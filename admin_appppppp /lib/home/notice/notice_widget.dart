import 'package:flutter/material.dart';

import '../../constant.dart';

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
            top: kDefaultPadding * 0.5,
            bottom: kDefaultPadding * 0.6),
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius:
            BorderRadius.circular(kDefaultPadding * 0.5),
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
                  color: kTextWhiteColor),
            )
          ],
        ),
      ),
    );
  }
}
