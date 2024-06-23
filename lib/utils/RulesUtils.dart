import 'package:euro_24_guess/models/Rules.dart';

List<Rules> RulesUtils(){
  List<Rules> list = [];
  list.add(Rules("A, B, C, D", "A", "D", "B", "C"));
  list.add(Rules("A, B, C, E", "A", "E", "B", "C"));
  list.add(Rules("A, B, C, F", "A", "F", "B", "C"));
  list.add(Rules("A, B, D, E", "D", "E", "A", "B"));
  list.add(Rules("A, B, D, F", "D", "F", "A", "B"));
  list.add(Rules("A, B, E, F", "E", "F", "B", "A"));
  list.add(Rules("A, C, D, E", "E", "D", "C", "A"));
  list.add(Rules("A, C, D, F", "F", "D", "C", "A"));
  list.add(Rules("A, C, E, F", "E", "F", "C", "A"));
  list.add(Rules("A, D, E, F", "E", "F", "D", "A"));
  list.add(Rules("B, C, D, E", "E", "D", "B", "C"));
  list.add(Rules("B, C, D, F", "F", "D", "C", "B"));
  list.add(Rules("B, C, E, F", "F", "E", "C", "B"));
  list.add(Rules("B, D, E, F", "F", "E", "D", "B"));
  list.add(Rules("C, D, E, F", "F", "E", "D", "C"));
  return list;
}