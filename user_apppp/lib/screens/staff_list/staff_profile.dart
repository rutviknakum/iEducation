// import 'package:flutter/material.dart';
// import 'package:user/constant.dart';
// import 'package:user/database/database_class.dart';
// import 'package:user/screens/staff_list/staff_profile_widget.dart';

// class StaffProfileScreen extends StatefulWidget {
//   final Map<String, dynamic> args;
//   const StaffProfileScreen({Key? key, required this.args}) : super(key: key);

//   final int index;

//   @override
//   State<StaffProfileScreen> createState() => _StaffProfileScreenState();
// }

// class _StaffProfileScreenState extends State<StaffProfileScreen> {
//   StaffList? showStaffData;

//   @override
//   void initState() {
//     super.initState();
//     showStaffData = StaffList.fromJson(widget.index);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Staff Profile'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: ListView(
//           children: [
//             Center(
//               child: CircleAvatar(
//                 radius: 80,
//                 backgroundImage: NetworkImage(showStaffData!.image),
//               ),
//             ),
//             sizedBox,
//             sizedBox,
//             StaffProfileWidgetScreen(title: "Name", value: showStaffData!.name),
//             StaffProfileWidgetScreen(
//                 title: "Email ID", value: showStaffData!.email),
//             StaffProfileWidgetScreen(
//                 title: "Contact No", value: showStaffData!.phoneNo),
//             StaffProfileWidgetScreen(
//                 title: "Subject", value: showStaffData!.subject),
//             StaffProfileWidgetScreen(
//                 title: "Experience", value: showStaffData!.experience),
//           ],
//         ),
//       ),
//     );
//   }
// }
