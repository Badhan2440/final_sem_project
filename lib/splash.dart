import 'package:flutter/material.dart';

import 'onbording.dart';
import 'main.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState()=> _SplashState();

  }

class _SplashState extends State<Splash>{

  @override
  void initState() {

    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async{
    await Future.delayed(Duration(milliseconds: 5000),() {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> OnboardingScreen() ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: Center(

          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/symbol.png'),
                SizedBox(height: 4),
                Text(
                  "ELDOC",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),

                ),

              ]

          ),

      ),
    );
  }
}
