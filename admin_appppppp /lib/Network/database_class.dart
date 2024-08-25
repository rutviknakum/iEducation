// **** Student ****

// ignore_for_file: non_constant_identifier_names

class Student {
  String fName,
      mName,
      lName,
      email,
      image,
      address,
      bloodGroup,
      gender,
      caste,
      semester,
      stream,
      pincode,
      enrollNo,
      spidNo,
      phoneNo,
      dob;
  int key;

  Student({
    required this.fName,
    required this.mName,
    required this.lName,
    required this.image,
    required this.email,
    required this.phoneNo,
    required this.dob,
    required this.gender,
    required this.caste,
    required this.stream,
    required this.semester,
    required this.address,
    required this.pincode,
    required this.enrollNo,
    required this.spidNo,
    required this.bloodGroup,
    required this.key,
  });

  factory Student.fromJson(Map<dynamic, dynamic> json) => Student(
      address: json['address'],
      bloodGroup: json['bloodGroup'],
      caste: json['caste'],
      dob: json['dob'],
      email: json['email'],
      enrollNo: json['enrollNo'],
      fName: json['fName'],
      gender: json['gender'],
      image: json['image'],
      lName: json['lName'],
      mName: json['mName'],
      phoneNo: json['phoneNo'],
      pincode: json['pincode'],
      semester: json['semester'],
      spidNo: json['spidNo'],
      stream: json['stream'],
      key: json['key']);

  Map<String, dynamic> toJson() => {
        'key': key,
        'fName': fName,
        'mName': mName,
        'lName': lName,
        'email': email,
        'image': image,
        'phoneNo': phoneNo,
        'dob': dob,
        'semester': semester,
        'gender': gender,
        'caste': caste,
        'stream': stream,
        'address': address,
        'pincode': pincode,
        'enrollNo': enrollNo,
        'spidNo': spidNo,
        'bloodGroup': bloodGroup,
      };
}

List<Student> studentDataList = [];

// **** Staff List ****
class StaffList {
  String image, name, degree, email, experience, post, phoneNo, subject;
  int key;

  StaffList({
    required this.image,
    required this.name,
    required this.degree,
    required this.post,
    required this.email,
    required this.phoneNo,
    required this.subject,
    required this.experience,
    required this.key,
  });
  factory StaffList.fromJson(Map<dynamic, dynamic> json) => StaffList(
        image: json['image'],
        name: json['name'],
        degree: json['degree'],
        post: json['post'],
        email: json['email'],
        subject: json['subject'],
        phoneNo: json['phoneNo'],
        experience: json['experience'],
        key: json['key'],
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'name': name,
        'degree': degree,
        'post': post,
        'email': email,
        'image': image,
        'phoneNo': phoneNo,
        'experience': experience,
        'subject': subject,
      };
}

List<StaffList> staffDataList = [];

// **** Time Table ****
class TimeTable {
  String stream, semester, lectureName, TeacherName, lectureDate;
  int key;

  TimeTable({
    required this.lectureName,
    required this.TeacherName,
    required this.semester,
    required this.stream,
    required this.lectureDate,
    required this.key,
  });
  factory TimeTable.fromJson(Map<dynamic, dynamic> json) => TimeTable(
        key: json['key'],
        semester: json['semester'],
        stream: json['stream'],
        lectureName: json['lectureName'],
        TeacherName: json['TeacherName'],
        lectureDate: json['lectureDate'],
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'lectureName': lectureName,
        'TeacherName': TeacherName,
        'semester': semester,
        'stream': stream,
        'lectureDate': lectureDate,
      };
}

class TimeTableModel {
  String lectureDate;
  List<TimeTable> tb = [];
  TimeTableModel({
    required this.lectureDate,
    required this.tb,
  });
  factory TimeTableModel.fromJson(Map<dynamic, dynamic> json) => TimeTableModel(
        lectureDate: json['lectureDate'],
        tb: List<TimeTable>.from(
            json['tb'].map((Map e) => TimeTable.fromJson(e))),
      );

  Map<String, dynamic> toJson() => {
        'lectureDate': lectureDate,
        'tb': List.from(tb.map((e) => e)),
      };
}

List<TimeTableModel> timeTableDataList = [];

// **** Materials ****
class Materials {
  String fileName, fileSize, subjectName, stream, semester, date, time;
  int key;

  Materials({
    required this.fileName,
    required this.fileSize,
    required this.subjectName,
    required this.stream,
    required this.semester,
    required this.date,
    required this.time,
    required this.key,
  });

  factory Materials.fromJson(Map<dynamic, dynamic> json) => Materials(
        key: json['key'],
        fileName: json['fileName'],
        fileSize: json['fileSize'],
        subjectName: json['subjectName'],
        stream: json['stream'],
        semester: json['semester'],
        date: json['date'],
        time: json['time'],
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'fileName': fileName,
        'fileSize': fileSize,
        'subjectName': subjectName,
        'stream': stream,
        'semester': semester,
        'date': date,
        'time': time,
      };
}

List<Materials> materialsDataList = [];

// **** Assignment ****
class Assignment {
  String fileName,
      fileSize,
      subjectName,
      stream,
      semester,
      date,
      time,
      noOfAssignment;
  int key;

