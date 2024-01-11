import 'dart:convert';
import 'package:carousel_slider/carousel_options.dart';
import 'package:dcrown_mart/screen/addresslist_page.dart';
import 'package:dcrown_mart/screen/category_page.dart';
import 'package:dcrown_mart/screen/feedback_page.dart';
import 'package:dcrown_mart/screen/myaddress_page.dart';
import 'package:dcrown_mart/screen/mycart_page.dart';
import 'package:dcrown_mart/screen/myorder_page.dart';
import 'package:dcrown_mart/screen/placedorder_page.dart';
import 'package:dcrown_mart/screen/product_page.dart';
import 'package:dcrown_mart/screen/referral_page.dart';
import 'package:dcrown_mart/screen/upgrade_page.dart';
import 'package:dcrown_mart/screen/viewall_page.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:dcrown_mart/const.dart';
import 'dart:async';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

String globalVariable = "";
List data = [];
List drink = [];
List fruit = [];
List masala = [];
List snacks = [];
List bakery = [];
List tea = [];
//String name = "asdfghj";

int limit1 = drink.length;
List<bool> addedToCart1 = List.generate(limit1, (index) => false);
//List<bool> addedToCart = [false, false, false];
int limit2 = drink.length;
List<bool> addedToCart2 = List.generate(limit2, (index) => false);
//List<bool> addedToCart2 = [false, false, false, false, false, false];
int limit3 = fruit.length;
List<bool> addedToCart3 = List.generate(limit3, (index) => false);
//List<bool> addedToCart3 = [false, false, false, false, false];
int limit4 = masala.length;
List<bool> addedToCart4 = List.generate(limit4, (index) => false);
int limit5 = snacks.length;
List<bool> addedToCart5 = List.generate(limit5, (index) => false);
int limit6 = bakery.length;
List<bool> addedToCart6 = List.generate(limit6, (index) => false);
int limit7 = tea.length;
List<bool> addedToCart7 = List.generate(limit7, (index) => false);

/*print(name) {
  // TODO: implement print
  throw UnimplementedError();
}*/

