import 'dart:math';

int getRandom(int min, int max) {
  Random random = Random();
  int randomNumber = random.nextInt(max) + min;
  return randomNumber;
}