import 'package:get/get.dart';
import 'package:student_information/Screen/Home_Screen/Student_Model.dart';

class HomeController extends GetxController
{
  RxList<StudentModel> StudentList = <StudentModel>[].obs;
  RxInt tabIndex = 0.obs;
  Rx<StudentModel> studentInfo = StudentModel().obs;
}