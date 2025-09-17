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

void tampilkanStatistik() {
  print('\n📊 STATISTIK PERMAINAN:');
  print('├─ Total percobaan: $percobaan');
  print('├─ Tebakan: ${tebakanSebelumnya.join(' → ')}');

  if (tebakanSebelumnya.length > 1) {
    int selisihTertinggi = hitungSelisihTertinggi();
    print('├─ Selisih tertinggi: $selisihTertinggi');
  }
}

void tanyakanMainLagi() {
  print('\n' + '─' * 40);
  stdout.write('🔄 Main lagi? (y/n): ');
  String? jawaban = stdin.readLineSync()?.toLowerCase();

  if (jawaban == 'y' || jawaban == 'ya') {
    print('\n' * 3);
    GameTebakAngka().main();
  } else {
    print('\n🙏 Terima kasih sudah bermain!');
    print('👋 Sampai jumpa lagi!');
  }
}
