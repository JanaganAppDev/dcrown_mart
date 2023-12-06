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
      body: Container(
        margin: EdgeInsets.all(10),
        //padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, index) {
            return Container(
              padding: EdgeInsets.all(10.0),
              height: 170.0,
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
                      Column(
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
    );
  }
}
