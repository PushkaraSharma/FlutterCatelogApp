import 'package:flutter/material.dart';
import 'package:trailapp/pages/LoginPage.dart';
import 'package:trailapp/pages/homePage.dart';
import 'package:trailapp/utils/routes.dart';
import 'package:trailapp/widgets/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homePageRoute,
      routes: {
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homePageRoute: (context) => HomePage()
      },
    );
  }
}
