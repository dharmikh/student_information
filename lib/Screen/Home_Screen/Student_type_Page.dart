import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_information/Screen/Home_Screen/Controller/HomeController.dart';
import 'package:student_information/Screen/Home_Screen/Student_Model.dart';
import 'package:student_information/Utils/Api_Helper.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text(
                "Student Details",
                style: TextStyle(color: Colors.white),
              ),
              bottom: TabBar(
                labelColor: Colors.white,
                onTap: (value) {
                  homeController.tabIndex.value = value;
                  print("====== $value");
                },
                tabs: [
                  Tab(
                    text: "Exam",
                  ),
                  Tab(
                    text: "Quiz",
                  ),
                  Tab(
                    text: "Homework",
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                FutureBuilder(
                  future: Api_data.api_data.Studeta(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("${snapshot.error}"),
                      );
                    } else if (snapshot.hasData) {
                      homeController.StudentList.value = snapshot.data!;
                      homeController.StudentExamList.value = [];
                      for (StudentModel student in homeController.StudentList) {
                        if (student.scores![0].score! > 35) {
                          homeController.StudentExamList.add(student);
                        }
                      }
                      for (StudentModel student in homeController.StudentList) {
                        if (student.scores![1].score! > 35) {
                          homeController.StudentExamList.add(student);
                        }
                      }
                      for (StudentModel student in homeController.StudentList) {
                        if (student.scores![2].score! > 35) {
                          homeController.StudentExamList.add(student);
                        }
                      }
                      return ListView.builder(
                        itemCount: homeController.StudentExamList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              homeController.studentInfo.value =
                                  homeController.StudentExamList[index];
                              Get.toNamed('sf');
                            },
                            child: Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage(
                                      "assets/image/00${homeController.StudentExamList[index].id! >= 100 ? homeController.StudentExamList[index].id : homeController.StudentExamList[index].id! >= 10 ? "0${homeController.StudentExamList[index].id}" : "00${homeController.StudentList[index].id}"}.png"),
                                ),
                                title: Text(
                                    "${homeController.StudentExamList[index].name}"),
                                subtitle: Text(
                                    "${homeController.StudentExamList[index].scores![0].type}"),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
                FutureBuilder(
                  future: Api_data.api_data.Studeta(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("${snapshot.error}"),
                      );
                    } else if (snapshot.hasData) {
                      homeController.StudentList.value = snapshot.data!;
                      homeController.StudentQuizList.value = [];
                      for (StudentModel student in homeController.StudentList) {
                        if (student.scores![0].score! > 30 &&
                            student.scores![0].score! < 35) {
                          homeController.StudentQuizList.add(student);
                        }
                      }
                      for (StudentModel student in homeController.StudentList) {
                        if (student.scores![1].score! > 30 &&
                            student.scores![1].score! < 35) {
                          homeController.StudentQuizList.add(student);
                        }
                      }
                      for (StudentModel student in homeController.StudentList) {
                        if (student.scores![2].score! > 30 &&
                            student.scores![2].score! < 35) {
                          homeController.StudentQuizList.add(student);
                        }
                      }
                      return ListView.builder(
                        itemCount: homeController.StudentQuizList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              homeController.studentInfo.value =
                                  homeController.StudentQuizList[index];
                              Get.toNamed('sf');
                            },
                            child: Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage(
                                      "assets/image/00${homeController.StudentQuizList[index].id! >= 100 ? homeController.StudentQuizList[index].id : homeController.StudentQuizList[index].id! >= 10 ? "0${homeController.StudentQuizList[index].id}" : "00${homeController.StudentQuizList[index].id}"}.png"),
                                ),
                                title: Text(
                                    "${homeController.StudentQuizList[index].name}"),
                                subtitle: Text(
                                    "${homeController.StudentQuizList[index].scores![1].type}"),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
                FutureBuilder(
                  future: Api_data.api_data.Studeta(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("${snapshot.error}"),
                      );
                    } else if (snapshot.hasData) {
                      homeController.StudentList.value = snapshot.data!;
                      homeController.StudentHWList.value = [];
                      for (StudentModel student in homeController.StudentList) {
                        if (student.scores![0].score! < 30) {
                          homeController.StudentHWList.add(student);
                        }
                      }
                      for (StudentModel student in homeController.StudentList) {
                        if (student.scores![1].score! < 30) {
                          homeController.StudentHWList.add(student);
                        }
                      }
                      for (StudentModel student in homeController.StudentList) {
                        if (student.scores![2].score! < 30) {
                          homeController.StudentHWList.add(student);
                        }
                      }
                      return ListView.builder(
                        itemCount: homeController.StudentHWList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              homeController.studentInfo.value =
                                  homeController.StudentHWList[index];
                              Get.toNamed('sf');
                            },
                            child: Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage(
                                      "assets/image/00${homeController.StudentHWList[index].id! >= 100 ? homeController.StudentHWList[index].id : homeController.StudentHWList[index].id! >= 10 ? "0${homeController.StudentHWList[index].id}" : "00${homeController.StudentHWList[index].id}"}.png"),
                                ),
                                title: Text(
                                    "${homeController.StudentHWList[index].name}"),
                                subtitle: Text(
                                    "${homeController.StudentHWList[index].scores![2].type}"),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            )),
      ),
    );
  }
}
