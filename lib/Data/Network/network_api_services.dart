import 'dart:convert';
import 'dart:io';

import 'package:mvvm_app/Data/Network/base_api_services.dart';
import 'package:mvvm_app/Data/app_exception.dart';

import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  
  /*Here is Method for GET api response this method is override from an abstract class of BaseApiServices in base_api_services */

  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet Connection');
    }

    return responseJson;
  }

  /*Here is Method for POST api response this method is override from an abstract class of BaseApiServices in base_api_services */

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet Connection');
    }
    return responseJson;
  }

  /*below is switch cases for status. well!, based on the responses it will return the status code*/

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responsejson = jsonDecode(response.body.toString());
        return responsejson;

      case 400:
        throw BadRequestException(response.body.toString());

      case 404:
        throw UnauthorisedException(response.body.toString());

      default:
        throw FetchDataException(
            'Error accoured while communicating with server with status code${response.statusCode.toString()}');
    }
  }
}
