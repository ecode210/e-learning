import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Learn extends ChangeNotifier {
  Map likes = {
    "100 Level": false,
    "200 Level": false,
    "300 Level": false,
    "400 Level": false,
  };

  void likeCourse(String title) {
    likes[title] = !likes[title];
    notifyListeners();
  }

  Map courses = {
    "100 Level": [
      [
        "MTH 102",
        "Calculus",
      ],
      [
        "MTH 104",
        "Vectors",
      ],
      [
        "PHY 104",
        "Electricity and Magnetism",
      ],
    ],
    "200 Level": [
      [
        "CSC 202",
        "File Processing",
      ],
      [
        "CSC 203",
        "Computer Programming I",
      ],
      [
        "CSC 204",
        "Digital Computer System",
      ],
      [
        "GST 222",
        "Conflict Resolution",
      ],
      [
        "MTH 205",
        "Differential Equations I",
      ],
      [
        "STA 202",
        "Test of Hypothesis I",
      ],
    ],
    "300 Level": [
      [
        "CSC 301",
        "Introduction to Computer",
      ],
      [
        "CSC 303",
        "Computer Architecture",
      ],
      [
        "CSC 304",
        "Theoretical Computer",
      ],
      [
        "CSC 305",
        "System Analysis",
      ],
      [
        "CSC 306",
        "Database Design",
      ],
      [
        "CSC 308",
        "Computer Installation",
      ],
      [
        "CSC 310",
        "Operations Research",
      ],
      [
        "GST 301",
        "Entrepreneurship Studies",
      ],
      [
        "MTH 310",
        "Discrete Mathematics",
      ],
      [
        "MTH 303",
        "Differential Equations II",
      ],
    ],
    "400 Level": [
      [
        "CSC 402",
        "Organization of Prog Lang",
      ],
      [
        "CSC 403",
        "Software Design",
      ],
      [
        "CSC 404",
        "Computer Construction",
      ],
      [
        "CSC 406",
        "System Modelling",
      ],
      [
        "CSC 407",
        "Data Networks",
      ],
      [
        "CSC 409",
        "Computer Programming II",
      ],
    ],
  };

  Future<File> loadStorage(String url) async {
    final refPDF = FirebaseStorage.instance.ref(url);
    final bytes = await refPDF.getData();
    return storeFile(url, bytes!);
  }

  Future<File> storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();

    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  // Future openFile(String url, String? fileName) async {
  //   final file = await downloadFile(url, fileName!);
  //   if (file == null) return;
  //   OpenFile.open(file.path);
  // }
}
