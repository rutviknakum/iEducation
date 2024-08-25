// ignore_for_file: must_be_immutable, unnecessary_null_comparison

import 'package:admin_appppppp/Network/database_class.dart';
import 'package:admin_appppppp/common/appbar.dart';
import 'package:admin_appppppp/common/cashed_network_image.dart';
import 'package:admin_appppppp/common/profile_column.dart';
import 'package:admin_appppppp/constant.dart';
import 'package:admin_appppppp/navigation/app_navigation.dart';
import 'package:flutter/material.dart';

class StudentProfileScreen extends StatefulWidget {
  Map<String, dynamic> args;
  StudentProfileScreen({super.key, required this.args});
  static const String route = 'StudentProfile';

  @override
  State<StudentProfileScreen> createState() => StudentProfileScreenState();
}

class StudentProfileScreenState extends State<StudentProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Student showStudentData = Student.fromJson(widget.args);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar(
        context,
        title: 'Student Profile',
        onPressed: () {
          AppNavigation.shared.moveToUpdateStudent(widget.args);
          //   .then((value) {
          // showStudentData = value;
          // setState(() {});
          // });
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => UpdateStudent(
          //       index: widget.args['index'],
          //     ),
          //   ),
          // );
          // setState(() {});
          // .then(
          //   (value) {
          //     showStudentData = value[0];
          //     setState(() {});
          //   },
          // );
        },
        actionIcon: Icons.edit,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: showStudentData == null
                      ? Image.asset(
                          'assets/icons/profile.png',
                          height: 100,
                          width: 100,
                        )
                      : cachedNetworkImage(imageUrl: showStudentData.image),
                ),
                sizedBox,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  child: Center(
                    child: Text(
                      '${showStudentData.fName} ${showStudentData.mName} ${showStudentData.lName}',
                      style: const TextStyle(fontSize: 23),
                    ),
                  ),
                ),
                sizedBox,
                sizedBox,
                Text(
                  'Personal Information',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.076,
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Divider(
                    color: kPrimaryColor,
                    thickness: 2,
                  ),
                ),
                sizedBox,
                ProfileDetailColumn(
                    title: 'Email Id', value: showStudentData.email),
                ProfileDetailColumn(
                    title: 'Phone No', value: showStudentData.phoneNo),
                ProfileDetailColumn(
                    title: 'Date of Birth', value: showStudentData.dob),
                ProfileDetailColumn(
                    title: 'Gender', value: showStudentData.gender),
                ProfileDetailColumn(
                    title: 'Address', value: showStudentData.address),
                ProfileDetailColumn(
                    title: 'Pincode', value: showStudentData.pincode),
                ProfileDetailColumn(
                    title: 'Blood Group', value: showStudentData.bloodGroup),
                ProfileDetailColumn(
                    title: 'Cast', value: showStudentData.caste),
                sizedBox,
                Text(
                  'Educational Information',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.065,
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Divider(
                    color: kPrimaryColor,
                    thickness: 2,
                  ),
                ),
                ProfileDetailColumn(
                    title: 'Stream', value: showStudentData.stream),
                ProfileDetailColumn(
                    title: 'Semester', value: showStudentData.semester),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
