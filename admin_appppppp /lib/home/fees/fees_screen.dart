import 'package:admin_appppppp/common/appbar.dart';
import 'package:admin_appppppp/common/floating_actin_button.dart';
import 'package:admin_appppppp/constant.dart';
import 'package:admin_appppppp/home/fees/add_fees_screen.dart';
import 'package:flutter/material.dart';

class FeesScreen extends StatelessWidget {
  const FeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar(context, title: 'Fees'),
      body: Column(
        children: [
          Center(
            child: Image.asset('assets/icons/fees.png'),
          ),
          ListView(
            padding: const EdgeInsets.all(15),
            physics: const BouncingScrollPhysics(),
            children: [
              FeeStudentField(
                  title: "Bachelor of Computer Application", onPress: () {}),
              sizedBox,
              FeeStudentField(title: "Bachelor of Commerce", onPress: () {}),
              sizedBox,
              FeeStudentField(
                  title: "Bachelor of Business Administration", onPress: () {}),
            ],
          ),
        ],
      ),
      floatingActionButton: floatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddFeesScreen()));
        },
      ),
    );
  }
}

class FeeStudentField extends StatelessWidget {
  const FeeStudentField(
      {super.key, required this.title, required this.onPress});

  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: kTextWhiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
