// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, sort_child_properties_last
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import '../Classes/Colors.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Customizable/Template.dart';


class StatusCard extends StatelessWidget {
  final String ?statusIcon;
  final String cost;
  final String statusText;
  

  const StatusCard({
    Key? key,
    this.statusIcon,
    required this.cost,
    required this.statusText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; //Use this to make the card width responsive
    double screenHeight = MediaQuery.of(context).size.height; //Use this to make the card height responsive
    
    // SizedBox to control the size of the card
    return SizedBox(
      width: screenWidth * 0.98,
      height: screenHeight * 0.22,
      // Card to hold the status icon, status text, and cost
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AvatarGlow(
              child: SvgPicture.asset( 
              statusText == 'Success' ? "assets/success_icon.svg" : "assets/failed_icon.svg",
              width: 50,
              height: 50,
              ),
              endRadius: 35,
              glowColor: statusText == 'Success' ? AppColors.MyGreen : AppColors.MyRed,
              duration: Duration(seconds: 2),
              repeat: true,
              showTwoGlows: true,
            ),
            Text('Payment $statusText', style: TextStyle(fontSize: 24)),
            SizedBox(height: 5),
            Text('EGP $cost', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            
          ],
        ),
      ),
    );
  }
}
