import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_testes/app/modules/info/info_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute(Modular.initialRoute, module: InfoModule()),
  ];
}
