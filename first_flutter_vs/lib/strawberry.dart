import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StrawberryPage extends StatefulWidget {
  const StrawberryPage({super.key, required this.title});
  final String title;

  @override
  State<StrawberryPage> createState() => StrawberryPageState();
}

class StrawberryPageState extends State<StrawberryPage> {
String dropdownValue = 'Select option';
String dropdownInfo = '';
  
  void updateScreen(String dropdownValue) {
    if(dropdownValue == 'General Facts') {
      dropdownInfo = 'According to the USDA:\n';
      dropdownInfo += 'Calories: 53\nTotal Fat: 0.3 g\n';
      dropdownInfo += 'Potassium: 254 mg\nTotal Carbohydrates: 12.7 g\n';
      dropdownInfo += 'Total Protein: 1.1 g';
    } else if (dropdownValue == 'Health Benefits') {
      dropdownInfo = '1. Helps prevent skin damage with anti-inflammatory effects\n';
      dropdownInfo += '2. Can reduce pain and swelling in joints\n';
      dropdownInfo += '3. Lowers risk of cardiovascular disease\n';
      dropdownInfo += '4. May slow growth of cancer cells (with antioxidants)\n';
    } else if (dropdownValue == 'Potential Drawbacks') {
      dropdownInfo = '1. Lower in calories (for those with high caloric needs)\n';
      dropdownInfo += '2. Low in vitamins other than vitamin C\n';
      dropdownInfo += '3. Low in protein to balance carbohydrate consumption\n';
    } else { // 'Select option' chosen, no text on screen
      dropdownInfo = '';
    }
  }
  
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(252, 200, 45, 18),
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
            'images/strawberries.jpeg',
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