import 'package:absensi/screens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import './login.dart';

class LauncherPage extends StatefulWidget {
  const LauncherPage({Key? key}) : super(key: key);

  @override
  _LauncherPageState createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    super.initState();
    startLaunching();
  }

  startLaunching() async {
    final prefs = await SharedPreferences.getInstance();
    bool slogin;
    slogin = prefs.getBool('slogin') ?? false;

    var duration = const Duration(seconds: 2);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return slogin ? const MainScreen() : const LoginPage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(
    //     statusBarColor: Color(0xfffbb448),
    //   ),
    // );
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: const Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xfffbb448), Color(0xfff7892b)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset(
                "assets/logo.png",
                height: 70.0,
                width: 200.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
