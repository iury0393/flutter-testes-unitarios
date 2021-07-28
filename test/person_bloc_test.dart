import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testes/person.dart';
import 'package:flutter_testes/person_bloc.dart';
import 'package:flutter_testes/person_repository.dart';
import 'package:flutter_testes/person_state.dart';
import 'package:mockito/mockito.dart';

class PersonRepositoryMock extends Mock implements PersonRepository {}

void main() {
  final repository = PersonRepositoryMock();
  final bloc = PersonBloc(repository);
  final person = Person(id: 1, name: 'Jacob', age: 29, height: 1.77, weight: 64.4);

  test('deve retorna uma lista de person', () async {
    when(repository.getPerson()).thenAnswer((_) async => <Person>[person, person]);

    bloc.add(PersonEvent.fetch);

    await expectLater(
        bloc,
        emitsInOrder([
          isA<PersonLoadingState>(),
          isA<PersonListState>(),
        ]));
  });

  test('deve disparar um error', () async {
    when(repository.getPerson()).thenThrow(Exception('deu error'));

    bloc.add(PersonEvent.fetch);

    await expectLater(
        bloc,
        emitsInOrder([
          isA<PersonLoadingState>(),
          isA<PersonErrorState>(),
        ]));
  });
}
