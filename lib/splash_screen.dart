import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedSplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() =>   SplashScreenState();
}

class SplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration =   const Duration(seconds: 3);
    return   Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed("Home");
  }

  @override
  void initState() {
    super.initState();
    animationController =   AnimationController(
        vsync: this, duration:   const Duration(seconds: 2));
    animation =
      CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() =>  setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              Padding(padding: const EdgeInsets.only(bottom: 30.0),child:  Image.asset('images/logo2.png',height: 25.0,fit: BoxFit.scaleDown,))


            ],),
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               Image.asset(
                'images/logo1.png',
                width: animation.value * 250,
                height: animation.value * 250,
              ),
            ],
          ),
        ],
      ),
    );
  }
}