import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scamazon Diagnoser',
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Scamazon Diagnoser'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Scamazon Diagnoser", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
            const SizedBox(height: 20),
            FilledButton(onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const SymptomsPage()),
              );
            }, child: const Text("Start Diagnosis")),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SymptomsPage extends StatefulWidget {
  const SymptomsPage({super.key});

  @override
  State<SymptomsPage> createState() => _SymptomsPageState();
}
String symptom = "Please select a symptom";
class _SymptomsPageState extends State<SymptomsPage> {
  var symptomList = [
    "Please select a symptom",
    "Cough", 
    "Fever",
    "Shortness of Breath",
    "Sore Throat",
    "Loss of Taste",
    "Loss of Smell",
    "Headache",
    "Body Aches",
    "Fatigue",
    "Nausea",
    "Vomiting",
    "Diarrhea",
    "Death"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Enter Symptoms", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
            const SizedBox(height: 20),
            DropdownMenu(
              dropdownMenuEntries: symptomList.map((symptom) {
                return DropdownMenuEntry(
                  value: symptom,
                  label: symptom,
                );
              }).toList(), // Convert symptomList to a list of DropdownMenuEntry widgets
              onSelected: (value) {
                setState(() {
                  symptom = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            FilledButton(onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const ResultsPage()),
              );
            }, child: const Text("Get Results")),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}
class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text ("symptom entered: $symptom"),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}