import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_apppp/constant.dart';
import 'package:user_apppp/data/database_service.dart';
import 'package:user_apppp/database/database_api.dart';
import 'package:user_apppp/database/database_class.dart';
import 'package:user_apppp/login_screen.dart';
import 'package:user_apppp/model/model.dart';



class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late bool _passwordVisible = true;
  bool isSingUpLoading = false;
  bool isLoginLoader = false;

  getLoginData() async {
    isLoginLoader = true;
    setState(() {});
    await DataBaseHelper.loginData();
    await StudentDataApi.fetchData();
    isLoginLoader = false;
  }

  @override
  void initState() {
    getLoginData();
    super.initState();
  }

  final GlobalKey<FormState> singUpFormKey = GlobalKey<FormState>();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    mobileNumber.clear();
    password.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: primarycolor,
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/splash.png',
                    height: 150,
                    width: 150,
                  ),
                  const SizedBox(
                    //  height: kDefaultPadding / 2,
                    height: kDefaultPadding * 0.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hii ",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          color: background,
                        ),
                      ),
                      Text(
                        "Student",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: background,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    // height: kDefaultPadding / 6,
                    height: kDefaultPadding * 0.2,
                  ),
                  Text(
                    "Sign in to continue",
                    style: TextStyle(
                      color: background,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.56,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
                color: kOtherColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Form(
                      key: singUpFormKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: mobileNumber,
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                            decoration: const InputDecoration(
                              labelText: 'Enter Mobile Number',
                              labelStyle: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            validator: (value) =>
                                value!.isEmpty ? "Enter Mobile Number" : null,
                          ),
                          sizedBox,
                          TextFormField(
                            controller: password,
                            obscureText: _passwordVisible,
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.visiblePassword,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: const TextStyle(
                                fontSize: 15,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(_passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.remove_red_eye_outlined),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value!.length <= 6) {
                                return "Must be more than 6 characters";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: kDefaultPadding * 0.2,
                          ),
                          sizedBox,
                          sizedBox,
                          isSingUpLoading
                              ? const Center(child: CircularProgressIndicator())
                              : InkWell(
                                  onTap: () async {
                                    if (singUpFormKey.currentState!
                                        .validate()) {
                                      UserData userData = UserData(
                                        mobilNumber: mobileNumber.text,
                                        password: password.text,
                                      );
                                      isSingUpLoading = true;
                                      if (studentDataList.any(
                                            (element) =>
                                                element.phoneNo ==
                                                mobileNumber.text,
                                          ) &&
                                          DataBaseHelper.userDataList.any(
                                              (element) =>
                                                  element.mobilNumber ==
                                                  mobileNumber.text)) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text(
                                              "Mobile number is already registered "),
                                          backgroundColor: Colors.red,
                                          margin: EdgeInsets.all(20),
                                          behavior: SnackBarBehavior.floating,
                                        ));
                                      } else if (studentDataList.any(
                                          (element) =>
                                              element.phoneNo ==
                                              mobileNumber.text)) {
                                        await DataBaseHelper.userData(
                                            data: userData.toJson());
                                        DataBaseHelper.clearAllData();
                                        if (!mounted) return;
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen(),
                                          ),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text("Student Not Found"),
                                          backgroundColor: Colors.red,
                                          margin: EdgeInsets.all(20),
                                          behavior: SnackBarBehavior.floating,
                                        ));
                                      }
                                      isSingUpLoading = false;
                                      setState(() {});
                                    }
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    padding: const EdgeInsets.only(right: 20),
                                    width: double.infinity,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [background, primarycolor],
                                            begin: const FractionalOffset(0, 0),
                                            end: const FractionalOffset(0.5, 0),
                                            stops: const [0, 1]),
                                        borderRadius: BorderRadius.circular(
                                            kDefaultPadding / 1)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Spacer(),
                                        Text(
                                          "SIGN UP",
                                          style: TextStyle(
                                              color: background,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const Spacer(),
                                        const Icon(
                                          Icons.arrow_forward_outlined,
                                          color: kOtherColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
