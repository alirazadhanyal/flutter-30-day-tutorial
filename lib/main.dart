// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application/Utils/routs.dart';
import 'package:flutter_application/pages/home_page.dart';
import 'package:flutter_application/pages/login_page.dart';
import 'package:flutter_application/widgets/themes.dart';
import 'pages/cart_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRouts.HomeRoute,
      routes: {
        MyRouts.HomeRoute: (context) => const HomePage(),
        MyRouts.LoginRoute: (context) => const LoginPage(),
        MyRouts.addToCart: (context) => const CartPage(),
      },
    );
  }
}
