// ignore_for_file: use_key_in_widget_constructors
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../Classes/ScreenSize.dart';

class NewReceipt extends StatefulWidget {
  @override
  State<NewReceipt> createState() => _NewReceiptState();
}

class _NewReceiptState extends State<NewReceipt> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  final _refNumber = TextEditingController();
  final _costController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  String _radioValue = 'Success';

  @override
  Widget build(BuildContext context) {
    final ScreenSize screenSize = ScreenSize(); // ScreenSize class instance (Singleton)
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Receipt'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            onPressed: () { Navigator.pop(context); },
            backgroundColor: Colors.indigoAccent,
            mini: true,
            child: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          ),
        )
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _costController,
                decoration: const InputDecoration(labelText: 'Cost'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(labelText: 'Date'),
                readOnly: true,
                onTap: () async {
                  final DateTime? pickedDateTime = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2025),
                  );
                  setState(() {
                    _dateController.text = '${pickedDateTime!.day}/${pickedDateTime.month}/${pickedDateTime.year}';
                  });
                },
              ),
              TextFormField(
                controller: _timeController,
                decoration: const InputDecoration( labelText: 'Time'),
                readOnly: true,
                onTap: () async {
                  final TimeOfDay? pickedDateTime = await showTimePicker( context: context, initialTime: TimeOfDay.now());
                  setState(() {
                    _timeController.text = '${pickedDateTime!.hour}:${pickedDateTime.minute} ${pickedDateTime.period == DayPeriod.am ? 'AM' : 'PM'}';
                  });
                },
              ),
              TextFormField(
                controller: _refNumber,
                decoration: const InputDecoration( 
                  labelText: 'Reference Number',
                  hintText: 'Auto Generated - Leave Blank',
                  ),
                readOnly: true,                
              ),
              SizedBox(height: screenSize.screenHeight! / 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(value: 'Success', groupValue: _radioValue, onChanged: (value) {
                    setState(() { _radioValue = value!; });
                  },),
                  const Text("Success"),
                  Radio(value: 'Failed', groupValue: _radioValue, onChanged: (value) {
                    setState(() { _radioValue = value!; });
                  },),
                  const Text("Failed"),
                ],
              ),
              SizedBox(height: screenSize.screenHeight! / 16),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  child: const Text('Create Receipt', style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    _refNumber.text = generateRandomNumber().toString();
                    final data = <String, dynamic>{
                      'cost': _costController.text,
                      'date': _dateController.text,
                      'time': _timeController.text,
                      'referenceNum': _refNumber.text,
                      'status': _radioValue,
                    };
                    db.collection("Receipts").doc().set(data).onError((e, _) => print("Error writing document: $e"));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Receipt Created Successfully'),
                        duration: Duration(seconds: 4),
                        backgroundColor: Colors.grey,
                      ),
                    );
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Function to generate a random 8-digit number ( Reference Number )
int generateRandomNumber() {
  Random random = Random();
  int min = 10000000; // Minimum 8-digit number
  int max = 99999999; // Maximum 8-digit number
  int randomNumber = min + random.nextInt(max - min);
  return randomNumber;
}