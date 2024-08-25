import "package:flutter/material.dart";
import "package:lottie/lottie.dart";
import "package:user_apppp/common/appbar.dart";
import "package:user_apppp/constant.dart";
import "package:user_apppp/database/database_api.dart";
import "package:user_apppp/database/database_class.dart";


class GeneralNotice extends StatefulWidget {
  const GeneralNotice({Key? key}) : super(key: key);

  @override
  State<GeneralNotice> createState() => _GeneralNoticeState();
}

class _GeneralNoticeState extends State<GeneralNotice> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    isLoading = true;
    await GeneralApi.fetchData();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar(context, title: "General"),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : generalDataList.isEmpty
              ? Center(
                  child: Lottie.asset(
                    'assets/icons/Circle.json',
                    repeat: true,
                    reverse: true,
                    animate: true,
                  ),
                )
              : NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (notification) {
                    notification.disallowIndicator();
                    return true;
                  },
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: generalDataList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      generalDataList[index].image,
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              sizedBox,
                              Text(
                                "Title : ${generalDataList[index].title}",
                              ),
                              Text(
                                "Description : ${generalDataList[index].description}",
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}
