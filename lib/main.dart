
import 'package:contact_list/Screen/addcontact.dart';
import 'package:contact_list/Screen/dashScreen.dart';
import 'package:contact_list/Screen/lastScreen.dart';
import 'package:contact_list/Screen/missScreen.dart';
import 'package:contact_list/Screen/profileScreen.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/':(context) => DashScreen(),
            'new':(context) => AddContact(),
            'profile':(context) => Profile(),
            'recent':(context) => Last(),
            'phone':(context) => Missed(),

          }
      )
  );
}