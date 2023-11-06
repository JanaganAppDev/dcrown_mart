import 'package:dcrown_mart/screen/NewPassword.dart';
import 'package:dcrown_mart/screen/category_page.dart';
import 'package:dcrown_mart/screen/feedback_page.dart';
import 'package:dcrown_mart/screen/home_page.dart';
import 'package:dcrown_mart/screen/mycart_page.dart';
import 'package:dcrown_mart/screen/myorder_page.dart';
import 'package:dcrown_mart/screen/orderlist_page.dart';
import 'package:dcrown_mart/screen/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:dcrown_mart/screen/login_page.dart';
import 'package:dcrown_mart/screen/signup_page.dart';
import 'package:dcrown_mart/screen/otp_page.dart';
import 'package:http/http.dart';

import 'const.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
