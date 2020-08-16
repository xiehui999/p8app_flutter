import 'dart:async';

import 'package:flutter/material.dart';
import 'package:p8app_flutter/common/image.dart';

import 'home_bottom_navigation.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(Duration(milliseconds: 1500), () {
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(builder: (context) => new HomeTab()),
          (route) => route == null);
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
    timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xffffffff),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'MedLinc Demo',
            style: TextStyle(
                color: Color(0xff70c2F0),
                fontWeight: FontWeight.bold,
                fontSize: 26.0),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
          ),
          Image.asset(Images.flutterIcon)
        ],
      ),
    );
  }
}
