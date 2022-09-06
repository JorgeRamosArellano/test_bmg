
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_bmg/models/models.dart';

class HTTP{
  //https://newsapi.org/v2/top-headlines?country=de&category=business&apiKey=API_KEY
  static const String apiKey = '1948ddc971314493b2ec78a36648375d'; 
  static const String url = 'newsapi.org'; 

  static Future<News?> getNewsByCategory(String category) async{
    print('getNewsByCategory');
    print(category);
    final uri = Uri.https(
      url, 
      '/v2/top-headlines',
      {
        'apiKey'    : apiKey,
        'category'  : category,
      },
    );

    final response = await http.get(uri);
    print(response.body);

    if(response.statusCode == 200 ){
      //Tod correcto
      final decodedData = json.decode(response.body);
      return News.fromJson(decodedData);
    }
    return null;
  }

}