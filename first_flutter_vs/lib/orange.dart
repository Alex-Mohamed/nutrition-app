import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrangePage extends StatefulWidget {
  const OrangePage({super.key, required this.title});
  final String title;

  @override
  State<OrangePage> createState() => OrangePageState();
}

class OrangePageState extends State<OrangePage> {
String dropdownValue = 'Select option';
String dropdownInfo = '';
  
  void updateScreen(String dropdownValue) {
    if(dropdownValue == 'General Facts') {
      dropdownInfo = 'According to the USDA:\n';
      dropdownInfo += 'Calories: 45\nTotal Fat: 0.1 g\n';
      dropdownInfo += 'Potassium: 174 mg\nTotal Carbohydrates: 11 g\n';
      dropdownInfo += 'Total Protein: 0.9 g';
    } else if (dropdownValue == 'Health Benefits') {
      dropdownInfo = '1. Helps with hydration as water-rich food\n';
      dropdownInfo += '2. Improves digestion with high fiber amount\n';
      dropdownInfo += '3. Supports immune system with abundant vitamin C\n';
      dropdownInfo += '4. Combat chronic diseases due to antioxidants\n';
    } else if (dropdownValue == 'Potential Drawbacks') {
      dropdownInfo = '1. Do not provide any dietary fat\n';
      dropdownInfo += '2. High in sugar, can heavily impact blood sugar levels\n';
      dropdownInfo += '3. Low in minerals (iron, zinc, copper, etc.)\n';
    } else { // 'Select option' chosen, no text on screen
      dropdownInfo = '';
    }
  }
  
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(253, 186, 113, 23),
        title: Text(
          widget.title,
          style: GoogleFonts.aDLaMDisplay(
            textStyle: const TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
            'images/oranges.jpeg',
            height: 400,
            width: 400,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'What would you like to learn?\t\t\t',
                  style: TextStyle(fontSize: 20),
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_drop_down_circle_sharp),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      updateScreen(dropdownValue); //updates text on screen (dropdownInfo)
                    });
                  },
                  items: const [
                    DropdownMenuItem<String>(
                      value: 'Select option',
                      child: Text('Select option'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'General Facts',
                      child: Text('General Facts'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Health Benefits',
                      child: Text('Health Benefits'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Potential Drawbacks',
                      child: Text('Potential Drawbacks'),
                    ),
                  ],
                ),
              ],
            ),
            Text( //updates depending on dropdown selection
              dropdownInfo,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 20, 
              )
            ),
          ],
        ),
      ),
    );
  }
}