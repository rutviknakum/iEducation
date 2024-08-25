
import 'package:admin_appppppp/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget sTextFormField({
  TextEditingController? txtController,
  TextInputType? keyboardType = TextInputType.text,
  String hintText = '',
  String? Function(String?)? validator,
  List<TextInputFormatter>? inputFormatters,
  int maxLines = 1,
}) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 3,
      left: 10,
      right: 10,
    ),
    child: TextFormField(
      maxLines: maxLines,
      validator: validator,
      inputFormatters: inputFormatters,
      cursorColor: kPrimaryColor,
      controller: txtController,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        fillColor: kSecondaryColor,
        filled: true,
        contentPadding: const EdgeInsets.all(17),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: kPrimaryColor,
            width: 1,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: kPrimaryColor,
            width: 1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            width: 1,
            color: kPrimaryColor,
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
    ),
  );
}
