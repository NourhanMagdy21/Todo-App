import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app1/core/theme/application_theme.dart';
import 'package:todo_app1/screens/home_layout/home_layout_screen.dart';
import 'package:todo_app1/screens/login/login_view.dart';
import 'package:todo_app1/screens/registration/registration_view.dart';
import 'package:todo_app1/screens/splash_screen/splash_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ToDo());
}

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ApplicationTheme.lightTheme,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeLayout.routeName: (context) => HomeLayout(),
        LoginView.routeName: (context) => LoginView(),
        RegistrationView.routeName: (context) => RegistrationView(),
      },
    );
  }
}
