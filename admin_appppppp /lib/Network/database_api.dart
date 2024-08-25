import 'dart:async';

import 'package:admin_appppppp/Network/database_class.dart';
import 'package:firebase_database/firebase_database.dart';

// **** Student ****
class StudentDataApi {
  static DatabaseReference db = FirebaseDatabase.instance.ref('studentDetails');
  static String keys = "";

  static studentAddData({required Student obj}) async {
    await db.child(obj.stream).child(obj.key.toString()).set(obj.toJson());
  }

  static Future fetchData() async {
    studentDataList.clear();
    await db.once().then((value) {
      Map data =
          value.snapshot.value == null ? {} : value.snapshot.value as Map;
      data.forEach((key, value) {
        if (key == keys) {
          value.forEach((key, value) {
            studentDataList.add(Student.fromJson(value));
          });
          studentDataList.sort((a, b) => a.key.compareTo(b.key));
        }
      });
    });
  }

  static updateData({
    required String child,
    required String oldStream,
    required Student obj,
  }) async {
    if (child != oldStream) {
      await deleteStdData(key: obj.key.toString(), child: oldStream);
    }
    await db.child(child).child(obj.key.toString()).update(obj.toJson());
  }

  static deleteStdData({required String key, required String child}) async {
    await db.child(child).child(key).remove();
  }
}

// **** Staff List ****
class StaffListApi {
  static DatabaseReference db = FirebaseDatabase.instance.ref('staffList');

  static staffListAddData({required StaffList obj}) async {
    await db.child(obj.key.toString()).set(obj.toJson());
  }

  static Future fetchData() async {
    staffDataList.clear();
    await db.once().then((value) {
      Map data =
          value.snapshot.value == null ? {} : value.snapshot.value as Map;
      data.forEach((key, value) {
        staffDataList.add(StaffList.fromJson(value));
      });
      staffDataList.sort((a, b) => a.key.compareTo(b.key));
    });
  }

  static updateData({
    required StaffList obj,
  }) async {
    await db.child(obj.key.toString()).update(obj.toJson());
  }

  static deleteData({required String key}) async {
    await db.child(key).remove();
  }
}

// **** Time Table ****
class TimeTableApi {
  static DatabaseReference db = FirebaseDatabase.instance.ref('timeTable');

  static timeTableAddData({required TimeTable obj}) async {
    await db.child(obj.lectureDate).child(obj.key.toString()).set(obj.toJson());
    // {
    //   'Key': int.parse(key),
    //   'Stream': timeTbl.stream,
    //   'Semester': timeTbl.semester,
    //   'LectureName': timeTbl.lectureName,
    //   'LectureDate': timeTbl.lectureDate,
    //   'LectureStartTime': timeTbl.lectureStartTime,
    //   'LectureEndTime': timeTbl.lectureEndTime,
    // },
    // );
  }

  static Future fetchData() async {
    timeTableDataList.clear();
    await db.once().then(
      (value) {
        Map data =
            value.snapshot.value == null ? {} : value.snapshot.value as Map;
        data.forEach(
          (keys, value) {
            List<TimeTable> temp = [];
            value.forEach(
              (key, value) {
                Map data = value as Map<dynamic, dynamic>;
                temp.add(TimeTable.fromJson(data));
              },
            );
            Map tempMap = {
              'lectureDate': keys,
              'tb':
                  List<Map<String, dynamic>>.from(temp.map((e) => e.toJson())),
            };
            timeTableDataList.add(TimeTableModel.fromJson(tempMap));
            for (var ele in timeTableDataList) {
              print(ele.lectureDate);
              for (var tbData in ele.tb) {
                print(tbData.toJson());
              }
            }
          },
        );
      },
    );
  }

  static updateData({
    required String child,
    required String oldDate,
    required TimeTable obj,
  }) async {
    if (child != oldDate) {
      await deleteTimeTableData(key: obj.key.toString(), child: oldDate);
    }
    await db.child(child).child(obj.key.toString()).update(obj.toJson());
    //   {
    //     'Key': tbl.key,
    //     'Stream': tbl.stream,
    //     'Semester': tbl.semester,
    //     'LectureName': tbl.lectureName,
    //     'LectureDate': tbl.lectureDate,
    //     'LectureStartTime': tbl.lectureStartTime,
    //     'LectureEndTime': tbl.lectureEndTime,
    //   },
    // );
  }

