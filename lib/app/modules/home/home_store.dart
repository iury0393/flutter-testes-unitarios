import 'package:flutter_testes/app/model/person.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  late Person person;

  @observable
  int counter = 0;

  Future<void> increment() async {
    counter = counter + 1;
  }
}
