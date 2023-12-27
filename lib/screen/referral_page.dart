import 'package:flutter/material.dart';
import 'package:dcrown_mart/const.dart';
import 'home page/home_page.dart';
import 'package:share_plus/share_plus.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


class ReferralPage extends StatefulWidget {
  const ReferralPage({super.key});

  @override
  State<ReferralPage> createState() => _ReferralPageState();
}

void _onShare(context) async {
  print("testing");
  final box = context.findRenderObject() as RenderBox?;
  var referralidController;
  String text =  referralidController.text;
  //String link = 'link';
  await Share.share(text,
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
}

class _ReferralPageState extends State<ReferralPage> {

  TextEditingController referralidController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        backgroundColor:
        colorPrimary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        title: const Text('Referral'),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Text("Earn Money\n  By Refer",style:TextStyle(fontSize:24.0,
                fontWeight:FontWeight.bold,
                color: colorBlack )),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child:Container(
                      height: 45.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        color: colorWhite,
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(
                          color: colorPrimary,
                          width: 2.0,
                        ),
                      ),
                      child: Center(
                        child: Form(
                          key: _formKey,
                          child: TextFormField(
                            controller: referralidController,
                            cursorColor: colorPrimary,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(10.0),
                            ),
                            style: TextStyle(
                              color: colorBlack,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),

                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0,right: 20.0),
                    child: Container(
                      width: 120.0,
                      height: 45.0,
                      child: ElevatedButton(
                        onPressed: () {
                          Share.share( referralidController.text);
                        },
                        child: const Text('Share'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: screenHeight,
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                  color: colorWhite,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 8.0),
                          Text(
                            'Invite a Friends',
                            style: TextStyle(
                              color: colorBlack,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.search,
                            color: colorBlack,
                            size: 24.0,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 30,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              radius: 20.0,
                              backgroundColor: Colors.grey,
                              child: Icon(
                                Icons.person,
                                color: colorWhite,
                                size: 20.0,
                              ),
                            ),
                            title: Row(
                              children: [
                                Text('Name'),
                                SizedBox(width: 150),
                                ElevatedButton(
                                  onPressed: () {
                                    print('Button pressed for item $index');
                                  },
                                  child: Text('share'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),

                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

