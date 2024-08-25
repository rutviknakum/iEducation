// ignore_for_file: use_build_context_synchronously

import 'package:admin_appppppp/Network/database_api.dart';
import 'package:admin_appppppp/constant.dart';
import 'package:admin_appppppp/home/Attendence/attendence_screen.dart';
import 'package:admin_appppppp/home/assignment/assignment_screen.dart';
import 'package:admin_appppppp/home/fees/fees_screen.dart';
import 'package:admin_appppppp/home/home_page_widget.dart';
import 'package:admin_appppppp/login_screen/login_screen.dart';
import 'package:admin_appppppp/navigation/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const HomeScreen({Key? key}) : super(key: key);
  static const route = 'home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // ignore: prefer_const_constructors
                    title: Row(
                      children: const [
                        Icon(Icons.logout),
                        kWidthSizedBox,
                        Text("Logout"),
                      ],
                    ),
                    content: const Text("Sure you want to logout"),
                    actions: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {});
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Center(
                            child: Text(
                              'Cancle',
                              style: TextStyle(color: kOtherColor),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          pref.remove("userID");
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                          setState(() {});
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Center(
                            child: Text(
                              'Ok',
                              style: TextStyle(color: kOtherColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Icon(
              Icons.logout,
              color: kOtherColor,
              size: 25,
            ),
          ),
          kHalfWidthSizedBox,
        ],
        title: const Text(
          "DASHBOARD",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomeCard(
                    title: "Students",
                    icon: 'assets/icons/students.png',
                    onPress: () {
                      AppNavigation.shared.movetoStudent();
                      setState(() {});
                    },
                  ),
                  HomeCard(
                    title: 'Time Table',
                    icon: 'assets/icons/timetable.png',
                    onPress: () async {
                      await TimeTableApi.fetchData();
                      await AppNavigation.shared.movetoTimeTableScreen();
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomeCard(
                    title: "Notice",
                    icon: 'assets/icons/notice.png',
                    onPress: () {
                      AppNavigation.shared.moveToNoticeScreen();
                      setState(() {});
                    },
                  ),
                  HomeCard(
                    title: "Materials",
                    icon: 'assets/icons/materials.png',
                    onPress: () async {
                      await MaterialApi.fetchData();
                      AppNavigation.shared.moveToMaterialsScreen();
                      setState(() {});
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomeCard(
                    title: "Course",
                    icon: 'assets/icons/course.png',
                    onPress: () async {
                      await CourseApi.fetchData();
                      AppNavigation.shared.moveToCourseScreen();
                      setState(() {});
                    },
                  ),
                  HomeCard(
                    title: "Attendence",
                    icon: 'assets/icons/attendence.png',
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AttendenceScreen(),
                        ),
                      );
                      setState(() {});
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomeCard(
                    title: "Results",
                    icon: 'assets/icons/results.png',
                    onPress: () async {
                      await ResultApi.fetchData();
                      AppNavigation.shared.moveToResultScreen();
                      setState(() {});
                    },
                  ),
                  HomeCard(
                    title: "Staff List",
                    icon: 'assets/icons/staff.png',
                    onPress: () {
                      AppNavigation.shared.movetoStaffList();
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const StaffListScreen(),
                      //     ),
                      //   );
                      //   setState(() {});
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomeCard(
                    title: "Fees",
                    icon: 'assets/icons/fees.png',
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FeesScreen(),
                        ),
                      );
                      setState(() {});
                    },
                  ),
                  HomeCard(
                    title: "Assignment",
                    icon: 'assets/icons/materials.png',
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AssignmentScreen(),
                        ),
                      );
                      setState(() {});
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
