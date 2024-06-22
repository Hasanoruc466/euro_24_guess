import 'dart:async';

import 'package:euro_24_guess/pages/groups/groups.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EURO 2024 Tahmin Oyunu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final firebaseRef = FirebaseDatabase.instance.ref("Grup A");

  void _onPressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const GroupsPage()));
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeigth = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/euro_24_logo.jpg'),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("EURO 24 Tahmin Oyunu", style: TextStyle(fontSize: 20))
            ),
            const Padding(padding: EdgeInsets.all(16.0), child: Text("Hoşgeldiniz", style: TextStyle(fontSize: 20))),
            Container(
              margin: const EdgeInsets.all(10),
              width: screenWidth * 0.4,
              height: screenHeigth * 0.08,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 104, 155, 243),
                borderRadius: BorderRadius.circular(20.0)
              ),
              child: ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(onPressed: _onPressed, child: const Text('Başla', style: TextStyle(fontSize: 14, letterSpacing: 2, color: Color.fromARGB(255, 192, 243, 52))))
              ],
            ),
            )
          ],
        ),
      ),
     
    );
  }
}
