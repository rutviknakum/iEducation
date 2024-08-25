
import 'package:admin_appppppp/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget noticeDetailsCard(
  BuildContext context, {
  required String imageUrl,
  String title = '',
  String description = '',
}) {
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.center,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              imageBuilder: (context, imageProvider) => Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              placeholder: (context, url) =>
                  const CircularProgressIndicator(color: kPrimaryColor),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          sizedBox,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Title : ',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.715,
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Description : ',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.55,
                child: Text(
                  description,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
