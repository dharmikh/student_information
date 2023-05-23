import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_information/Screen/Home_Screen/Controller/HomeController.dart';

class StudentInfo extends StatefulWidget {
  const StudentInfo({Key? key}) : super(key: key);

  @override
  State<StudentInfo> createState() => _StudentInfoState();
}

class _StudentInfoState extends State<StudentInfo> {

 HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Student Information"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  backgroundImage: AssetImage("assets/image/00${homeController.studentInfo.value.id! >= 100 ? homeController.studentInfo.value.id : homeController.studentInfo.value.id! >= 10 ? "0${homeController.studentInfo.value.id}" : "00${homeController.studentInfo.value.id}"}.png"),
                  radius: 80,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, left: 65),
                child: Row(
                  children: [
                    Text(
                      "Id",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    SizedBox(
                      width: 75,
                    ),
                    Text(
                      ":    ${homeController.studentInfo.value.id}",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 65),
                child: Row(
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    SizedBox(
                      width: 45,
                    ),
                    Text(
                      ":    ${homeController.studentInfo.value.name}",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(top: 30),
              //   child: Text(
              //     "MARKS",
              //     style: TextStyle(color: Colors.black, fontSize: 18),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 65),
                child: Row(
                  children: [
                    Text(
                      "Exam",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      ":    ${homeController.studentInfo.value.scores![0].score!.toStringAsFixed(2)}",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 65),
                child: Row(
                  children: [
                    Text(
                      "Quiz",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      ":    ${homeController.studentInfo.value.scores![1].score!.toStringAsFixed(2)}",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 65),
                child: Row(
                  children: [
                    Text(
                      "Homework",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      ":    ${homeController.studentInfo.value.scores![2].score!.toStringAsFixed(2)}",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
