// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, unused_local_variable, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/DetailsCard.dart';
import 'package:flutter_application_1/Widgets/TextualMessage.dart';
import 'package:flutter_application_1/Widgets/StatusCard.dart';
import 'package:flutter_application_1/main.dart';
import '../Classes/Colors.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_core/firebase_core.dart';
import '../Firebase/firebase_options.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import '../Buttons/ExpandableFAB.dart';
import 'package:native_screenshot/native_screenshot.dart';


class DigitalReceipt extends StatefulWidget {
  final dynamic cost;
  final dynamic status;
  final dynamic date;
  final dynamic time;
  final dynamic referenceNum;
  final dynamic id;

  const DigitalReceipt({
    super.key,
    this.cost,
    this.status,
    this.date,
    this.time,
    this.referenceNum,
    this.id,
    });
  
  

  @override
  State<DigitalReceipt> createState() => _DigitalReceiptState();
}

class _DigitalReceiptState extends State<DigitalReceipt> {
  
  @override
  Widget build(BuildContext context) {
    dynamic cost = widget.cost;
    dynamic status = widget.status;
    dynamic date = widget.date;
    dynamic time = widget.time;
    dynamic referenceNum = widget.referenceNum;
    dynamic id = widget.id;

    return Scaffold(
      floatingActionButton: ExpandableFloatingActionButton(),
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          //A column that holds all the widgets inside the *body
          children: [
            const SizedBox(height: 60),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.pop(context);   //Navigate back to the previous screen
                      setState(() {
                        
                      });
                    },
                    child: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
                    backgroundColor: Colors.indigoAccent,
                    mini: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            StatusCard(cost: '$cost', statusText: '$status'),
            const SizedBox(height: 5),
            DetailsCard(ref: '$referenceNum', date: '$date' ,cost: '$cost', statusText: '$status'),
            const SizedBox(height: 5),
            TextualMessage(),
          ],
        ),
      ),
    );
  }
}
