import 'package:dcrown_mart/screen/addresslist_page.dart';
import 'package:dcrown_mart/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:dcrown_mart/const.dart';

class OrderSummaryPage extends StatefulWidget {
  const OrderSummaryPage({super.key});

  @override
  State<OrderSummaryPage> createState() => _OrderSummaryPageState();
}

class _OrderSummaryPageState extends State<OrderSummaryPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: Text(
          "Order Summary",
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 400.0,
            margin: EdgeInsets.all(10),
            //padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  padding: EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 10.0, bottom: 50.0),
                  height: 190.0,
                  width: screenWidth,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 55,
                            width: 55,
                            child: Image.asset("assets/dishwash1.jpg",
                                width: 50.0, height: 50.0),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 40.0),
                            child: Column(
                              children: [
                                Text(
                                  "DISHWASH LIQUID",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: colorBlack,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "2 items × Rs150",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: colorGrey2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "Rs300",
                                style: TextStyle(
                                  color: colorPrimary,
                                ),
                              ),
                              Text(
                                "(with 0% tax include)",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: colorGrey2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: colorGrey2,
                            ),
                          ),
                          Text(
                            "Rs300",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: colorGrey2,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delivery",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: colorGrey2,
                            ),
                          ),
                          Text(
                            "Rs0",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: colorGrey2,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: colorPrimary,
                            ),
                          ),
                          Text(
                            "Rs300",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: colorPrimary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.location_on),
                    Padding(
                      padding: EdgeInsets.only(right: 70.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 58.0),
                            child: Text(
                              "My Current Address",
                              style: TextStyle(
                                fontSize: 14.0,
                                color: colorGrey2,
                              ),
                            ),
                          ),
                          Text(
                            "N0.01,tambaram west,chennai ....",
                            style: TextStyle(
                                fontSize: 12.0,
                                color: colorBlack,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddresslistPage()));
                      },
                      child: Text(
                        "Change",
                        style: TextStyle(
                          color: colorPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Container(
                    width: screenWidth,
                    height: 45.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      child: Text(
                        "Place Order - Rs300",
                        style: TextStyle(
                          fontSize: 20.0,
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
    );
  }
}
