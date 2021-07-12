import 'dart:math' as math;

class Person {
  String fullName;
  int age;
  double weight;
  double height;

  Person({
    required this.fullName,
    required this.age,
    required this.weight,
    required this.height,
  });

  double get imc {
    var result = weight / math.pow(height, 2);
    result = result * 100;
    return result.roundToDouble() / 100;
  }

  bool get old {
    return age >= 18;
  }
}
