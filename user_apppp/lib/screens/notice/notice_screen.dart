// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:user_apppp/common/appbar.dart';
import 'package:user_apppp/constant.dart';
import 'package:user_apppp/database/database_api.dart';
import 'package:user_apppp/screens/notice/college_activity_notice.dart';
import 'package:user_apppp/screens/notice/competitive_exam_notice.dart';
import 'package:user_apppp/screens/notice/cultural_festvial_notice.dart';
import 'package:user_apppp/screens/notice/general_notice.dart';
import 'package:user_apppp/screens/notice/job_vacancy_notice.dart';
import 'package:user_apppp/screens/notice/sport_notice.dart';


class NoticeScreen extends StatefulWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: appbar(context, title: 'Notice'),
      body: ListView(
        padding: const EdgeInsets.all(10),
        physics: const BouncingScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NoticeCard(
                title: "Culture Festival",
                icon: "assets/icons/culture_festival.png",
                onPress: () async {
                  await CulturalFestivalApi.fetchData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CulturalFestival(),
                    ),
                  );
                  setState(() {});
                },
              ),
              NoticeCard(
                title: "College Activity",
                icon: "assets/icons/college_activity.png",
                onPress: () async {
                  await CollegeActivityApi.fetchData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CollegeActivity(),
                    ),
                  );
                  setState(() {});
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NoticeCard(
                title: "Sports",
                icon: "assets/icons/sport.png",
                onPress: () async {
                  await SportsApi.fetchData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SportNotice(),
                    ),
                  );
                  setState(() {});
                },
              ),
              NoticeCard(
                title: "Competitive Exam",
                icon: "assets/icons/exam.png",
                onPress: () async {
                  await CompetitiveExamApi.fetchData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CompetitiveExamNotice(),
                    ),
                  );
                  setState(() {});
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NoticeCard(
                title: "Job Vacancy",
                icon: "assets/icons/job_vacancy.png",
                onPress: () async {
                  await JobVacancyApi.fetchData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const JobVacancyNotice(),
                    ),
                  );
                  setState(() {});
                },
              ),
              NoticeCard(
                title: "General",
                icon: "assets/icons/general.png",
                onPress: () async {
                  await GeneralApi.fetchData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GeneralNotice(),
                    ),
                  );
                  setState(() {});
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NoticeCard extends StatelessWidget {
  const NoticeCard(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onPress})
      : super(key: key);

  final String title;
  final String icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.18,
        width: MediaQuery.of(context).size.width * 0.4,
        margin: const EdgeInsets.only(
            top: kDefaultPadding * 0.5, bottom: kDefaultPadding * 0.6),
        decoration: BoxDecoration(
          color: primarycolor,
          borderRadius: BorderRadius.circular(kDefaultPadding * 0.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(icon),
              height: 50,
              width: 50,
            ),
            const SizedBox(
              height: kDefaultPadding * 0.8,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
