import 'dart:async';
import 'package:flutter/material.dart';
import 'Home_Screen.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {

  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    Home_Screen(),
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: Colors.blueAccent,
        alignment: Alignment.center,
          child:  Text(" Welcome ! " ,
            style: TextStyle(fontSize: 40,color: Colors.white),),
      ),
    );
  }
}
