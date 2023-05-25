import 'package:cmsc23_project/screens/admin_login.dart';
import 'package:cmsc23_project/screens/user_homepage.dart';
import 'package:cmsc23_project/screens/user_login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../providers/todo_provider.dart';
import '../screens/admin_homepage.dart';
import '../screens/entrance_monitor.dart';
import '../screens/entryform.dart';
import '../screens/login.dart';
import '../screens/main_menu.dart';
import '../screens/user_details.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => TodoListProvider())),
        ChangeNotifierProvider(create: ((context) => AuthProvider())),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health-monitoring App',
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const MainMenu(),
        // '/': (context) => const AdminPage(),
        // '/': (context) => const HomePage(),
        // '/': (context) => const EntranceMonitor(),
        '/login': (context) => const LoginPage(),
        'user_login': (context) => const UserLoginPage(),
        'admin_login': (context) => const AdminLoginPage(),
        '/todo': (context) => const LoginPage(),
        '/user_details': (context) => const UserDetailsPage(),
        '/homepage': (context) => const HomePage(),
        '/entryform': (context) => const EntryForm(),
        '/admin_homepage': (context) => const AdminPage(),
        '/entrance-monitor': (context) => const EntranceMonitor(),
      },
    );
  }
}
