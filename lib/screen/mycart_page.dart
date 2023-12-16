import 'package:dcrown_mart/const.dart';
import 'package:dcrown_mart/screen/myorder_page.dart';
import 'package:dcrown_mart/screen/placedorder_page.dart';
import 'package:flutter/material.dart';
import 'home page/home_page.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({Key? key}) : super(key: key);

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  int itemCount = 1;
  String selectedSize = '500ML';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: Text(
          "MY Cart",
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
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(2.0),
              child: Container(
                margin: EdgeInsets.all(8),
                height: 100.0,
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
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "DISHWASH LIQUID",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: colorGrey2,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete_forever),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Rs.150",
                                  style: TextStyle(
                                    color: colorPrimary,
                                  ),
                                ),
                                Container(),
                              ],
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Container(
                                    height: 25.0,
                                    width: 90.0,
                                    decoration: BoxDecoration(
                                      color: colorWhite,
                                      borderRadius: BorderRadius.circular(20.0),
                                      border: Border.all(
                                        color: colorPrimary,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: DropdownButton<String>(
                                        value: selectedSize,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedSize = newValue!;
                                          });
                                        },
                                        items: <String>[
                                          '500ML',
                                          '1000ML',
                                          '2000ML'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                  fontSize: 13.0,
                                                  color: colorGrey2),
                                            ),
                                          );
                                        }).toList(),
                                        style: TextStyle(
                                            fontSize: 13.0, color: colorGrey2),
                                        icon: Icon(Icons.arrow_drop_down),
                                        underline: SizedBox.shrink(),
                                        isExpanded: true,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        itemCount =
                                            (itemCount > 0) ? itemCount - 1 : 0;
                                      });
                                    },
                                    child: Container(
                                      height: 25.0,
                                      width: 70.0,
                                      decoration: BoxDecoration(
                                        color: colorWhite,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        border: Border.all(
                                          color: colorPrimary,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.remove,
                                              color: colorBlack, size: 16),
                                          Text(
                                            itemCount.toString(),
                                            style: TextStyle(
                                              fontSize: 13.0,
                                              color: colorBlack,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                itemCount++;
                                              });
                                            },
                                            child: Icon(Icons.add,
                                                color: colorBlack, size: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //SizedBox(width: 50.0),
                    /*Column(
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
                              color: colorWhite,
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: colorPrimary,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.remove,
                                    color: colorBlack, size: 16),
                                Text(
                                  itemCount.toString(),
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    color: colorBlack,
                                  ),
                                ),
                                Icon(Icons.add,
                                    color: colorBlack, size: 16),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),*/
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: colorPrimary,
            height: 60.0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: Text(
                      "1 Item | Rs150",
                      style: TextStyle(
                        color: colorBlack,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  //SizedBox(width: 100.0),
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlacedOrderPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorWhite,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Order",
                            style: TextStyle(
                              color: colorAccent,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(width: 15.0),
                          Icon(Icons.arrow_forward_ios,
                              color: colorBlack, size: 15, weight: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
