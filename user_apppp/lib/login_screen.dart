import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_apppp/constant.dart';
import 'package:user_apppp/data/database_service.dart';
import 'package:user_apppp/screens/home_screen/home_screen_bottombar.dart';
import 'package:user_apppp/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool _passwordVisible = true;
  bool isLoginLoader = false;
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController password = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  getLoginData() async {
    isLoginLoader = true;
    await DataBaseHelper.loginData();

    setState(() {});
    isLoginLoader = false;
  }

  @override
  void initState() {
    getLoginData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint(" user data List ====> ${DataBaseHelper.userDataList.length}");
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/splash.png',
                    height: 150,
                    width: 150,
                  ),
                  const SizedBox(
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
                            color: background),
                      ),
                      Text(
                        "Student",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: background),
                      ),
                    ],
                  ),
                  const SizedBox(
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
                      key: _formKey,
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
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility_off
                                      : Icons.remove_red_eye_outlined,
                                ),
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
                          InkWell(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                if (DataBaseHelper.userDataList.any((element) =>
                                    element.mobilNumber == mobileNumber.text)) {
                                  if (DataBaseHelper.userDataList.any(
                                      (element) =>
                                          element.password == password.text)) {
                                    final SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString(
                                        "userMobileNumber", mobileNumber.text);
                                    if (!mounted) return;
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreenBottomBar(),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Wrong password"),
                                        backgroundColor: Colors.red,
                                        margin: EdgeInsets.all(20),
                                        behavior: SnackBarBehavior.floating,
                                      ),
                                    );
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Invalid mobile Number"),
                                      backgroundColor: Colors.red,
                                      margin: EdgeInsets.all(20),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
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
                                gradient: LinearGradient(
                                  colors: [background, primarycolor],
                                  begin: const FractionalOffset(0, 0),
                                  end: const FractionalOffset(0.5, 0),
                                  stops: const [0, 1],
                                ),
                                borderRadius: BorderRadius.circular(
                                  kDefaultPadding / 1,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Spacer(),
                                  Text(
                                    "SIGN IN",
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
                          const SizedBox(height: kDefaultPadding * 1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Account not found?",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignupScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Sign Up Account",
                                  style: TextStyle(
                                    color: primarycolor,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                  ),
                                ),
                              ),
                            ],
                          )
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
