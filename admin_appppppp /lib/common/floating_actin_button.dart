
import 'package:admin_appppppp/constant.dart';
import 'package:flutter/material.dart';

Widget floatingActionButton({required void Function()? onPressed}) {
  return FloatingActionButton.extended(
    backgroundColor: kPrimaryColor,
    onPressed: onPressed,
    icon: const Icon(Icons.add),
    label: const Text(
      'Add',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
