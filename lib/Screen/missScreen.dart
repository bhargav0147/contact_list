
import 'package:contact_list/Screen/dashScreen.dart';
import 'package:flutter/material.dart';


class Missed extends StatefulWidget {
  const Missed({Key? key}) : super(key: key);

  @override
  State<Missed> createState() => _MissedState();
}

class _MissedState extends State<Missed> {
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
                          borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            SizedBox(height: 40),
                            Text(
                              "Missed calls",
                              style: TextStyle(
                                  color: Colors.blue,
                                  letterSpacing: 2,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
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
                                    height: 550,
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
                              Navigator.pushNamed(context, '/');
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
                            },
                            child: Icon(Icons.phone_missed,
                                color: bottomColour[c],
                                size: c == 0 ? 35 : 45)),
                        InkWell(
                            onTap: () {
                              a = 0;
                              b = 0;
                              c = 0;
                              setState(() {
                                d = 1;
                              });
                              Navigator.pushNamed(context, 'new');
                            },
                            child: Icon(Icons.add,
                                color: bottomColour[d],
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
          CircleAvatar(
            backgroundImage:AssetImage("assets/images/user (1).png"),
            radius: 20,
          ),
          SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${contactList[index].name}",
                style: TextStyle(color: Colors.red,fontSize: 20),
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