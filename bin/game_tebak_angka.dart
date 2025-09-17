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

  void main() {
    uiHeader();
  }
}

void uiHeader() {
  print('╔══════════════════════════════════════════╗');
  print('║    GAME TEBAK ANGKA BIAR GAK BORING      ║');
  print('║          ====================            ║');
  print('║  Tebak angka antara 1-100 dalam 10x      ║');
  print('║               percobaan                  ║');
  print('╚══════════════════════════════════════════╝');
  print('');
}

void uiStatus() {
  print('\n┌───[ Percobaan ${percobaan + 1}/$maksPercobaan ]───');
  if (tebakanSebelumnya.isNotEmpty) {
    print('├─ Tebakan sebelumnya: ${tebakanSebelumnya.join(', ')}');
  }
  print('└─────────────────────────────────────');
}
