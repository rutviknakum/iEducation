

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
import 'package:admin_appppppp/home/time_table/time_table_screen.dart';
import 'package:admin_appppppp/home/time_table/update_time_table.dart';
import 'package:admin_appppppp/login_screen/login_screen.dart';
import 'package:admin_appppppp/navigation/constants.dart';
import 'package:admin_appppppp/navigation/fade_route.dart';
import 'package:admin_appppppp/navigation/slide_transit.dart';
import 'package:flutter/material.dart';

import '../home/time_table/add_timetable_screen.dart';

class NavigationUtilities {
  static final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  static void push(Widget widget, {String? name}) {
    key.currentState!.push(MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(name: name),
    ));
  }

  static Future<dynamic>? pushNamed(String route,
      {RouteType type = RouteType.left, Map<String, dynamic>? args}) {
    args ??= <String, dynamic>{};
    args["routeType"] = type;
    return key.currentState!.pushNamed(
      route,
      arguments: args,
    );
  }

  static Future<dynamic> pushRoute(String route,
      {RouteType type = RouteType.left, Map? args}) async {
    args ??= <String, dynamic>{};
    args["routeType"] = type;
    return await key.currentState!.pushNamed(
      route,
      arguments: args,
    );
  }

  static Future<dynamic>? pushReplacementNamed(String route,
      {RouteType type = RouteType.left, Map? args}) {
    args ??= <String, dynamic>{};
    args["routeType"] = type;
    return key.currentState!.pushReplacementNamed(
      route,
      arguments: args,
    );
  }

  static RoutePredicate namePredicate(List<String> names) {
    return (route) =>
        !route.willHandlePopInternally &&
        route is ModalRoute &&
        (names.contains(route.settings.name));
  }
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final routeName = settings.name;
  final arguments = settings.arguments as Map<String, dynamic>? ?? {};
  final routeType =
      arguments["routeType"] as RouteType? ?? RouteType.defaultRoute;

  Widget? screen;

  switch (routeName) {
    case LoginScreen.route:
      screen = const LoginScreen();
      break;
    case HomeScreen.route:
      screen = const HomeScreen();
      break;

// **** Student ****
    case StudentsFieldScreen.route:
      screen = const StudentsFieldScreen();
      break;
    case StudentListScreen.route:
      screen = StudentListScreen(
        args: arguments,
      );
      break;
    case StudentProfileScreen.route:
      screen = StudentProfileScreen(
        args: arguments,
      );
      break;
    case AddStudentDetails.route:
      screen = const AddStudentDetails();
      break;
    case UpdateStudent.route:
      screen = UpdateStudent(
        args: arguments,
      );
      break;

// **** Time Table ****
    case TimeTableScreen.route:
      screen = const TimeTableScreen();
      break;
    case AddTimeTable.route:
      screen = const AddTimeTable();
      break;
    case UpdateTimeTable.route:
      screen = UpdateTimeTable(
        args: arguments,
      );
      break;

// **** Staff List ****
    case StaffListScreen.route:
      screen = const StaffListScreen();
      break;
    case AddStaffDetailsScreen.route:
      screen = const AddStaffDetailsScreen();
      break;
    case StaffProfileScreen.route:
      screen = StaffProfileScreen(
        args: arguments,
      );
      break;
    case UpdateStaffScreen.route:
      screen = UpdateStaffScreen(
        args: arguments,
      );
      break;

// **** Notice ****
    case NoticeScreen.route:
      screen = const NoticeScreen();
      break;

    case CulturalFestivalNotice.route:
      screen = const CulturalFestivalNotice();
      break;
    case CollegeActivityNotice.route:
      screen = const CollegeActivityNotice();
      break;
    case SportsNoticeScreen.route:
      screen = const SportsNoticeScreen();
      break;
    case CompetitiveExamNotice.route:
      screen = const CompetitiveExamNotice();
      break;
    case JobVacancyNotice.route:
      screen = const JobVacancyNotice();
      break;
    case GeneralNotice.route:
      screen = const GeneralNotice();
      break;

// **** Add Notice ****
    case AddCulturalFestival.route:
      screen = const AddCulturalFestival();
      break;
    case AddCollegeActivityNotice.route:
      screen = const AddCollegeActivityNotice();
      break;
    case AddSportsNotice.route:
      screen = const AddSportsNotice();
      break;
    case AddCompetitiveExamNotice.route:
      screen = const AddCompetitiveExamNotice();
      break;
    case AddJobVacancyNotice.route:
      screen = const AddJobVacancyNotice();
      break;
    case AddGeneralNotice.route:
      screen = const AddGeneralNotice();
      break;

// **** Update Notice ****
    case UpdateCultureFestival.route:
      screen = UpdateCultureFestival(
        args: arguments,
      );
      break;
    case UpdateCollegeActivity.route:
      screen = UpdateCollegeActivity(
        args: arguments,
      );
      break;
    case UpdateSportNotice.route:
      screen = UpdateSportNotice(
        args: arguments,
      );
      break;
    case UpdateCompetitiveExam.route:
      screen = UpdateCompetitiveExam(
        args: arguments,
      );
      break;
    case UpdateJobVacancyNotice.route:
      screen = UpdateJobVacancyNotice(
        args: arguments,
      );
      break;
    case UpdateGeneralNotice.route:
      screen = UpdateGeneralNotice(
        args: arguments,
      );
      break;

// **** Materials ****
    case MaterialScreen.route:
      screen = const MaterialScreen();
      break;
    case AddMaterialScreen.route:
      screen = const AddMaterialScreen();
      break;

// **** Materials ****
    case AssignmentScreen.route:
      screen = const AssignmentScreen();
      break;
    case AddAssignmentScreen.route:
      screen = const AddAssignmentScreen();
      break;

// **** Course ****
    case CourseScreen.route:
      screen = const CourseScreen();
      break;
    case AddCourseScreen.route:
      screen = const AddCourseScreen();
      break;

// **** Course ****
    case ResultScreen.route:
      screen = const ResultScreen();
      break;
    case AddResultScreen.route:
      screen = const AddResultScreen();
      break;
  }

  switch (routeType) {
    case RouteType.fade:
      return FadeRoute(
        builder: (_) => screen!,
        settings: RouteSettings(name: routeName),
      );
    case RouteType.left:
      return SlideRoute(
        enterPage: screen!,
        direction: AxisDirection.left,
      );

    case RouteType.down:
      return SlideRoute(
        enterPage: screen!,
        direction: AxisDirection.down,
      );
    case RouteType.up:
      return SlideRoute(
        enterPage: screen!,
        direction: AxisDirection.up,
      );
    case RouteType.right:
      return SlideRoute(
        enterPage: screen!,
        direction: AxisDirection.right,
      );

    case RouteType.defaultRoute:
    default:
      return MaterialPageRoute(
        builder: (_) => screen!,
        settings: RouteSettings(name: routeName),
      );
  }
}
