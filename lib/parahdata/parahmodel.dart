class ParahModel {
  final int parahNumber;
  final List<ParahAyahs> parahAyahs;

  ParahModel({this.parahAyahs, this.parahNumber});

  factory ParahModel.fromJSON(Map<String, dynamic> json) {
    Iterable juzAyahs = json['data']['ayahs'];
    List<ParahAyahs> juzAyahsList =
        juzAyahs.map((e) => ParahAyahs.fromJSON(e)).toList();

    return ParahModel(
        parahAyahs: juzAyahsList, parahNumber: json['data']['number']);
  }
}

class ParahAyahs {
  final String ayahsText;
  final int ayahNumber;
  final String surahName;
  final String revelationType;

  ParahAyahs(
      {this.ayahsText, this.surahName, this.ayahNumber, this.revelationType});

  factory ParahAyahs.fromJSON(Map<String, dynamic> json) {
    return ParahAyahs(
        ayahNumber: json['numberInSurah'],
        ayahsText: json['text'],
        revelationType: json['surah']['revelationType'],
        surahName: json['surah']['name']);
  }
}
