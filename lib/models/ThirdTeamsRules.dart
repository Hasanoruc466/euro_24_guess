class ThirdTeamsRules{
  late String teams;
  late String bVersus;
  late String cVersus;
  late String eVersus;
  late String fVersus;
  
  ThirdTeamsRules(this.teams, this.bVersus, this.cVersus, this.eVersus, this.fVersus);

  @override
  String toString() {
    // TODO: implement toString
    return teams + ' ' + bVersus + ' ' + cVersus + ' ' + eVersus + ' ' + fVersus;
  }
}