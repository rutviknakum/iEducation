import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:user_apppp/common/appbar.dart';
import 'package:user_apppp/common/pdf_viewer_dialog.dart';
import 'package:user_apppp/constant.dart';
import 'package:user_apppp/data/database_service.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  State<CourseScreen> createState() => CourseScreenState();
}

class CourseScreenState extends State<CourseScreen> {
  bool isLoading = false;
  bool isReady = false;
  int? pages = 0;
  int? currentPage = 0;

  Future<void> getData() async {
    isLoading = true;
    await DataBaseHelper.filterData();
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

    FlutterDownloader.registerCallback(downloadCallback as DownloadCallback);
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
      backgroundColor: background,
      appBar: appbar(context, title: 'Course'),
      body: isLoading
          ? Center(child: CircularProgressIndicator(color: primarycolor))
          : DataBaseHelper.viewCourseData.isEmpty
              ? Center(
                  child: Lottie.asset('assets/icons/Circle.json'),
                )
              : ListView.builder(
                  itemCount: DataBaseHelper.viewCourseData.length,
                  padding: const EdgeInsets.all(10),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
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
                                  DataBaseHelper
                                      .viewCourseData[index].subjectName,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  '${DataBaseHelper.viewCourseData[index].stream} ${DataBaseHelper.viewCourseData[index].semester}',
                                ),
                                Text(
                                  '${DataBaseHelper.viewCourseData[index].date}  ${DataBaseHelper.viewCourseData[index].time}',
                                ),
                                Text(
                                    "${DataBaseHelper.viewCourseData[index].fileSize} MB"),
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
                                      url: DataBaseHelper
                                          .viewCourseData[index].fileName,
                                      headers: {},
                                      savedDir: downloadsDir![0].path,
                                      showNotification: true,
                                      openFileFromNotification: true,
                                    );
                                  },
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
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
                                      pdfUrl: DataBaseHelper
                                          .viewCourseData[index].fileName,
                                      title:
                                          '${DataBaseHelper.viewCourseData[index].subjectName} (${DataBaseHelper.viewCourseData[index].semester})',
                                    );
                                  },
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
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
    );
  }
}
