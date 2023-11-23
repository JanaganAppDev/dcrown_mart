import 'package:dcrown_mart/const.dart';
import 'package:dcrown_mart/screen/myaddress_page.dart';
import 'package:flutter/material.dart';


class AddresslistPage extends StatefulWidget {
  const AddresslistPage({super.key});

  @override
  State<AddresslistPage> createState() => _AddresslistPageState();
}

class _AddresslistPageState extends State<AddresslistPage> {
  @override
  
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Address List'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Address list",
                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,color: colorGrey1),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 265.0),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MyAddressPage()),
                                );
                                print('Container tapped!');
                              },
                              child: Icon(Icons.edit_rounded,color: colorPrimary,)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              height: 600.0,
              child: ListView.builder(
                //scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(8.0),
                    height: 50.0,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      color: colorWhite,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: colorGrey,
                          blurRadius: 0.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Text("1.50/12,sasthri street, chennai-689001",style:TextStyle(fontSize: 18.0),),
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
                child: Text("Add aother address",style: TextStyle(fontWeight:FontWeight.w600,fontSize:25.0),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