  Assignment({
    required this.fileName,
    required this.fileSize,
    required this.subjectName,
    required this.stream,
    required this.noOfAssignment,
    required this.semester,
    required this.date,
    required this.time,
    required this.key,
  });

  factory Assignment.fromJson(Map<dynamic, dynamic> json) => Assignment(
        key: json['key'],
        fileName: json['fileName'],
        fileSize: json['fileSize'],
        subjectName: json['subjectName'],
        noOfAssignment: json['noOfAssignment'],
        stream: json['stream'],
        semester: json['semester'],
        date: json['date'],
        time: json['time'],
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'fileName': fileName,
        'fileSize': fileSize,
        'noOfAssignment': noOfAssignment,
        'subjectName': subjectName,
        'stream': stream,
        'semester': semester,
        'date': date,
        'time': time,
      };
}

List<Assignment> assignmentDataList = [];

// **** Course ****
class Course {
  String fileName, fileSize, subjectName, stream, semester, date, time;
  int key;

  Course({
    required this.fileName,
    required this.fileSize,
    required this.subjectName,
    required this.stream,
    required this.semester,
    required this.date,
    required this.time,
    required this.key,
  });
  factory Course.fromJson(Map<dynamic, dynamic> json) => Course(
        key: json['key'],
        fileName: json['fileName'],
        fileSize: json['fileSize'],
        stream: json['stream'],
        semester: json['semester'],
        subjectName: json['subjectName'],
        date: json['date'],
        time: json['time'],
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'fileName': fileName,
        'fileSize': fileSize,
        'stream': stream,
        'semester': semester,
        'subjectName': subjectName,
        'date': date,
        'time': time,
      };
}

List<Course> courseDataList = [];

// **** Result ****
class Result {
  String fileName, fileSize, stream, semester, date, time, examType;
  int? key;

  Result({
    required this.fileName,
    required this.fileSize,
    required this.stream,
    required this.semester,
    required this.examType,
    required this.date,
    required this.time,
    required this.key,
  });
  factory Result.fromJson(Map<dynamic, dynamic> json) => Result(
        key: json['key'],
        fileName: json['fileName'],
        fileSize: json['fileSize'],
        stream: json['stream'],
        semester: json['semester'],
        examType: json['examType'],
        date: json['date'],
        time: json['time'],
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'fileName': fileName,
        'fileSize': fileSize,
        'stream': stream,
        'semester': semester,
        'examType': examType,
        'date': date,
        'time': time,
      };
}

List<Result> resultDataList = [];

//  **** Cultural Festival ****
class CulturalFestival {
  String image, title, description;
  int key;

  CulturalFestival({
    required this.image,
    required this.title,
    required this.description,
    required this.key,
  });
  factory CulturalFestival.fromJson(Map<dynamic, dynamic> json) =>
      CulturalFestival(
        key: json['key'],
        image: json['image'],
        title: json['title'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'image': image,
        'title': title,
        'description': description,
      };
}

List<CulturalFestival> culturalFestivalDataList = [];

//  **** College Activity ****
class CollegeActivity {
  String image, title, description;
  int key;

  CollegeActivity({
    required this.image,
    required this.title,
    required this.description,
    required this.key,
  });
  factory CollegeActivity.fromJson(Map<dynamic, dynamic> json) =>
      CollegeActivity(
        key: json['key'],
        image: json['image'],
        title: json['title'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'image': image,
        'title': title,
        'description': description,
      };
}

List<CollegeActivity> collegeActivityDataList = [];

// **** Sports ****
class Sports {
  String image, title, description;
  int key;

  Sports({
    required this.image,
    required this.title,
    required this.description,
    required this.key,
  });
  factory Sports.fromJson(Map<dynamic, dynamic> json) => Sports(
        key: json['key'],
        image: json['image'],
        title: json['title'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'image': image,
        'title': title,
        'description': description,
      };
}

List<Sports> sportsDataList = [];

// **** Job Vacancy ****
class JobVacancy {
  String image, title, description;
  int key;

  JobVacancy({
    required this.image,
    required this.title,
    required this.description,
    required this.key,
  });
  factory JobVacancy.fromJson(Map<dynamic, dynamic> json) => JobVacancy(
        key: json['key'],
        image: json['image'],
        title: json['title'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'image': image,
        'title': title,
        'description': description,
      };
}

List<JobVacancy> jobVacancyDataList = [];

// **** General ****
class General {
  String image, title, description;
  int key;

  General({
    required this.image,
    required this.title,
    required this.description,
    required this.key,
  });
  factory General.fromJson(Map<dynamic, dynamic> json) => General(
        key: json['key'],
        image: json['image'],
        title: json['title'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'image': image,
        'title': title,
        'description': description,
      };
}

List<General> generalDataList = [];

// **** Competitive Exam ****
class CompetitiveExam {
  String image, title, description;
  int key;

  CompetitiveExam({
    required this.image,
    required this.title,
    required this.description,
    required this.key,
  });
  factory CompetitiveExam.fromJson(Map<dynamic, dynamic> json) =>
      CompetitiveExam(
        key: json['key'],
        image: json['image'],
        title: json['title'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'image': image,
        'title': title,
        'description': description,
      };
}

List<CompetitiveExam> competitiveExamDataList = [];
