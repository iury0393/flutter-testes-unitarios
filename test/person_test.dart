import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testes/person.dart';

void main() {
  final Person person = Person(
    id: 2,
    name: 'Iury Vasconcelos Leitão',
    age: 28,
    weight: 78.0,
    height: 1.74,
  );
  test('All Matchs', () async {
    expect(
      person.name,
      allOf([
        equals('Iury Vasconcelos Leitão'),
        isA<String>(),
        isNotNull,
        contains('Iu'),
      ]),
    );
  });
  group('Display person methods', () {
    test('Display imc', () async {
      expect(person.imc, 25.76);
    });
    test('Display if person is older', () async {
      expect(person.isOlder, true);
    });
  });

  test('Throw erro', () {
    expect(() => int.parse('x'), throwsException);
  });
}
