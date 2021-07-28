import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'bloc_provider.dart';
import 'home_page.dart';
import 'person_bloc.dart';
import 'person_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(bloc: PersonBloc(PersonRepository(Client())), child: HomePage()),
    );
  }
}