  static deleteTimeTableData(
      {required String key, required String child}) async {
    await db.child(child).child(key).remove();
  }
}

// **** Materials ****
class MaterialApi {
  static DatabaseReference db = FirebaseDatabase.instance.ref('materials');

  static materialsAddData({required Materials obj}) async {
    await db.child(obj.key.toString()).set(obj.toJson());
  }

  static Future fetchData() async {
    materialsDataList.clear();
    await db.once().then((value) {
      Map data =
          value.snapshot.value == null ? {} : value.snapshot.value as Map;
      data.forEach((key, value) {
        materialsDataList.add(Materials.fromJson(value));
      });
      materialsDataList.sort((a, b) => a.key.compareTo(b.key));
    });
  }

  static deleteData({required String key}) async {
    await db.child(key).remove();
  }
}

// **** Assignment ****
class AssignmentApi {
  static DatabaseReference db = FirebaseDatabase.instance.ref('assignments');

  static assignmentAddData({required Assignment obj}) async {
    await db.child(obj.key.toString()).set(obj.toJson());
  }

  static Future fetchData() async {
    assignmentDataList.clear();
    await db.once().then((value) {
      Map data =
          value.snapshot.value == null ? {} : value.snapshot.value as Map;
      data.forEach((key, value) {
        assignmentDataList.add(Assignment.fromJson(value));
      });
      assignmentDataList.sort((a, b) => a.key.compareTo(b.key));
    });
  }

  static deleteData({required String key}) async {
    await db.child(key).remove();
  }
}

// **** Course ****
class CourseApi {
  static DatabaseReference db = FirebaseDatabase.instance.ref('courses');

  static courseAddData({required Course obj}) async {
    await db.child(obj.key.toString()).set(obj.toJson());
  }

  static fetchData() async {
    courseDataList.clear();
    await db.once().then((value) {
      Map data =
          value.snapshot.value == null ? {} : value.snapshot.value as Map;
      data.forEach((key, value) {
        courseDataList.add(Course.fromJson(value));
      });
      courseDataList.sort((a, b) => a.key.compareTo(b.key));
    });
  }

  static deleteData({required String key}) async {
    await db.child(key).remove();
  }
}

// **** Result ****
class ResultApi {
  static DatabaseReference db = FirebaseDatabase.instance.ref('results');

  static resultAddData({required Result obj}) async {
    await db.child(obj.key.toString()).set(obj.toJson());
  }

  static Future<void> fetchData() async {
    resultDataList.clear();
    await db.once().then((value) {
      Map data =
          value.snapshot.value == null ? {} : value.snapshot.value as Map;
      data.forEach((key, value) {
        resultDataList.add(Result.fromJson(value));
      });
      resultDataList.sort((a, b) => a.key!.compareTo(b.key!));
    });
  }

  static deleteData({required String key}) async {
    await db.child(key).remove();
  }
}

// **** Cultural Festival Notice ****
class CulturalFestivalApi {
  static DatabaseReference db =
      FirebaseDatabase.instance.ref('culturalFestivalNotice');

  static culturalFestivalAddData({required CulturalFestival obj}) async {
    await db.child(obj.key.toString()).set(obj.toJson());
  }

  static fetchData() async {
    culturalFestivalDataList.clear();
    await db.once().then((value) {
      Map data =
          value.snapshot.value == null ? {} : value.snapshot.value as Map;
      data.forEach((key, value) {
        culturalFestivalDataList.add(CulturalFestival.fromJson(value));
      });
      culturalFestivalDataList.sort((a, b) => a.key.compareTo(b.key));
    });
  }

  static updateData({required CulturalFestival obj}) async {
    await db.child(obj.key.toString()).update(obj.toJson());
  }

  static deleteData({required String key}) async {
    await db.child(key).remove();
  }
}

// **** College Activity Notice ****

class CollegeActivityApi {
  static DatabaseReference db =
      FirebaseDatabase.instance.ref('collegeActivityNotice');

