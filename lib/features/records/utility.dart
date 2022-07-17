import 'package:in_100_days/entity/record.codegen.dart';
import 'package:in_100_days/entity/goal.codegen.dart';

bool isGameOver(List<Record> records) {
  if (records.isEmpty) {
    return false;
  }
  return records.first.createdDateTime.day < DateTime.now().day;
}

bool isCongratulation(Goal goal) {
  return goal.createdDateTime.difference(DateTime.now()).inDays >= 100;
}

bool purchasedInToday(Goal goal) {
  if (goal.purchasedProducts.isEmpty) {
    return false;
  }

  return isSameDay(
      goal.purchasedProducts.last.purchasedDateTime, DateTime.now());
}

bool isSameDay(DateTime lhs, DateTime rhs) =>
    lhs.year == rhs.year && lhs.month == rhs.month && lhs.day == rhs.day;
