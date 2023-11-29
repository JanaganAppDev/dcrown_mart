import 'package:dcrown_mart/const.dart';
import 'package:dcrown_mart/screen/home_page.dart';
import 'package:dcrown_mart/screen/myaddress_page.dart';
import 'package:flutter/material.dart';


class AddresslistPage extends StatefulWidget {
  const AddresslistPage({super.key});

  @override
  State<AddresslistPage> createState() => _AddresslistPageState();
}

class _AddresslistPageState extends State<AddresslistPage> {
  String groupValue = "Method $index";

  static get index => null;


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
                //scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(0.0),
                    height: 88.0,
                    width: screenWidth,
                    child: Column(
                      children: [
                        Container(
                          child: RadioListTile(
                            title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Address list",
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,color: colorGrey1),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => MyAddressPage()),
                                    );
                                    print('Container tapped!');
                                  },
                                  child: Icon(Icons.edit_rounded,color: colorPrimary,))
                            ],
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
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 30.0),
                              child: Text("1.50/12,sasthri street, chennai-689001",style:TextStyle(fontSize: 18.0),),
                            ),
                          ],
                        ),
                        Divider(
                          height: 5,
                            thickness: 1,
                          indent: 0,
                          endIndent: 0,
                          color: colorGrey,
                        )
                      ],
                    ),
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
                child: Text("Add another address",style: TextStyle(fontWeight:FontWeight.w600,fontSize:25.0),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
