// ignore_for_file: use_build_context_synchronously

import 'package:admin_appppppp/Network/database_api.dart';
import 'package:admin_appppppp/Network/database_class.dart';
import 'package:admin_appppppp/constant.dart';
import 'package:admin_appppppp/navigation/app_navigation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class StaffListScreen extends StatefulWidget {
  const StaffListScreen({Key? key}) : super(key: key);
  static const route = 'staffListScreen';

  @override
  State<StaffListScreen> createState() => _StaffListScreenState();
}

class _StaffListScreenState extends State<StaffListScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  bool isLoading = false;

  Future<void> getData() async {
    isLoading = true;
    await StaffListApi.fetchData();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 98),
          child: Text(
            "Staff List",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
              onPressed: (() {
                AppNavigation.shared.moveToAddStaffList();
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
          ? const Center(child: CircularProgressIndicator(color: kPrimaryColor))
          : staffDataList.isEmpty
              ? Center(
                  child: Image.asset('assets/icons/staff.png'),
                )
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: staffDataList.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(staffDataList[index].toString()),
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
                                    await StaffListApi.deleteData(
                                      key: staffDataList[index].key.toString(),
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
                            AppNavigation.shared.moveToStaffProfile(
                                staffDataList[index].toJson());

                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => StaffProfileScreen(
                            //       args: index,
                            //     ),
                            //   ),
                            // ).whenComplete(
                            //   () async {
                            //     await getData();
                            //   },
                            // );
                          }),
                          child: Card(
                            elevation: 5,
                            child: ListTile(
                              leading: CachedNetworkImage(
                                imageUrl: staffDataList[index].image.toString(),
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
                                staffDataList[index].name,
                              ),
                              subtitle: Text(
                                staffDataList[index].degree,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}
