import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplePage extends StatefulWidget {
  const ApplePage({super.key, required this.title});
  final String title;

  @override
  State<ApplePage> createState() => ApplePageState();
}

class ApplePageState extends State<ApplePage> {
String dropdownValue = 'Select option';
String dropdownInfo = '';
  
  void updateScreen(String dropdownValue) {
    if(dropdownValue == 'General Facts') {
      dropdownInfo = 'According to the USDA:\n';
      dropdownInfo += 'Calories: 95\nTotal Fat: 0.3 g\n';
      dropdownInfo += 'Potassium: 195 mg\nTotal Carbohydrates: 25 g\n';
      dropdownInfo += 'Total Protein: 0.5 g';
    } else if (dropdownValue == 'Health Benefits') {
      dropdownInfo = '1. High in fiber and water, increases "fullness"\n';
      dropdownInfo += '2. Linked to a lower chance of heart disease (due to soluble fiber)\n';
      dropdownInfo += '3. Linked to a lower chance of diabetes (due to polyphenol quercetin)\n';
      dropdownInfo += '4. Could combat airway inflammation related to asthma\n';
    } else if (dropdownValue == 'Potential Drawbacks') {
      dropdownInfo = '1. Could damage teeth due to acidic nature\n';
      dropdownInfo += '2. Could cause fluctuation in blood sugar levels\n';
      dropdownInfo += '3. Side effects of excessive consumption include bloating and constipation\n';
    } else { // 'Select option' chosen, no text on screen
      dropdownInfo = '';
    }
  }
  
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 186, 51, 23),
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
            'images/apple.webp',
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
            Text(
              dropdownInfo,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 20, 
              )
            ), //should update depending on dropdown selection
          ],
        ),
      ),
    );
  }
}