import 'package:flutter/material.dart';

import 'home_page.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({Key? key}) : super(key: key);

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[600],
        title: Text("My Cart"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(8),
              height: 100.0,
              width: screenWidth,
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
              child: Row(
                children: [
                  Image.asset("assets/dishwash.jpeg",
                      width: 50.0, height: 50.0),
                  SizedBox(width: 10.0),
                  Column(
                    children: [
                      SizedBox(height: 10.0),
                      Text(
                        "DISHWASH LIQUID",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Rs.150",
                        style: TextStyle(
                          color: Colors.yellow[500],
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        height: 25.0,
                        width: 70.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                            color: Colors.yellow,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "500ML",
                            style: TextStyle(
                              fontSize: 13.0,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 50.0),
                  Column(
                    children: [
                      SizedBox(height: 10.0),
                      IconButton(
                        icon: Icon(Icons.delete_forever),
                        onPressed: () {},
                      ),
                      SizedBox(height: 10.0),
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (itemCount > 0) {
                              itemCount--;
                            }
                          });
                        },
                        child: Container(
                          height: 25.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: Colors.yellow,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.remove, color: Colors.yellow),
                              Text(
                                itemCount.toString(),
                                style: TextStyle(
                                  fontSize: 13.0,
                                  color: Colors.grey[700],
                                ),
                              ),
                              Icon(Icons.add, color: Colors.yellow),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
