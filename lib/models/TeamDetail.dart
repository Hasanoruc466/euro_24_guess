class Teams {
  late String name;
  late String code;

  Teams(dynamic team){
    this.name = team["name"];
    this.code = team["code"];
  }

  @override
  String toString() {
    // TODO: implement toString
    return code + "-" + name;
  }
}