class _HomePageState extends State<HomePage> {
  Future<void> fetchData() async {
    final url = Uri.parse('https://api.dcrownmart.com/product/getProduct');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      data = jsonResponse;

      for (int i = 0; i < jsonResponse.length; i++) {
        if (jsonResponse[i]['categories'] == "Cold Drinks & juices") {
          drink.add(jsonResponse[i]);
        } else if (jsonResponse[i]['categories'] == "Fruit & vegitables") {
          fruit.add(jsonResponse[i]);
        } else if (jsonResponse[i]['categories'] == "Masala,oil & More") {
          masala.add(jsonResponse[i]);
        } else if (jsonResponse[i]['categories'] == "Snacks & Munchies") {
          snacks.add(jsonResponse[i]);
        } else if (jsonResponse[i]['categories'] == "Bakery & Biscutes") {
          bakery.add(jsonResponse[i]);
        } else if (jsonResponse[i]['categories'] ==
            "Tea,Coffee &Health drink") {
          tea.add(jsonResponse[i]);
        } else {
          print("not match");
        }
      }
      // data = jsonResponse[index]['categoriescategories'];
    } else {
      print("not match");
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  List<String> images = [
    "assets/fruits2.jpg",
    "assets/fruits3.jpg",
    "assets/fruits1.jpg",
  ];

  int _currentIndex = 0;
  int itemCountInCart = 0;

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
              style: TextStyle(fontSize: 19, color: colorBlack),
            ),
          ],
        ),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: colorBlack),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: colorBlack),
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
                  icon: Icon(Icons.shopping_cart, color: colorBlack),
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
                      color: colorBlack,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '$itemCountInCart',
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
            DrawerHeader(
              decoration: BoxDecoration(
                color: colorPrimary,
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 40,
                      backgroundImage: AssetImage("assets/profile.png"),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Container(
                    // alignment: Alignment.bottomLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 25,
                        ),
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
                        SizedBox(height: 2.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Free Member".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 5.0),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UpgradePage(),
                                  ),
                                );
                              },
                              /*style: ElevatedButton.styleFrom(
                                  backgroundColor: toolbar, // Background color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  padding: EdgeInsets.all(0)),*/
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.lightGreen.shade700,
                                  boxShadow: [
                                    BoxShadow(
                                      color: colorGrey2,
                                      blurRadius: 1,
                                      spreadRadius: 0,
                                      offset: Offset(0, 0),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 8),
                                  child: Center(
                                    child: Text(
                                      "Upgrade",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: colorWhite,
                                      ),
                                    ),
                                  ),
                                ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReferralPage()),
                );
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
              height: 200,
              child: CarouselSlider.builder(
                enableAutoSlider: true,
                autoSliderTransitionTime: Duration(seconds: 2),
                autoSliderDelay: Duration(seconds: 3),
                autoSliderTransitionCurve: Curves.fastOutSlowIn,
                viewportFraction: 1.05,
                unlimitedMode: true,
                slideBuilder: (index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
                slideIndicator: CircularSlideIndicator(
                  currentIndicatorColor: colorPrimary,
                  indicatorRadius: 4.0,
                  padding: EdgeInsets.only(bottom: 10),
                ),
                itemCount: images.length,
                initialPage: _currentIndex,
                onSlideChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            /*Container(
              child:
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CarouselSlider(
                    items: images.map((image) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: colorGrey1,
                            ),
                            child: Image.asset(
                              image,
                              //width: screenWidth,
                              //fit: BoxFit.cover,
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
            ),*/
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductPage()),
                );
                print('Container tapped!');
              },
              child: Container(
                padding: EdgeInsets.all(8.0),
                height: 187.0,
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
                                child: Image.network(
                                  'assets/crown_loading2.png',
                                  height: 120.0,
                                  width: 110.0,
                                  alignment: Alignment.center,
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text(
                                  drink[index]['name'].toString(),
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
                                    padding: EdgeInsets.all(8.0),
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
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            itemCountInCart =
                                                itemCountInCart == 0 ? 1 : 0;
                                            addedToCart1[index] =
                                                !addedToCart1[index];
                                          });
                                          if (addedToCart1[index]) {
                                            /*Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyCartPage()),
                                            );*/
                                          }
                                        },
                                        child: Center(
                                          child: Icon(
                                            addedToCart1[index]
                                                ? Icons.remove_circle
                                                : Icons.add_circle,
                                            color: colorWhite,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10.0),
                                              bottomRight:
                                                  Radius.circular(10.0),
                                            ),
                                          ),
                                          textStyle: TextStyle(
                                            fontSize: 18,
                                          ),
                                          padding: EdgeInsets.only(right: 1.0),
                                          backgroundColor: addedToCart1[index]
                                              ? colorRed
                                              : colorPrimary,
                                        ),
                                      ),
                                    ),
                                  ),
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
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Cold Drinks & juices",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ViewallPage(productList: drink)));
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductPage()),
                );
                print('Container tapped!');
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: 190.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemExtent: 205.0,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 3.0),
                                child: Container(
                                  //height: 190.0,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Center(
                                        child: Image.network(
                                          'assets/crown_loading2.png',
                                          height: 120.0,
                                          width: 110.0,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                      /*Center(
                                        child: Image.network(
                                          data[index]['image'] != null
                                              ? data[index]['image']
                                              : 'assets/dishwash.jpeg',
                                          height: 120.0,
                                          width: 110.0,
                                          alignment: Alignment.center,
                                        ),
                                      ),*/
                                      SizedBox(height: 4.0),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          drink[index]['name'].toString(),
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
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              drink[index]['price'].toString(),
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
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                                width: 40,
                                                height: 40,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      itemCountInCart =
                                                          itemCountInCart == 0
                                                              ? 1
                                                              : 0;
                                                      addedToCart2[index] =
                                                          !addedToCart2[index];
                                                    });
                                                    if (addedToCart2[index]) {
                                                      /*Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                MyCartPage()),
                                                      );*/
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                10.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                10.0),
                                                      ),
                                                    ),
                                                    textStyle: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                    padding: EdgeInsets.only(
                                                        right: 1.0),
                                                    backgroundColor:
                                                        addedToCart2[index]
                                                            ? colorRed
                                                            : colorPrimary,
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
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
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Fruit & vegitables",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ViewallPage(productList: fruit)));
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductPage()),
                );
                print('Container tapped!');
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: 194.0,
                  //width: screenWidth,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemExtent: 205.0,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 4.0),
                                child: Container(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Center(
                                        child: Image.network(
                                          'assets/crown_loading2.png',
                                          height: 120.0,
                                          width: 110.0,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                      /*Center(
                                        child: Image(
                                          height: 100.0,
                                          width: 110.0,
                                          alignment: Alignment.center,
                                          image: AssetImage(
                                            'assets/crown_loading2.png',
                                          ),
                                        ),
                                      ),*/
                                      SizedBox(height: 3.0),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          fruit[index]['name'].toString(),
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
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              fruit[index]['price'].toString(),
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
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                                width: 40,
                                                height: 40,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      itemCountInCart =
                                                          itemCountInCart == 0
                                                              ? 1
                                                              : 0;
                                                      addedToCart3[index] =
                                                          !addedToCart3[index];
                                                    });
                                                    if (addedToCart3[index]) {
                                                      /*Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                MyCartPage()),
                                                      );*/
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                10.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                10.0),
                                                      ),
                                                    ),
                                                    textStyle: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                    padding: EdgeInsets.only(
                                                        right: 1.0),
                                                    backgroundColor:
                                                        addedToCart3[index]
                                                            ? colorRed
                                                            : colorPrimary,
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
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
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Masala,oil & More",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ViewallPage(productList: masala)));
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductPage()),
                );
                print('Container tapped!');
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: 194.0,
                  //width: screenWidth,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemExtent: 205.0,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 4.0),
                                child: Container(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Center(
                                        child: Image.network(
                                          'assets/crown_loading2.png',
                                          height: 120.0,
                                          width: 110.0,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                      /*Center(
                                        child: Image(
                                          height: 120.0,
                                          width: 110.0,
                                          alignment: Alignment.center,
                                          image: AssetImage(
                                            masala[index]['image'],
                                          ),
                                        ),
                                      ),*/
                                      SizedBox(height: 3.0),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          masala[index]['name'].toString(),
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
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              masala[index]['price'].toString(),
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
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                                width: 40,
                                                height: 40,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      itemCountInCart =
                                                          itemCountInCart == 0
                                                              ? 1
                                                              : 0;
                                                      addedToCart4[index] =
                                                          !addedToCart4[index];
                                                    });
                                                    if (addedToCart4[index]) {
                                                      /*Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                MyCartPage()),
                                                      );*/
                                                    }
                                                  },
                                                  child: Center(
                                                    child: Icon(
                                                      addedToCart4[index]
                                                          ? Icons.remove_circle
                                                          : Icons.add_circle,
                                                      color: colorWhite,
                                                    ),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                10.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                10.0),
                                                      ),
                                                    ),
                                                    textStyle: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                    padding: EdgeInsets.only(
                                                        right: 1.0),
                                                    backgroundColor:
                                                        addedToCart4[index]
                                                            ? colorRed
                                                            : colorPrimary,
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
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
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Snacks & Munchies",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ViewallPage(productList: snacks)));
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductPage()),
                );
                print('Container tapped!');
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: 194.0,
                  //width: screenWidth,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemExtent: 205.0,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 4.0),
                                child: Container(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Center(
                                        child: Image.network(
                                          'assets/crown_loading2.png',
                                          height: 120.0,
                                          width: 110.0,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                      /*Center(
                                        child: Image(
                                          height: 120.0,
                                          width: 110.0,
                                          alignment: Alignment.center,
                                          image: AssetImage(
                                            snacks[index]['image'],
                                          ),
                                        ),
                                      ),*/
                                      SizedBox(height: 3.0),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          snacks[index]['name'].toString(),
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
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              snacks[index]['price'].toString(),
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
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                                width: 40,
                                                height: 40,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      itemCountInCart =
                                                          itemCountInCart == 0
                                                              ? 1
                                                              : 0;
                                                      addedToCart5[index] =
                                                          !addedToCart5[index];
                                                    });
                                                    if (addedToCart5[index]) {
                                                      /*Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                MyCartPage()),
                                                      );*/
                                                    }
                                                  },
                                                  child: Center(
                                                    child: Icon(
                                                      addedToCart5[index]
                                                          ? Icons.remove_circle
                                                          : Icons.add_circle,
                                                      color: colorWhite,
                                                    ),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                10.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                10.0),
                                                      ),
                                                    ),
                                                    textStyle: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                    padding: EdgeInsets.only(
                                                        right: 1.0),
                                                    backgroundColor:
                                                        addedToCart5[index]
                                                            ? colorRed
                                                            : colorPrimary,
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
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
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Bakery & Biscutes",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ViewallPage(productList: bakery)));
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductPage()),
                );
                print('Container tapped!');
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: 194.0,
                  //width: screenWidth,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemExtent: 205.0,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 4.0),
                                child: Container(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Center(
                                        child: Image.network(
                                          'assets/crown_loading2.png',
                                          height: 120.0,
                                          width: 110.0,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                      SizedBox(height: 3.0),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          bakery[index]['name'].toString(),
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
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              bakery[index]['price'].toString(),
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
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                                width: 40,
                                                height: 40,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      itemCountInCart =
                                                          itemCountInCart == 0
                                                              ? 1
                                                              : 0;
                                                      addedToCart6[index] =
                                                          !addedToCart6[index];
                                                    });
                                                    if (addedToCart6[index]) {
                                                      /*Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                MyCartPage()),
                                                      );*/
                                                    }
                                                  },
                                                  child: Center(
                                                    child: Icon(
                                                      addedToCart6[index]
                                                          ? Icons.remove_circle
                                                          : Icons.add_circle,
                                                      color: colorWhite,
                                                    ),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                10.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                10.0),
                                                      ),
                                                    ),
                                                    textStyle: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                    padding: EdgeInsets.only(
                                                        right: 1.0),
                                                    backgroundColor:
                                                        addedToCart6[index]
                                                            ? colorRed
                                                            : colorPrimary,
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
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
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Tea,Coffee &Health drink",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ViewallPage(productList: tea)));
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductPage()),
                );
                print('Container tapped!');
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: 194.0,
                  //width: screenWidth,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemExtent: 205.0,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 4.0),
                                child: Container(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Center(
                                        child: Image.network(
                                          'assets/crown_loading2.png',
                                          height: 120.0,
                                          width: 110.0,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                      SizedBox(height: 3.0),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          tea[index]['name'].toString(),
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
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              tea[index]['price'].toString(),
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
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                                width: 40,
                                                height: 40,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      itemCountInCart =
                                                          itemCountInCart == 0
                                                              ? 1
                                                              : 0;
                                                      addedToCart7[index] =
                                                          !addedToCart7[index];
                                                    });
                                                    if (addedToCart7[index]) {
                                                      /*Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                MyCartPage()),
                                                      );*/
                                                    }
                                                  },
                                                  child: Center(
                                                    child: Icon(
                                                      addedToCart7[index]
                                                          ? Icons.remove_circle
                                                          : Icons.add_circle,
                                                      color: colorWhite,
                                                    ),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                10.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                10.0),
                                                      ),
                                                    ),
                                                    textStyle: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                    padding: EdgeInsets.only(
                                                        right: 1.0),
                                                    backgroundColor:
                                                        addedToCart7[index]
                                                            ? colorRed
                                                            : colorPrimary,
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
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
            ),
          ],
        ),
      ),
    );
  }
}
