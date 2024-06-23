import 'package:euro_24_guess/models/Rules.dart';
import 'package:euro_24_guess/models/TeamDetail.dart';
import 'package:euro_24_guess/models/TeamVersus.dart';
import 'package:euro_24_guess/utils/RulesUtils.dart';
import 'package:flutter/material.dart';

class Last16PlayOff extends StatefulWidget {
  final List<Teams> firstTeams;
  final List<Teams> secondTeams;
  final List<Teams> thirdTeams;

  const Last16PlayOff(
      {Key? key,
      required this.firstTeams,
      required this.secondTeams,
      required this.thirdTeams})
      : super(key: key);

  @override
  State<Last16PlayOff> createState() => _Last16PlayOffState();
}

class _Last16PlayOffState extends State<Last16PlayOff> {
  String selectedTeam = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Son 16'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                        margin: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedTeam = 'Fenerbahçe';
                            });
                          },
                          child: const Text('Fenerbahçe'),
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              )),
                        ))),
                const Text("vs"),
                Expanded(
                    child: Container(
                        margin: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedTeam = 'Fenerbahçe';
                            });
                          },
                          child: const Text('Fenerbahçe'),
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              )),
                        ))),
              ],
            )
          ],
        ),
      ),
    );
  }
}

List<TeamVersus> matches(
    List<Teams> firstTeams, List<Teams> secondTeams, List<Teams> thirdTeams) {
  List<TeamVersus> list = [];
  String groupStr = thirdTeams.map((team) => team.group).join(', ');
  list.add(TeamVersus("1", firstTeams[0], secondTeams[2]));
  list.add(TeamVersus("2", secondTeams[0], secondTeams[1]));
  list.add(TeamVersus("6", secondTeams[3], secondTeams[4]));
  list.add(TeamVersus("8", firstTeams[3], secondTeams[5]));
  List<Rules> rulesList = RulesUtils();
  Rules? rules = rulesList.firstWhere((rule) => rule.teams == groupStr);
  list.add(TeamVersus("3", firstTeams[1],
      thirdTeams.firstWhere((team) => team.group == rules.bVersus)));
  list.add(TeamVersus("4", firstTeams[2],
      thirdTeams.firstWhere((team) => team.group == rules.cVersus)));
  list.add(TeamVersus("5", firstTeams[5],
      thirdTeams.firstWhere((team) => team.group == rules.fVersus)));
  list.add(TeamVersus("7", firstTeams[4],
      thirdTeams.firstWhere((team) => team.group == rules.eVersus)));
  return list;
}
