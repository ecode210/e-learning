import 'dart:async';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:e_learning/view/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: size.width,
                child: SvgPicture.asset(
                  "assets/svg/onboarding.svg",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 50,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      """
University of Abuja
E-Learning App""",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Discover various courses and learn on your own schedule",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    const SizedBox(height: 10),
                    AvatarGlow(
                      glowColor: Colors.amber,
                      endRadius: 80.0,
                      showTwoGlows: true,
                      child: BouncingWidget(
                        onPressed: () {
                          Timer(
                            const Duration(milliseconds: 500),
                            () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Dashboard(),
                                ),
                              );
                            },
                          );
                        },
                        scaleFactor: 0.4,
                        child: CircleAvatar(
                          radius: size.height * 0.07,
                          backgroundColor: Colors.grey.shade800,
                          child: Text(
                            "GET STARTED",
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.headline2!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
