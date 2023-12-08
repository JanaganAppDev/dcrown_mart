
import 'dart:io';

import 'package:dcrown_mart/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';




class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}


bool _isButtonClicked = false;

class _PaymentPageState extends State<PaymentPage> {
  List<String> paymentModes = [
    'Select Payment Mode',
    'Direct Bank Transfer',
    'Google Pay',
    'Phonepe',
    'Others'
  ];
  String selectedPaymentMode = 'Select Payment Mode';

  File? _image;
  final picker = ImagePicker();


  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
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
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text(
                'Note: Pay to 7553879835 and click pay\n                       OR',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Pay to this account:\nName: crownmart\nBank: Axis Bank\nBranch: Chennai\nAcc no: 12345657\nIFSC: axis1234567',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Column(
                children: [
                  TextFormField(
                    cursorColor: colorPrimary,
                    decoration: InputDecoration(
                      hintText: '₹60',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(55.0),
                        borderSide: BorderSide(
                          color: colorPrimary,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(55.0),
                        borderSide: BorderSide(
                          color: colorPrimary,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(55.0),
                        border: Border.all(
                          color: _isButtonClicked ? colorRed : colorPrimaryDark,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButtonFormField<String>(
                        value: selectedPaymentMode,
                        onChanged: (newValue) {
                          setState(() {
                            selectedPaymentMode = newValue!;
                          });
                        },
                        items: paymentModes.map((mode) {
                          return DropdownMenuItem<String>(
                            value: mode,
                            child: Text(mode),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      cursorColor: colorPrimary,
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.account_balance, color: colorGrey2),
                        hintText: 'Transaction ID',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(55.0),
                          borderSide: BorderSide(
                            color: colorPrimary,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(55.0),
                          borderSide: BorderSide(
                            color: colorPrimary,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(55.0),
                          borderSide: BorderSide(
                            color:
                                _isButtonClicked ? colorRed : colorPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                 /* Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(55.0),
                        border: Border.all(
                          color: _isButtonClicked ? colorRed : colorPrimaryDark,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: () async {
                          var status = await Permission.photos.request();
                          if (status.isGranted) {
                            List<XFile>? images = await ImagePicker().pickMultiImage(imageQuality: 50);

                            if (images != null) {
                            }
                          } else {
                          }
                        },



                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Icon(Icons.image, color: colorGrey2),
                              SizedBox(width: 10),
                              Text('Screen shot'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),*/
                  GestureDetector(
                      child:  Container(
                        height: 55.0,
                        width: 500.0,
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: colorWhite,
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(
                            color: colorPrimary,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.image, color: colorGrey2),
                            SizedBox(width: 10),
                            _image == null ? Text('Screen Shot') : Text(_image!.path.split('/').last),
                          ],
                        ),
                      ),
                      onTap: () {
                        getImageFromGallery();
                      }
                  ),



                  SizedBox(height: 20.0),
                  Container(
                    //margin: EdgeInsets.only(top: 60.0),
                    width: 140.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text("Upload"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
