import 'package:flutter_modular/flutter_modular.dart';
import 'package:thing_stuffs/src/features/things/ui/pages/things_page.dart';

class ThingsModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const ThingsPage()),
      ];
}
