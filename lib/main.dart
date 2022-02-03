import 'package:e_learning/view/home.dart';
import 'package:e_learning/viewmodel/learn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Learn(),
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "E-Learning App",
          theme: ThemeData(
            textTheme: TextTheme(
              headline1: GoogleFonts.quicksand(
                textStyle: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  height: 1.1,
                ),
              ),
              headline2: GoogleFonts.quicksand(
                textStyle: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  height: 1.1,
                ),
              ),
              headline3: GoogleFonts.quicksand(
                textStyle: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle1: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
            ),
          ),
          home: const Home(),
        );
      },
    );
  }
}
