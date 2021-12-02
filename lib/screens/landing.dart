import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

const String sUrl = "http://127.0.0.1:8000/api/logout";
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

    try {
      var res = await http.post(Uri.parse(sUrl), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print(res.statusCode);
      prefs.setBool('slogin', false);
      prefs.remove('token');
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: const Center(
              // child: Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     // RaisedButton(onPressed: () => load()),
              //     Text(
              //       "Your Token : $token",
              //       style: TextStyle(fontSize: 20),
              //     ),
              //     const Text('Home'),
              //     RaisedButton(
              //       onPressed: () => _logOut(),
              //       color: Colors.white,
              //       child: const Text('Logout', style: TextStyle(fontSize: 18)),
              //     )
              //   ],
              // ),
              ),
        ),
      ),
    );
  }
}
