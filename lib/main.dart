import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:telegram_clone/data/repository/user_contact_repository.dart';
import 'package:telegram_clone/presentation/main/settings/bloc/setting_bloc.dart';
import 'package:telegram_clone/presentation/main/settings/cubit/setting_cubit.dart';
import 'firebase_options.dart';
import 'routes/app_routes.dart';
import 'routes/routes_name.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SettingBloc(
            contactsRepository:
                UserContactsRepository(firestore: FirebaseFirestore.instance),
          ),
        ),
        BlocProvider(
          create: (context) => SettingCubit(
            contactsRepository:
                UserContactsRepository(firestore: FirebaseFirestore.instance),
          ),
        ),
      ],
      child: const KeyboardDismisser(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesName.login,
          onGenerateRoute: AppRoutes.onGenerateRoute,
        ),
      ),
    );
  }
}
