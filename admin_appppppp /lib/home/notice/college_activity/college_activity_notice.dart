// ignore_for_file: use_build_context_synchronously

import 'package:admin_appppppp/Network/database_api.dart';
import 'package:admin_appppppp/Network/database_class.dart';
import 'package:admin_appppppp/common/card.dart';
import 'package:admin_appppppp/navigation/app_navigation.dart';
import 'package:flutter/material.dart';

class CollegeActivityNotice extends StatefulWidget {
  const CollegeActivityNotice({Key? key}) : super(key: key);
  static const route = 'collegeActivity';
  @override
  State<CollegeActivityNotice> createState() => _CollegeActivityNoticeState();
}

class _CollegeActivityNoticeState extends State<CollegeActivityNotice> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  bool isLoading = false;

  Future<void> getData() async {
    isLoading = true;
    await CollegeActivityApi.fetchData();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 58),
          child: Text(
            "College Activity",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
              onPressed: (() {
                AppNavigation.shared.moveToAddCollegeActivityScreen();
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
          : collegeActivityDataList.isEmpty
              ? Center(child: Image.asset('assets/icons/college_activity.png'))
              : ListView.builder(
                  itemCount: collegeActivityDataList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Dismissible(
                      key: Key(collegeActivityDataList[index].toString()),
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
                                  await CollegeActivityApi.deleteData(
                                    key: collegeActivityDataList[index]
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
                              .moveToUpdateCollegeActivityScreen(
                                  collegeActivityDataList[index].toJson());
                          setState(() {});
                          // await Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //         UpdateCollegeActivity(index: index),
                          //   ),
                          // ).whenComplete(() async {
                          //   await getData();
                          //   setState(() {});
                          // });
                        },
                        child: noticeDetailsCard(
                          context,
                          imageUrl: collegeActivityDataList[index].image,
                          title: collegeActivityDataList[index].title,
                          description:
                              collegeActivityDataList[index].description,
                        ),
                      ),
                    ),
                  ),
                ),
    );
  }
}
