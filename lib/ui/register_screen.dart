// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:news_app/database/database_helper.dart';
import 'package:news_app/ui/login_screen.dart';
import 'package:sliding_action_button/sliding_action_button.dart';

import '../data/appdata.dart';
import '../widgets/custom_form_field.dart';
import '../widgets/custom_password.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey();
  final DatabaseHelper _dbHelper = DatabaseHelper();

  void registerUser() async {
    final username = usernameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Enter username/email/password First',
            style: TextStyle(
              color: Colors.orangeAccent,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );
    }

    try {
      bool exist = await _dbHelper.checkUserExist(email);

      if (exist) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Email Already Exist',
              style: TextStyle(
                color: Colors.orangeAccent,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        );
      } else {
        await _dbHelper.signup(username, email, password);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Account Created Successfully',
              style: TextStyle(
                color: Colors.orangeAccent,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    }
  }

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
                    "assets/images/register.png",
                    height: 250,
                    width: 250,
                    fit: BoxFit.cover,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(20),
                  child: Form(
                    key: _globalKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: usernameController,
                          hintText: "Enter Your Username",
                          icon: Icons.account_circle_outlined,
                          keyboardType: TextInputType.text,
                          labelText: "Username",
                          onChanged: (value) {
                            setState(() {
                              usernameController.text = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter the Username first...";
                            }
                            return null;
                          },
                        ),

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

                        CustomPassword(
                          controller: confirmPasswordController,
                          hintText: "Re-enter Your Password",
                          icon: Icons.lock_reset_outlined,
                          keyboardType: TextInputType.text,
                          labelText: "Confirm Password",
                          onChanged: (value) {
                            setState(() {
                              confirmPasswordController.text = value;
                            });
                          },
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value != passwordController.text) {
                              return "Enter the correct Password";
                            }
                            if (!passwordRegExp.hasMatch(value)) {
                              return "Enter valid Password";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),

                        SquareSlideToActionButton(
                          width: 250,
                          parentBoxRadiusValue: 15,
                          initialSlidingActionLabel: 'Sign Up',
                          initialSlidingActionLabelTextStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          finalSlidingActionLabel: 'Sign Up Sucssess',
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
                            if (_globalKey.currentState!.validate()) {
                              registerUser();
                            }
                          },
                          onSlideActionCanceled: () {},
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an Account?'),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                ' LogIn',
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
