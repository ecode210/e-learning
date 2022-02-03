import 'dart:async';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:e_learning/view/courses.dart';
import 'package:e_learning/viewmodel/learn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.05,
                width: size.width,
              ),
              Expanded(
                child: Container(
                  width: size.width,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            """
What do you want
to learn today?""",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          AvatarGlow(
                            glowColor: Colors.amber,
                            endRadius: 50,
                            showTwoGlows: true,
                            child: CircleAvatar(
                              radius: size.height * 0.05,
                              backgroundColor: Colors.amber,
                              child: FaIcon(
                                FontAwesomeIcons.userGraduate,
                                color: Colors.white,
                                size: size.height * 0.04,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Popular Courses",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child:
                                  buildPopular(size, Colors.cyan, "CSC 404")),
                          const SizedBox(width: 10),
                          Expanded(
                              child:
                                  buildPopular(size, Colors.amber, "MTH 102")),
                          const SizedBox(width: 10),
                          Expanded(
                              child:
                                  buildPopular(size, Colors.purple, "CSC 203")),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child:
                                  buildPopular(size, Colors.brown, "PHY 104")),
                          const SizedBox(width: 10),
                          Expanded(
                              child: buildPopular(
                                  size, Colors.lightGreen, "CSC 306")),
                          const SizedBox(width: 10),
                          Expanded(
                              child: buildPopular(size, Colors.red, "GST 222")),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Categories",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      const SizedBox(height: 20),
                      Expanded(child: buildCategories(size, "100 Level")),
                      const SizedBox(height: 10),
                      Expanded(child: buildCategories(size, "200 Level")),
                      const SizedBox(height: 10),
                      Expanded(child: buildCategories(size, "300 Level")),
                      const SizedBox(height: 10),
                      Expanded(child: buildCategories(size, "400 Level")),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPopular(var size, MaterialColor color, String title) {
    return Container(
      height: size.height * 0.045,
      decoration: BoxDecoration(
        color: color.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: color,
          width: 2,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }

  Widget buildCategories(var size, String title) {
    return BouncingWidget(
      onPressed: () {
        Timer(
          const Duration(milliseconds: 300),
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Courses(
                  title: title,
                  course:
                      Provider.of<Learn>(context, listen: false).courses[title],
                ),
              ),
            );
          },
        );
      },
      scaleFactor: 0.2,
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline2,
            ),
            Expanded(
              child: SizedBox(
                height: size.height,
                child: SvgPicture.asset(
                  "assets/svg/$title.svg",
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.centerRight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
