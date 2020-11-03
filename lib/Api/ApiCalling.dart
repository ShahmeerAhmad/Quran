import 'package:http/http.dart' as http;
import 'package:quran/parahdata/parahmodel.dart';
import 'package:quran/sajdaData/sajdamodel.dart';
import 'dart:convert' as convert;
import 'package:quran/surahData/surahmodel.dart';

class ApiCalling {
  Future<SurahData> getSurahs() async {
    String url = "http://api.alquran.cloud/v1/quran/quran-uthmani";

    var response = await http.get(url);
    if (response.statusCode == 200) {
      return SurahData.fromJson(convert.jsonDecode(response.body));
    } else {
      print("Failed to load");
    }
  }

  Future<ParahModel> getParahs(int index) async {
    String url = "http://api.alquran.cloud/v1/juz/$index/quran-uthmani";

    final response = await http.get(url);
    if (response.statusCode == 200) {
      return ParahModel.fromJSON(convert.jsonDecode(response.body));
    } else {
      print("failed to load");
    }
  }

  Future<SajdaModel> getSajda() async {
    String url = "http://api.alquran.cloud/v1/sajda/quran-uthmani";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return SajdaModel.formJson(convert.jsonDecode(response.body));
    } else {
      print("failed to load");
    }
  }
}
