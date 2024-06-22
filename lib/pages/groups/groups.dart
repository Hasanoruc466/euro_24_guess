import 'package:euro_24_guess/pages/groups/groupCard.dart';
import 'package:euro_24_guess/pages/groups/thirdsTeamsPopUp.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});
  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  final DatabaseReference _firebaseRef =
      FirebaseDatabase.instance.ref("euro24/groups");
  Map<dynamic, dynamic> firstTeams = Map();
  Map<dynamic, dynamic> secondTeams = Map();
  Map<dynamic, dynamic> thirdTeams = Map();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text("Gruplar"),
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: 75.0),
        child: StreamBuilder(
            stream: _firebaseRef.onValue,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data!.snapshot.value != null) {
                final data = snapshot.data!.snapshot.value;
                if (data is Map<dynamic, dynamic>) {
                  Map<dynamic, dynamic> groups =
                      Map<dynamic, dynamic>.from(data);
                  return ListView(
                    children: groups.entries.map((entry) {
                      String groupName = entry.key;
                      List<dynamic> teams =
                          List<dynamic>.from(entry.value['teams']);
                      if (teams.length > 0) {
                        firstTeams[groupName] = teams.first;
                      }

                      if (teams.length > 1) {
                        secondTeams[groupName] = teams[1];
                      }

                      if (teams.length > 2) {
                        thirdTeams[groupName] = teams[2];
                      }
                      return GroupCard(
                        groupName: groupName,
                        teams: teams,
                        onReorder: (List<dynamic> newTeams) {
                          if (newTeams.length > 0) {
                            firstTeams[groupName] = teams.first;
                          }

                          if (newTeams.length > 1) {
                            secondTeams[groupName] = teams[1];
                          }

                          if (newTeams.length > 2) {
                            thirdTeams[groupName] = teams[2];
                          }
                        },
                      );
                    }).toList(),
                  );
                } else {
                  return const Center(child: Text('Unexpected data format'));
                }
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.keyboard_arrow_right_sharp),
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) => ThirdsTeamsPopup(teams: thirdTeams));
        },
      ),
    );
  }
}
