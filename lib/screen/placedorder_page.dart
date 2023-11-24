import 'package:dcrown_mart/const.dart';
import 'package:flutter/material.dart';

class PlacedOrderPage extends StatefulWidget {
  const PlacedOrderPage({super.key});

  @override
  State<PlacedOrderPage> createState() => _PlacedOrderPageState();
}

class _PlacedOrderPageState extends State<PlacedOrderPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: Row(
          children: [
           /* IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),*/
            /*CircleAvatar(
              backgroundImage: AssetImage("assets/crown_img.jpg"),
            ),*/
            SizedBox(width: 8),
            Text(
              "Placed Order",
              style: TextStyle(fontSize: 19),
            ),
          ],
        ),
        centerTitle: false,
        actions: <Widget>[
          /*IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),*/
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
                      color: colorBlack,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '0',
                      style: TextStyle(
                        color: colorWhite,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50.0),
            Center(
              child: Image(
                height: 100.0,
                width: 110.0,
                alignment: Alignment.center,
                image:
                AssetImage('assets/order_image.png',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 10.0, right: 10.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_circle_left, color: colorPrimary),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: Container(

                      color: colorWhite,
                      child: Center(
                        child: Text(
                          'Calendar View',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_circle_right, color: colorPrimary),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: screenWidth,
                height: 100.0,
                decoration: BoxDecoration(
                    color: colorWhite,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                          color: colorGrey,
                          blurRadius: 5.0,
                          offset: Offset(0, 2))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Delivery by',
                          style: TextStyle(
                            color: colorGrey1,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.radio_button_checked,
                              color: colorPrimary,
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            '6:00AM-9:00PM',
                            style: TextStyle(color: colorBlack, fontSize: 15.0),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: screenWidth,
                  height: 100.0,
                  decoration: BoxDecoration(
                      color: colorWhite,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                            color: colorGrey,
                            blurRadius: 5.0,
                            offset: Offset(0, 2))
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Payment Method',
                            style: TextStyle(
                              color: colorGrey1,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Image(
                              height: 50.0,
                              width: 45.0,
                              alignment: Alignment.center,
                              image:
                              AssetImage('assets/bank_logo.png',
                              ),
                            ),
                            Text(
                              'Direct Bank Tranfer',
                              style:
                                  TextStyle(color: colorBlack, fontSize: 15.0),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
