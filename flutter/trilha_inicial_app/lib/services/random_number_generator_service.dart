import 'dart:math';

class RandomNumberGeneratorService {
  static int generateRandomNumber(int maxNumber) {
    Random randomNumber = Random();
    return randomNumber.nextInt(maxNumber);
  }
}