  static collegeActivityAddData({required CollegeActivity obj}) async {
    await db.child(obj.key.toString()).set(obj.toJson());
  }

  static fetchData() async {
    collegeActivityDataList.clear();
    await db.once().then((value) {
      Map data =
          value.snapshot.value == null ? {} : value.snapshot.value as Map;
      data.forEach((key, value) {
        collegeActivityDataList.add(CollegeActivity.fromJson(value));
      });
      collegeActivityDataList.sort((a, b) => a.key.compareTo(b.key));
    });
  }

  static updateData({required CollegeActivity obj}) async {
    await db.child(obj.key.toString()).update(obj.toJson());
  }

  static deleteData({required String key}) async {
    await db.child(key).remove();
  }
}

// **** Sports Notice ****
class SportsApi {
  static DatabaseReference db = FirebaseDatabase.instance.ref('sportsNotice');

  static sportsAddData({required Sports obj}) async {
    await db.child(obj.key.toString()).set(obj.toJson());
  }

  static fetchData() async {
    sportsDataList.clear();
    await db.once().then((value) {
      Map data =
          value.snapshot.value == null ? {} : value.snapshot.value as Map;
      data.forEach((key, value) {
        sportsDataList.add(Sports.fromJson(value));
      });
      sportsDataList.sort((a, b) => a.key.compareTo(b.key));
    });
  }

  static Future<void> updateData({required Sports obj}) async {
    await db.child(obj.key.toString()).update(obj.toJson());
  }

  static deleteData({required String key}) async {
    await db.child(key).remove();
  }
}

// **** Job Vacancy Notice ****
class JobVacancyApi {
  static DatabaseReference db =
      FirebaseDatabase.instance.ref('jobVacancyNotice');

  static jobVacancyAddData({required JobVacancy obj}) async {
    await db.child(obj.key.toString()).set(obj.toJson());
  }

  static fetchData() async {
    jobVacancyDataList.clear();
    await db.once().then((value) {
      Map data =
          value.snapshot.value == null ? {} : value.snapshot.value as Map;
      data.forEach((key, value) {
        jobVacancyDataList.add(JobVacancy.fromJson(value));
      });
      jobVacancyDataList.sort((a, b) => a.key.compareTo(b.key));
    });
  }

  static updateData({required JobVacancy obj}) async {
    await db.child(obj.key.toString()).update(obj.toJson());
  }

  static deleteData({required String key}) async {
    await db.child(key).remove();
  }
}

// **** General Notice ****
class GeneralApi {
  static DatabaseReference db = FirebaseDatabase.instance.ref('generalNotice');

  static generalAddData({required General obj}) async {
    await db.child(obj.key.toString()).set(obj.toJson());
  }

  static fetchData() async {
    generalDataList.clear();
    await db.once().then((value) {
      Map data =
          value.snapshot.value == null ? {} : value.snapshot.value as Map;
      data.forEach((key, value) {
        generalDataList.add(General.fromJson(value));
      });
      generalDataList.sort((a, b) => a.key.compareTo(b.key));
    });
  }

  static updateData({required General obj}) async {
    await db.child(obj.key.toString()).update(obj.toJson());
  }

  static deleteData({required String key}) async {
    await db.child(key).remove();
  }
}

// **** Compatitive Exam Notice ****
class CompetitiveExamApi {
  static DatabaseReference db =
      FirebaseDatabase.instance.ref('competitiveExamNotice');

  static competitiveExamAddData({required CompetitiveExam obj}) async {
    await db.child(obj.key.toString()).set(obj.toJson());
  }

  static fetchData() async {
    competitiveExamDataList.clear();
    await db.once().then((value) {
      Map data =
          value.snapshot.value == null ? {} : value.snapshot.value as Map;
      data.forEach((key, value) {
        competitiveExamDataList.add(CompetitiveExam.fromJson(value));
      });
      competitiveExamDataList.sort((a, b) => a.key.compareTo(b.key));
    });
  }

  static updateData({required CompetitiveExam obj}) async {
    await db.child(obj.key.toString()).update(obj.toJson());
  }

  static deleteData({required String key}) async {
    await db.child(key).remove();
  }
}
