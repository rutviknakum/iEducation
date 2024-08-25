
import 'package:admin_appppppp/home/assignment/add_assignment_screen.dart';
import 'package:admin_appppppp/home/assignment/assignment_screen.dart';
import 'package:admin_appppppp/home/course/add_course_screen.dart';
import 'package:admin_appppppp/home/course/course_screen.dart';
import 'package:admin_appppppp/home/home_screen.dart';
import 'package:admin_appppppp/home/materials/add_materials_screen.dart';
import 'package:admin_appppppp/home/materials/materials_screen.dart';
import 'package:admin_appppppp/home/notice/General/add_general_notice.dart';
import 'package:admin_appppppp/home/notice/General/general_notice.dart';
import 'package:admin_appppppp/home/notice/General/update_general_notice.dart';
import 'package:admin_appppppp/home/notice/college_activity/add_college_activity_notice.dart';
import 'package:admin_appppppp/home/notice/college_activity/college_activity_notice.dart';
import 'package:admin_appppppp/home/notice/college_activity/update_college_activity.dart';
import 'package:admin_appppppp/home/notice/competitive_exam/add_competitive_exam_notice.dart';
import 'package:admin_appppppp/home/notice/competitive_exam/competitive_exam_notice.dart';
import 'package:admin_appppppp/home/notice/competitive_exam/update_competitive_exam.dart';
import 'package:admin_appppppp/home/notice/cultural_festival/add_clutural_festival_notice.dart';
import 'package:admin_appppppp/home/notice/cultural_festival/cultural_festival_notice.dart';
import 'package:admin_appppppp/home/notice/cultural_festival/update_clutural_festival.dart';
import 'package:admin_appppppp/home/notice/job_vacancy/add_job_vacancy.dart';
import 'package:admin_appppppp/home/notice/job_vacancy/job_vacancy_notice.dart';
import 'package:admin_appppppp/home/notice/job_vacancy/update_job_vacancy.dart';
import 'package:admin_appppppp/home/notice/notice_screen.dart';
import 'package:admin_appppppp/home/notice/sports/add_sports_screen.dart';
import 'package:admin_appppppp/home/notice/sports/sports_notice.dart';
import 'package:admin_appppppp/home/notice/sports/update_sport_notice.dart';
import 'package:admin_appppppp/home/results/add_result_screen.dart';
import 'package:admin_appppppp/home/results/result_screen.dart';
import 'package:admin_appppppp/home/staff_list/add_staff_details_screen.dart';
import 'package:admin_appppppp/home/staff_list/staff_profile.dart';
import 'package:admin_appppppp/home/staff_list/stafflist_screen.dart';
import 'package:admin_appppppp/home/staff_list/update_staff.dart';
import 'package:admin_appppppp/home/students/add_student_details.dart';
import 'package:admin_appppppp/home/students/student_list.dart';
import 'package:admin_appppppp/home/students/student_profile_screen.dart';
import 'package:admin_appppppp/home/students/students_field.dart';
import 'package:admin_appppppp/home/students/update_student.dart';
import 'package:admin_appppppp/home/time_table/add_timeTable_screen.dart';
import 'package:admin_appppppp/home/time_table/time_table_screen.dart';
import 'package:admin_appppppp/home/time_table/update_time_table.dart';
import 'package:admin_appppppp/login_screen/login_screen.dart';
import 'package:admin_appppppp/navigation/constants.dart';
import 'package:admin_appppppp/navigation/navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppNavigation {
  static final AppNavigation shared = AppNavigation();

  void goNextFromSplash() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getBool('userID') == true) {
      NavigationUtilities.pushReplacementNamed(HomeScreen.route,
          type: RouteType.up);
    } else {
      NavigationUtilities.pushReplacementNamed(LoginScreen.route,
          type: RouteType.right);
    }
  }

// **** Student ****
  void movetoStudent() {
    NavigationUtilities.pushNamed(StudentsFieldScreen.route);
  }

  void movetoAddStudent() {
    NavigationUtilities.pushNamed(AddStudentDetails.route, type: RouteType.up);
  }

  void moveToStudentList(String stream) {
    NavigationUtilities.pushNamed(StudentListScreen.route,
        type: RouteType.up, args: {'stream': stream});
  }

  void moveToStudentProfile(
    Map<String, dynamic> args,
    // {bool isReplace = false}
  ) {
    // if (isReplace == true) {
    //   NavigationUtilities.pushNamed(StudentProfileScreen.route,
    //       type: RouteType.up);
    // } else {
    NavigationUtilities.pushNamed(StudentProfileScreen.route,
        type: RouteType.up, args: args);
    // }
  }

  Future<dynamic> moveToUpdateStudent(Map<String, dynamic> args) async {
    NavigationUtilities.pushNamed(UpdateStudent.route, args: args);
  }

// **** Time Table ****
  movetoTimeTableScreen()  {
    // await TimeTableApi.fetchData();
    NavigationUtilities.pushNamed(TimeTableScreen.route);
  }

  Future movetoAddTimeTableScreen() async {
    await NavigationUtilities.pushNamed(AddTimeTable.route, type: RouteType.up);
  }

  void moveToUpdateTimeTableScreen(Map<String, dynamic> args) async {
    NavigationUtilities.pushNamed(UpdateTimeTable.route, args: args);
  }

