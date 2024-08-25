import 'package:admin_appppppp/Network/database_api.dart';
import 'package:admin_appppppp/Network/database_class.dart';
import 'package:admin_appppppp/common/appbar.dart';
import 'package:admin_appppppp/common/dropdown_button_widget.dart';
import 'package:admin_appppppp/common/label_text.dart';
import 'package:admin_appppppp/common/material_button.dart';
import 'package:admin_appppppp/common/process_indicator.dart';
import 'package:admin_appppppp/common/text_editing_controller.dart';
import 'package:admin_appppppp/common/text_form_field.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:intl/intl.dart';

class AddTimeTable extends StatefulWidget {
  const AddTimeTable({Key? key}) : super(key: key);
  static const route = 'addTimeTable';
  @override
  State<AddTimeTable> createState() => _AddTimeTableState();
}

class _AddTimeTableState extends State<AddTimeTable> {
  GlobalKey<FormState> addTimeTable = GlobalKey<FormState>();
  String? selectedSemester;
  String? selectedStream;
  List<String> stream = [
    'M.Tech-IC',
    'M.Tech-EC',
    'Msc-IT',
    'Msc-DS',
    'M.Sc-Agriculture Analytics',
  ];

  List<String> semester = [
    'SEM - 1',
    'SEM - 2',
    'SEM - 3',
    'SEM - 4',
  ];

  // DateTime? date = DateTime.now();
  // TimeOfDay? time = TimeOfDay.now();

  bool loading = false;

  void clearData() {
    txtLectureName.clear();
    txtLectureDate.clear();
    txtLectureStartTime.clear();
    txtLectureEndTime.clear();
  }

  @override
  void dispose() {
    txtLectureName.clear();
    txtLectureDate.clear();
    txtLectureStartTime.clear();
    txtLectureEndTime.clear();
    //  date =null;
    //  time=null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, title: 'Add Time Table'),
      body: Stack(
        children: [
          Form(
            key: addTimeTable,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  labelText(text: "Select Stream"),
                  dropDownButton(
                    context,
                    hintText: 'Select Stream',
                    item: stream
                        .map(
                          (stream) => DropdownMenuItem<String>(
                            value: stream,
                            child: Text(
                              stream,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                        .toList(),
                    value: selectedStream,
                    onChanged: (value) {
                      setState(() {
                        selectedStream = value as String;
                      });
                    },
                  ),
                  labelText(text: "Select Semester"),
                  dropDownButton(
                    context,
                    hintText: 'Select Semester',
                    item: semester
                        .map((semester) => DropdownMenuItem<String>(
                              value: semester,
                              child: Text(
                                semester,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    value: selectedSemester,
                    onChanged: (value) {
                      setState(
                        () {
                          selectedSemester = value as String;
                        },
                      );
                    },
                  ),
                  labelText(text: "Lecture Name"),
                  textFormField(
                    txtController: txtLectureName,
                    validator: (value) =>
                        value!.isEmpty ? "Enter Lecture Name" : null,
                    hintText: "Lecture Name",
                    prefixIcon: Icons.library_books,
                  ),
                  labelText(text: "Teacher Name"),
                  textFormField(
                    txtController: txtTeacherName,
                    validator: (value) =>
                        value!.isEmpty ? "Enter Lecture Name" : null,
                    hintText: "Teacher Name",
                    prefixIcon: Icons.person,
                  ),
                  labelText(text: "Lecture Date"),
                  textFormField(
                      readOnly: true,
                      txtController: txtLectureDate,
                      validator: (value) {
                        if (value!.isEmpty || value.isEmpty) {
                          return 'Choose Date';
                        }
                        return null;
                      },
                      prefixIcon: Icons.calendar_today_outlined,
                      suffixIcon: Icons.calendar_month,
                      hintText: "Lecture Date",
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2030),
                        );
                        if (newDate == null) return;
                        String date1 =
                            "${newDate.day}-${newDate.month}-${newDate.year}";
                        txtLectureDate.text = date1;
                        setState(() {});
                      }),

                  /*
                  labelText(text: "Lecture  Start Time"),
                  textFormField(
                    readOnly: true,
                    txtController: txtLectureStartTime,
                    validator: (value) {
                      if (value!.isEmpty || value.isEmpty) {
                        return 'Set Start Time';
                      }
                      return null;
                    },
                    prefixIcon: Icons.schedule,
                    suffixIcon: Icons.av_timer,
                    hintText: "Lecture Start Time",
                    onPressed: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      );
                      if (pickedTime != null) {
                        if (!mounted) return;

                        DateTime parsedTime = DateFormat.jm()
                            .parse(pickedTime.format(context).toString());
                        String formattedTime =
                            DateFormat('hh:mm aa').format(parsedTime);
                        setState(() {
                          txtLectureStartTime.text = formattedTime;
                        });
                      }
                    },
                  ),


*/
                ],
              ),
            ),
          ),
          Positioned(
              child: loading ? processIndicator(context) : const SizedBox())
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
        child: materialButton(
          context,
          buttonText: 'Submit',
          onPressed: () async {
            if (addTimeTable.currentState!.validate()) {
              if (selectedStream != null) {
                if (selectedSemester != null) {
                  loading = true;
                  setState(() {});
                  TimeTable obj = TimeTable(
                    key: int.parse(
                        DateTime.now().millisecondsSinceEpoch.toString()),
                    stream: selectedStream.toString(),
                    semester: selectedSemester.toString(),
                    lectureName: txtLectureName.text,
                    lectureDate: txtLectureDate.text,
                    TeacherName: txtTeacherName.text,
                  );
                  await TimeTableApi.timeTableAddData(
                    obj: obj,
                  );
                  if (!mounted) return;
                  Navigator.pop(context);
                  loading = false;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text("Successfully Add Time Table"),
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
                      content: Text("Please Select Sem "),
                      backgroundColor: Colors.red,
                      margin: EdgeInsets.all(20),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              } else {
                loading = false;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Please Select Stream "),
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
