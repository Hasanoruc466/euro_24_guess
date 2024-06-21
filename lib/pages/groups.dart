
import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';


class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});
  @override
  State<GroupsPage> createState() => _GroupsPageState();

}
final firebaseRef = FirebaseDatabase.instance.ref("Grup A");

class _GroupsPageState extends State<GroupsPage>{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(""),
      ),
      body: Column(children: [
        Expanded(child: FirebaseAnimatedList(query: firebaseRef, itemBuilder: (context, snapshot, index, animation) {
          return Column(children: [
            Card(
            child: Text(snapshot.child("1").value.toString()),
          ),
          Checkbox(value: false, onChanged: (e) {print(e);})
          ],);
        }))
      ],)
    );
  }
}