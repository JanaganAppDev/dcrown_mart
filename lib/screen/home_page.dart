import 'dart:convert';
import 'package:dcrown_mart/screen/feedback_page.dart';
import 'package:dcrown_mart/screen/mycart_page.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

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
          backgroundColor: Colors.yellow[600],
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
          backgroundColor: Colors.white,
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Yogesh krishna"),
                accountEmail: Text("Free Member"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/profile.png"),
                ),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                ),
              ),
              ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
              ListTile(
                title: Text("My Orders"),
                leading: Icon(Icons.shopping_cart),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyCartPage()));
                },
              ),
              ListTile(
                title: Text("My Address"),
                leading: Icon(Icons.location_on),
                onTap: () {},
              ),
              ListTile(
                title: Text("Feedback"),
                leading: Icon(Icons.lightbulb),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FeedBackPage()));
                },
              ),
              ListTile(
                title: Text("Contact Us"),
                leading: Icon(Icons.chat_outlined),
                onTap: () {},
              ),
              ListTile(
                title: Text("Share"),
                leading: Icon(Icons.share),
                onTap: () {},
              ),
              ListTile(
                title: Text("Logout"),
                leading: Icon(Icons.logout),
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
                        color: Colors.grey[700],
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
                        color: Colors.grey[700],
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
                        color: Colors.grey[700],
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
              Image.asset("assets/fruits.png", width: 400.0, height: 200.0),
              Container(
                color: Colors.white,
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
                            height: 80,
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 4,
                                  spreadRadius: 0,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Icon(
                                Icons.phone_android,
                                size: 30,
                                color: Colors.grey[800],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset("assets/superdeals.png", width: 400.0, height: 400.0),
            ],
          ),
        ));
  }
}
