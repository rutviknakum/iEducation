import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:user_apppp/constant.dart';
import 'package:user_apppp/data/database_service.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => ResultScreenState();
}

class ResultScreenState extends State<ResultScreen> {
  bool isLoading = false;

  getData() async {
    isLoading = true;
    await DataBaseHelper.filterData();
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

    FlutterDownloader.registerCallback(downloadCallback as DownloadCallback);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send!.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Results"),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: primarycolor,
              ),
            )
          : DataBaseHelper.viewResultData.isEmpty
              ? Center(
                  child: Lottie.asset(
                    'assets/icons/Circle.json',
                    repeat: true,
                    reverse: true,
                    animate: true,
                  ),
                )
              : ListView.builder(
                  itemCount: DataBaseHelper.viewResultData.length,
                  padding: const EdgeInsets.all(10),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DataBaseHelper.viewResultData[index].examType,
                              style: const TextStyle(fontSize: 20),
                            ),
                            const Divider(
                              thickness: 2,
                            ),
                            Text(
                              '${DataBaseHelper.viewResultData[index].stream}  ${DataBaseHelper.viewResultData[index].semester}',
                              style: const TextStyle(fontSize: 20),
                            ),
                            Row(
                              children: [
                                Text(
                                  DataBaseHelper.viewResultData[index].date,
                                ),
                              ],
                            ),
                            Text(
                                "${DataBaseHelper.viewResultData[index].fileSize} MB"),
                            const Divider(
                              thickness: 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    final List<Directory>? downloadsDir =
                                        await getExternalStorageDirectories();
                                    await FlutterDownloader.enqueue(
                                      saveInPublicStorage: true,
                                      url: DataBaseHelper
                                          .viewResultData[index].fileName,
                                      headers: {},
                                      savedDir: downloadsDir![0].path,
                                      showNotification: true,
                                      openFileFromNotification: true,
                                    );
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width: 100,
                                    color: primarycolor,
                                    child: const Center(
                                        child: Text(
                                      'Download',
                                      style: TextStyle(color: white),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
    );
  }
}
