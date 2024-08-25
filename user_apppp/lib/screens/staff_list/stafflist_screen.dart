// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:user/database/database_api.dart'
// import 'package:user/database/database_class.dart';
// import 'package:user/screens/staff_list/staff_profile.dart';

// class StaffListScreen extends StatefulWidget {
//   const StaffListScreen({Key? key}) : super(key: key);

//   @override
//   State<StaffListScreen> createState() => _StaffListScreenState();
// }

// class _StaffListScreenState extends State<StaffListScreen> {
//   List<StaffList> staffList = [];

//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }

//   bool isLoading = false;

//   Future<void> getData() async {
//     isLoading = true;
//     staffList = await StaffDataApi.fetchData();
//     isLoading = false;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Staff List'),
//         centerTitle: true,
//       ),
//       body: isLoading
//           ? const Center(
//               child: CircularProgressIndicator(),
//             )
//           : staffListData.isEmpty
//               ? Center(
//                   child: Lottie.asset(
//                     'assets/icons/Circle.json',
//                     repeat: true,
//                     reverse: true,
//                     animate: true,
//                   ),
//                 )
//               : Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: ListView.builder(
//                     itemCount: staffListData.length,
//                     itemBuilder: (context, index) {
//                       return Card(
//                         child: ListTile(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) =>
//                                     StaffProfileScreen(index: index),
//                               ),
//                             );
//                             setState(() {});
//                           },
//                           leading: CircleAvatar(
//                             radius: 30,
//                             backgroundImage:
//                                 NetworkImage(staffListData[index].image),
//                           ),
//                           title: Text(
//                             staffListData[index].name,
//                             style: const TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.bold),
//                           ),
//                           subtitle: Text(
//                             staffListData[index].degree,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//     );
//   }
// }
