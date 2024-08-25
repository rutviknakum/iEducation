import 'package:flutter/material.dart';
import 'package:user_apppp/common/appbar.dart';
import 'package:user_apppp/common/cashed_network_image.dart';
import 'package:user_apppp/constant.dart';
import 'package:user_apppp/data/database_service.dart';
import 'package:user_apppp/student_profile/student_profile_widget.dart';


class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({Key? key}) : super(key: key);

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   DataBaseHelper.filterData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, title: 'Student Profile'),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        cachedNetworkImage(
                            imageUrl: DataBaseHelper.viewStudentData!.image),
                        sizedBox,
                        Text(
                          "${DataBaseHelper.viewStudentData!.fName} ${DataBaseHelper.viewStudentData!.mName} ${DataBaseHelper.viewStudentData!.lName}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                sizedBox,
                Text(
                  "Personal Information",
                  style: TextStyle(
                    fontSize: 25,
                    color: primarycolor,
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: primarycolor,
                ),
                sizedBox,
                StudentProfileWidgetScreen(
                    title: "Email",
                    value: DataBaseHelper.viewStudentData!.email),
                StudentProfileWidgetScreen(
                    title: "Phone Number",
                    value: DataBaseHelper.viewStudentData!.phoneNo),
                StudentProfileWidgetScreen(
                    title: "Date of Birth",
                    value: DataBaseHelper.viewStudentData!.dob),
                StudentProfileWidgetScreen(
                    title: "Gender",
                    value: DataBaseHelper.viewStudentData!.gender),
                StudentProfileWidgetScreen(
                    title: "Address",
                    value: DataBaseHelper.viewStudentData!.address),
                StudentProfileWidgetScreen(
                    title: "Pincode",
                    value: DataBaseHelper.viewStudentData!.pincode),
                StudentProfileWidgetScreen(
                    title: "Blood Group",
                    value: DataBaseHelper.viewStudentData!.bloodGroup),
                sizedBox,
                Text(
                  "Educational Information",
                  style: TextStyle(
                    fontSize: 25,
                    color: primarycolor,
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: primarycolor,
                ),
                sizedBox,
                StudentProfileWidgetScreen(
                    title: "Stream",
                    value: DataBaseHelper.viewStudentData!.stream),
                StudentProfileWidgetScreen(
                    title: "Semester",
                    value: DataBaseHelper.viewStudentData!.semester),
                StudentProfileWidgetScreen(
                    title: "Enrollment No:",
                    value: DataBaseHelper.viewStudentData!.enrollNo),
                StudentProfileWidgetScreen(
                    title: "SPID NO:",
                    value: DataBaseHelper.viewStudentData!.spidNo),
                sizedBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
