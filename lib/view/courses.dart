import 'dart:async';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:e_learning/viewmodel/learn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Courses extends StatefulWidget {
  final String title;
  final List course;

  const Courses({Key? key, required this.title, required this.course})
      : super(key: key);

  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  BouncingWidget(
                    onPressed: () {
                      Timer(
                        const Duration(milliseconds: 300),
                        () {
                          Navigator.pop(context);
                        },
                      );
                    },
                    scaleFactor: 0.4,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: size.height * 0.04,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "${widget.title} Courses",
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: size.height * 0.3,
                child: SvgPicture.asset(
                  "assets/svg/${widget.title}.svg",
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const FaIcon(
                    FontAwesomeIcons.userGraduate,
                    color: Colors.amber,
                    size: 17,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "2.8K+ Students",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.white,
                          height: 1.3,
                        ),
                  ),
                  const Spacer(),
                  Consumer<Learn>(
                    builder: (context, learn, child) {
                      return BouncingWidget(
                        onPressed: () {
                          learn.likeCourse(widget.title);
                        },
                        scaleFactor: 0.4,
                        child: FaIcon(
                          learn.likes[widget.title]
                              ? FontAwesomeIcons.solidHeart
                              : FontAwesomeIcons.heart,
                          color: Colors.amber,
                          size: 17,
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Courses",
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SizedBox(
                  width: size.width,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: widget.course.length,
                    itemBuilder: (context, index) {
                      List course = widget.course[index];
                      return buildCourse(
                          size, course[0], course[1], course[2], index + 1);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCourse(var size, String title, subtitle, url, int index) {
    return InkWell(
      onTap: () {
        Provider.of<Learn>(context, listen: false).openFile(url, "$title.pdf");
      },
      child: Container(
        width: size.width,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Container(
              width: 40,
              alignment: Alignment.center,
              child: Text(
                index.toString(),
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  subtitle,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.amber,
                      ),
                ),
              ],
            ),
            const Spacer(),
            const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.amber,
              child: FaIcon(
                FontAwesomeIcons.book,
                color: Colors.white,
                size: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
