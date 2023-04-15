import 'dart:io';

import 'package:contact_list/class/data_model.dart';
import 'package:flutter/material.dart';

List<ContactClass> contactList = [
  ContactClass(name: 'Aanan', num: '7046632531',path: null),
  ContactClass(name: 'Charun', num: '9866002097',path: null),
  ContactClass(name: 'Devaj', num: '8868802097',path: null),
  ContactClass(name: 'Ishir', num: '8866632497',path: null),
  ContactClass(name: 'Jairaj', num: '8865054397',path: null),
  ContactClass(name: 'Viraj', num: '8632156942',path: null),
  ContactClass(name: 'Yash', num: '7521463985',path: null),
  ContactClass(name: 'Arjun', num: '8697594632',path: null),
  ContactClass(name: 'Ansh', num: '987456358',path: null),
  ContactClass(name: 'Aryan', num: '978648975',path: null),
];
List bottomColour = [Colors.black26, Colors.blue];
int a = 1, b = 0, c = 0, d = 0;

class DashScreen extends StatefulWidget {
  const DashScreen({Key? key}) : super(key: key);

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                  child: Expanded(
                    child: Container(
                      height: 685,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius:BorderRadius.vertical(top: Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            SizedBox(height: 40),
                            Text(
                              "Contacts",
                              style: TextStyle(
                                  color: Colors.blue,
                                  letterSpacing: 2,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 40),
                            Container(
                              height: 40,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white),
                              child: Row(
                                children: [
                                  SizedBox(width: 10),
                                  Icon(Icons.search_rounded,
                                      size: 20, color: Colors.black12),
                                  SizedBox(width: 15),
                                  Text(
                                    "Search",
                                    style: TextStyle(color: Colors.black12),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white),
                              child: Row(
                                children: [
                                  SizedBox(width: 10),
                                  CircleAvatar(
                                    backgroundImage: AssetImage("assets/images/user (1).png"),
                                    radius: 20,
                                  ),
                                  SizedBox(width: 15),
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Bhargav Patel",
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      Text(
                                        "My Profile",
                                        style: TextStyle(
                                            color: Colors.black26,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "My Contacts",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 15),
                                )),
                            SizedBox(height: 20),
                            Column(
                              children: [
                                SizedBox(
                                    height: 410,
                                    child: ListView.builder(
                                        itemBuilder: (context, index) =>
                                            mynumber(index),
                                        itemCount: contactList.length)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                            onTap: () {
                              b = 0;
                              c = 0;
                              d = 0;
                              setState(() {
                                a = 1;
                              });
                            },
                            child: Icon(Icons.person,
                                color: bottomColour[a],
                                size: a == 0 ? 35 : 45)),
                        InkWell(
                            onTap: () {
                              a = 0;
                              c = 0;
                              d = 0;
                              setState(() {
                                b = 1;
                              });
                              Navigator.pushNamed(context, 'recent');
                            },
                            child: Icon(Icons.watch_later_sharp,
                                color: bottomColour[b],
                                size: b == 0 ? 35 : 45)),
                        InkWell(
                            onTap: () {
                              a = 0;
                              b = 0;
                              d = 0;
                              setState(() {
                                c = 1;
                              });
                              Navigator.pushNamed(context, 'phone');
                            },
                            child: Icon(Icons.phone_missed,
                                color: bottomColour[d],
                                size: c == 0 ? 35 : 45)),
                        InkWell(
                            onTap: () {
                              a = 0;
                              b = 0;
                              c = 0;
                              setState(() {
                                d = 1;
                              });
                              Navigator.pushNamed(context, 'new').then((value) {
                                setState(() {
                                  a=0;
                                  b=0;
                                  c=0;
                                  d=0;
                                });
                              });
                            },
                            child: Icon(Icons.add,
                                color: bottomColour[c],
                                size: d == 0 ? 35 : 45)),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget mynumber(int index) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: Row(
        children: [
          SizedBox(width: 10),
          contactList[index].path==null?CircleAvatar(
            backgroundImage:AssetImage("assets/images/user (1).png"),
            radius: 20,
          ):CircleAvatar(radius: 20,backgroundImage: FileImage(File("${contactList[index].path}")),),
          SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${contactList[index].name}",
                style: TextStyle(color: Colors.blue),
              ),
              Text(
                "${contactList[index].num}",
                style: TextStyle(color: Colors.black38, fontSize: 12),
              ),
            ],
          ),
          Spacer(),
          IconButton(onPressed: () {
            Navigator.pushNamed(context, 'profile',arguments: index).then((value) {
              setState(() {

              });
            },);
          }, icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.blue,))
        ],
      ),
    );
  }
}