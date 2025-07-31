// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:news_app/ui/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void logout(BuildContext context) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  sharedPreferences.remove('email');
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'You are Logged Out..!!',
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
