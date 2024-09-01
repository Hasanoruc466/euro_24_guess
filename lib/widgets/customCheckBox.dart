import 'package:country_flags/country_flags.dart';
import 'package:euro_24_guess/models/TeamDetail.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final Teams team;
  final bool isChecked;
  final ValueChanged<bool?> onChanged;

  const CustomCheckbox({
    Key? key,
    required this.team,
    required this.isChecked,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.42,
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.1,
          color: Colors.blue
        ),
        borderRadius: BorderRadius.circular(10),
        color: isChecked ? Colors.blue : null,
            ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
                onTap: () {
                  onChanged(!isChecked);
                },
                child: Container(
                    child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CountryFlag.fromCountryCode(team.code,
                        shape: const Circle()),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      team.name,
                      style: TextStyle(fontSize: 15, color: isChecked ? Colors.white : Color.fromARGB(255, 109, 152, 187)),
                    )
                  ],
                ))),
          ],
        ));
  }
}
