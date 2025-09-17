import 'dart:io';
import 'dart:math';

class GameTebakAngka {
  final int angkaRahasia;
  int percobaan;
  final int maxPercobaan;
  final List<int> tebakanSebelumnya = [];

  GameTebakAngka({int batasAtas = 100, int maksPercobaan = 10})
    : angkaRahasia = Random().nextInt(batasAtas) + 1,
      percobaan = 0,
      maxPercobaan = maksPercobaan;
}
