import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/app_constant.dart';

class AppSplashScreen extends StatefulWidget {
  const AppSplashScreen({super.key});

  @override
  State<AppSplashScreen> createState() => _AppSplashScreenState();
}

class _AppSplashScreenState extends State<AppSplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? scaleController;
  Animation<double>? scaleAnimation;

  bool _a = false;
  bool _c = false;
  bool _d = false;
  bool _e = false;
  bool secondAnim = false;

  Color boxColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    Timer(const Duration(milliseconds: 600), () {
      setState(() {
        boxColor = const Color(0xff0871B9);
        _a = true;
      });
    });
    Timer(const Duration(milliseconds: 1500), () {
      setState(() {
        boxColor = const Color(0xff0871B9);
        _c = true;
      });
    });
    Timer(const Duration(milliseconds: 1700), () {
      setState(() {
        _e = true;
      });
    });
    Timer(const Duration(milliseconds: 3200), () {
      secondAnim = true;

      scaleController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1000),
      )..forward();
      scaleAnimation =
          Tween<double>(begin: 0.0, end: 12).animate(scaleController!);

      setState(() {
        boxColor = const Color.fromARGB(255, 54, 42, 177);
        _d = true;
      });
    });
    Timer(const Duration(milliseconds: 4200), () {
      secondAnim = true;
    });

    afterBuildCreated(() async {
      setValue(appOpenCount, (getIntAsync(appOpenCount)) + 1);
    });

    Timer(const Duration(milliseconds: 4000), () {
      finish(context);
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  void dispose() {
    scaleController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: _d ? 900 : 2500),
              curve: _d ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
              height: _d
                  ? 0
                  : _a
                      ? h / 2.5
                      : 20,
              width: 20,
            ),
            AnimatedContainer(
              duration: Duration(seconds: _c ? 2 : 0),
              curve: Curves.fastLinearToSlowEaseIn,
              height: _d
                  ? h
                  : _c
                      ? 130
                      : 20,
              width: _d
                  ? w
                  : _c
                      ? 130
                      : 20,
              decoration: BoxDecoration(
                  color: boxColor,
                  //shape: _c? BoxShape.rectangle : BoxShape.circle,
                  borderRadius: _d
                      ? const BorderRadius.only()
                      : BorderRadius.circular(30)),
              child: secondAnim
                  ? Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                            color: Colors.brown, shape: BoxShape.circle),
                        child: AnimatedBuilder(
                          animation: scaleAnimation!,
                          builder: (c, child) => Transform.scale(
                            scale: scaleAnimation!.value,
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff0871B9),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: _e
                          ? Text(
                              "SEMAS",
                              style:
                                  boldTextStyle(size: 30, color: Colors.white),
                            )
                          : const SizedBox(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
