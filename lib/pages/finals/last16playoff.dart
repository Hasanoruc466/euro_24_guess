import 'package:country_flags/country_flags.dart';
import 'package:euro_24_guess/models/ThirdTeamsRules.dart';
import 'package:euro_24_guess/models/TeamDetail.dart';
import 'package:euro_24_guess/models/TeamVersus.dart';
import 'package:euro_24_guess/pages/finals/finals.dart';
import 'package:euro_24_guess/utils/RulesUtils.dart';
import 'package:euro_24_guess/widgets/customCheckBox.dart';
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
  List<Teams> selectedTeam = [];
  List<TeamVersus> _matches = [];

  @override
  void initState() {
    super.initState();
    _matches =
        matches(widget.firstTeams, widget.secondTeams, widget.thirdTeams);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Son 16'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _matches
              .map((match) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomCheckbox(
                          team: match.firstTeam,
                          isChecked: selectedTeam.contains(match.firstTeam),
                          onChanged: (bool? value) {
                            setState(() {
                              if (value != null && value) {
                                match.firstTeam.setGroup(match.matchName);
                                selectedTeam.add(match.firstTeam);
                                selectedTeam.remove(match.secondTeam);
                              }
                            });
                          }),
                      const Text("vs"),
                      CustomCheckbox(
                          team: match.secondTeam,
                          isChecked: selectedTeam.contains(match.secondTeam),
                          onChanged: (bool? value) {
                            setState(() {
                              if (value != null && value) {
                                match.secondTeam.setGroup(match.matchName);
                                selectedTeam.add(match.secondTeam);
                                selectedTeam.remove(match.firstTeam);
                              }
                            });
                          }),
                    ],
                  ))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.keyboard_arrow_right_sharp),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => Finals(teamVersus: QuarterFinalMatches(selectedTeam)));
        },
      ),
    );
  }
}

List<TeamVersus> matches(
    List<Teams> firstTeams, List<Teams> secondTeams, List<Teams> thirdTeams) {
  List<TeamVersus> list = [];

  if (firstTeams.length < 6 || secondTeams.length < 6 || thirdTeams.isEmpty) {
    print(
        'Error: One or more team lists do not have the required number of elements.');
    return list;
  }

  List<String> groupNames = thirdTeams.map((team) => team.group).toList();
  groupNames.sort();
  String groupStr = groupNames.join(', ');
  list.add(TeamVersus("1", firstTeams[0], secondTeams[2]));
  list.add(TeamVersus("2", secondTeams[0], secondTeams[1]));
  list.add(TeamVersus("6", secondTeams[3], secondTeams[4]));
  list.add(TeamVersus("8", firstTeams[3], secondTeams[5]));

  List<ThirdTeamsRules> rulesList = RulesUtils();
  ThirdTeamsRules? rules = rulesList.firstWhere(
    (rule) => rule.teams == groupStr,
    orElse: () => ThirdTeamsRules("", "", "", "", ""),
  );

  if (rules.teams == "") {
    print('Error: No matching rules found.');
    return list;
  }

  Teams? bTeam = thirdTeams.firstWhere(
    (team) => team.group == rules.bVersus,
    orElse: () => Teams(null, ""),
  );
  Teams? cTeam = thirdTeams.firstWhere(
    (team) => team.group == rules.cVersus,
    orElse: () => Teams(null, ""),
  );
  Teams? fTeam = thirdTeams.firstWhere(
    (team) => team.group == rules.fVersus,
    orElse: () => Teams(null, ""),
  );
  Teams? eTeam = thirdTeams.firstWhere(
    (team) => team.group == rules.eVersus,
    orElse: () => Teams(null, ""),
  );

  if (bTeam.group != "") list.add(TeamVersus("3", firstTeams[1], bTeam));
  if (cTeam.group != "") list.add(TeamVersus("4", firstTeams[2], cTeam));
  if (fTeam.group != "") list.add(TeamVersus("5", firstTeams[5], fTeam));
  if (eTeam.group != "") list.add(TeamVersus("7", firstTeams[4], eTeam));

  return list;
}
