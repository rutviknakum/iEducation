import 'package:flutter/material.dart';
import 'package:user_apppp/common/appbar.dart';
import 'package:user_apppp/constant.dart';
import 'package:user_apppp/data/database_service.dart';


class IdCardScreen extends StatefulWidget {
  const IdCardScreen({Key? key}) : super(key: key);

  @override
  State<IdCardScreen> createState() => _IdCardScreenState();
}

class _IdCardScreenState extends State<IdCardScreen> {
  // profileData() async {
  //   await DataBaseHelper.filterData();
  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   profileData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, title: 'ID CARD'),
      backgroundColor: background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 115.6),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.55,
                          decoration: BoxDecoration(
                            color: primarycolor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 45),
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 135,
                            width: 125,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: background,
                              // border: Border.all(
                              //   color: primarycolor,
                              //   width: 3,
                              // ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: background,
                                border: Border.all(
                                  color: primarycolor,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    DataBaseHelper.viewStudentData!.image,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 200),
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IdCardNotice(
                                  title: "Name",
                                  value:
                                      '${DataBaseHelper.viewStudentData!.fName} ${DataBaseHelper.viewStudentData!.mName} ${DataBaseHelper.viewStudentData!.lName}'),
                              kHalfSizedBox,
                              IdCardNotice(
                                  title: "Stream",
                                  value:
                                      DataBaseHelper.viewStudentData!.stream),
                              kHalfSizedBox,
                              IdCardNotice(
                                  title: "Semester",
                                  value:
                                      DataBaseHelper.viewStudentData!.semester),
                              kHalfSizedBox,
                              IdCardNotice(
                                  title: "SPID NO",
                                  value:
                                      DataBaseHelper.viewStudentData!.spidNo),
                              kHalfSizedBox,
                              IdCardNotice(
                                  title: "Enrollment NO",
                                  value:
                                      DataBaseHelper.viewStudentData!.enrollNo),
                              kHalfSizedBox,
                              IdCardNotice(
                                  title: "Phone No",
                                  value:
                                      DataBaseHelper.viewStudentData!.phoneNo),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Text(
                              //       "Studnet Name : ",
                              //       style: TextStyle(
                              //         color: background,
                              //         fontWeight: FontWeight.w600,
                              //         fontSize:
                              //             MediaQuery.of(context).size.width *
                              //                 0.04,
                              //       ),
                              //     ),
                              //     Expanded(
                              //       child: Text(
                              //         '${DataBaseHelper.viewStudentData!.fName} ${DataBaseHelper.viewStudentData!.mName} ${DataBaseHelper.viewStudentData!.lName}',
                              //         style: TextStyle(
                              //           color: background,
                              //           fontSize:
                              //               MediaQuery.of(context).size.width *
                              //                   0.04,
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              // Row(
                              //   children: [
                              //     Expanded(
                              //       child: Text(
                              //         "Stream : ",
                              //         style: TextStyle(
                              //           color: background,
                              //           fontWeight: FontWeight.w600,
                              //           fontSize:
                              //               MediaQuery.of(context).size.width *
                              //                   0.04,
                              //         ),
                              //       ),
                              //     ),
                              //     Expanded(
                              //       child: Text(
                              //         '${DataBaseHelper.viewStudentData!.stream} (${DataBaseHelper.viewStudentData!.semester})',
                              //         style: TextStyle(
                              //           color: background,
                              //           fontSize:
                              //               MediaQuery.of(context).size.width *
                              //                   0.04,
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              // Row(
                              //   children: [
                              //     Text(
                              //       "Enroll. No : ",
                              //       style: TextStyle(
                              //         color: background,
                              //         fontWeight: FontWeight.w600,
                              //         fontSize:
                              //             MediaQuery.of(context).size.width *
                              //                 0.04,
                              //       ),
                              //     ),
                              //     Text(
                              //       DataBaseHelper.viewStudentData!.enrollNo,
                              //       style: TextStyle(
                              //         color: background,
                              //         fontSize:
                              //             MediaQuery.of(context).size.width *
                              //                 0.05,
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              // Text(
                              //   DataBaseHelper.viewStudentData!.spidNo,
                              //   style: TextStyle(
                              //     color: background,
                              //     fontSize:
                              //         MediaQuery.of(context).size.width * 0.05,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // child: Card(
          //   elevation: 5,
          //   shape: const RoundedRectangleBorder(
          //     borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          //   ),
          //   child: Container(
          //     height: MediaQuery.of(context).size.height * 0.7,
          //     decoration: BoxDecoration(
          //       color: background,
          //       borderRadius: BorderRadius.circular(20),
          //     ),
          //     child: Column(
          //       children: [
          //         Stack(
          //           children: [
          //             Container(
          //               height: MediaQuery.of(context).size.height * 0.17,
          //               decoration: BoxDecoration(
          //                 color: primarycolor,
          //                 borderRadius: const BorderRadius.only(
          //                   bottomLeft: Radius.circular(100),
          //                   bottomRight: Radius.circular(100),
          //                 ),
          //               ),
          //             ),
          //             Padding(
          //               padding: EdgeInsets.only(
          //                 top: MediaQuery.of(context).size.height * 0.08,
          //               ),
          //               child: Align(
          //                 alignment: Alignment.center,
          //                 child: CircleAvatar(
          //                   radius: 60,
          //                   backgroundColor: primarycolor,
          //                   child: CircleAvatar(
          //                     radius: 55,
          //                     backgroundColor: background,
          //                     backgroundImage: NetworkImage(
          //                       DataBaseHelper.viewStudentData!.image,
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //         sizedBox,
          //         sizedBox,
          //         IdCardNotice(
          //             title: "Name : ",
          //             value:
          //                 '${DataBaseHelper.viewStudentData!.fName} ${DataBaseHelper.viewStudentData!.mName} ${DataBaseHelper.viewStudentData!.lName}'),
          //         kHalfSizedBox,
          //         IdCardNotice(
          //             title: "Stream : ",
          //             value: DataBaseHelper.viewStudentData!.stream),
          //         kHalfSizedBox,
          //         IdCardNotice(
          //             title: "Semester : ",
          //             value: DataBaseHelper.viewStudentData!.semester),
          //         kHalfSizedBox,
          //         IdCardNotice(
          //             title: "SPID NO : ",
          //             value: DataBaseHelper.viewStudentData!.spidNo),
          //         kHalfSizedBox,
          //         IdCardNotice(
          //             title: "Enrollment NO : ",
          //             value: DataBaseHelper.viewStudentData!.enrollNo),
          //         kHalfSizedBox,
          //         IdCardNotice(
          //             title: "Phone No : ",
          //             value: DataBaseHelper.viewStudentData!.phoneNo),
          //       ],
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}

class IdCardNotice extends StatelessWidget {
  const IdCardNotice({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.33,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: background,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
            child: Text(
          " :   ",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: background,
            fontSize: MediaQuery.of(context).size.width * 0.04,
          ),
        )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.36,
              child: Text(
                value,
                overflow: TextOverflow.clip,
                style: TextStyle(
                    color: background,
                    fontSize: MediaQuery.of(context).size.width * 0.04),
              ),
            ),
          ],
        )
      ],
    );
  }
}
