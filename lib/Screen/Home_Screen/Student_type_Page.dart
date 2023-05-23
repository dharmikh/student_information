import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_information/Screen/Home_Screen/Controller/HomeController.dart';
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
              title: Text("Student Details"),
              bottom: TabBar(
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
                    if(snapshot.hasError)
                    {
                      return Center(child: Text("${snapshot.error}"),);
                    }
                    else if(snapshot.hasData)
                    {
                      homeController.StudentList.value = snapshot.data!;
                      return ListView.builder(
                        itemCount: homeController.StudentList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              homeController.studentInfo.value = homeController.StudentList[index];
                              Get.toNamed('sf');
                            },
                            child: Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage("assets/image/00${homeController.StudentList[index].id! >= 100 ? homeController.StudentList[index].id : homeController.StudentList[index].id! >= 10 ? "0${homeController.StudentList[index].id}" : "00${homeController.StudentList[index].id}"}.png"),
                                ),
                                title: Text("${homeController.StudentList[index].name}"),
                                subtitle: Text("${homeController.StudentList[index].scores![0].type}"),
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
                    if(snapshot.hasError)
                    {
                      return Center(child: Text("${snapshot.error}"),);
                    }
                    else if(snapshot.hasData)
                    {
                      homeController.StudentList.value = snapshot.data!;
                      return ListView.builder(
                        itemCount: homeController.StudentList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              homeController.studentInfo.value = homeController.StudentList[index];
                              Get.toNamed('sf');
                            },
                            child: Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage("assets/image/00${homeController.StudentList[index].id! >= 100 ? homeController.StudentList[index].id : homeController.StudentList[index].id! >= 10 ? "0${homeController.StudentList[index].id}" : "00${homeController.StudentList[index].id}"}.png"),
                                ),
                                title: Text("${homeController.StudentList[index].name}"),
                                subtitle: Text("${homeController.StudentList[index].scores![1].type}"),
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
                    if(snapshot.hasError)
                    {
                      return Center(child: Text("${snapshot.error}"),);
                    }
                    else if(snapshot.hasData)
                    {
                      homeController.StudentList.value = snapshot.data!;
                      return ListView.builder(
                        itemCount: homeController.StudentList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              homeController.studentInfo.value = homeController.StudentList[index];
                              Get.toNamed('sf');
                            },
                            child: Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage("assets/image/00${homeController.StudentList[index].id! >= 100 ? homeController.StudentList[index].id : homeController.StudentList[index].id! >= 10 ? "0${homeController.StudentList[index].id}" : "00${homeController.StudentList[index].id}"}.png"),
                                ),
                                title: Text("${homeController.StudentList[index].name}"),
                                subtitle: Text("${homeController.StudentList[index].scores![2].type}"),
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
            )
        ),
      ),
    );
  }
}
