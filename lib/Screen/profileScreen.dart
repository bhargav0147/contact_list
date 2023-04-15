import 'dart:io';

import 'package:contact_list/Screen/dashScreen.dart';
import 'package:contact_list/class/data_model.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController txtnewname = TextEditingController();

  TextEditingController txtnewnum = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, -0.40),
              child: Container(
                height: 350,
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.lightBlue.shade100,
                          spreadRadius: 2,
                          blurRadius: 10)
                    ]),
              ),
            ),
            Align(
                alignment: Alignment(0, -0.85),
                child: contactList[index].path == null
                    ? CircleAvatar(
                        radius: 90,
                        backgroundImage:
                            AssetImage("assets/images/user (1).png"),
                      )
                    : CircleAvatar(
                        radius: 90,
                        backgroundImage:
                            FileImage(File("${contactList[index].path}")),
                      )),
            Align(
              alignment: Alignment(0, -0.15),
              child: Container(
                height: 250,
                width: 350,
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "${contactList[index].name}",
                      style: TextStyle(
                          letterSpacing: 1, fontSize: 35, color: Colors.blue),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "${contactList[index].num}",
                      style: TextStyle(
                          letterSpacing: 1, fontSize: 30, color: Colors.blue),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.blue.shade50,
                                    spreadRadius: 2,
                                    blurRadius: 10)
                              ]),
                          child: IconButton(
                              onPressed: () async {
                                String link =
                                    "sms: ${contactList[index].num}?body=Welcome";
                                await launchUrl(Uri.parse(link));
                              },
                              icon: Icon(
                                Icons.message,
                                color: Colors.blue,
                                size: 40,
                              )),
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.blue.shade50,
                                    spreadRadius: 2,
                                    blurRadius: 10)
                              ]),
                          child: IconButton(
                              onPressed: () async {
                                String link = "tel: ${contactList[index].num}";
                                await launchUrl(Uri.parse(link));
                              },
                              icon: Icon(
                                Icons.call,
                                color: Colors.blue,
                                size: 40,
                              )),
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.blue.shade50,
                                    spreadRadius: 2,
                                    blurRadius: 10)
                              ]),
                          child: IconButton(
                              onPressed: () {
                                txtnewname = TextEditingController(
                                    text: "${contactList[index].name}");
                                txtnewnum = TextEditingController(
                                    text: "${contactList[index].num}");
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "Update",
                                            style: TextStyle(
                                                letterSpacing: 1,
                                                fontSize: 18,
                                                color: Colors.blue),
                                          ),
                                          TextField(
                                            controller: txtnewname,
                                          ),
                                          TextField(
                                            controller: txtnewnum,
                                          ),
                                          SizedBox(height: 25),
                                          InkWell(
                                            onTap: () {
                                              contactList[index] = ContactClass(
                                                  name: txtnewname.text,
                                                  num: txtnewnum.text);
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              height: 30,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Center(
                                                child: Text(
                                                  "Update",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      letterSpacing: 1,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Colors.blue,
                                size: 40,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment(0, 0.35),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                      height: 70,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: InkWell(
                            onTap: () {
                              Share.share(
                                  "${contactList[index].name}\n${contactList[index].num}");
                            },
                            child: Text(
                              "Share Contact",
                              style: TextStyle(
                                fontSize: 23,fontWeight: FontWeight.bold,letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                      )),
                )),
            Align(
                alignment: Alignment(0, 0.55),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                      height: 70,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: InkWell(
                            onTap: () {
                              contactList.removeAt(index);
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Delete Contact",
                              style: TextStyle(
                                fontSize: 23,fontWeight: FontWeight.bold,letterSpacing: 1,color: Colors.red
                              ),
                            ),
                          ),
                        ),
                      )),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios_sharp,
          color: Colors.white,
        ),
      ),
    ));
  }
}
