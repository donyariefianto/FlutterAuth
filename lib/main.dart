import 'package:flutter/material.dart';

import './login.dart';
import './launcher.dart';
import './mainscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Absensi',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LauncherPage(),
        routes: <String, WidgetBuilder>{
          '/login': (BuildContext context) => const LoginPage(),
          '/landing': (BuildContext context) => MainScreen(),
        });
  }
}
