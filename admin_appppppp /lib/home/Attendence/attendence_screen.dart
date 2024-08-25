import 'package:flutter/material.dart';

class AttendenceScreen extends StatelessWidget {
  const AttendenceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String data = "";
    DateTime date = DateTime.now();
    // TimeOfDay time = TimeOfDay.now();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(left: 89),
            child: Text(
              "Attendence",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${date.day}/${date.month}/${date.year}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
