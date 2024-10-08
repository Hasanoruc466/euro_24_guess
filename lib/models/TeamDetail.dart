class Teams {
  late String name;
  late String code;
  late String group;

  Teams(dynamic team, this.group){
    this.name = team["name"];
    this.code = team["code"];
  }

  void update(dynamic team){
    this.name = team["name"];
    this.code = team["code"];
  }

  void setGroup(String group){
    this.group = group;
  }

  String getName() {
    return this.name;
  }

  @override
  String toString() {
    // TODO: implement toString
    return group + ": " + code + "-" + name;
  }
}