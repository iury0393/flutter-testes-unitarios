import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testes/app/model/person.dart';

void main() {
  Person person = Person(
    fullName: 'Iury Vasconcelos Leitão',
    age: 28,
    weight: 78.0,
    height: 1.74,
  );
  group('Display info', () {
    test('Display person name', () async {
      expect(person.fullName, 'Iury Vasconcelos Leitão');
    });
    test('Display imc', () async {
      expect(person.imc, 25.76);
    });

    test('Display if person is older', () async {
      expect(person.old, true);
    });
  });
}
