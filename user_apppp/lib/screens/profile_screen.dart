import 'package:flutter/material.dart';
import 'package:user_apppp/common/appbar.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, title: 'Profile'),
      body: SafeArea(
        child: Center(
          child: Column(
            children: const [
              Text(" "),
              Text(" "),
            ],
          ),
        ),
      ),
    );
  }
}
