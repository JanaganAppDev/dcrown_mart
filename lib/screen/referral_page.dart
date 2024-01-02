import 'package:flutter/material.dart';
import 'package:dcrown_mart/const.dart';
import 'package:permission_handler/permission_handler.dart';
import 'home page/home_page.dart';
import 'package:share_plus/share_plus.dart';
import 'package:contacts_service/contacts_service.dart';

class ReferralPage extends StatefulWidget {
  const ReferralPage({Key? key}) : super(key: key);


  @override
  State<ReferralPage> createState() => _ReferralPageState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _ReferralPageState extends State<ReferralPage> {
  Iterable<Contact>? _contacts;
  TextEditingController referralidController = TextEditingController();

  void _onShare(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    String text = referralidController.text;
    await Share.share(text,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }

  @override
  void initState() {
    super.initState();
    _getContacts();
  }

  Future<void> _getContacts() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      Iterable<Contact> contactList = await ContactsService.getContacts();
      setState(() {
        _contacts = contactList;
      });
    } else {
      await Permission.contacts.request();
      _getContacts();
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: colorWhite,
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
        title: const Text('Referral'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Earn Money\n  By Refer",
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: colorBlack),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
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
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                      width: 120.0,
                      height: 45.0,
                      child: ElevatedButton(
                        onPressed: () {
                          _onShare(context);
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
                            'Invite Friends',
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
                        itemCount: _contacts?.length ?? 0,
                        itemBuilder: (context, index) {
                          Contact contact = _contacts!.elementAt(index);
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
                                Text(contact.displayName ?? ''),
                                SizedBox(width: 80),
                                ElevatedButton(
                                  onPressed: () {
                                    print('Button pressed for item $index');
                                  },
                                  child: Text('Share'),
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
