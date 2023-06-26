// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Classes/Colors.dart';
import 'package:flutter_application_1/Customizable/Template.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController fontSizeController = TextEditingController();
  FontStyle? fontStyle = Template.fontStyle;
  TextEditingController logoWidthController = TextEditingController();
  TextEditingController logoHeightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    fontSizeController.text = Template.font.toString();
    logoWidthController.text = Template.logoWidth.toString();
    logoHeightController.text = Template.logoHeight.toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: FloatingActionButton(
              onPressed: () { Navigator.pop(context); },
              backgroundColor: Colors.indigoAccent,
              mini: true, 
              child: const Icon(Icons.arrow_back_ios_new, color: Colors.white,),
            ),
          ),

      ),
      backgroundColor: AppColors.primaryColor,
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 30),
              GradientText(
                'Settings',
                colors: const [
                  Colors.indigo,
                  Colors.indigoAccent,
                  Colors.blueAccent,
                ],
                style: const TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 1,
                color: Colors.indigo,
              ),
            ],
          ),
          const SizedBox(height: 50),
          // ----------------------------------------- Edit Goes Here (Font/Logo) -------------------------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Font Size',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 20),
              // FONT SIZE TEXT FIELD ------------------------------------------------------------
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 35,
                child: TextField(
                  controller: fontSizeController,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.indigo,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.indigo)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.indigo)),
                    ),
                  
                  onChanged: (value) {
                    setState(() {
                      Template.font = double.parse(fontSizeController.text);
                    });
                  },
                ),
              ),
              // FONT SIZE TEXT FIELD ------------------------------------------------------------
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Font Style',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 20),
              
              // FONT STYLE RADIO BUTTONS -> ------------------------------------------------------------
              Row(
                children: [
                  Radio<FontStyle>(
                    value: FontStyle.normal,
                    groupValue: fontStyle,
                    activeColor: Colors.indigo,
                    onChanged: (value) {
                      setState(() {
                        fontStyle = value;
                        Template.fontStyle = fontStyle!;
                      });
                    },
                  ),
                  Text('Normal'),
                ],
              ),
              Row(
                children: [
                  Radio<FontStyle>(
                    value: FontStyle.italic,
                    groupValue: fontStyle,
                    activeColor: Colors.indigo,
                    onChanged: (value) {
                      setState(() {
                        fontStyle = value;
                        Template.fontStyle = fontStyle!;
                      });
                    },
                  ),
                  Text('Italic'),
                ],
              ),
            ],
          ),
          // FONT STYLE RADIO BUTTONS <- ------------------------------------------------------------

          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Logo Size',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 20),
              
              // LOGO SIZE TEXT FIELDS -> ------------------------------------------------------------
              Container(
                width: 80,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.indigo,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  controller: logoWidthController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.indigo)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.indigo)),
                    hintText: 'Width'
                  ),
                  onChanged: (value) {
                    setState(() {
                      Template.logoWidth = double.parse(logoWidthController.text);
                    });
                  },
                ),
              ),
              SizedBox(width: 10),
               Container(
                width: 80,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.indigo,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  controller: logoHeightController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.indigo)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.indigo)),
                    hintText: 'Height'
                  ),
                  onChanged: (value) {
                    setState(() {
                      Template.logoHeight = double.parse(logoHeightController.text);
                    });
                  },
                ),
              ),
              // LOGO SIZE TEXT FIELDS <- ------------------------------------------------------------
            ],
          ),
        ],
      ),
    );
  }
}
