import 'dart:developer' show log;

import 'package:dio/dio.dart';

class NetworkingHelper {
  final Dio dio = Dio();

  NetworkingHelper() { 
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options , handler) { 
          return handler.next(options) ; 
        } , 
        onResponse: (response , handler) {
          return handler.next(response) ;  
        },
        onError: (error, handler) {
          return handler.next(error) ; 
        },
      )
    );
  }

  //to get all data
  Future<void> getAllData() async {
    try {
      final response = await dio.get(
        'https://fakestoreapi.com/products/1',
        // we can get one post if we write /products/1 ----> get products with id =1
      );
      log(response.data['id'].toString());
    } catch (e) {
      log(e.toString());
    }
  }

  // add or post data , send data as a map
  Future<void> postData() async {
    try {
      final response = await dio.post(
        'https://jsonplaceholder.typicode.com/posts',
        data: {
          'title': 'Test Post ',
          'body': 'This id First Test Post',
          'userId': 2,
        },
      );
      log(response.data.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  //to delete data with id
  Future<void> deleteData({required int id}) async {
    try {
      final response = await dio.delete(
        'https://fakestoreapi.com/products/$id',
      );
      log(response.data.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
