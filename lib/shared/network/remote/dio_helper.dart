import 'package:dio/dio.dart';

class DioHelper
{
  static Dio? dio;
//base url : https://newsapi.org/
//method url : v2/top-headlines?
// country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
//https://newsapi.org/v2/everything?q=tesla&from=2024-01-05&sortBy=publishedAt&apiKey=39c82b77c8834853b819143d03ba7243

  //https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=39c82b77c8834853b819143d03ba7243
  //init the dio
  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );


  }

  //get data

 static Future<Response?> getData({
    required String url,
  required Map <String,dynamic>query,


})async
{

return await dio?.get(url,queryParameters:query, );



}



}