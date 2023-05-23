import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:student_information/Screen/Home_Screen/Student_Model.dart';

class Api_data {
  Api_data._();

  static Api_data api_data = Api_data._();

  Future<List<StudentModel>> Studeta() async {
    var data = await rootBundle.loadString("assets/jeson/Student.json");
    List json = jsonDecode(data);
    return json.map((e) => StudentModel.fromJson(e)).toList();
  }
}
