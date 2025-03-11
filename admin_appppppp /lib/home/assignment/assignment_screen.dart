// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:admin_appppppp/Network/database_api.dart';
import 'package:admin_appppppp/Network/database_class.dart';
import 'package:admin_appppppp/common/appbar.dart';
import 'package:admin_appppppp/common/floating_actin_button.dart';
import 'package:admin_appppppp/common/pdf_viewer/pdf_viewer_dialog.dart';
import 'package:admin_appppppp/constant.dart';
import 'package:admin_appppppp/navigation/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';

class AssignmentScreen extends StatefulWidget {
  const AssignmentScreen({Key? key}) : super(key: key);
  static const route = 'assignment';
  @override
  State<AssignmentScreen> createState() => AssignmentScreenState();
}

class AssignmentScreenState extends State<AssignmentScreen> {
  bool isLoading = false;

  Future<void> getData() async {
    isLoading = true;
    await AssignmentApi.fetchData();
    isLoading = false;
    setState(() {});
  }

  final ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();
    getData();
    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      setState(() {});
    });

    FlutterDownloader.registerCallback(downloadCallback);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  @pragma('vm:entry-point')
  static void downloadCallback(String id, int status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send!.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar(context, title: 'Assignment'),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : assignmentDataList.isEmpty
              ? Center(
                  child: Lottie.asset('assets/icons/Circle.json'),
                )
              : NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (notification) {
                    notification.disallowIndicator();
                    return true;
                  },
                  child: ListView.builder(
                    itemCount: assignmentDataList.length,
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (context, index) => Dismissible(
                      key: Key(
                        assignmentDataList[index].key.toString(),
                      ),
                      confirmDismiss: (direction) {
                        return showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: const Text('Sure You Want To Remove?'),
                            actions: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel'),
                              ),
                              MaterialButton(
                                onPressed: () async {
                                  await MaterialApi.deleteData(
                                    key: assignmentDataList[index]
                                        .key
                                        .toString(),
                                  );
                                  Navigator.pop(context);
                                  await getData();
                                },
                                child: const Text('Ok'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      assignmentDataList[index].subjectName,
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      assignmentDataList[index].noOfAssignment,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '${assignmentDataList[index].stream} ${assignmentDataList[index].semester}',
                                    ),
                                    Text(
                                      '${assignmentDataList[index].date}  ${assignmentDataList[index].time}',
                                    ),
                                    Text(
                                        "${assignmentDataList[index].fileSize} MB"),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        final List<Directory>? downloadsDir =
                                            await getExternalStorageDirectories();
                                        await FlutterDownloader.enqueue(
                                          saveInPublicStorage: true,
                                          url: assignmentDataList[index]
                                              .fileName,
                                          headers: {},
                                          savedDir: downloadsDir![0].path,
                                          showNotification: true,
                                          openFileFromNotification: true,
                                        );
                                      },
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.14,
                                        child: Lottie.asset(
                                          'assets/icons/download.json',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    kHalfSizedBox,
                                    GestureDetector(
                                      onTap: () {
                                        viewPdfs(
                                          context,
                                          pdfUrl: assignmentDataList[index]
                                              .fileName,
                                          title:
                                              '${assignmentDataList[index].subjectName} (${assignmentDataList[index].semester})',
                                        );
                                      },
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.14,
                                        child: Image.asset(
                                          'assets/icons/assignmenet.png',
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
      floatingActionButton: floatingActionButton(
        onPressed: () {
          AppNavigation.shared.moveToAddAssignmentScreen();
          setState(() {});
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const AddMaterialScreen(),
          //   ),
          // ).whenComplete(() {
          //   getData();
          //   setState(() {});
          // });
        },
      ),
    );
  }
}
