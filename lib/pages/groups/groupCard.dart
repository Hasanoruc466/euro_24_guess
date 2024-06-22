import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

class GroupCard extends StatefulWidget {
  final String groupName;
  final List<dynamic> teams;
  final Function(List<dynamic>) onReorder;

  const GroupCard(
      {super.key,
      required this.groupName,
      required this.teams,
      required this.onReorder});

  @override
  State<GroupCard> createState() => _GroupCardState();
}

class _GroupCardState extends State<GroupCard> {
  List<dynamic> _localTeams = [];

  @override
  void initState() {
    super.initState();
    _localTeams = widget.teams;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${widget.groupName} Grubu',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            ReorderableListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: _localTeams.map((team) => _buildTeamTile(team)).toList(),
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (newIndex > oldIndex) {
                    newIndex--;
                  }
                  final items = _localTeams.removeAt(oldIndex);
                  _localTeams.insert(newIndex, items);
                  widget.onReorder(_localTeams);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

    Widget _buildTeamTile(dynamic team) {
    return ListTile(
      key: ValueKey(team['code']), // Her takım için unique bir key oluşturuyoruz
      title: Text(team['name']),
      trailing: Icon(Icons.drag_handle),
      leading: CountryFlag.fromCountryCode(
        team['code'],
        shape: Circle(),
      ),
    );
  }
}


