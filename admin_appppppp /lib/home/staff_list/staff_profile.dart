
import 'package:admin_appppppp/Network/database_class.dart';
import 'package:admin_appppppp/common/appbar.dart';
import 'package:admin_appppppp/common/cashed_network_image.dart';
import 'package:admin_appppppp/constant.dart';
import 'package:admin_appppppp/navigation/app_navigation.dart';
import 'package:flutter/material.dart';

import 'staff_profile_widget.dart';

class StaffProfileScreen extends StatefulWidget {
  final Map<String, dynamic> args;
  const StaffProfileScreen({Key? key, required this.args}) : super(key: key);
  static const route = 'staffProfileScreen';

  @override
  State<StaffProfileScreen> createState() => _StaffProfileScreenState();
}

class _StaffProfileScreenState extends State<StaffProfileScreen> {
  late StaffList showStaffData;

  @override
  void initState() {
    super.initState();
    showStaffData = StaffList.fromJson(widget.args);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(
        context,
        title: "Staff Profile",
        actionIcon: Icons.edit,
        onPressed: () {
          AppNavigation.shared.moveToUpdateStaffList(widget.args);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => UpdateStaffScreen(
          //       index: widget.args,
          //     ),
          //   ),
          // );
          // setState(() {});
          // .then(
          //   (value) {
          //     showStaffData = value[0];
          //     setState(() {});
          //   },
          // );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowIndicator();
            return true;
          },
          child: ListView(
            children: [
              Center(
                child: cachedNetworkImage(imageUrl: showStaffData.image),
              ),
              sizedBox,
              StaffProfileWidgetScreen(
                  title: "Name", value: showStaffData.name),
              StaffProfileWidgetScreen(
                  title: "Email ID", value: showStaffData.email),
              StaffProfileWidgetScreen(
                  title: "Contact No", value: showStaffData.phoneNo),
              StaffProfileWidgetScreen(
                  title: "Post", value: showStaffData.post),
              StaffProfileWidgetScreen(
                  title: "Subject", value: showStaffData.subject),
              StaffProfileWidgetScreen(
                  title: "Experience", value: showStaffData.experience),
              StaffProfileWidgetScreen(
                  title: "Degree", value: showStaffData.degree),
            ],
          ),
        ),
      ),
    );
  }
}
