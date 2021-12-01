import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

String token = "";

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    load();
  }

  load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token')!;
    });
  }

  _logOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('slogin', false);
    prefs.remove('token');
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // RaisedButton(onPressed: () => load()),
                Text(
                  "Your Token : $token",
                  style: TextStyle(fontSize: 20),
                ),
                const Text('Home'),
                RaisedButton(
                  onPressed: () => _logOut(),
                  color: Colors.white,
                  child: const Text('Logout', style: TextStyle(fontSize: 18)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
