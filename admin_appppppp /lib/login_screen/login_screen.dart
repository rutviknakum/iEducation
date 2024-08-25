// ignore_for_file: use_build_context_synchronously

import 'package:admin_appppppp/constant.dart';
import 'package:admin_appppppp/navigation/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String route = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool _passwordVisible = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController txtIDController = TextEditingController();
  TextEditingController txtPasswordController = TextEditingController();
  String userID = 'admin';
  String password = 'admin';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.46,
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
                      height: kDefaultPadding * 0.5,
                    ),
                    const SizedBox(
                      height: kDefaultPadding * 0.2,
                    ),
                    const Text(
                      "Sign in to continue",
                      style: TextStyle(
                        color: kTextWhiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.54,
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
                        key: formKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: txtIDController,
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(
                                color: kTextBlackColor,
                                fontSize: 15,
                              ),
                              decoration: const InputDecoration(
                                labelText: 'Enter Admin Details ',
                                labelStyle: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              validator: (value) {
                                RegExp regExp = RegExp(emailPattern);
                                if (value == null || value.isEmpty) {
                                  return "Please enter some text";
                                } else if (!regExp.hasMatch(value)) {
                                  return "Please enter valid email address";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: txtPasswordController,
                              obscureText: _passwordVisible,
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.visiblePassword,
                              style: const TextStyle(
                                color: kTextBlackColor,
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                labelText: 'Enter Admin Password',
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
                              height: 40,
                            ),
                            InkWell(
                              onTap: () async {
                                if (userID == txtIDController.text &&
                                    password == txtPasswordController.text) {
                                  final SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  await prefs.setBool(
                                    "userID",
                                    true,
                                  );
                                  AppNavigation.shared.goNextFromSplash();
                                  // Navigator.of(context).pushReplacement(
                                  //   MaterialPageRoute(
                                  //     builder: (context) => const HomeScreen(),
                                  //   ),
                                  // );
                                  setState(() {});
                                } else {
                                  if (userID != txtIDController.text) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Invalid User ID"),
                                        backgroundColor: Colors.red,
                                        margin: EdgeInsets.all(20),
                                        behavior: SnackBarBehavior.floating,
                                      ),
                                    );
                                  } else if (password !=
                                      txtPasswordController.text) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text("Invalid Password"),
                                      backgroundColor: Colors.red,
                                      margin: EdgeInsets.all(20),
                                      behavior: SnackBarBehavior.floating,
                                    ));
                                  }
                                }
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                padding: const EdgeInsets.only(right: 20),
                                width: double.infinity,
                                height: 60,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      colors: [kSecondaryColor, kPrimaryColor],
                                      begin: FractionalOffset(0, 0),
                                      end: FractionalOffset(0.5, 0),
                                      stops: [0, 1]),
                                  borderRadius: BorderRadius.circular(
                                    kDefaultPadding / 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Spacer(),
                                    Text(
                                      "SIGN IN",
                                      style: TextStyle(
                                          color: kTextWhiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.arrow_forward_outlined,
                                      color: kOtherColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            // const SizedBox(
                            //   height: kDefaultPadding,
                            // ),
                            // Align(
                            //   alignment: Alignment.bottomRight,
                            //   child: TextButton(
                            //     onPressed: () {},
                            //     child: const Text(
                            //       "Forgot Password",
                            //       textAlign: TextAlign.end,
                            //       style: TextStyle(fontSize: 15),
                            //     ),
                            //   ),
                            // ),
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
      ),
    );
  }
}
