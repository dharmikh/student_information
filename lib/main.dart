import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_information/Screen/Home_Screen/Student_cetegory_Page.dart';
import 'package:student_information/Screen/Home_Screen/Student_type_Page.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        '/': (context) => Home_Page(),
        'sf': (context) => StudentInfo(),
      },
    ),
  );
}
