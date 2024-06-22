import 'package:country_flags/country_flags.dart';
import 'package:euro_24_guess/models/TeamDetail.dart';
import 'package:flutter/material.dart';

class ThirdsTeamsPopup extends StatefulWidget {
  final Map<dynamic, dynamic> teams;

  const ThirdsTeamsPopup({Key? key, required this.teams}) : super(key: key);

  @override
  State<ThirdsTeamsPopup> createState() => _ThirdTeamsPopUpState();
}

class _ThirdTeamsPopUpState extends State<ThirdsTeamsPopup> {
  late List<Teams> teams;
  List<Teams> temp = [];
  @override
  void initState() {
    super.initState();
    teams = widget.teams.values.map((e) => Teams(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("En iyi Üçüncüler"),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: teams.length,
          itemBuilder: (BuildContext context, int index) {
            final item = teams[index];
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
                  CountryFlag.fromCountryCode(item.code, shape: Circle()),
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
              Navigator.pop(context);
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
            print(temp.contains(item));
          },
        );
      },
    ),
  );
}
