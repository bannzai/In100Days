import "dart:math";

T pickRandomElement<T>(List<T> list) {
  final random = Random();
  final i = random.nextInt(list.length);
  return list[i];
}
