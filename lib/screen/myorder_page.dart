import 'package:dcrown_mart/screen/home_page.dart';
import 'package:dcrown_mart/screen/orderlist_page.dart';
import 'package:flutter/material.dart';
import 'package:dcrown_mart/const.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({super.key});

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: Text(
          "My Orders",
          style: TextStyle(
            fontSize: 16.0,
            color: colorWhite,
          ),
        ),
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
      body: Container(
        //padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, index) {
            return Container(
              padding: EdgeInsets.all(10.0),
              height: 75.0,
              width: screenWidth,
              decoration: BoxDecoration(
                color: colorWhite,
                boxShadow: [
                  BoxShadow(
                    color: colorGrey,
                    blurRadius: 8,
                    spreadRadius: -2.1,
                    offset: Offset(-1, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order ID:8",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: colorBlack,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Pending",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: colorPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rs190",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: colorPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Container(
                              height: 22.0,
                              width: 80.0,
                              decoration: BoxDecoration(
                                color: colorWhite,
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                  color: colorPrimary,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    color: colorGrey2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrderListPage()));
                          },
                          child: Container(
                            height: 22.0,
                            width: 80.0,
                            decoration: BoxDecoration(
                              color: colorWhite,
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: colorPrimary,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Info",
                                style: TextStyle(
                                  fontSize: 13.0,
                                  color: colorGrey2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //padding: EdgeInsets.all(10),
            );
          },
        ),
      ),
    );
  }
}
