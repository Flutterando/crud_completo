import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:thing_stuffs/src/features/splash/ui/pages/splash_page.dart';

import 'features/auth/auth_module.dart';
import 'features/things/things_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        AuthModule(),
      ];

  @override
  List<Bind> get binds => [
        Bind.instance<FirebaseAuth>(FirebaseAuth.instance),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/splash', child: (_, __) => const SplashPage()),
        ModuleRoute('/things', module: ThingsModule()),
        ModuleRoute('/auth', module: AuthModule()),
      ];
}
