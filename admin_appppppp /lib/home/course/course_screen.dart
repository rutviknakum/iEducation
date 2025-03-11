// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:admin_appppppp/Network/database_api.dart';
import 'package:admin_appppppp/Network/database_class.dart';
import 'package:admin_appppppp/common/pdf_viewer/pdf_viewer_dialog.dart';
import 'package:admin_appppppp/constant.dart';
import 'package:admin_appppppp/navigation/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);
  static const route = 'courseScreen';
  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  bool isLoading = false;

  Future<void> getData() async {
    isLoading = true;
    await CourseApi.fetchData();
    isLoading = false;
    setState(() {});
  }

  final ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();

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
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 55),
          child: Text(
            "Course",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
              onPressed: (() {
                AppNavigation.shared.moveToAddCourseScreen();
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
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : courseDataList.isEmpty
              ? Center(
                  child: Image.asset('assets/icons/course.png'),
                )
              : ListView.builder(
                  itemCount: courseDataList.length,
                  padding: const EdgeInsets.all(10),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Dismissible(
                    key: Key(
                      courseDataList[index].key.toString(),
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
                                await CourseApi.deleteData(
                                  key: courseDataList[index].key.toString(),
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
                                    courseDataList[index].subjectName,
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    '${courseDataList[index].stream} ${courseDataList[index].semester}',
                                  ),
                                  Text(
                                    '${courseDataList[index].date}  ${courseDataList[index].time}',
                                  ),
                                  Text("${courseDataList[index].fileSize} MB"),
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
                                        url: courseDataList[index].fileName,
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
                                      width: MediaQuery.of(context).size.width *
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
                                        pdfUrl: courseDataList[index].fileName,
                                        title:
                                            '${courseDataList[index].subjectName} (${courseDataList[index].semester})',
                                      );
                                    },
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      width: MediaQuery.of(context).size.width *
                                          0.14,
                                      child: Lottie.asset(
                                        'assets/icons/eye.json',
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
    );
  }
}
