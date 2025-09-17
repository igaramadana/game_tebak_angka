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
    mainGame();
  }
}

void mainGame() {
  bool menang = false;

  while (percobaan < maksPercobaan && !menang) {
    _tampilkanStatus();

    int? tebakan = _mintaInputTebakan();
    if (tebakan == null) continue;

    tebakanSebelumnya.add(tebakan);
    percobaan++;

    if (tebakan == angkaRahasia) {
      menang = true;
      tampilkanKemenangan();
    } else {
      beriPetunjuk(tebakan);
    }
  }

  if (!menang) {
    tampilkanKekalahan();
  }

  tampilkanStatistik();
  tanyakanMainLagi();
}

void _tampilkanStatus() {
  print('\n┌───[ Percobaan ${percobaan + 1}/$maksPercobaan ]───');
  if (tebakanSebelumnya.isNotEmpty) {
    print('├─ Tebakan sebelumnya: ${tebakanSebelumnya.join(', ')}');
  }
  print('└─────────────────────────────────────');
}

int? _mintaInputTebakan() {
  stdout.write('🎯 Masukkan tebakan Anda (1-100): ');
  String? input = stdin.readLineSync();

  if (input == null || input.isEmpty) {
    print('❌ Input tidak boleh kosong!');
    return null;
  }

  int? tebakan = int.tryParse(input);
  if (tebakan == null) {
    print('❌ Harap masukkan angka yang valid!');
    return null;
  }

  if (tebakan < 1 || tebakan > 100) {
    print('❌ Angka harus antara 1 dan 100!');
    return null;
  }

  return tebakan;
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

int? mintaInputTebakan() {
  stdout.write('🎯 Masukkan tebakan Anda (1-100): ');
  String? input = stdin.readLineSync();

  if (input == null || input.isEmpty) {
    print('❌ Input tidak boleh kosong!');
    return null;
  }

  int? tebakan = int.tryParse(input);
  if (tebakan == null) {
    print('❌ Harap masukkan angka yang valid!');
    return null;
  }

  if (tebakan < 1 || tebakan > 100) {
    print('❌ Angka harus antara 1 dan 100!');
    return null;
  }

  return tebakan;
}

void beriPetunjuk(int tebakan) {
  if (tebakan < angkaRahasia) {
    print('📈 Terlalu rendah! Coba angka yang lebih tinggi.');
  } else {
    print('📉 Terlalu tinggi! Coba angka yang lebih rendah.');
  }

  int selisih = (tebakan - angkaRahasia).abs();
  if (selisih <= 5) {
    print('💡 Panas sekali! Hampir benar!');
  } else if (selisih <= 15) {
    print('💡 Panas! Mendekati...');
  } else if (selisih <= 30) {
    print('💡 Hangat...');
  } else {
    print('💡 Dingin... masih jauh.');
  }
}

void tampilkanKemenangan() {
  print('\n' + '=' * 50);
  print('🎉 SELAMAT! Anda menang!');
  print('💯 Angka rahasia: $angkaRahasia');
  print('✅ Berhasil dalam $percobaan percobaan');
  print('=' * 50);
}

void tampilkanKekalahan() {
  print('\n' + '=' * 50);
  print('😢 Sayang sekali! Anda kalah...');
  print('🔢 Angka rahasia: $angkaRahasia');
  print('💔 Percobaan habis: $maksPercobaan/$maksPercobaan');
  print('=' * 50);
}

int hitungSelisihTertinggi() {
  int selisihTertinggi = 0;
  for (int i = 1; i < tebakanSebelumnya.length; i++) {
    int selisih = (tebakanSebelumnya[i] - tebakanSebelumnya[i - 1]).abs();
    if (selisih > selisihTertinggi) {
      selisihTertinggi = selisih;
    }
  }
  return selisihTertinggi;
}

void main() {}
