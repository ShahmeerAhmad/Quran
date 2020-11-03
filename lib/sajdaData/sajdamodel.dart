class SajdaModel {
  List sajda;
  SajdaModel({this.sajda});

  factory SajdaModel.formJson(Map<String, dynamic> json) {
    Iterable sajdaData = json['data']['ayahs'];
    List<Sajda> listsajda = sajdaData.map((e) => Sajda.fromJson(e)).toList();
    return SajdaModel(sajda: listsajda);
  }
}

class Sajda {
  String revelationType;
  String text;
  int numberInSurah;
  String name;
  Sajda({this.text, this.revelationType, this.numberInSurah, this.name});

  factory Sajda.fromJson(Map<String, dynamic> json) {
    return Sajda(
        text: json['text'],
        numberInSurah: json["numberInSurah"],
        name: json['surah']['name'],
        revelationType: json['surah']['revelationType']);
  }
}
