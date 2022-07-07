import 'package:in_100_days/entity/goal.codegen.dart';

bool isCongratulation(Goal goal) {
  return goal.createdDateTime.difference(DateTime.now()).inDays >= 100;
}
