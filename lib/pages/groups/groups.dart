import 'package:euro_24_guess/models/TeamDetail.dart';
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
  List<Teams> firstTeams = [];
  List<Teams> secondTeams = [];
  List<Teams> thirdTeams = [];
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
                        try {
                          var existingGroup = firstTeams
                              .firstWhere((team) => team.group == groupName);
                          existingGroup.update(teams.first);
                        } catch (e) {
                          firstTeams.add(Teams(teams.first, groupName));
                        }
                      }

                      if (teams.length > 1) {
                        try {
                          var existingGroup = secondTeams
                              .firstWhere((team) => team.group == groupName);
                          existingGroup.update(teams[1]);
                        } catch (e) {
                          secondTeams.add(Teams(teams[1], groupName));
                        }
                      }

                      if (teams.length > 2) {
                        try {
                          var existingGroup = thirdTeams
                              .firstWhere((team) => team.group == groupName);
                          existingGroup.update(teams[2]);
                        } catch (e) {
                          thirdTeams.add(Teams(teams[2], groupName));
                        }
                      }
                      return GroupCard(
                        groupName: groupName,
                        teams: teams,
                        onReorder: (List<dynamic> newTeams) {
                          if (teams.length > 0) {
                            try {
                              var existingGroup = firstTeams.firstWhere(
                                  (team) => team.group == groupName);
                              existingGroup.update(teams.first);
                            } catch (e) {
                              firstTeams.add(Teams(teams.first, groupName));
                            }
                          }

                          if (teams.length > 1) {
                            try {
                              var existingGroup = secondTeams.firstWhere(
                                  (team) => team.group == groupName);
                              existingGroup.update(teams[1]);
                            } catch (e) {
                              secondTeams.add(Teams(teams[1], groupName));
                            }
                          }

                          if (teams.length > 2) {
                            try {
                              var existingGroup = thirdTeams.firstWhere(
                                  (team) => team.group == groupName);
                              existingGroup.update(teams[2]);
                            } catch (e) {
                              thirdTeams.add(Teams(teams[2], groupName));
                            }
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
          showDialog(
              context: context,
              builder: (BuildContext context) => ThirdsTeamsPopup(
                    teams: thirdTeams,
                    firstTeams: firstTeams,
                    secondTeams: secondTeams,
                  ));
        },
      ),
    );
  }
}
