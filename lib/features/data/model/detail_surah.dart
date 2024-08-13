class DetailSurahModel {
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? tempatTurun;
  String? arti;
  String? deskripsi;
  AudioFull? audioFull;
  List<Ayat>? ayat;
  SurahInfo? suratSelanjutnya;
  dynamic suratSebelumnya;

  DetailSurahModel({
     this.nomor,
     this.nama,
     this.namaLatin,
     this.jumlahAyat,
     this.tempatTurun,
     this.arti,
     this.deskripsi,
     this.audioFull,
     this.ayat,
    this.suratSelanjutnya,
    this.suratSebelumnya,
  });

  factory DetailSurahModel.fromJson(Map<String, dynamic> json) {
    return DetailSurahModel(
      nomor: json['nomor'],
      nama: json['nama'],
      namaLatin: json['namaLatin'],
      jumlahAyat: json['jumlahAyat'],
      tempatTurun: json['tempatTurun'],
      arti: json['arti'],
      deskripsi: json['deskripsi'],
      audioFull: AudioFull.fromJson(json['audioFull']),
      ayat: (json['ayat'] as List).map((i) => Ayat.fromJson(i)).toList(),
      suratSelanjutnya: json['suratSelanjutnya'] != null
          ? SurahInfo.fromJson(json['suratSelanjutnya'])
          : null,
      suratSebelumnya: json['suratSebelumnya'] != null
          ? SurahInfo.fromJson(json['suratSebelumnya'])
          : false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nomor': nomor,
      'nama': nama,
      'namaLatin': namaLatin,
      'jumlahAyat': jumlahAyat,
      'tempatTurun': tempatTurun,
      'arti': arti,
      'deskripsi': deskripsi,
      'audioFull': audioFull?.toJson(),
      'ayat': ayat?.map((i) => i.toJson()).toList(),
      'suratSelanjutnya': suratSelanjutnya?.toJson(),
      'suratSebelumnya': suratSebelumnya?.toJson(),
    };
  }

   bool get isSuratSebelumnyaFalse => suratSebelumnya == null ? false : true;
   bool get isSuratSelanjutnyaaFalse => suratSelanjutnya == null ? false : true;
}

class AudioFull {
  String? audio01;
  String? audio02;
  String? audio03;
  String? audio04;
  String? audio05;

  AudioFull({
    this.audio01,
    this.audio02,
    this.audio03,
    this.audio04,
    this.audio05,
  });

  factory AudioFull.fromJson(Map<String, dynamic> json) {
    return AudioFull(
      audio01: json['01'],
      audio02: json['02'],
      audio03: json['03'],
      audio04: json['04'],
      audio05: json['05'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '01': audio01,
      '02': audio02,
      '03': audio03,
      '04': audio04,
      '05': audio05,
    };
  }
}

class Ayat {
  int? nomorAyat;
  String? teksArab;
  String? teksLatin;
  String? teksIndonesia;
  Audio? audio;

  Ayat({
     this.nomorAyat,
     this.teksArab,
     this.teksLatin,
     this.teksIndonesia,
     this.audio,
  });

  factory Ayat.fromJson(Map<String, dynamic> json) {
    return Ayat(
      nomorAyat: json['nomorAyat'],
      teksArab: json['teksArab'],
      teksLatin: json['teksLatin'],
      teksIndonesia: json['teksIndonesia'],
      audio: Audio.fromJson(json['audio']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nomorAyat': nomorAyat,
      'teksArab': teksArab,
      'teksLatin': teksLatin,
      'teksIndonesia': teksIndonesia,
      'audio': audio?.toJson(),
    };
  }
}

class Audio {
  String? audio01;
  String? audio02;
  String? audio03;
  String? audio04;
  String? audio05;

  Audio({
    this.audio01,
    this.audio02,
    this.audio03,
    this.audio04,
    this.audio05,
  });

  factory Audio.fromJson(Map<String, dynamic> json) {
    return Audio(
      audio01: json['01'],
      audio02: json['02'],
      audio03: json['03'],
      audio04: json['04'],
      audio05: json['05'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '01': audio01,
      '02': audio02,
      '03': audio03,
      '04': audio04,
      '05': audio05,
    };
  }
}

class SurahInfo {
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;

  SurahInfo({
     this.nomor,
     this.nama,
     this.namaLatin,
     this.jumlahAyat,
  });

  factory SurahInfo.fromJson(Map<String, dynamic> json) {
    return SurahInfo(
      nomor: json['nomor'],
      nama: json['nama'],
      namaLatin: json['namaLatin'],
      jumlahAyat: json['jumlahAyat'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nomor': nomor,
      'nama': nama,
      'namaLatin': namaLatin,
      'jumlahAyat': jumlahAyat,
    };
  }
}
