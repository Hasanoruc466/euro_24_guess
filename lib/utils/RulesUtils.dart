import 'package:euro_24_guess/models/TeamDetail.dart';
import 'package:euro_24_guess/models/ThirdTeamsRules.dart';
import 'package:euro_24_guess/models/TeamVersus.dart';

List<ThirdTeamsRules> RulesUtils(){
  List<ThirdTeamsRules> list = [];
  list.add(ThirdTeamsRules("A, B, C, D", "A", "D", "B", "C"));
  list.add(ThirdTeamsRules("A, B, C, E", "A", "E", "B", "C"));
  list.add(ThirdTeamsRules("A, B, C, F", "A", "F", "B", "C"));
  list.add(ThirdTeamsRules("A, B, D, E", "D", "E", "A", "B"));
  list.add(ThirdTeamsRules("A, B, D, F", "D", "F", "A", "B"));
  list.add(ThirdTeamsRules("A, B, E, F", "E", "F", "B", "A"));
  list.add(ThirdTeamsRules("A, C, D, E", "E", "D", "C", "A"));
  list.add(ThirdTeamsRules("A, C, D, F", "F", "D", "C", "A"));
  list.add(ThirdTeamsRules("A, C, E, F", "E", "F", "C", "A"));
  list.add(ThirdTeamsRules("A, D, E, F", "E", "F", "D", "A"));
  list.add(ThirdTeamsRules("B, C, D, E", "E", "D", "B", "C"));
  list.add(ThirdTeamsRules("B, C, D, F", "F", "D", "C", "B"));
  list.add(ThirdTeamsRules("B, C, E, F", "F", "E", "C", "B"));
  list.add(ThirdTeamsRules("B, D, E, F", "F", "E", "D", "B"));
  list.add(ThirdTeamsRules("C, D, E, F", "F", "E", "D", "C"));
  return list;
}

List<TeamVersus> QuarterFinalMatches(List<Teams> teams){
  List<TeamVersus> list = [];
  Teams firstTeam = teams.firstWhere((team) => team.group == "3");
  Teams secondTeam = teams.firstWhere((team) => team.group == "1");
  Teams firstTeam1 = teams.firstWhere((team) => team.group == "5");
  Teams secondTeam1 = teams.firstWhere((team) => team.group == "6");
  Teams firstTeam2 = teams.firstWhere((team) => team.group == "7");
  Teams secondTeam2 = teams.firstWhere((team) => team.group == "8");
  Teams firstTeam3 = teams.firstWhere((team) => team.group == "4");
  Teams secondTeam3 = teams.firstWhere((team) => team.group == "2");
  list.add(TeamVersus("1", firstTeam, secondTeam));
  list.add(TeamVersus("2", firstTeam1, secondTeam1));
  list.add(TeamVersus("3", firstTeam2, secondTeam2));
  list.add(TeamVersus("4", firstTeam3, secondTeam3));
  return list;
}

List<TeamVersus> SemiFinalMatches(List<Teams> teams){
  List<TeamVersus> list = [];
  Teams firstTeam = teams.firstWhere((team) => team.group == "1");
  Teams secondTeam = teams.firstWhere((team) => team.group == "2");
  Teams firstTeam1 = teams.firstWhere((team) => team.group == "3");
  Teams secondTeam1 = teams.firstWhere((team) => team.group == "4");
  list.add(TeamVersus("1", firstTeam, secondTeam));
  list.add(TeamVersus("2", firstTeam1, secondTeam1));
  return list;
}

List<TeamVersus> FinalMatches(List<Teams> teams){
  List<TeamVersus> list = [];
  Teams firstTeam = teams.firstWhere((team) => team.group == "1");
  Teams secondTeam = teams.firstWhere((team) => team.group == "2");
  list.add(TeamVersus("1", firstTeam, secondTeam));
  return list;
}