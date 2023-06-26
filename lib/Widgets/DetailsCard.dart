// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Customizable/Template.dart';
import '../Classes/ScreenSize.dart';

class DetailsCard extends StatelessWidget {
  final dynamic ref;
  final dynamic statusText;
  final dynamic date;
  final dynamic cost;

  const DetailsCard({
    Key? key,
    required this.ref,
    required this.statusText,
    required this.date,
    required this.cost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = ScreenSize();  // ScreenSize class

    return SizedBox(
      width: screenSize.screenWidth! * 0.98,
      height: screenSize.screenHeight! / 3,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Text('Payment Details', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  //SizedBox(width: screenWidth * 0.35),
                  Spacer(),
                  Container(
                    alignment: Alignment.topRight,
                    width: 60,
                    height: 60,
                    child: Image.asset('assets/logo.png', width: Template.logoWidth, height: Template.logoHeight, fit: BoxFit.contain)),
                ],
              ),
            ),
            //SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text('Ref Number', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300)),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text('$ref', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text('Payment Status', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300)),
                  Spacer(),
                  // if payment status is success, show success icon, else show failed icon ternary operator
                  statusText == 'Success' ? SvgPicture.asset('assets/success_icon.svg', width: 20, height: 20) : SvgPicture.asset('assets/failed_icon.svg', width: 20, height: 20),
                  SizedBox(width: 5),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text('$statusText', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text('Payment Date', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300)),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text('$date', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300)),
                  ),
                ],
              ),
            ),
            SizedBox( height: screenSize.screenHeight! * 0.02),
            Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            SizedBox(height: screenSize.screenHeight! * 0.02),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text('Total Payment', style:TextStyle(fontSize: 17, fontWeight: FontWeight.w300)),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text('$cost EGP', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
