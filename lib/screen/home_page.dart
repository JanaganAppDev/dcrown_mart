import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dcrown_mart/screen/addresslist_page.dart';
import 'package:dcrown_mart/screen/category_page.dart';
import 'package:dcrown_mart/screen/feedback_page.dart';
import 'package:dcrown_mart/screen/myaddress_page.dart';
import 'package:dcrown_mart/screen/mycart_page.dart';
import 'package:dcrown_mart/screen/myorder_page.dart';
import 'package:dcrown_mart/screen/placedorder_page.dart';
import 'package:dcrown_mart/screen/product_page.dart';
import 'package:dcrown_mart/screen/upgrade_page.dart';
import 'package:dcrown_mart/screen/viewall_page.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:dcrown_mart/const.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<bool> addedToCart = [false, false, false];
List<bool> addedToCart2 = [false, false, false, false, false];
List<bool> addedToCart3 = [false, false, false, false, false];

class _HomePageState extends State<HomePage> {
  @override
  /*ScrollController _scrollController = ScrollController();
  double scrollOffset = 0.0;
  Timer? timer;*/

  /*@override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (scrollOffset < _scrollController.position.maxScrollExtent) {
        scrollOffset += 500.0;
        _scrollController.animateTo(scrollOffset,
            duration: Duration(seconds: 1), curve: Curves.ease);
      } else {
        scrollOffset = 0.0;
        _scrollController.animateTo(scrollOffset,
            duration: Duration(seconds: 1), curve: Curves.ease);
      }
    });
  }*/

  /*@override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }*/

