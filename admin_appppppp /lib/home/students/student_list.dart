// ignore_for_file: use_build_context_synchronously

import 'package:admin_appppppp/Network/database_api.dart';
import 'package:admin_appppppp/Network/database_class.dart';
import 'package:admin_appppppp/common/appbar.dart';
import 'package:admin_appppppp/common/dropdown_button_widget.dart';
import 'package:admin_appppppp/navigation/app_navigation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class StudentListScreen extends StatefulWidget {
  final Map<String, dynamic> args;
  const StudentListScreen({Key? key, required this.args}) : super(key: key);
  static const String route = 'StudentList';

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  String? selectedSemSemester = 'All';

  final List<String> semester = [
    'All',
    'SEM - 1',
    'SEM - 2',
    'SEM - 3',
    'SEM - 4',
  ];

  List<Student> studSemData = [];

  @override
  void initState() {
    super.initState();
    studSemData.addAll(studentDataList);
  }

  Future<void> sortingData(String value) async {
    if (value == 'All') {
      studSemData.clear();
      studSemData.addAll(studentDataList);
      setState(() {});
    } else {
      studSemData.clear();
      for (var element in studentDataList) {
        if (element.semester == value) {
          studSemData.add(element);
        }
      }
      setState(() {});
    }
  }

  // bool loading = false;

  Future<void> getData() async {
    // loading = true;
    studentDataList = await StudentDataApi.fetchData();
    // loading = false;
    await sortingData(selectedSemSemester!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, title: widget.args['stream']),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            dropDownButton(
              context,
              hintText: 'Select Semester',
              item: semester
                  .map(
                    (semester) => DropdownMenuItem<String>(
                      value: semester,
                      child: Text(
                        semester,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                  .toList(),
              value: selectedSemSemester,
              onChanged: (value) {
                setState(() {
                  selectedSemSemester = value as String;
                  sortingData(selectedSemSemester!);
                });
              },
            ),
            Expanded(
              child: Scrollbar(
                radius: const Radius.circular(100),
                thickness: 5,
                child:
                    //  loading
                    //     ? const Center(
                    //         child: CircularProgressIndicator(),
                    //       )
                    //     : studentDataList.isEmpty
                    //         ? Center(
                    //             child: Lottie.asset(
                    //               'assets/images/Circle.json',
                    //               repeat: true,
                    //               reverse: true,
                    //               animate: true,
                    //             ),
                    //           )
                    //         :
                    ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  itemCount: studSemData.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key(studentDataList[index].toString()),
                      confirmDismiss: (direction) {
                        return showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: const Text(
                              'Sure You Want To Remove?',
                            ),
                            actions: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel'),
                              ),
                              MaterialButton(
                                onPressed: () async {
                                  await StudentDataApi.deleteStdData(
                                    key: studSemData[index].key.toString(),
                                    child: studSemData[index].stream,
                                  );
                                  Navigator.pop(context);
                                  await getData();
                                },
                                child: const Text('Ok'),
                              ),
                            ],
                          ),
                          barrierDismissible: false,
                        );
                      },
                      child: GestureDetector(
                        onTap: (() {
                          AppNavigation.shared.moveToStudentProfile(
                              studSemData[index].toJson());
                        }),
                        child: Card(
                          elevation: 5,
                          child: ListTile(
                            leading: CachedNetworkImage(
                              imageUrl: studSemData[index].image.toString(),
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: 50,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                            title: Text(
                              '${studSemData[index].fName} ${studSemData[index].mName} ${studSemData[index].lName}',
                            ),
                            subtitle: Text(
                              studSemData[index].semester,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
