import 'dart:math';

class Utils {
  /**
   * Generates a positive random integer uniformly distributed on the range
   * from [min], inclusive, to [max], exclusive.
   */
  static int next(int min, int max) => min + Random().nextInt(max - min);
}