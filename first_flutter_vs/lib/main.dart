import 'package:first_flutter_vs/banana.dart';
import 'package:first_flutter_vs/apple.dart';
import 'package:first_flutter_vs/orange.dart';
import 'package:first_flutter_vs/strawberry.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nutrition App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int likes = 0;
  int dislikes = 0;

  void __incrementLikes() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      likes++;
    });
  }

  void _incrementDislikes() {
    setState(() {
      dislikes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.

        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.thumb_up),
            iconSize: 20,
            onPressed: __incrementLikes,
            color: Colors.green,
            tooltip: 'Like',
          ),
          
          IconButton(
            icon: const Icon(Icons.thumb_down),
            iconSize: 20,
            onPressed: _incrementDislikes,
            color: Colors.red,
            tooltip: 'Dislike',
          ),
        ],

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
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Welcome to the nutrition app! Click on a food item below to learn more about its nutritional info.',
              style: GoogleFonts.sahitya(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 200,
                  width: 200,
                  child: ElevatedButton(
                    child:
                      Image.asset(
                        'images/bananas.webp',
                        width: 150,
                        height: 150,
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const BananaPage(title: 'Bananas')));
                      },
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: 200,
                  child: ElevatedButton(
                    child:
                      Image.asset(
                        'images/apple.webp',
                        width: 125,
                        height: 125,
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ApplePage(title: 'Apples')));
                      },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 200,
                  width: 200,
                  child: ElevatedButton(
                    child: 
                      Image.asset(
                        'images/oranges.jpeg',
                        width: 150,
                        height: 150,
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const OrangePage(title: 'Oranges')));
                      },
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: 200,
                  child: ElevatedButton(
                    child:
                      Image.asset(
                        'images/strawberries.jpeg',
                        width: 150,
                        height: 150,
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const StrawberryPage(title: 'Strawberries')));
                      }
                  ),
                ),
              ] 
            ),
            Row(
              children: [
                Text(
                  'Number of Likes: ',
                  style: GoogleFonts.sahitya(
                    textStyle: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  '$likes',
                  style: GoogleFonts.sahitya(
                    textStyle: const TextStyle(
                      fontSize: 20,
                    )
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text (
                  'Number of Dislikes: ',
                  style: GoogleFonts.sahitya(
                    textStyle: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  '$dislikes',
                  style: GoogleFonts.sahitya(
                    textStyle: const TextStyle(
                      fontSize: 20,
                    )
                  )
                  ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.teal,
    );
  }
}