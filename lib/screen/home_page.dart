import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}
class _HomepageState extends State<Homepage> {
  /*TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();

  void login(String email,password) async{
    try{
      Response response = await post(
        Uri.parse('http://localhost:5000/api/users/login'),
          body:{
          'email':'aravind@gmail.com',
            'password':'12234565'
          }
      );
      if(response.statusCode==200){
        var data = jsonDecode(response.body.toString());

      }
      else{
        print('failed');
      }

    }catch(e){
      print(e.toString());

    }
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('dcrownmart')
      ),
    );
  }
}
