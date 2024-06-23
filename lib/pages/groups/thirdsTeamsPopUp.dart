import 'package:country_flags/country_flags.dart';
import 'package:euro_24_guess/models/TeamDetail.dart';
import 'package:euro_24_guess/pages/finals/last16playoff.dart';
import 'package:flutter/material.dart';

class ThirdsTeamsPopup extends StatefulWidget {
  final List<Teams> teams;
  final List<Teams> firstTeams;
  final List<Teams> secondTeams;

  const ThirdsTeamsPopup({Key? key, required this.teams, required this.firstTeams, required this.secondTeams}) : super(key: key);

  @override
  State<ThirdsTeamsPopup> createState() => _ThirdTeamsPopUpState();
}

class _ThirdTeamsPopUpState extends State<ThirdsTeamsPopup> {
  List<Teams> temp = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("En iyi Üçüncüler"),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.teams.length,
          itemBuilder: (BuildContext context, int index) {
            final item = widget.teams[index];
            return CheckboxListTile(
              title: Text(item.name),
              value: temp.contains(item),
              onChanged: (bool? value) {
                setState(() {
                  if (value != null && value && temp.length < 4) {
                    temp.add(item);
                  } else {
                    temp.remove(item);
                  }
                });
              },
              secondary:
                  CountryFlag.fromCountryCode(item.code, shape: const Circle()),
            );
          },
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {       
             Navigator.pop(context);
          },
          child: const Text('İptal Et'),
        ),
        TextButton(
          onPressed: () {
            if(temp.length == 4){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Last16PlayOff(firstTeams:  widget.firstTeams, secondTeams: widget.secondTeams, thirdTeams: temp)));
            }
          },
          child: const Text('Tamam'),
        ),
      ],
    );
  }
}

Widget _teamsChecboxList(Map<dynamic, dynamic> map) {
  List teams = map.values.toList();
  List<String> temp = [];
  return SizedBox(
    width: double.maxFinite,
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: teams.length,
      itemBuilder: (BuildContext context, int index) {
        final item = teams[index];
        return CheckboxListTile(
          title: Text(item),
          value: temp.contains(item),
          onChanged: (bool? value) {
            if (value != null && value) {
              temp.add(item);
            } else {
              temp.remove(item);
            }
          },
        );
      },
    ),
  );
}
