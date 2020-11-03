class Ayat {
  final String text;
  final int number;
  Ayat({this.text, this.number});

  factory Ayat.fromJSON(Map<String, dynamic> json) {
    return Ayat(text: json['text'], number: json['numberInSurah']);
  }
}
