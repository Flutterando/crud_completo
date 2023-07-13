import 'package:flutter_modular/flutter_modular.dart';
import 'package:thing_stuffs/src/features/auth/data/services/firebase_auth_service.dart';
import 'package:thing_stuffs/src/features/auth/interactor/reducers/auth_reducer.dart';

import 'interactor/services/auth_service.dart';
import 'ui/pages/login_page.dart';

class AuthModule extends Module {
  @override
  List<Bind> get exportedBinds => [
        AutoBind.factory<AuthService>(FirebaseAuthService.new),
        AutoBind.singleton(AuthReduce.new),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/login',
          child: (_, __) => const LoginPage(),
        )
      ];
}
