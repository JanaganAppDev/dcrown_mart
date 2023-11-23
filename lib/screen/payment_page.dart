import 'package:dcrown_mart/const.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';


class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

bool _isButtonClicked = false;

class _PaymentPageState extends State<PaymentPage> {
  List<String> paymentModes = ['Select Payment Mode','Direct Bank Transfer', 'Google Pay', 'Phonepe', 'Others'];
  String selectedPaymentMode = 'Select Payment Mode';

  @override
  Widget build(BuildContext context) {
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
                'Note: Pay to 7553879835 and click pay\nOR',
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
                          color: Colors.yellow,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(55.0),
                        borderSide: BorderSide(
                          color: Colors.yellow,
                        ),
                      ),

                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
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
                        prefixIcon: Icon(Icons.account_balance,color: colorGrey2),
                        hintText: 'Transaction ID',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(55.0),
                          borderSide: BorderSide(
                            color: Colors.yellow,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(55.0),
                          borderSide: BorderSide(
                            color: Colors.yellow,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(55.0),
                          borderSide: BorderSide(
                            color: _isButtonClicked ? Colors.red : Colors.yellow,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
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
                          if (await Permission.photos.request().isGranted) {
                            // User granted permission, open gallery
                            List<XFile>? images =
                            await ImagePicker().pickMultiImage(imageQuality: 50);
                            if (images != null) {
                              // Handle the selected images as needed, e.g., update a list of images.
                            }
                          } else {
                            // Permission denied
                            // You can show a message to the user or request the permission again.
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
                  ),


                  SizedBox(height: 20.0),
                  Container(
                    //margin: EdgeInsets.only(top: 60.0),
                    width: 140.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                      },
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
