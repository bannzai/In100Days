import 'package:in_100_days/entity/record.codegen.dart';
import 'package:in_100_days/entity/goal.codegen.dart';

bool isGameOver(List<Record> records) {
  if (records.isEmpty) {
    return true;
  }
  return records.first.createdDateTime.day + 1 >= DateTime.now().day;
}

bool isCongratulation(Goal goal) {
  return goal.createdDateTime.difference(DateTime.now()).inDays >= 100;
}

bool purchasedInToday(Goal goal) {
  if (goal.purchasedProducts.isEmpty) {
    return false;
  }

  final purchaseProduct = goal.purchasedProducts.last;
  return purchaseProduct.purchasedDateTime.day == DateTime.now().day;
}
