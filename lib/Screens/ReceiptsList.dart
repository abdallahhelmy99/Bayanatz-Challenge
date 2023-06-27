// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, unused_local_variable, sort_child_properties_last, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/NewReceipt.dart';
import 'package:flutter_application_1/Screens/Settings.dart';
import 'DigitalReceipt.dart';
import '../Classes/Colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../Classes/ScreenSize.dart';
import 'package:intl/intl.dart';


class ReceiptsList extends StatefulWidget {
  const ReceiptsList({Key? key}) : super(key: key);

  @override
  _ReceiptsListState createState() => _ReceiptsListState();
}

class _ReceiptsListState extends State<ReceiptsList> {
  @override
  Widget build(BuildContext context) {
    final ScreenSize screenSize = ScreenSize(); // ScreenSize class instance (Singleton)
    
    DateTime now = DateTime.now(); //Get the current date
    String monthName = DateFormat('MMMM').format(now); //Get the current month name
    
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      floatingActionButton: FloatingActionButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => NewReceipt()),) ;
      },
      backgroundColor: Colors.indigoAccent,
      child: Icon(Icons.add, color: Colors.white,),
    ),
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        actions: [
          // Settings Button navigate to the settings screen --------------------------------------------
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: FloatingActionButton(
              onPressed: () { //navigate to settings screen
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen()),) ; }, 
              child: const Icon(Icons.settings_outlined, color: Colors.white,),
              backgroundColor: Colors.indigoAccent,
              mini: true,
            ),
          ),
          // Settings Button navigate to the settings screen --------------------------------------------
        ],
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset( 'assets/receipt.svg', height: 70, width: 70, color: Colors.indigo,), //Receipt Icon
              const SizedBox(height: 20,),

              //Title Name -------------------------------------------------------------------
              GradientText('RECIEPTS',
                  colors: const [
                    Colors.indigo,
                    Colors.indigoAccent,
                    Colors.blueAccent,
                  ],
                  style: const TextStyle(fontSize: 35,fontWeight: FontWeight.bold,)),
              //Title Name -------------------------------------------------------------------

              const SizedBox(height: 20,),

              // Date Widget -------------------------------------------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${DateTime.now().day} of $monthName ${DateTime.now().year}",
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
                    
                  ),
                  const SizedBox(width: 15,),
                  Container(
                    width: screenSize.screenWidth! * 0.5,
                    height: 1,
                    color: Colors.grey,
                  ),
                ],
              ),
              // Date Widget -------------------------------------------------------------------

            ],
          ),

          // Spacing Between Date and List
          SizedBox(height: screenSize.screenHeight! / 32,),

          
          Flexible(
            child: StreamBuilder<QuerySnapshot>(
              // Stream of all documents in the Receipts collection
              stream:
                  FirebaseFirestore.instance.collection('Receipts').snapshots(),
              builder: (context, snapshot) {
                // Error State ----------------------------------------------------
                if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      children: [
                        Image.asset('assets/noData.jpg', height: 200, width: 200,),
                        const SizedBox(
                          height: 20,
                        ),
                        Text('Error: ${snapshot.error}'),
                      ],
                    ),
                  );
                }
                // Error State ----------------------------------------------------


                // Connection State ----------------------------------------------------
                if (!snapshot.hasData) {
                  return Center(child: Image.asset( 'assets/noData.jpg', height: 200, width: 200,),);
                }
                // Connection State ----------------------------------------------------

                
                final receipts = snapshot.data!.docs; // List of all documents 

                // ListView of all Receipts ----------------------------------------------------
                return ListView.builder( shrinkWrap: true, physics: const ScrollPhysics(), itemCount: receipts.length,
                  itemBuilder: (context, index) {
                    //receipt is a map of key value pairs. The key is a string and the value is dynamic.
                    final receipt = receipts[index].data() as Map<String, dynamic>?;
                    final referenceNum = receipt?['referenceNum'] ?? '';
                    final status = receipt?['status'] ?? '';
                    final date = receipt?['date'] ?? '';
                    final cost = receipt?['cost'] ?? '';
                    final id = receipt?['id'] ?? '';
                    final time = receipt?['time'] ?? '';
                // ListView of all Receipts ----------------------------------------------------

                    // Each Receipt Card Here ----------------------------------------------------
                    return Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: SizedBox(
                        height: screenSize.screenHeight! * 0.13,
                        /*  GestureDetector to navigate to make the card clickable
                            so navigate to the digital receipt screen */
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DigitalReceipt(
                                  // Pass the receipt data to the digital receipt screen for more details
                                  referenceNum: referenceNum,
                                  status: status,
                                  date: date,
                                  cost: cost,
                                  id: id,
                                  time: time,
                                ),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 15,
                                ),

                                // Status Icon Picture on the card ----------------------------------------------------
                                SvgPicture.asset( status == 'Success' ? "assets/success_icon.svg" : "assets/failed_icon.svg", width: 30, height: 30, ),
                                // Status Icon Picture on the card ----------------------------------------------------
                                
                                const SizedBox(width: 15,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('#$referenceNum',
                                        style: const TextStyle( fontSize: 18, fontWeight: FontWeight.normal)),
                                    Text(' $time',
                                        style: TextStyle( fontSize: 13, fontWeight: FontWeight.normal, color: Colors.grey[600])),
                                  ],
                                ),
                                const Spacer(),
                                
                                // Money spent (Cost) on the card tail ----------------------------------------------------
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Text('-$cost EGP',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          color: status == 'Success' ? Colors.green : Colors.red)),
                                ),
                                // Money spent (Cost) on the card tail ----------------------------------------------------

                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
