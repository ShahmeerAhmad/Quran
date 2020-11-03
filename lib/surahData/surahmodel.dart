import 'package:quran/surahData/ayat.dart';

class SurahData {
  List<Surah> surahs;
  SurahData({this.surahs});
  factory SurahData.fromJson(Map<String, dynamic> jsondata) {
    Iterable surahlist = jsondata['data']['surahs'];
    List<Surah> surahsList = surahlist.map((i) => Surah.fromJSON(i)).toList();
    return SurahData(surahs: surahsList);
  }
}

class Surah {
  final int number;

  final String name;
  final String englishName;
  final String englishNameTranslation;
  final String revelationType;
  final List<Ayat> ayahs;

  Surah(
      {this.number,
      this.revelationType,
      this.name,
      this.ayahs,
      this.englishName,
      this.englishNameTranslation});

  factory Surah.fromJSON(Map<String, dynamic> json) {
    Iterable ayahs = json['ayahs'];
    List<Ayat> ayahsList = ayahs.map((e) => Ayat.fromJSON((e))).toList();

    return Surah(
        name: json['name'],
        number: json['number'],
        englishName: json['englishName'],
        revelationType: json['revelationType'],
        englishNameTranslation: json['englishNameTranslation'],
        ayahs: ayahsList);
  }
}
