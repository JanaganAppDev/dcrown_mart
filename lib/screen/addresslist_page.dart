import 'dart:convert';
import 'package:dcrown_mart/const.dart';
import 'package:dcrown_mart/screen/home%20page/home_page.dart';
import 'package:dcrown_mart/screen/myaddress_page.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';

class AddresslistPage extends StatefulWidget {
  const AddresslistPage({super.key});

  @override
  State<AddresslistPage> createState() => _AddresslistPageState();
}

class _AddresslistPageState extends State<AddresslistPage> {
  String groupValue = "Method $index";

  static get index => null;

  /// api integration

  Future<void> getAddress() async {
    final url = Uri.parse('http://localhost:5000/adress/get');
    final response = await http.get(url,headers: {
      'Authorization':auth_key,
    });
    if (response.statusCode == 200||response.statusCode == 201) {
      final jsonResponse = jsonDecode(response.body);
      data = jsonResponse;
      print(data);
      print("object");
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
            Container(
              height: 600.0,
              child: ListView.builder(
                itemCount: data.isEmpty ? 0 : data.length,
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyAddressPage()),
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
                                  data[index]['flat'].toString(),
                              ),
                              Text(","),
                              Text(
                                data[index]['address'].toString(),
                              ),
                              Text(","),
                              Text(
                                data[index]['district'].toString(),
                              ),
                              Text(","),
                              Text(
                                data[index]['state'].toString(),
                              ),
                              Text(","),
                              Text(
                                data[index]['landmark'].toString(),
                              ),
                            ],
                          ),
                          Divider(
                            height: 30,
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
