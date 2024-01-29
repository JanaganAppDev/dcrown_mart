import 'dart:convert';
import 'package:dcrown_mart/const.dart';
import 'package:dcrown_mart/screen/myaddress_page.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home page/home_page.dart';

class AddresslistPage extends StatefulWidget {
  const AddresslistPage({super.key});

  @override
  State<AddresslistPage> createState() => _AddresslistPageState();
}

class _AddresslistPageState extends State<AddresslistPage> {
  String groupValue = "Method $index";

  static get index => null;

  bool loader= false;

  List addressList =[];

  /// api integration get

  Future<void> getAddress() async {
    setState(() {
      loader=true;
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = await prefs.getString('token') ?? "";
    print("fazil");
    print(token);
    final url = Uri.parse('http://localhost:5000/adress/get/2175');
    print(token);
    final response = await http.get(url,
        headers: {
      'Authorization':'Bearer'+' '+token,
    });
    if (response.statusCode == 200||response.statusCode == 201) {
      print("auth");
      final jsonResponse = jsonDecode(response.body);
      addressList = jsonResponse;
      print(addressList);
      setState(() {
        loader=false;
      });
      print("response");
    } else {
      print(response.body);
      print("not match");
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    getAddress();
    super.initState();
    print("safe");
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        title: const Text('Address List'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15.0),
            SizedBox(height: 10.0),
            loader == false ? Container(
              height: 600.0,
              child: ListView.builder(
                itemCount: addressList.length,
                itemBuilder: (context, index) {
                  return RadioListTile(
                    title: Container(
                      margin: EdgeInsets.all(0.0),
                      height: 88.0,
                      width: screenWidth,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 15.0),
                                child: Text(
                                  "Address list",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: colorGrey1),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  print(addressList[index]);
                                  print("addressList[index]['flat']");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyAddressPage(addDetails:addressList[index])),
                                  );
                                  print('Container tapped!');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: colorPrimary,
                                      width: 01.0,
                                    ),
                                  ),
                                  child: Icon(Icons.edit_rounded,
                                      color: colorPrimary, size: 22.0),
                                  width: 30.0,
                                  height: 30.0,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                addressList[index]['flat'].toString(),
                              ),
                              Text(","),
                              Text(
                                addressList[index]['address'].toString(),
                              ),
                              Text(","),
                              Text(
                                addressList[index]['district'].toString(),
                              ),
                              Text(","),
                              Text(
                                addressList[index]['state'].toString(),
                              ),
                              Text(","),
                              Text(
                                addressList[index]['landmark'].toString(),
                              ),
                              Text(","),
                              Text(
                                addressList[index]['pincode'].toString(),
                              ),
                            ],
                          ),
                          Divider(
                            height: 20,///30
                            thickness: 1,
                            indent: 0,
                            endIndent: 0,
                            color: colorGrey,
                          )
                        ],
                      ),
                    ),
                    value: "Method $index",
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value as String;
                      });
                    },
                    activeColor: colorPrimary,
                    dense: true,
                  );
                },
              ),
            ): Center(
              child: CircularProgressIndicator(),
            ),
            Container(
              //margin: EdgeInsets.only(top: 60.0),
              width: 350.0,
              height: 45.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyAddressPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  "Add another address",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
