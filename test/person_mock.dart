import 'package:flutter_testes/person_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class ClientMock extends Mock implements http.Client {}

class PersonRepositoryMock extends Mock implements PersonRepository {}
