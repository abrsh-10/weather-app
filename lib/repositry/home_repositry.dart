import 'package:weather/Model/data_model.dart';
import 'package:weather/data/network/api_services.dart';
import 'package:weather/res/app_url/app_url.dart';
import 'package:weather/utils/utils.dart';

class HomeReposirty{
  static Future<dynamic> hitApi(String city)async{
    var response=await ApiServices().getApi(Utils.generateWeatherURL(city));
    return response;
  }
}