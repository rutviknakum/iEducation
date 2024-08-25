
import 'package:admin_appppppp/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget textFormField({
  TextEditingController? txtController,
  IconData? prefixIcon,
  IconData? suffixIcon,
  String hintText = '',
  bool readOnly = false,
  List<TextInputFormatter>? inputFormatters,
  TextInputType? keyboardType = TextInputType.text,
  String? Function(String?)? validator,
  bool obscureText = false,
  void Function()? onPressed,
  int? maxLines = 1,
  TextStyle? hintStyle,
}) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 3,
      left: 10,
      right: 10,
    ),
    child: TextFormField(
      validator: validator,
      obscureText: obscureText,
      cursorColor: kPrimaryColor,
      controller: txtController,
      readOnly: readOnly,
      maxLines: maxLines,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        fillColor: kSecondaryColor,
        filled: true,
        contentPadding: const EdgeInsets.all(17),
        prefixIcon: Icon(
          prefixIcon,
          color: kPrimaryColor,
        ),
        suffixIcon: IconButton(
          onPressed: onPressed,
          color: kPrimaryColor,
          icon: Icon(suffixIcon),
        ),
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

Widget sTextFormField({
  TextEditingController? txtController,
  TextInputType? keyboardType = TextInputType.text,
  String hintText = '',
  String? Function(String?)? validator,
  int maxLines = 1, required List<TextInputFormatter> inputFormatters,
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
