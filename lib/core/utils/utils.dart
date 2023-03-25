import 'dart:math';

class Utils {
  Utils._();
  /**
   * Generates a positive random integer uniformly distributed on the range
   * from [min], inclusive, to [max], exclusive.
   */
  static int next(int min, int max) => min + Random().nextInt(max - min);

  static String bullet = "\u2022";
}