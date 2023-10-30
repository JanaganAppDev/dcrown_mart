import 'dart:convert';
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
          /*leading: IconButton(
          icon: Icon(Icons.menu), // Drawer button
          onPressed: () {},
        ),*/
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
                onTap: () {},
              ),
              ListTile(
                title: Text("My Address"),
                leading: Icon(Icons.location_on),
                onTap: () {},
              ),
              ListTile(
                title: Text("Feedback"),
                leading: Icon(Icons.lightbulb),
                onTap: () {},
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
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.white,
                child: Center(
                  child: Image.asset("assets/fruits.png",
                      width: 400.0, height: 200.0),
                ),
              ),
              Container(
                color: Colors.white,
                height: 100, // Set the height of the container to 100
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis
                            .horizontal, // Make the list scroll horizontally
                        itemCount: 10, // Adjust the number of boxes as needed
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
                                  spreadRadius: -2.1,
                                  offset: Offset(-3, 3),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Icon(
                                Icons.phone_android, // Add the mobile icon
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
            ],
          ),
        ));
  }
}
