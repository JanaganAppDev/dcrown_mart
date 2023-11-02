import 'dart:convert';
import 'package:dcrown_mart/screen/category_page.dart';
import 'package:dcrown_mart/screen/feedback_page.dart';
import 'package:dcrown_mart/screen/mycart_page.dart';
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
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: colorWhite,
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Yogesh krishna"),
                accountEmail: Text("Free Member"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/profile.png"),
                ),
                decoration: BoxDecoration(
                  color: colorPrimary,
                ),
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
                onTap: () {},
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
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/fruits.png",
                // width: 400.0, height: 200.0
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
                //width: 400.0, height: 400.0
              ),
            ],
          ),
        ));
  }
}
