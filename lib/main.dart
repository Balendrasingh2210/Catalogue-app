import 'package:flutter/material.dart';
import 'package:shopping_app/Screens/home_screen.dart';
import 'package:shopping_app/Screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/utils/routes.dart';
import 'package:shopping_app/widgets/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.LightTheme(context),
      // home: HomePage()
      darkTheme: MyTheme.DarkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginScreen(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginScreen(),
      },
    );
  }
}
