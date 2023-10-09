import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  void signup(String name, email, mobile, password, confirmpassword) async {
    try {
      Response response = await post(
          Uri.parse('http://localhost:5000/api/users/register'),
          body: {
            'name': 'kathir',
            'email': 'kathiresh@gmail.com',
            'mobile': '9988776655',
            'password': '12345678',
            'confirmpassword': '12345678'
          });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
