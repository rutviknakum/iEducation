import "package:flutter/material.dart";
import "package:lottie/lottie.dart";

import "package:user_apppp/common/appbar.dart";
import "package:user_apppp/constant.dart";
import "package:user_apppp/database/database_api.dart";
import "package:user_apppp/database/database_class.dart";

class CompetitiveExamNotice extends StatefulWidget {
  const CompetitiveExamNotice({Key? key}) : super(key: key);

  @override
  State<CompetitiveExamNotice> createState() => _CompetitiveExamNoticeState();
}

class _CompetitiveExamNoticeState extends State<CompetitiveExamNotice> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    isLoading = true;
    await CompetitiveExamApi.fetchData();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar(context, title: 'Compatitive Exam'),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : competitiveExamDataList.isEmpty
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
                    itemCount: competitiveExamDataList.length,
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
                                      competitiveExamDataList[index].image,
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              sizedBox,
                              Text(
                                "Title : ${competitiveExamDataList[index].title}",
                              ),
                              Text(
                                "Description : ${competitiveExamDataList[index].description}",
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
