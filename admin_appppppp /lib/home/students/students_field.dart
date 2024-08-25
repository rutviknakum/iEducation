import 'package:admin_appppppp/Network/database_api.dart';
import 'package:admin_appppppp/common/container.dart';
// ignore: unused_import
import 'package:admin_appppppp/common/floating_actin_button.dart';
import 'package:admin_appppppp/navigation/app_navigation.dart';
import 'package:flutter/material.dart';

class StudentsFieldScreen extends StatefulWidget {
  const StudentsFieldScreen({super.key});
  static const String route = 'studentsField';
  @override
  State<StudentsFieldScreen> createState() => _StudentsFieldScreenState();
}

class _StudentsFieldScreenState extends State<StudentsFieldScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 55),
          child: Text(
            "STUDENT_FIELD",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
              onPressed: (() {
                AppNavigation.shared.movetoAddStudent();
              }),
              icon: const Padding(
                padding: EdgeInsets.only(right: 25),
                child: Icon(
                  Icons.person_add,
                  size: 38,
                  color: Colors.white,
                ),
              ))
        ],
      ),
      body: Column(
        children: [
          studentContainer(
            context,
            titleText: "M.Tech-ICT",
            onTap: () async {
              StudentDataApi.keys = "M.Tech-IC";
              await StudentDataApi.fetchData();
              if (!mounted) return;
              AppNavigation.shared.moveToStudentList('M.Tech-ICT Students ');
            },
          ),
          studentContainer(
            context,
            titleText: "M.Tech-EC",
            onTap: () async {
              StudentDataApi.keys = "M.Tech-EC";
              await StudentDataApi.fetchData();
              if (!mounted) return;
              AppNavigation.shared.moveToStudentList('M.Tech-EC Students ');
            },
          ),
          studentContainer(
            context,
            titleText: 'Master of Science in IT',
            onTap: () async {
              StudentDataApi.keys = "Msc-IT";
              await StudentDataApi.fetchData();
              if (!mounted) return;
              AppNavigation.shared.moveToStudentList('Msc-IT Student ');
            },
          ),
          studentContainer(
            context,
            titleText: "Msc in Data Science",
            onTap: () async {
              StudentDataApi.keys = "Msc-DS";
              await StudentDataApi.fetchData();
              if (!mounted) return;
              AppNavigation.shared.moveToStudentList('Msc-DS Students ');
            },
          ),
          studentContainer(
            context,
            titleText: "Msc in Agriculture Analytics",
            onTap: () async {
              StudentDataApi.keys = "M.Sc-Agriculture Analytics";
              await StudentDataApi.fetchData();
              if (!mounted) return;
              AppNavigation.shared
                  .moveToStudentList('M.Sc-Agriculture Analytics Students ');
            },
          ),
        ],
      ),
      /*   floatingActionButton: floatingActionButton(
        onPressed: () {
          AppNavigation.shared.movetoAddStudent();
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const AddStudentDetails(),
          //   ),
          // );
          setState(() {});
        },
      ),

*/
    );
  }
}
