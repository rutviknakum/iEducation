// ignore_for_file: use_build_context_synchronously

import 'package:admin_appppppp/Network/database_api.dart';
import 'package:admin_appppppp/Network/database_class.dart';
import 'package:admin_appppppp/common/card.dart';
import 'package:admin_appppppp/navigation/app_navigation.dart';
import 'package:flutter/material.dart';

class CompetitiveExamNotice extends StatefulWidget {
  const CompetitiveExamNotice({super.key});
  static const route = 'competitiveExam';

  @override
  State<CompetitiveExamNotice> createState() => CompetitiveExamNoticeState();
}

class CompetitiveExamNoticeState extends State<CompetitiveExamNotice> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  bool isLoading = false;

  Future<void> getData() async {
    isLoading = true;
    await CompetitiveExamApi.fetchData();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 35),
          child: Text(
            "Competitive Exam",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
              onPressed: (() {
                AppNavigation.shared.moveToAddCompatitiveExamScreen();
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
      backgroundColor: Colors.white,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : competitiveExamDataList.isEmpty
              ? Center(child: Image.asset('assets/icons/exam.png'))
              : ListView.builder(
                  itemCount: competitiveExamDataList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Dismissible(
                      key: Key(competitiveExamDataList[index].toString()),
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
                                  await CompetitiveExamApi.deleteData(
                                    key: competitiveExamDataList[index]
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
                          AppNavigation.shared
                              .moveToUpdateCompatitiveExamScreen(
                                  competitiveExamDataList[index].toJson());
                          setState(() {});
                          // await Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //         UpdateCompetitiveExam(index: index),
                          //   ),
                          // ).whenComplete(() async {
                          //   await getData();
                          //   setState(() {});
                          // });
                        },
                        child: noticeDetailsCard(
                          context,
                          imageUrl: competitiveExamDataList[index].image,
                          title: competitiveExamDataList[index].title,
                          description:
                              competitiveExamDataList[index].description,
                        ),
                      ),
                    ),
                  ),
                ),
    );
  }
}
