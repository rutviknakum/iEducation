// ignore_for_file: use_build_context_synchronously

import 'package:admin_appppppp/Network/database_api.dart';
import 'package:admin_appppppp/Network/database_class.dart';
import 'package:admin_appppppp/common/card.dart';
import 'package:admin_appppppp/constant.dart';
import 'package:admin_appppppp/navigation/app_navigation.dart';
import 'package:flutter/material.dart';

class CulturalFestivalNotice extends StatefulWidget {
  const CulturalFestivalNotice({Key? key}) : super(key: key);
  static const route = 'culturalFestival';
  @override
  State<CulturalFestivalNotice> createState() => _CulturalFestivalNoticeState();
}

class _CulturalFestivalNoticeState extends State<CulturalFestivalNotice> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  bool isLoading = false;

  Future<void> getData() async {
    isLoading = true;
    await CulturalFestivalApi.fetchData();
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
            "Cultural Festival",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
              onPressed: (() {
                AppNavigation.shared.moveToAddCulturalFestivalScreen();
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
          ? const Center(child: CircularProgressIndicator(color: kPrimaryColor))
          : culturalFestivalDataList.isEmpty
              ? Center(child: Image.asset('assets/icons/notice.png'))
              : ListView.builder(
                  itemCount: culturalFestivalDataList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Dismissible(
                      key: Key(culturalFestivalDataList[index].toString()),
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
                                  await CulturalFestivalApi.deleteData(
                                    key: culturalFestivalDataList[index]
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
                              .moveToUpdateCulturalFestivalScreen(
                                  culturalFestivalDataList[index].toJson());
                          setState(() {});
                          // await Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //         UpdateCultureFestival(index: index),
                          //   ),
                          // ).whenComplete(() async {
                          //   await getData();
                          //   setState(() {});
                          // });
                        },
                        child: noticeDetailsCard(
                          context,
                          imageUrl: culturalFestivalDataList[index].image,
                          title: culturalFestivalDataList[index].title,
                          description:
                              culturalFestivalDataList[index].description,
                        ),
                      ),
                    ),
                  ),
                ),
    );
  }
}
