import 'package:get/get.dart';
import 'package:student_information/Screen/Home_Screen/Student_Model.dart';

class HomeController extends GetxController
{
  RxList<StudentModel> StudentList = <StudentModel>[].obs;
  RxList<StudentModel> StudentExamList = <StudentModel>[].obs;
  RxList<StudentModel> StudentQuizList = <StudentModel>[].obs;
  RxList<StudentModel> StudentHWList = <StudentModel>[].obs;
  RxInt tabIndex = 0.obs;
  Rx<StudentModel> studentInfo = StudentModel().obs;
}