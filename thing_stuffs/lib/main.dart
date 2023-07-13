import 'package:asp/asp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:thing_stuffs/src/app_widget.dart';

import 'firebase_options.dart';
import 'src/app_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(RxRoot(
    child: ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  ));
}
