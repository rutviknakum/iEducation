import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:user_apppp/database/database_class.dart';

// **** Student ****
class StudentDataApi {
  static DatabaseReference db = FirebaseDatabase.instanceFor(
          app: Firebase.app(),
          databaseURL:
              'https://ieducation-845d5-default-rtdb.firebaseio.com') // ieducation-845d5 // school-2d4f0
      .ref('studentDetails');

  static Future fetchData() async {
    studentDataList.clear();
    await db.once().then((value) {
      Map data =
          value.snapshot.value == null ? {} : value.snapshot.value as Map;
      data.forEach((key, value) {
        value.forEach((key, value) {
          studentDataList.add(Student.fromJson(value));
        });
        studentDataList.sort((a, b) => a.key.compareTo(b.key));
      });
    });
  }
}

// **** Staff List ****
class StaffListApi {
  static DatabaseReference db = FirebaseDatabase.instanceFor(
          app: Firebase.app(),
          databaseURL: 'https://ieducation-845d5-default-rtdb.firebaseio.com')
      .ref('staffList');

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
}

// **** Time Table ****
// class TimeTableApi {
//   static DatabaseReference db = FirebaseDatabase.instanceFor(
//           app: Firebase.app(),
//           databaseURL: 'https://school-2d4f0-default-rtdb.firebaseio.com')
//       .ref('timeTable');

//   static fetchData() async {
//     tableData.clear();

//     await db.once().then(
//       (value) {
//         Map data =
//             value.snapshot.value == null ? {} : value.snapshot.value as Map;
//         data.forEach(
//           (key, value) {
//             List<TimeTable> temp = [];
//             value.forEach(
//               (keys, value) {
//                 temp.add(
//                   TimeTable(
//                     key: value['Key'],
//                     stream: value['Stream'],
//                     semester: value['Semester'],
//                     lectureName: value['LectureName'],
//                     lectureDate: value['LectureDate'],
//                     lectureStartTime: value['LectureStartTime'],
//                     lectureEndTime: value['LectureEndTime'],
//                   ),
//                 );
//               },
//             );
//             tableData.add(
//               TimeTableModel(
//                 lectureDate: key,
//                 tb: temp,
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }

// **** Materials ****
class MaterialApi {
  static DatabaseReference db = FirebaseDatabase.instanceFor(
          app: Firebase.app(),
          databaseURL: 'https://ieducation-845d5-default-rtdb.firebaseio.com')
      .ref('materials');

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
}

// **** Assignment ****
class AssignmentApi {
  static DatabaseReference db = FirebaseDatabase.instanceFor(
          app: Firebase.app(),
          databaseURL: 'https://ieducation-845d5-default-rtdb.firebaseio.com')
      .ref('assignments');

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
}

// **** Course ****
class CourseApi {
  static DatabaseReference db = FirebaseDatabase.instanceFor(
          app: Firebase.app(),
          databaseURL: 'https://ieducation-845d5-default-rtdb.firebaseio.com')
      .ref('courses');

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
}

// **** Result ****
class ResultApi {
  static DatabaseReference db = FirebaseDatabase.instanceFor(
          app: Firebase.app(),
          databaseURL: 'https://ieducation-845d5-default-rtdb.firebaseio.com')
      .ref('results');

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
}

// **** Cultural Festival Notice ****
class CulturalFestivalApi {
  static DatabaseReference db = FirebaseDatabase.instanceFor(
          app: Firebase.app(),
          databaseURL: 'https://ieducation-845d5-default-rtdb.firebaseio.com')
      .ref('culturalFestivalNotice');

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
}

// **** College Activity Notice ****

class CollegeActivityApi {
  static DatabaseReference db = FirebaseDatabase.instanceFor(
          app: Firebase.app(),
          databaseURL: 'https://ieducation-845d5-default-rtdb.firebaseio.com')
      .ref('collegeActivityNotice');

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
}

// **** Sports Notice ****
class SportsApi {
  static DatabaseReference db = FirebaseDatabase.instanceFor(
          app: Firebase.app(),
          databaseURL: 'https://ieducation-845d5-default-rtdb.firebaseio.com')
      .ref('sportsNotice');

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
}

// **** Job Vacancy Notice ****
class JobVacancyApi {
  static DatabaseReference db = FirebaseDatabase.instanceFor(
          app: Firebase.app(),
          databaseURL: 'https://ieducation-845d5-default-rtdb.firebaseio.com')
      .ref('jobVacancyNotice');

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
}

// **** General Notice ****
class GeneralApi {
  static DatabaseReference db = FirebaseDatabase.instanceFor(
          app: Firebase.app(),
          databaseURL: 'https://ieducation-845d5-default-rtdb.firebaseio.com')
      .ref('generalNotice');

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
}

// **** Compatitive Exam Notice ****
class CompetitiveExamApi {
  static DatabaseReference db = FirebaseDatabase.instanceFor(
          app: Firebase.app(),
          databaseURL: 'https://ieducation-845d5-default-rtdb.firebaseio.com')
      .ref('competitiveExamNotice');

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
}
