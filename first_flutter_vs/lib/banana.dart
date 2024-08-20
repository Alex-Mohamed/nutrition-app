import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BananaPage extends StatefulWidget {
  const BananaPage({super.key, required this.title});
  final String title;

  @override
  State<BananaPage> createState() => BananaPageState();
}

class BananaPageState extends State<BananaPage> {
String dropdownValue = 'Select option';
String dropdownInfo = '';
  
  void updateScreen(String dropdownValue) {
    if(dropdownValue == 'General Facts') {
      dropdownInfo = 'According to the USDA:\n';
      dropdownInfo += 'Calories: 105\nTotal Fat: 0.4 g\n';
      dropdownInfo += 'Potassium: 422 mg\nTotal Carbohydrates: 27 g\n';
      dropdownInfo += 'Total Protein: 1.3 g';
    } else if (dropdownValue == 'Health Benefits') {
      dropdownInfo = '1. Can help regulate blood sugar levels\n';
      dropdownInfo += '2. Can help with digestion as a good source of fiber and pectin\n';
      dropdownInfo += '3. Can boost energy with abundant carbs, vitamins, and natural sugars\n';
      dropdownInfo += '4. Can combat anemia as a high source of iron\n';
    } else if (dropdownValue == 'Potential Drawbacks') {
      dropdownInfo = '1. Excess potassium can lead to health issues like hyperkalemia\n';
      dropdownInfo += '2. Can be harmful when one\'s kidneys are not fully functional\n';
      dropdownInfo += '3. Could cause allergic reactions such as anaphylaxis\n';
    } else { // 'Select option' chosen, no text on screen
      dropdownInfo = '';
    }
  }
  
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 176, 161, 24),
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
            'images/bananas.webp',
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