// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, sort_child_properties_last
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Customizable/Template.dart';
import 'package:flutter_application_1/main.dart';
import '../Classes/Colors.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_svg/flutter_svg.dart';



class TextualMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; //Use this to make the card width responsive
    double screenHeight = MediaQuery.of(context).size.height; //Use this to make the card height responsive
    
    return SizedBox(
      width: screenWidth * 0.98,
      height: screenHeight * 0.1,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Textual Message', style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),),
              Spacer(),
              Text("Message", style: TextStyle(fontSize: Template.font, fontStyle: Template.fontStyle),),
             
            ],),
        )
      ),
    );
  }
}
