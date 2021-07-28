import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testes/bloc_provider.dart';
import 'package:flutter_testes/home_page.dart';
import 'package:flutter_testes/person.dart';
import 'package:flutter_testes/person_bloc.dart';
import 'package:mockito/mockito.dart';

import 'person_mock.dart';

void main() {
  final repository = PersonRepositoryMock();
  final bloc = PersonBloc(repository);

  final person = Person(id: 1, name: 'Jacob', age: 29, height: 1.77, weight: 64.4);
  testWidgets('Deve mostrar todos os estados na tela', (WidgetTester tester) async {
    when(repository.getPerson()).thenAnswer((_) async => <Person>[person, person]);

    await tester.pumpWidget(MaterialApp(home: BlocProvider(bloc: bloc, child: HomePage())));

    final textButton = find.byType(TextButton);
    expect(textButton, findsOneWidget);
    final loading = find.byType(CircularProgressIndicator);
    expect(loading, findsNothing);
    final listPersons = find.byType(ListView);
    expect(listPersons, findsNothing);

    await tester.tap(textButton);

    // await tester.runAsync(() => bloc.first);
    await tester.pump();
    expect(loading, findsOneWidget);

    // await tester.runAsync(() => bloc.first);
    await tester.pump();
    expect(listPersons, findsOneWidget);
  });
}
