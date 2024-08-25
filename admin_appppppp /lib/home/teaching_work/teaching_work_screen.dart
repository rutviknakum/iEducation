import 'package:admin_appppppp/common/appbar.dart';
import 'package:admin_appppppp/constant.dart';
import 'package:flutter/material.dart';

class TeachingWorkScreen extends StatelessWidget {
  const TeachingWorkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, title: 'Teaching Work'),
    );
  }
}

class WorkMonthCard extends StatelessWidget {
  const WorkMonthCard(
      {Key? key,
      required this.date,
      required this.month,
      required this.onPress})
      : super(key: key);

  final String date;
  final String month;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height * 0.12,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              date,
              style: const TextStyle(
                color: kOtherColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              month,
              style: const TextStyle(
                color: kOtherColor,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
