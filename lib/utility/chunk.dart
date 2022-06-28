import 'dart:math';

List<List<T>> chunk<T>(List<T> list, {required int size}) {
  final chunks = <List<T>>[];
  for (var i = 0; i < list.length; i += size) {
    final chunk = list.sublist(i, min(i + size, list.length));
    chunks.add(chunk);
  }
  return chunks;
}
