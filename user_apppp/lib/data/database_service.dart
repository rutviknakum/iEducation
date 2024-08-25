import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_apppp/database/database_api.dart';
import 'package:user_apppp/database/database_class.dart';
import 'package:user_apppp/model/model.dart';

class DataBaseHelper {
  static final firebaseDatabase = FirebaseDatabase.instance.ref();

  static List<UserData> userDataList = [];
  static List<UserData> profileDataList = [];
  static userData({required Map<String, dynamic> data}) {
    String key = firebaseDatabase.push().key!;
    data["key"] = key;
    firebaseDatabase.child("userData").child(key).set(data);
  }

  static Future<void> loginData() async {
    DataSnapshot response = await firebaseDatabase.child("userData").get();
    Map data = response.value as Map? ?? {};
    userDataList.clear();
    data.forEach(
      (key, value) {
        userDataList.add(
          UserData(
            key: value['key'],
            mobilNumber: value['mobilNumber'],
            password: value["password"],
          ),
        );
      },
    );
  }

  static Future<void> profileData() async {
    DataSnapshot response = await firebaseDatabase.child("userData").get();
    Map data = response.value as Map? ?? {};
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var userMobileNumber = prefs.get(
      "userMobileNumber",
    );

    debugPrint("userMobileNumber =====> $userMobileNumber");
    profileDataList.clear();
    data.forEach((key, value) {
      if (value["mobilNumber"] == userMobileNumber) {
        profileDataList.add(UserData(
          key: value['key'],
          mobilNumber: value['mobilNumber'],
          password: value["password"],
        ));
      }
    });
  }

  static Student? viewStudentData;
  static List<Result> viewResultData = [];
  static List<Materials> viewMaterialData = [];
  static List<Course> viewCourseData = [];
  static List<TimeTable> viewTimeTableData = [];

  static clearAllData() {
    viewStudentData;
    viewResultData.clear();
    viewMaterialData.clear();
    viewCourseData.clear();
    viewTimeTableData.clear();
    studentDataList.clear();
    resultDataList.clear();
    materialsDataList.clear();
    courseDataList.clear();
    tableData.clear();
  }

  static filterData() async {
    await StudentDataApi.fetchData();
    await ResultApi.fetchData();
    await MaterialApi.fetchData();
    await CourseApi.fetchData();
    // await TimeTableApi.fetchData();

    Student? dummyStudent;
    List<Result> dummyResult = [];
    List<Materials> dummyMaterial = [];
    List<Course> dummyCourse = [];

// **** Student Profile ****
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    for (var mobile in studentDataList) {
      if (prefs.getString('userMobileNumber') == mobile.phoneNo) {
        // dummyStudent.clear();
        dummyStudent = mobile;
        print('======================>>>>> ====>>>>> $dummyStudent');
      }
    }
    viewStudentData = dummyStudent;

// **** Result ****

    for (var result in resultDataList) {
      if ((viewStudentData!.stream == result.stream) &&
          (viewStudentData!.semester == result.semester)) {
        dummyResult.add(result);
      }
    }
    viewResultData = dummyResult;
    // print((" in viewResultData     ==> ${viewResultData.length}"));

// **** Material ****

    for (var material in materialsDataList) {
      debugPrint("in material  ===> ");
      if ((viewStudentData!.stream == material.stream) &&
          (viewStudentData!.semester == material.semester)) {
        dummyMaterial.add(material);
      }
    }
    viewMaterialData = dummyMaterial;

// **** Course ****

    for (var course in courseDataList) {
      if ((viewStudentData!.stream == course.stream) &&
          (viewStudentData!.semester == course.semester)) {
        dummyCourse.add(course);
      }
    }
    viewCourseData = dummyCourse;

    // **** Time Table ****
//     for (var timeTable in tableData) {
//       if ((viewStudentData!.stream == timeTable.) &&
//           (viewStudentData!.semester == timeTable.semester)) {
//         dummyTimeTable.add(timeTable);
//       }
//     }
//     viewTimeTableData = dummyTimeTable;
  }
}
