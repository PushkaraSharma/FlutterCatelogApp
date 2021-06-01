import 'package:flutter/material.dart';
import 'package:trailapp/pages/LoginPage.dart';
import 'package:trailapp/pages/homePage.dart';
import 'package:trailapp/utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.purple,),
      darkTheme: ThemeData(brightness: Brightness.dark),

      routes: {
        MyRoutes.loginRoute:(context)=>LoginPage(),
        MyRoutes.homePageRoute:(context)=>HomePage()
      },
    );
  }
}


