// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:user_apppp/screens/course_screen.dart';
import 'package:user_apppp/screens/id_card_screen.dart';
import 'package:user_apppp/screens/material_screen.dart';
import 'package:user_apppp/screens/notice/notice_screen.dart';
import 'package:user_apppp/screens/teaching_work_screen.dart';
import 'package:user_apppp/screens/time_table/time_table_screen.dart';
import 'package:user_apppp/student_profile/student_profile_screen.dart';

import 'constant.dart';
import 'data/database_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isProfileLoading = false;
  @override
  void initState() {
    profileData();
    super.initState();
  }

  profileData() async {
    isProfileLoading = false;
    await DataBaseHelper.filterData();
    isProfileLoading = true;
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: isProfileLoading == false
          ? Center(
              child: CircularProgressIndicator(
                color: primarycolor,
              ),
            )
          : Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    color: primarycolor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05,
                      left: MediaQuery.of(context).size.height / 22,
                      right: MediaQuery.of(context).size.height / 22,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${DataBaseHelper.viewStudentData!.fName} ${DataBaseHelper.viewStudentData!.mName}',
                              style: TextStyle(
                                color: white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.055,
                              ),
                            ),
                            Text(
                              DataBaseHelper.viewStudentData!.phoneNo,
                              style: TextStyle(
                                color: white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.045,
                              ),
                            ),
                            Text(
                              '${DataBaseHelper.viewStudentData!.stream} (${DataBaseHelper.viewStudentData!.semester}) ',
                              style: TextStyle(
                                color: white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.045,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await DataBaseHelper.filterData();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const StudentProfileScreen(),
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: white,
                                backgroundImage: NetworkImage(
                                  DataBaseHelper.viewStudentData!.image,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.23,
                    left: MediaQuery.of(context).size.height * 0.02,
                    right: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: Card(
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: background),
                    ),
                    elevation: 5,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: background,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              HomeTopWidget(
                                title: "ID Card",
                                icon: "assets/icons/id-card.png",
                                onPress: () async {
                                  await DataBaseHelper.filterData();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const IdCardScreen(),
                                    ),
                                  );
                                },
                              ),
                              HomeTopWidget(
                                title: "Material",
                                icon: "assets/icons/syllbus.png",
                                onPress: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const MaterialScreen(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              HomeTopWidget(
                                title: "Course",
                                icon: "assets/icons/course.png",
                                onPress: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CourseScreen(),
                                    ),
                                  );
                                },
                              ),
                              HomeTopWidget(
                                title: "Notice",
                                icon: "assets/icons/notice.png",
                                onPress: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const NoticeScreen(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              HomeTopWidget(
                                title: "Teaching",
                                icon: "assets/icons/teachingwork.png",
                                onPress: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const TeachingWorkScreen(),
                                    ),
                                  );
                                },
                              ),
                              HomeTopWidget(
                                title: "Time Table",
                                icon: "assets/icons/timetable.png",
                                onPress: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const TimeTableScreen(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      // child: column(context),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 1.8,
                    left: MediaQuery.of(context).size.width / 22,
                    right: MediaQuery.of(context).size.width / 22,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'Fees',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontWeight: FontWeight.bold,
                            color: primarycolor,
                          ),
                        ),
                      ),
                      Card(
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: background),
                        ),
                        elevation: 7,
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const FeesScreenDesgin(),
                            //   ),
                            // );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.11,
                            decoration: BoxDecoration(
                              color: background,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Total Amount',
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03,
                                        fontWeight: FontWeight.w600,
                                        color: primarycolor,
                                      ),
                                    ),
                                    Text(
                                      "\$14500",
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03,
                                        color: primarycolor,
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  child: VerticalDivider(
                                    color: primarycolor,
                                    thickness: 1,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Paid Amount',
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03,
                                        fontWeight: FontWeight.w600,
                                        color: primarycolor,
                                      ),
                                    ),
                                    Text(
                                      "\$14500",
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03,
                                        color: primarycolor,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  child: VerticalDivider(
                                    color: primarycolor,
                                    thickness: 1,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Remaing Amount',
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03,
                                        fontWeight: FontWeight.w600,
                                        color: primarycolor,
                                      ),
                                    ),
                                    Text(
                                      "\$00000",
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03,
                                        color: primarycolor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        endIndent: 10,
                        indent: 10,
                        // color: primarycolor,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text('Attendence',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                              fontWeight: FontWeight.bold,
                              color: primarycolor,
                            )),
                      ),
                      Card(
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: background),
                        ),
                        elevation: 7,
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => const AttendanceScreen(),
                            //     ));
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.11,
                            decoration: BoxDecoration(
                                color: background,
                                borderRadius: BorderRadius.circular(10)
                                // //blurRadius: 2,
                                // radis: 10,
                                // //blurStyle: BlurStyle.solid,
                                ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Your Attendence',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                        ),
                                      ),
                                      Text('47.90%',
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ],
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/icons/attendence.png'),
                                          fit: BoxFit.contain),
                                      //radis: 20,
                                      gradient: LinearGradient(
                                        colors: [sixth, secoundrycolor],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      shape: BoxShape.circle,

                                      // borderwidth: 5,
                                      // bordercolor: black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kSecondaryColor,
//       body: isProfileLoading
//           ? const Center(
//               child: CircularProgressIndicator(),
//             )
//           : Stack(
//               children: [
//                 Container(
//                   height: MediaQuery.of(context).size.height * 0.38,
//                   decoration: const BoxDecoration(
//                     color: kPrimaryColor,
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(60),
//                       bottomRight: Radius.circular(60),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 '${DataBaseHelper.viewStudentData!.fName} ${DataBaseHelper.viewStudentData!.mName}',
//                                 style: const TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   color: kOtherColor,
//                                 ),
//                               ),
//                               Text(
//                                 DataBaseHelper.viewStudentData!.phoneNo,
//                                 style: const TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                     color: kOtherColor),
//                               ),
//                               Text(
//                                 '${DataBaseHelper.viewStudentData!.stream} (${DataBaseHelper.viewStudentData!.semester}) ',
//                                 style: const TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                     color: kOtherColor),
//                               ),
//                             ],
//                           ),
//                           GestureDetector(
//                             onTap: () async {
//                               await DataBaseHelper.filterData();
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) =>
//                                       const StudentProfileScreen(),
//                                 ),
//                               );
//                             },
//                             child: CircleAvatar(
//                               radius: 35,
//                               backgroundColor: kOtherColor,
//                               backgroundImage: NetworkImage(
//                                 DataBaseHelper.viewStudentData!.image,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       sizedBox,
//                       Container(
//                         height: MediaQuery.of(context).size.height * 0.3,
//                         margin: EdgeInsets.only(
//                           left: MediaQuery.of(context).size.width * 0.05,
//                           right: MediaQuery.of(context).size.width * 0.05,
//                           top: MediaQuery.of(context).size.width * 0.05,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 HomeTopWidget(
//                                   title: "ID Card",
//                                   icon: "assets/icons/id-card.png",
//                                   onPress: () async {
//                                     await DataBaseHelper.filterData();
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) =>
//                                             const IdCardScreen(),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                                 HomeTopWidget(
//                                   title: "Material",
//                                   icon: "assets/icons/syllbus.png",
//                                   onPress: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) =>
//                                             const MaterialScreen(),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ],
//                             ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 HomeTopWidget(
//                                   title: "Course",
//                                   icon: "assets/icons/course.png",
//                                   onPress: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) =>
//                                             const CourseScreen(),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                                 HomeTopWidget(
//                                   title: "Notice",
//                                   icon: "assets/icons/notice.png",
//                                   onPress: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) =>
//                                             const NoticeScreen(),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ],
//                             ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 HomeTopWidget(
//                                   title: "Teaching Work",
//                                   icon: "assets/icons/teachingwork.png",
//                                   onPress: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) =>
//                                             const TeachingWorkScreen(),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                                 HomeTopWidget(
//                                   title: "Time Table",
//                                   icon: "assets/icons/timetable.png",
//                                   onPress: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) =>
//                                             const TimeTableScreen(),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       sizedBox,
//                       const Text(
//                         "Fees",
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.w700),
//                       ),
//                       kHalfSizedBox,
//                       Container(
//                         height: MediaQuery.of(context).size.height * 0.13,
//                         padding: const EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           color: kOtherColor,
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         child: IntrinsicHeight(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: const [
//                                   Text(
//                                     "Total Amount",
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 15),
//                                   ),
//                                   Text("\$14500"),
//                                 ],
//                               ),
//                               const VerticalDivider(
//                                 color: kTextBlackColor,
//                               ),
//                               Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: const [
//                                   Text(
//                                     "Paid Amount",
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 15),
//                                   ),
//                                   Text("\$14500")
//                                 ],
//                               ),
//                               const VerticalDivider(
//                                 color: kTextBlackColor,
//                               ),
//                               Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   SizedBox(
//                                     width: MediaQuery.of(context).size.width *
//                                         0.27,
//                                     child: const Text(
//                                       "Remaining Amount",
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 15,
//                                       ),
//                                     ),
//                                   ),
//                                   const Text("\$0000"),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       sizedBox,
//                       const Text(
//                         "Attendance",
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.w700),
//                       ),
//                       kHalfSizedBox,
//                       GestureDetector(
//                         onTap: () {
//                           // Navigator.push(
//                           //     context,
//                           //     MaterialPageRoute(
//                           //         builder: (context) => SettingScreen()));
//                         },
//                         child: Container(
//                           height: MediaQuery.of(context).size.height * 0.1,
//                           padding: const EdgeInsets.all(15),
//                           decoration: BoxDecoration(
//                             color: kOtherColor,
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: const [
//                                   Text(
//                                     "Your Attendance",
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 18),
//                                   ),
//                                   Text(
//                                     "75.46%",
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 15),
//                                   ),
//                                 ],
//                               ),
//                               const CircleAvatar(
//                                 radius: 25,
//                                 backgroundColor: Colors.deepPurple,
//                                 child: CircleAvatar(
//                                   radius: 20,
//                                   backgroundColor: kPrimaryColor,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }

class HomeTopWidget extends StatelessWidget {
  const HomeTopWidget(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onPress})
      : super(key: key);

  final String title;
  final String icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPress,
          child: CircleAvatar(
              backgroundColor: primarycolor,
              radius: 30,
              child: Image(
                height: 30,
                fit: BoxFit.cover,
                image: AssetImage(
                  icon,
                ),
              )),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.008,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.04,
            color: primarycolor,
          ),
        ),
      ],
    );
  }
}
