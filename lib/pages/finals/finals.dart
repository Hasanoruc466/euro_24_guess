import 'package:country_flags/country_flags.dart';
import 'package:euro_24_guess/main.dart';
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
          if (selectedTeam.length == 1) {
            Teams champion = selectedTeam.first;
            showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      title: Text('Şampiyon ${champion.name}'),
                      content: const Text(
                        'Tebrikler 2024 Avrupa Futbol Şampiyonasını tamamladınız. Umarım tahmininiz gerçekleşmiştir. Ana Sayfaya dönmek için Devam Et butonuna tıklayınız...',
                        style: TextStyle(fontSize: 12),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyHomePage(
                                      title: ''),
                                ),
                                (Route<dynamic> route) =>
                                    false, // Tüm önceki sayfaları kaldırır
                              );
                            },
                            child: const Text(
                              "Devam Et",
                              style: TextStyle(fontSize: 12),
                            ))
                      ],
                      icon: SizedBox(
                        width: 200, // Bayrağın genişliği
                        height: 150, // Bayrağın yüksekliği
                        child: CountryFlag.fromCountryCode(
                          champion.code,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ));
          } else {
            showDialog(
                context: context,
                builder: (BuildContext context) => Finals(
                    teamVersus: selectedTeam.length == 4
                        ? SemiFinalMatches(selectedTeam)
                        : FinalMatches(selectedTeam)));
          }
        },
      ),
    );
  }
}
