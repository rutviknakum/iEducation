// ignore_for_file: use_build_context_synchronously

import 'package:admin_appppppp/Network/database_api.dart';
import 'package:admin_appppppp/Network/database_class.dart';
import 'package:admin_appppppp/common/card.dart';
import 'package:admin_appppppp/navigation/app_navigation.dart';
import 'package:flutter/material.dart';

class JobVacancyNotice extends StatefulWidget {
  const JobVacancyNotice({Key? key}) : super(key: key);
  static const route = 'jobVacancy';

  @override
  State<JobVacancyNotice> createState() => _JobVacancyNoticeState();
}

class _JobVacancyNoticeState extends State<JobVacancyNotice> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  bool isLoading = false;

  Future<void> getData() async {
    isLoading = true;
    await JobVacancyApi.fetchData();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 58),
          child: Text(
            "Job Vacancy",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
              onPressed: (() {
                AppNavigation.shared.moveToAddJobVacancyScreen();
              }),
              icon: const Padding(
                padding: EdgeInsets.only(right: 25),
                child: Icon(
                  Icons.add_circle,
                  size: 38,
                  color: Colors.white,
                ),
              ))
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : jobVacancyDataList.isEmpty
              ? Center(child: Image.asset('assets/icons/job_vacancy.png'))
              : ListView.builder(
                  itemCount: jobVacancyDataList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Dismissible(
                      key: Key(jobVacancyDataList[index].toString()),
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
                                  await JobVacancyApi.deleteData(
                                    key: jobVacancyDataList[index]
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
                      child: GestureDetector(
                        onTap: () {
                          AppNavigation.shared.moveToUpdateJobVacancyScreen(
                              jobVacancyDataList[index].toJson());
                          setState(() {});
                          // await Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //         UpdateJobVacancyNotice(index: index),
                          //   ),
                          // ).whenComplete(() async {
                          //   await getData();
                          //   setState(() {});
                          // });
                        },
                        child: noticeDetailsCard(
                          context,
                          imageUrl: jobVacancyDataList[index].image,
                          title: jobVacancyDataList[index].title,
                          description: jobVacancyDataList[index].description,
                        ),
                      ),
                    ),
                  ),
                ),
    );
  }
}
