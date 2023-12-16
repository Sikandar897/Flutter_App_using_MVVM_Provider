
import 'package:mvvm_app/Data/Network/base_api_services.dart';
import 'package:mvvm_app/Data/Network/network_api_services.dart';
import 'package:mvvm_app/Resources/app_urls.dart';

//here we are handling api response already defined in network as baseapi services and networkApi services

class AuthRepository {
BaseApiServices apiServices = NetworkApiServices();

//here is code for hitting login api

Future<dynamic> loginAPi(dynamic data) async {
  try{
    dynamic response = await apiServices.getPostApiResponse(AppUrl.loginUrl, data);
    return response;
  }
  catch(e){
    rethrow;
  }
}

//here is code for hitting Register Api

Future<dynamic> signUpAPi(dynamic data) async {
  try{
    dynamic response = await apiServices.getPostApiResponse(AppUrl.registerUrl, data);
    return response;
  }
  catch(e){
    rethrow;
  }
}
}