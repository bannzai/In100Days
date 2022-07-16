import '../../entity/record.codegen.dart';

bool isGameOver(List<Record> records) {
  if (records.isEmpty) {
    return true;
  }
  return records.first.createdDateTime.day + 1 >= DateTime.now().day;
}
