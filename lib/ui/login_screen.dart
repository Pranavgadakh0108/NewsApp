// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:news_app/data/appdata.dart';
import 'package:news_app/database/database_helper.dart';
import 'package:news_app/ui/bottom_nav.dart';
import 'package:news_app/ui/register_screen.dart';
import 'package:news_app/widgets/custom_form_field.dart';
import 'package:news_app/widgets/custom_password.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_action_button/sliding_action_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final DatabaseHelper _dbHelper = DatabaseHelper();

  bool _isProcessing = false; // Add this as a class variable

  void loginUser() async {
    if (_isProcessing) return;
    _isProcessing = true;

    try {
      // Clear any existing snackbars first
      ScaffoldMessenger.of(context).clearSnackBars();

      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Enter Email and Password First',
              style: TextStyle(
                color: Colors.orangeAccent,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        );
        return; // Add this to exit early
      }

      try {
        final user = await _dbHelper.signIn(email, password);
        if (user != null) {
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          await sharedPreferences.setString('email', email);

          // Show success message only once
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'You are Logged In..!!',
                style: TextStyle(
                  color: Colors.orangeAccent,
                  fontWeight: FontWeight.w700,
                ),
              ),
              duration: Duration(seconds: 2), // Optional: Set duration
            ),
          );

          // Navigate after a small delay to let user see the message
          Future.delayed(Duration(milliseconds: 800), () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => BottomNav()),
            );
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Invalid Email or Password',
                style: TextStyle(
                  color: Colors.orangeAccent,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Error: ${e.toString()}',
              style: TextStyle(
                color: Colors.orangeAccent,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        );
      }
    } finally {
      _isProcessing = false;
    }
  }

  // void loginUser() async {
  //   final email = emailController.text;
  //   final password = passwordController.text;

  //   if (email.isEmpty || password.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(
  //           'Enter Email and Password First',
  //           style: TextStyle(
  //             color: Colors.orangeAccent,
  //             fontWeight: FontWeight.w700,
  //           ),
  //         ),
  //       ),
  //     );
  //   }

  //   try {
  //     final user = await _dbHelper.signIn(email, password);
  //     if (user != null) {
  //       SharedPreferences sharedPreferences =
  //           await SharedPreferences.getInstance();

  //       sharedPreferences.setString('email', email);

  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(
  //             'You are Logged In..!!',
  //             style: TextStyle(
  //               color: Colors.orangeAccent,
  //               fontWeight: FontWeight.w700,
  //             ),
  //           ),
  //         ),
  //       );
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => BottomNav()),
  //       );
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(
  //             'Invalid Email or Password',
  //             style: TextStyle(
  //               color: Colors.orangeAccent,
  //               fontWeight: FontWeight.w700,
  //             ),
  //           ),
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(
  //           '$e',
  //           style: TextStyle(
  //             color: Colors.orangeAccent,
  //             fontWeight: FontWeight.w700,
  //           ),
  //         ),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade800, Colors.white, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  child: Image.asset(
                    "assets/images/login.png",
                    height: 250,
                    width: 250,
                    fit: BoxFit.cover,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _globalKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: emailController,
                          hintText: "Enter Your Email",
                          icon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                          labelText: "Email",
                          onChanged: (value) {
                            setState(() {
                              emailController.text = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter the Email first...";
                            }
                            if (!emailRegex.hasMatch(value)) {
                              return "Enter valid Email";
                            }
                            return null;
                          },
                        ),

                        CustomPassword(
                          controller: passwordController,
                          hintText: "Enter Your Password",
                          icon: Icons.lock_outline,
                          keyboardType: TextInputType.text,
                          labelText: "Password",
                          onChanged: (value) {
                            setState(() {
                              passwordController.text = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter the Password first...";
                            }
                            if (!passwordRegExp.hasMatch(value)) {
                              return "Enter valid Password";
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 20),

                        SquareSlideToActionButton(
                          width: 250,
                          parentBoxRadiusValue: 15,
                          initialSlidingActionLabel: 'Log In',
                          initialSlidingActionLabelTextStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          finalSlidingActionLabel: 'Login In Sucssess',
                          finalSlidingActionLabelTextStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          squareSlidingButtonSize: 50,
                          squareSlidingButtonIcon: const Icon(
                            Icons.arrow_circle_right_outlined,
                            color: Colors.orange,
                            size: 35,
                          ),
                          squareSlidingButtonBackgroundColor: Colors.white,
                          parentBoxGradientBackgroundColor: LinearGradient(
                            colors: [
                              Colors.orange.shade700,
                              Colors.orange.shade400,
                            ],
                          ),
                          parentBoxDisableGradientBackgroundColor:
                              LinearGradient(colors: [Colors.grey]),
                          leftEdgeSpacing: 2,
                          rightEdgeSpacing: 4,
                          onSlideActionCompleted: () {
                            if (!_isProcessing && _globalKey.currentState!.validate()) {
                              loginUser();
                            }
                          },
                          onSlideActionCanceled: () {},
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an Account?"),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                " Sign Up",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
