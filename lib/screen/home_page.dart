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
              Text("Dcrown Mart"),
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
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.0),
              Container(
                child: Center(
                  child: Image.asset("assets/fruits.png",
                      width: 400.0, height: 200.0),
                ),
              ),
            ],
          ),
        ));
  }
}