// **** Staff List ****
  void movetoStaffList() {
    NavigationUtilities.pushNamed(StaffListScreen.route, type: RouteType.right);
  }

  Future<dynamic> moveToAddStaffList() async {
    NavigationUtilities.pushNamed(AddStaffDetailsScreen.route,
        type: RouteType.up);
  }

  void moveToStaffProfile(Map<String, dynamic> args) {
    NavigationUtilities.pushNamed(StaffProfileScreen.route,
        type: RouteType.up, args: args);
  }

  Future<dynamic> moveToUpdateStaffList(Map<String, dynamic> args) async {
    NavigationUtilities.pushNamed(UpdateStaffScreen.route, args: args);
  }

// **** Notice ****
  void moveToNoticeScreen() {
    NavigationUtilities.pushNamed(NoticeScreen.route);
  }

  void moveToCulturalFestivalScreen() {
    NavigationUtilities.pushNamed(CulturalFestivalNotice.route);
  }

  void moveToCollegeActivityScreen() {
    NavigationUtilities.pushNamed(CollegeActivityNotice.route);
  }

  void moveToSportsScreen() {
    NavigationUtilities.pushNamed(SportsNoticeScreen.route);
  }

  void moveToCompatitiveExamScreen() {
    NavigationUtilities.pushNamed(CompetitiveExamNotice.route);
  }

  void moveToJobVacancyScreen() {
    NavigationUtilities.pushNamed(JobVacancyNotice.route);
  }

  void moveToGeneralScreen() {
    NavigationUtilities.pushNamed(GeneralNotice.route);
  }

// **** Add Notice ****

  void moveToAddCulturalFestivalScreen() {
    NavigationUtilities.pushNamed(AddCulturalFestival.route,
        type: RouteType.up);
  }

  void moveToAddCollegeActivityScreen() {
    NavigationUtilities.pushNamed(AddCollegeActivityNotice.route,
        type: RouteType.up);
  }

  void moveToAddSportsScreen() {
    NavigationUtilities.pushNamed(AddSportsNotice.route, type: RouteType.up);
  }

  void moveToAddCompatitiveExamScreen() {
    NavigationUtilities.pushNamed(AddCompetitiveExamNotice.route,
        type: RouteType.up);
  }

  void moveToAddJobVacancyScreen() {
    NavigationUtilities.pushNamed(AddJobVacancyNotice.route,
        type: RouteType.up);
  }

  void moveToAddGeneralScreen() {
    NavigationUtilities.pushNamed(AddGeneralNotice.route, type: RouteType.up);
  }

// **** Update Notice ****

  void moveToUpdateCulturalFestivalScreen(Map<String, dynamic> args) {
    NavigationUtilities.pushNamed(UpdateCultureFestival.route, args: args);
  }

  void moveToUpdateCollegeActivityScreen(Map<String, dynamic> args) {
    NavigationUtilities.pushNamed(UpdateCollegeActivity.route, args: args);
  }

  void moveToUpdateSportsScreen(Map<String, dynamic> args) {
    NavigationUtilities.pushNamed(UpdateSportNotice.route, args: args);
  }

  void moveToUpdateCompatitiveExamScreen(Map<String, dynamic> args) {
    NavigationUtilities.pushNamed(UpdateCompetitiveExam.route, args: args);
  }

  void moveToUpdateJobVacancyScreen(Map<String, dynamic> args) {
    NavigationUtilities.pushNamed(UpdateJobVacancyNotice.route, args: args);
  }

  void moveToUpdateGeneralScreen(Map<String, dynamic> args) {
    NavigationUtilities.pushNamed(UpdateGeneralNotice.route, args: args);
  }

// **** Materials ********

  void moveToMaterialsScreen() {
    NavigationUtilities.pushNamed(MaterialScreen.route);
  }

  void moveToAddMaterialScreen() {
    NavigationUtilities.pushNamed(AddMaterialScreen.route, type: RouteType.up);
  }

// **** Materials ********

  void moveToAssignmentScreen() {
    NavigationUtilities.pushNamed(AssignmentScreen.route);
  }

  void moveToAddAssignmentScreen() {
    NavigationUtilities.pushNamed(AddAssignmentScreen.route,
        type: RouteType.up);
  }

// **** Course ********

  void moveToCourseScreen() {
    NavigationUtilities.pushNamed(CourseScreen.route);
  }

  void moveToAddCourseScreen() {
    NavigationUtilities.pushNamed(AddCourseScreen.route, type: RouteType.up);
  }

// **** Result ********

  void moveToResultScreen() {
    NavigationUtilities.pushNamed(ResultScreen.route);
  }

  void moveToAddResultScreen() {
    NavigationUtilities.pushNamed(AddResultScreen.route, type: RouteType.up);
  }

  // void moveToLogin({bool isPopAndSwitch = true, bool isLogOut = false}) {
  // print('Go to Appnavigation And code their For Move To Next screen');
  //   if (isLogOut) {
  //     Navigator.of(NavigationUtilities.key.currentState!.overlay!.context)
  //         .pushNamedAndRemoveUntil(
  //       OtpLoginScreen.route,
  //       (Route<dynamic> route) => false,
  //     );
  //   } else {
  //     NavigationUtilities.pushReplacementNamed(OtpLoginScreen.route);
  //   }
  // }
}
