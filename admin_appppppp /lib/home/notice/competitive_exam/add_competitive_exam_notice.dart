import 'dart:io';

import 'package:admin_appppppp/Network/database_api.dart';
import 'package:admin_appppppp/Network/database_class.dart';
import 'package:admin_appppppp/common/appbar.dart';
import 'package:admin_appppppp/common/label_text.dart';
import 'package:admin_appppppp/common/material_button.dart';
import 'package:admin_appppppp/common/process_indicator.dart';
import 'package:admin_appppppp/common/text_editing_controller.dart';
import 'package:admin_appppppp/constant.dart';
import 'package:admin_appppppp/home/staff_list/add_stafflist_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AddCompetitiveExamNotice extends StatefulWidget {
  const AddCompetitiveExamNotice({Key? key}) : super(key: key);
  static const route = 'addCompetitiveExam';

  @override
  State<AddCompetitiveExamNotice> createState() =>
      _AddCompetitiveExamNoticeState();
}

class _AddCompetitiveExamNoticeState extends State<AddCompetitiveExamNotice> {
  GlobalKey<FormState> addCompetitiveExam = GlobalKey<FormState>();

  File? fileimage;
  String? imageUrl;

  final firebaseStorage = FirebaseStorage.instance;

  bool loading = false;

  void clearData() {
    fileimage = null;
    txtCompetitiveExamTitle.text = '';
    txtCompetitiveExamDescription.text = '';
  }

  @override
  void dispose() {
    txtCompetitiveExamTitle.clear();
    txtCompetitiveExamDescription.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, title: 'Add Competitive Exam'),
      body: SafeArea(
        child: Stack(
          children: [
            Form(
              key: addCompetitiveExam,
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (notification) {
                  notification.disallowIndicator();
                  return true;
                },
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sizedBox,
                      labelText(text: "Enter Exam Title :"),
                      sTextFormField(
                        txtController: txtCompetitiveExamTitle,
                        validator: (value) =>
                            value!.isEmpty ? "Exam  Title" : null,
                        hintText: "Enter Exam Title",
                      ),
                      labelText(text: "Enter Exam Subject :"),
                      sTextFormField(
                        txtController: txtCompetitiveExamsubject,
                        validator: (value) =>
                            value!.isEmpty ? "Exam  Subject" : null,
                        hintText: "Enter Exam Title",
                      ),
                      //sizedBox,
                      labelText(text: "Enter Exam syllabus :"),
                      sTextFormField(
                        txtController: txtCompetitiveExamDescription,
                        validator: (value) =>
                            value!.isEmpty ? "Enter Description" : null,
                        hintText: "Enter Exam syllabus",
                        maxLines: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              child: loading ? processIndicator(context) : const SizedBox(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
        child: materialButton(
          context,
          buttonText: 'Submit',
          onPressed: () async {
            if (addCompetitiveExam.currentState!.validate()) {
              if (fileimage == null) {
                loading = true;
                setState(() {});
                var snapshot = await firebaseStorage
                    .ref()
                    .child('competitiveExam_images/img_${DateTime.now()}')
                    .putFile(fileimage!);
                imageUrl = await snapshot.ref.getDownloadURL();
                CompetitiveExam obj = CompetitiveExam(
                    key: int.parse(
                        DateTime.now().millisecondsSinceEpoch.toString()),
                    title: txtCompetitiveExamTitle.text,
                    description: txtCompetitiveExamDescription.text,
                    image: imageUrl ?? '');
                await CompetitiveExamApi.competitiveExamAddData(obj: obj);
                if (!mounted) return;
                Navigator.pop(context);
                loading = false;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text("Successfully Add Notice"),
                    backgroundColor: Colors.green,
                    margin: EdgeInsets.all(20),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                clearData();
                setState(() {});
              } else {
                loading = false;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Please Select Image"),
                    backgroundColor: Colors.red,
                    margin: EdgeInsets.all(20),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
