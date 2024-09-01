import 'package:euro_24_guess/models/TeamDetail.dart';
import 'package:euro_24_guess/models/TeamVersus.dart';
import 'package:euro_24_guess/utils/RulesUtils.dart';
import 'package:euro_24_guess/widgets/customCheckBox.dart';
import 'package:flutter/material.dart';

class Finals extends StatefulWidget {
  final List<TeamVersus> teamVersus;

  const Finals({Key? key, required this.teamVersus}) : super(key: key);

  @override
  State<Finals> createState() => _FinalsState();
}

class _FinalsState extends State<Finals> {
  List<Teams> selectedTeam = [];
  List<TeamVersus> _teamVersus = [];
  String _finalName = "";
  @override
  void initState() {
    super.initState();
    _teamVersus = widget.teamVersus;
    switch (_teamVersus.length) {
      case 1:
        _finalName = "Final";
        break;
      case 2:
        _finalName = "Yarı Final";
        break;
      default:
        _finalName = "Çeyrek Final";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_finalName),
      ),
       body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _teamVersus
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
              builder: (BuildContext context) => Finals(teamVersus: selectedTeam.length == 4 ? SemiFinalMatches(selectedTeam) : FinalMatches(selectedTeam)));
        },
      ),
    );
  }
}
