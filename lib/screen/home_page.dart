import 'dart:convert';
import 'package:dcrown_mart/screen/category_page.dart';
import 'package:dcrown_mart/screen/feedback_page.dart';
import 'package:dcrown_mart/screen/mycart_page.dart';
import 'package:dcrown_mart/screen/myorder_page.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:dcrown_mart/const.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorPrimary,
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/crown_img.jpg"),
              ),
              SizedBox(width: 8),
              Text(
                "Dcrown Mart",
                style: TextStyle(fontSize: 19),
              ),
            ],
          ),
          centerTitle: false,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {},
                  ),
                  Positioned(
                    bottom: 6,
                    right: 2,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        '0',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: colorWhite,
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: colorPrimary,
                ),
                accountName: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("assets/profile.png"),
                      ),
                      //SizedBox(width: 10.0),
                      Column(
                        children: [
                          //SizedBox(height: 20.0),
                          Padding(
                            padding: const EdgeInsets.only(right: 70),
                            child: Row(
                              children: [
                                Text(
                                  "Yogesh krishna",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: colorBlack,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //SizedBox(height: 5.0),
                          Row(
                            children: [
                              Text("Free Member"),
                              SizedBox(width: 5.0),
                              Container(
                                width: 80.0,
                                height: 20.0,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: toolbar,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  child: Text(
                                    "Upgrade",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: colorWhite,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      /*Container(
                        width: 80.0,
                        height: 20.0,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: toolbar,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text(
                            "Upgrade",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: colorWhite,
                            ),
                          ),
                        ),
                      ),*/
                    ],
                  ),
                ),
                accountEmail: Text(""),
              ),
              ListTile(
                title: Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: colorBlack,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: Icon(Icons.home, color: colorBlack),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
              ListTile(
                title: Text(
                  "My Orders",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: colorBlack,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: Icon(Icons.shopping_cart, color: colorBlack),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyCartPage()));
                },
              ),
              ListTile(
                title: Text(
                  "My Address",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: colorBlack,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: Icon(Icons.location_on, color: colorBlack),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CategoryPage()));
                },
              ),
              ListTile(
                title: Text(
                  "Feedback",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: colorBlack,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: Icon(Icons.lightbulb, color: colorBlack),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FeedBackPage()));
                },
              ),
              ListTile(
                title: Text(
                  "Contact Us",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: colorBlack,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: Icon(Icons.chat_outlined, color: colorBlack),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyOrderPage()));
                },
              ),
              ListTile(
                title: Text(
                  "Share",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: colorBlack,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: Icon(Icons.share, color: colorBlack),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: colorBlack,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: Icon(Icons.logout, color: colorBlack),
                onTap: () {},
              ),
              ListTile(
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "About",
                      style: TextStyle(
                        color: colorGrey2,
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Privacy Policy",
                      style: TextStyle(
                        color: colorGrey2,
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Terms & Conditions",
                      style: TextStyle(
                        color: colorGrey2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/fruits.png",
                width: double.infinity,
                //height: 200,
                fit: BoxFit.cover,
              ),
              Container(
                color: colorWhite,
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 80,
                            height: 60,
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: colorWhite,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: colorGrey,
                                  blurRadius: 4,
                                  spreadRadius: 0,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  SizedBox(height: 12.0),
                                  Icon(
                                    Icons.phone_android,
                                    size: 30,
                                    color: colorGrey2,
                                  ),
                                  SizedBox(height: 5.0),
                                  Text("Prepaid"),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                "assets/superdeals.png",
                width: double.infinity,
                //height: 200,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ));
  }
}
