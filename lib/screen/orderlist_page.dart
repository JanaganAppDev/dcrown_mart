import 'package:dcrown_mart/screen/myorder_page.dart';
import 'package:flutter/material.dart';
import 'package:dcrown_mart/const.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key});

  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  /*List<Step> stepList() => [
        Step(
            title: Text('Pending'),
            content: Center(
              child: Text('Will be shipped shortly'),
            )),
        Step(
            title: Text('Ready to ship'),
            content: Center(
              child: Text('Will be shipped at 10.00 PM'),
            )),
        Step(
            title: Text('Delivered'),
            content: Center(
              child: Text('Delivered at chennai - 10.00PM'),
            ))
      ];*/
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: Text(
          "OrderList",
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
              MaterialPageRoute(builder: (context) => MyOrderPage()),
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, index) {
          return Container(
            margin: EdgeInsets.all(10.0),
            //padding: EdgeInsets.all(10.0),
            //height: 300.0,
            //width: screenWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              ),
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
            child: Flexible(
              flex: 1,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 110.0,
                      height: 35.0,
                      decoration: BoxDecoration(
                        color: colorBlack, // Set background color to black
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Pending",
                          style: TextStyle(
                            fontSize: 15.0,
                            color:
                                colorWhite, // Set text color to white or your desired color
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.brightness_1,
                                      color: colorPrimary, size: 10),
                                  SizedBox(width: 5),
                                  Text(
                                    "Order ID:",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: colorGrey1,
                                      //fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "8",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: colorBlack,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.brightness_1,
                                      color: colorPrimary, size: 10),
                                  SizedBox(width: 5),
                                  Text(
                                    "Subtotal:",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: colorGrey1,
                                      //fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "Rs 150",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: colorBlack,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.brightness_1,
                                      color: colorPrimary, size: 10),
                                  SizedBox(width: 5),
                                  Text(
                                    "Date:",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: colorGrey1,
                                      //fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "2023-11-04",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: colorBlack,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.brightness_1,
                                      color: colorPrimary, size: 10),
                                  SizedBox(width: 5),
                                  Text(
                                    "Delivery:",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: colorGrey1,
                                      //fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "Rs 40",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: colorBlack,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.brightness_1,
                                      color: colorPrimary, size: 10),
                                  SizedBox(width: 5),
                                  Text(
                                    "QTY:",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: colorGrey1,
                                      //fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "1",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: colorBlack,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.brightness_1,
                                      color: colorPrimary, size: 10),
                                  SizedBox(width: 5),
                                  Text(
                                    "Tax(0.0%):",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: colorGrey1,
                                      //fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "Rs0",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: colorBlack,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.brightness_1,
                                      color: colorPrimary, size: 10),
                                  SizedBox(width: 5),
                                  Text(
                                    "TimeSlot:",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: colorGrey1,
                                      //fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "6.00AM-\n9.30PM",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: colorBlack,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.brightness_1,
                                      color: colorPrimary, size: 10),
                                  SizedBox(width: 5),
                                  Text(
                                    "Total:",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: colorGrey1,
                                      //fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "Rs190",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: colorBlack,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Row(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.brightness_1,
                                      color: colorPrimary, size: 10),
                                  SizedBox(width: 5),
                                  Text(
                                    "Address:",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: colorGrey1,
                                      //fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "01,sample address,chennai-600026",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: colorBlack,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 25.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        color: Colors.black, // Set background color to black
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                        ),
                        // Remove the border property to remove the border
                      ),
                      child: Center(
                        child: Text(
                          "Direct Bank Transfer",
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Colors
                                .white, // Set text color to white or your desired color
                          ),
                        ),
                      ),
                    ),
                  ),
                  Stepper(
                    //type: StepperType.horizontal, // Stepper orientation is horizontal
                    currentStep:
                        _index, // The current step is determined by the _index variable
                    onStepTapped: (int index) {
                      // Callback when a step is tapped
                      setState(() {
                        _index = index; // Update the current step index
                      });
                    },
                    steps: [
                      Step(
                        title: Text('Pending'), // Title of the first step
                        content: Container(
                          height: 20, // Specify the height of the content area
                          child: Column(
                            children: [
                              Flexible(
                                child: Center(
                                  child: Text(
                                      'Will be shipped shortly'), // Content of the first step
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Step(
                        title:
                            Text('Ready to ship'), // Title of the second step
                        content: Container(
                          height: 20, // Specify the height of the content area
                          child: Column(
                            children: [
                              Flexible(
                                child: Center(
                                  child: Text(
                                      'Will be shipped at 10.00 PM'), // Content of the second step
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Step(
                        title: Text('Delivered'), // Title of the third step
                        content: Container(
                          height: 20, // Specify the height of the content area
                          child: Column(
                            children: [
                              Flexible(
                                child: Center(
                                  child: Text(
                                      'Delivered at chennai - 10.00 PM'), // Content of the third step
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                    controlsBuilder:
                        (BuildContext context, ControlsDetails details) {
                      return Container(); // Custom controls builder, returning an empty container in this case
                    },
                  ),
                  /*Stepper(
                    type: StepperType.horizontal,
                    currentStep: _index,
                    onStepTapped: (int index) {
                      setState(() {
                        _index = index;
                      });
                    },
                    steps: [
                      Step(
                        title: Text('Pending'),
                        content: Center(
                          child: Text('Will be shipped shortly'),
                        ),
                      ),
                      Step(
                        title: Text('Ready to ship'),
                        content: Center(
                          child: Text('Will be shipped at 10.00 PM'),
                        ),
                      ),
                      Step(
                        title: Text('Delivered'),
                        content: Center(
                          child: Text('Delivered at chennai - 10.00PM'),
                        ),
                      ),
                    ],
                    controlsBuilder:
                        (BuildContext context, ControlsDetails details) {
                      return Container();
                    },
                  ),*/
                  Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(10.0),
                    height: 70.0,
                    //width: screenWidth,
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
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 55,
                          width: 55,
                          child: Image.asset("assets/dishwash.jpeg",
                              width: 50.0, height: 50.0),
                        ),
                        SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "DISHWASH LIQUID",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: colorBlack,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "QTY:1",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: colorGrey2,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4.0),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "500ML",
                                    style: TextStyle(
                                      color: colorBlack,
                                    ),
                                  ),
                                  Text(
                                    "Rs.150.0",
                                    style: TextStyle(
                                      color: colorPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //padding: EdgeInsets.all(10),
          );
        },
      ),
    );
  }
}