  List<String> images = [
    "assets/fruits2.jpg",
    "assets/fruits3.jpg",
    "assets/fruits1.jpg",
  ];
  int _currentIndex = 0;
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
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
            onPressed: () {
              /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlacedOrderPage()),
              );*/
            },
          ),
          Align(
            alignment: Alignment.center,
            child: Stack(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyCartPage()),
                    );
                  },
                ),
                Positioned(
                  bottom: 6,
                  right: 2,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '0',
                      style: TextStyle(
                        color: Colors.white,
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
      drawer: Drawer(
        backgroundColor: colorWhite,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: colorPrimary,
              ),
              accountName: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("assets/profile.png"),
                    ),
                    //SizedBox(width: 10.0),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 70),
                          child: Row(
                            children: [
                              Text(
                                "Yogesh krishna",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: colorBlack,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Row(
                            children: [
                              Text("Free Member"),
                              SizedBox(width: 5.0),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UpgradePage(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: toolbar, // Background color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                child: Container(
                                  width: 70.0,
                                  height: 20,
                                  child: Center(
                                    child: Text(
                                      "Upgrade",
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        color: colorWhite,
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
                    /*Container(
                        width: 80.0,
                        height: 20.0,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: toolbar,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text(
                            "Upgrade",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: colorWhite,
                            ),
                          ),
                        ),
                      ),*/
                  ],
                ),
              ),
              accountEmail: Text(""),
            ),
            ListTile(
              title: Text(
                "Home",
                style: TextStyle(
                  fontSize: 14.0,
                  color: colorBlack,
                  fontWeight: FontWeight.w600,
                ),
              ),
              leading: Icon(Icons.home, color: colorBlack),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            ListTile(
              title: Text(
                "My Orders",
                style: TextStyle(
                  fontSize: 14.0,
                  color: colorBlack,
                  fontWeight: FontWeight.w600,
                ),
              ),
              leading: Icon(Icons.shopping_cart, color: colorBlack),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyOrderPage()));
              },
            ),
            ListTile(
              title: Text(
                "My Address",
                style: TextStyle(
                  fontSize: 14.0,
                  color: colorBlack,
                  fontWeight: FontWeight.w600,
                ),
              ),
              leading: Icon(Icons.location_on, color: colorBlack),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddresslistPage()),
                );
              },
            ),
            ListTile(
              title: Text(
                "Feedback",
                style: TextStyle(
                  fontSize: 14.0,
                  color: colorBlack,
                  fontWeight: FontWeight.w600,
                ),
              ),
              leading: Icon(Icons.lightbulb, color: colorBlack),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FeedBackPage()));
              },
            ),
            ListTile(
              title: Text(
                "Contact Us",
                style: TextStyle(
                  fontSize: 14.0,
                  color: colorBlack,
                  fontWeight: FontWeight.w600,
                ),
              ),
              leading: Icon(Icons.chat_outlined, color: colorBlack),
              onTap: () {
                /*Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyCartPage()));*/
              },
            ),
            ListTile(
              title: Text(
                "Share",
                style: TextStyle(
                  fontSize: 14.0,
                  color: colorBlack,
                  fontWeight: FontWeight.w600,
                ),
              ),
              leading: Icon(Icons.share, color: colorBlack),
              onTap: () {
                /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyAddressPage()),
                );*/
              },
            ),
            ListTile(
              title: Text(
                "Logout",
                style: TextStyle(
                  fontSize: 14.0,
                  color: colorBlack,
                  fontWeight: FontWeight.w600,
                ),
              ),
              leading: Icon(Icons.logout, color: colorBlack),
              onTap: () {
                /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddresslistPage()),
                );*/
              },
            ),
            ListTile(
              title: Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductPage()),
                    );*/
                  },
                  child: Text(
                    "About",
                    style: TextStyle(
                      color: colorGrey2,
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
                      color: colorGrey2,
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
                      color: colorGrey2,
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
            Container(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CarouselSlider(
                    items: images.map((image) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: colorGrey1,
                            ),
                            child: Image.asset(
                              image,
                              width: screenWidth,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: images.map((image) {
                      int index = images.indexOf(image);
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: _currentIndex == index ? 12.0 : 8.0,
                        height: 6.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? colorPrimary
                              : colorGrey1,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Container(
              color: colorWhite,
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
                          height: 60,
                          margin: EdgeInsets.all(8),
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
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(height: 12.0),
                                Icon(
                                  Icons.phone_android,
                                  size: 30,
                                  color: colorGrey2,
                                ),
                                SizedBox(height: 5.0),
                                Text("Prepaid"),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              "assets/superdeals.png",
              width: double.infinity,
              //height: 200,
              fit: BoxFit.cover,
            ),
            Container(
              color: colorPrimary,
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: colorBlack,
                                    blurRadius: 8.0,
                                    spreadRadius: -5.4,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                radius: 30.0,
                                backgroundImage:
                                    AssetImage('assets/grocery icon.png'),
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'grocery',
                              style: TextStyle(color: colorWhite),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Crown Super Deals",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              height: 185.0,
              child: GridView.builder(
                itemCount: 2,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: colorWhite,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: colorGrey,
                              blurRadius: 5.0,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        // height: 185.0,
                        // width: 140.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Center(
                              child: Image(
                                height: 100.0,
                                width: 110.0,
                                alignment: Alignment.center,
                                image:
                                AssetImage('assets/dishwash.jpeg',
                                ),
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "DISHWASH LIQUID",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: notificationTitle,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:  EdgeInsets.all(8.0),
                                  child: Text(
                                    "Rs 150",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: colorPrimaryDark,
                                    ),
                                  ),
                                ),
                                Text(
                                  "Rs 200",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                Container(
                                    width: 40,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            addedToCart[index] = !addedToCart[index];
                                          });
                                          if (addedToCart[index]) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => MyCartPage()),
                                            );
                                          }
                                        },
                                        child: Center(
                                        child: Icon(
                                          addedToCart[index]
                                              ? Icons.remove_circle
                                              : Icons.add_circle,
                                          color: colorWhite,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10.0),
                                          ),
                                        ),
                                        textStyle: TextStyle(
                                          fontSize: 18,
                                        ),
                                        padding: EdgeInsets.all(11.0),
                                        backgroundColor: addedToCart[index]
                                            ? colorRed
                                            : colorPrimary,
                                      )
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            height: 20,
                            width: 35,
                            child: Container(
                              decoration: BoxDecoration(
                                color: toolbar,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  "25%",
                                  style: TextStyle(
                                    color: colorWhite,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular products",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewallPage()));
                      },
                      child: Row(
                        children: [
                          Text(
                            "view all",
                            style: TextStyle(
                              color: colorGrey1,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios,
                              color: colorGrey1, size: 12.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: Container(
                height: 190.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemExtent: 205.0,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 160.0,
                              decoration: BoxDecoration(
                                color: colorWhite,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: colorGrey,
                                    blurRadius: 5.0,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              // height: 185.0,
                              // width: 140.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Center(
                                    child: Image(
                                      height: 120.0,
                                      width: 110.0,
                                      alignment: Alignment.center,
                                      image:
                                      AssetImage('assets/dishwash.jpeg',
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4.0),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      "DISHWASH LIQUID",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: notificationTitle,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.all(8.0),
                                        child: Text(
                                          "Rs 150",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                            color: colorPrimaryDark,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Rs 200",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                      Container(
                                          width: 40,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                addedToCart2[index] = !addedToCart2[index];
                                              });
                                              if (addedToCart2[index]) {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => MyCartPage()),
                                                );
                                              }
                                            },
                                            child: Center(
                                              child: Icon(
                                                addedToCart2[index]
                                                    ? Icons.remove_circle
                                                    : Icons.add_circle,
                                                color: colorWhite,
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(10.0),
                                                  bottomRight:
                                                      Radius.circular(10.0),
                                                ),
                                              ),
                                              textStyle: TextStyle(
                                                fontSize: 18,
                                              ),
                                              padding: EdgeInsets.all(10.0),
                                              backgroundColor:
                                                  addedToCart2[index]
                                                      ? colorRed
                                                      : colorPrimary,
                                            ),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 0,
                              bottom: 0,
                              right: 0,
                              left: 0,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: SizedBox(
                                  height: 20,
                                  width: 35,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: toolbar,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "25%",
                                        style: TextStyle(
                                          color: colorWhite,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text(
                      "New products",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewallPage()));
                    },
                    child: Row(
                      children: [
                        Text(
                          "view all",
                          style: TextStyle(
                            color: colorGrey1,
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios,
                            color: colorGrey1, size: 12.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: Container(
                height: 190.0,
                //width: screenWidth,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemExtent: 205.0,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 160.0,
                              decoration: BoxDecoration(
                                color: colorWhite,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: colorGrey,
                                    blurRadius: 5.0,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              // height: 185.0,
                              // width: 140.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Center(
                                    child: Image(
                                      height: 120.0,
                                      width: 110.0,
                                      alignment: Alignment.center,
                                      image:
                                      AssetImage('assets/dishwash.jpeg',
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 3.0),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      "DISHWASH LIQUID",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: notificationTitle,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 3.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.all(8.0),
                                        child: Text(
                                          "Rs 150",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                            color: colorPrimaryDark,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Rs 200",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                      Container(
                                          width: 40,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                addedToCart3[index] = !addedToCart3[index];
                                              });
                                              if (addedToCart3[index]) {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => MyCartPage()),
                                                );
                                              }
                                            },
                                            child: Center(
                                              child: Icon(
                                                addedToCart3[index]
                                                    ? Icons.remove_circle
                                                    : Icons.add_circle,
                                                color: colorWhite,
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(10.0),
                                                  bottomRight:
                                                      Radius.circular(10.0),
                                                ),
                                              ),
                                              textStyle: TextStyle(
                                                fontSize: 18,
                                              ),
                                              padding: EdgeInsets.all(10.0),
                                              backgroundColor:
                                                  addedToCart3[index]
                                                      ? colorRed
                                                      : colorPrimary,
                                            ),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 0,
                              bottom: 0,
                              right: 0,
                              left: 0,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: SizedBox(
                                  height: 20,
                                  width: 35,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: toolbar,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "25%",
                                        style: TextStyle(
                                          color: colorWhite,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
