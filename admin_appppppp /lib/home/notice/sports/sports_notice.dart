// ignore_for_file: use_build_context_synchronously

import 'package:admin_appppppp/Network/database_api.dart';
import 'package:admin_appppppp/Network/database_class.dart';
import 'package:admin_appppppp/common/card.dart';
import 'package:admin_appppppp/navigation/app_navigation.dart';
import 'package:flutter/material.dart';

class SportsNoticeScreen extends StatefulWidget {
  const SportsNoticeScreen({Key? key}) : super(key: key);
  static const route = 'sports';

  @override
  State<SportsNoticeScreen> createState() => _SportsNoticeScreenState();
}

class _SportsNoticeScreenState extends State<SportsNoticeScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  bool isLoading = false;

  Future<void> getData() async {
    isLoading = true;
    await SportsApi.fetchData();
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
            "Sports Activity",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
              onPressed: (() {
                AppNavigation.shared.moveToAddSportsScreen();
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
          : sportsDataList.isEmpty
              ? Center(child: Image.asset('assets/icons/sport.png'))
              : ListView.builder(
                  itemCount: sportsDataList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Dismissible(
                      key: Key(sportsDataList[index].key.toString()),
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
                                  await SportsApi.deleteData(
                                    key: sportsDataList[index].key.toString(),
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
                          AppNavigation.shared.moveToUpdateSportsScreen(
                              sportsDataList[index].toJson());
                          setState(() {});
                          // await Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //         UpdateSportNotice(index: index),
                          //   ),
                          // ).whenComplete(() async {
                          //   await getData();
                          //   setState(() {});
                          // });
                        },
                        child: noticeDetailsCard(
                          context,
                          imageUrl: sportsDataList[index].image,
                          title: sportsDataList[index].title,
                          description: sportsDataList[index].description,
                        ),
                      ),
                    ),
                  ),
                ),
    );
  }
}
