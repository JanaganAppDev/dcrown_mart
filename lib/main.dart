import 'package:dcrown_mart/screen/login%20page/ForgotPassword_page.dart';
import 'package:dcrown_mart/screen/login%20page/NewPassword.dart';
import 'package:dcrown_mart/screen/addresslist_page.dart';
import 'package:dcrown_mart/screen/category_page.dart';
import 'package:dcrown_mart/screen/feedback_page.dart';
import 'package:dcrown_mart/screen/home%20page/home_page.dart';
import 'package:dcrown_mart/screen/myaddress_page.dart';
import 'package:dcrown_mart/screen/mycart_page.dart';
import 'package:dcrown_mart/screen/myorder_page.dart';
import 'package:dcrown_mart/screen/orderSummary_page.dart';
import 'package:dcrown_mart/screen/orderlist_page.dart';
import 'package:dcrown_mart/screen/login%20page/otp_page.dart';
import 'package:dcrown_mart/screen/payment_page.dart';
import 'package:dcrown_mart/screen/placedorder_page.dart';
import 'package:dcrown_mart/screen/product_page.dart';
import 'package:dcrown_mart/screen/profile_page.dart';
import 'package:dcrown_mart/screen/referral_page.dart';
import 'package:dcrown_mart/screen/upgrade_page.dart';
import 'package:flutter/material.dart';
import 'package:dcrown_mart/screen/login%20page/login_page.dart';
import 'package:dcrown_mart/screen/signup%20page/signup_page.dart';
import 'package:dcrown_mart/screen/login%20page/otp_page.dart';
import 'package:http/http.dart';
import 'package:dcrown_mart/screen/viewall_page.dart';
import 'package:dcrown_mart/screen/search_page.dart';
import 'const.dart';
import 'package:permission_handler/permission_handler.dart';

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
