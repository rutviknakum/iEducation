// ignore_for_file: use_build_context_synchronously

import 'package:admin_appppppp/Network/database_api.dart';
import 'package:admin_appppppp/Network/database_class.dart';
import 'package:admin_appppppp/constant.dart';
import 'package:admin_appppppp/home/time_table/time_table_widget.dart';
import 'package:admin_appppppp/navigation/app_navigation.dart';
import 'package:flutter/material.dart';

class TimeTableScreen extends StatefulWidget {
  const TimeTableScreen({super.key});
  static const route = 'timeTableScreen';
  @override
  State<TimeTableScreen> createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  bool loading = false;

  @override
  void initState() {
    // TimeTableApi.fetchData();
    getData();
    super.initState();
  }

  void getData() async {
    loading = true;
    await TimeTableApi.fetchData();
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print('*=*=*=*=*=*=*=**=.-.-.-.-.-.-.-.-.- >>>>>>> ${timeTableDataList}');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 72),
          child: Text(
            "TIME TABLE",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
              onPressed: (() {
                AppNavigation.shared
                    .movetoAddTimeTableScreen()
                    .whenComplete(() {
                  getData();
                  setState(() {});
                });
              }),
              icon: const Padding(
                padding: EdgeInsets.only(right: 25),
                child: Icon(
                  Icons.calendar_today,
                  size: 38,
                  color: Colors.white,
                ),
              ))
        ],
      ),
      body: SafeArea(
        child: loading
            ? const Center(
                child: CircularProgressIndicator(color: kPrimaryColor),
              )
            : timeTableDataList.isEmpty
                ? Center(
                    child: Image.asset(
                      'assets/icons/timetable.png',
                    ),
                  )
                : NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (notification) {
                      notification.disallowIndicator();
                      return true;
                    },
                    child: ListView.builder(
                      itemCount: timeTableDataList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: kSecondaryColor,
                                child: Text(
                                  timeTableDataList[index].lectureDate,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              kHalfSizedBox,
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: timeTableDataList[index].tb.length,
                                itemBuilder: (context, index1) {
                                  return GestureDetector(
                                    onTap: () {
                                      AppNavigation.shared
                                          .moveToUpdateStaffList(
                                              timeTableDataList[index]
                                                  .tb[index1]
                                                  .toJson())
                                          .whenComplete(() {
                                        // await TimeTableApi.fetchData();
                                        getData();
                                        setState(() {});
                                      });
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) =>
                                      //         UpdateTimeTable(
                                      //       tb: timeTableDataList[index].tb[index1],
                                      //     ),
                                      //   ),
                                      // ).whenComplete(
                                      //   () async {
                                      //     await TimeTableApi.fetchData();
                                      //     setState(() {});
                                      //   },
                                      // );
                                    },
                                    child: Dismissible(
                                      key: Key(timeTableDataList[index]
                                          .tb[index1]
                                          .key
                                          .toString()),
                                      confirmDismiss: (direction) {
                                        return showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            content: const Text(
                                                'Sure You Want To Remove?'),
                                            actions: [
                                              MaterialButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Cancel'),
                                              ),
                                              MaterialButton(
                                                onPressed: () async {
                                                  await TimeTableApi
                                                      .deleteTimeTableData(
                                                    key:
                                                        timeTableDataList[index]
                                                            .tb[index1]
                                                            .key
                                                            .toString(),
                                                    child:
                                                        timeTableDataList[index]
                                                            .lectureDate,
                                                  );
                                                  Navigator.pop(context);
                                                  getData();
                                                },
                                                child: const Text('Ok'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      child: Card(
                                        elevation: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            children: [
                                              TimeTableColumn(
                                                title: "Subject Name",
                                                value: timeTableDataList[index]
                                                    .tb[index1]
                                                    .lectureName,
                                              ),
                                              TimeTableColumn(
                                                title: "Teacher Name",
                                                value: timeTableDataList[index]
                                                    .tb[index1]
                                                    .TeacherName,
                                              ),
                                              TimeTableColumn(
                                                title: "Stream",
                                                value: timeTableDataList[index]
                                                    .tb[index1]
                                                    .stream,
                                              ),
                                              TimeTableColumn(
                                                title: "Semester",
                                                value: timeTableDataList[index]
                                                    .tb[index1]
                                                    .semester,
                                              ),
                                              TimeTableColumn(
                                                title: "Lecture Date",
                                                value: timeTableDataList[index]
                                                    .tb[index1]
                                                    .lectureDate,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
      ),

      /*  
      floatingActionButton: floatingActionButton(
        onPressed: () {
          AppNavigation.shared.movetoAddTimeTableScreen().whenComplete(() {
            getData();
            setState(() {});
          });
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const AddTimeTable(),
          //   ),
          // ).whenComplete(
          //   () async {
          //     await TimeTableApi.fetchData();
          //     setState(() {});
          //   },
          // );
        },
      ),
*/
    );
  }
}
