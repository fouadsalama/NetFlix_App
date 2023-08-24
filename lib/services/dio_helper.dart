import 'package:dio/dio.dart';

class DioHelper{
static late Dio dio;

  static init(){
     dio = Dio(
       BaseOptions(
         baseUrl: 'https://api.themoviedb.org/3/movie',
           receiveDataWhenStatusError: true,
           headers: {
             'Content-Type' : 'application/json',
           }
       )
     );
   }


   static Future<Response> getData(String url)async{
    return await dio.get(url);
   }


}