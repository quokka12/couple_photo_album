import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/font/font_size.dart';
import '../../config/router/route_names.dart';
import '../../config/size/widget_size.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 1500), () => context.goNamed(RouteNames.bottomBar));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/splash.JPG"),
              fit: BoxFit.cover,
              opacity: 0.9,
            ),
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: WidgetSize.ratioOfVertical(context, 0.3)),
              Expanded(
                  flex: 10,
                  child: Text('진지커플 스토리',
                      style: TextStyle(
                          fontSize: FontSize.H1,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))),
              Expanded(
                  flex: 1,
                  child: Text('© Copyright 2023, CONER Co.',
                      style: TextStyle(fontSize: FontSize.BODY, color: Colors.white))),
            ],
          ),
        ),
      ),
    );
  }
}
