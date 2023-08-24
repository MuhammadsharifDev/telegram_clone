import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:telegram_clone/src/routes/app_routes.dart';
import 'package:telegram_clone/src/routes/routes_name.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const KeyboardDismisser(
      child:  MaterialApp(
        initialRoute: RoutesName.login,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}

