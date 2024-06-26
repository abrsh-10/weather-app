import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/Model/data_model.dart';
import 'package:weather/repositry/home_repositry.dart';
import 'package:weather/view/home/home_screen.dart';

import '../../res/images/image_assets.dart';
import '../../utils/utils.dart';

class HomeController extends GetxController{

  RxBool isLoading = false.obs;
  RxList<String> cities = RxList([
    'Addis Ababa',
    'Dire Dawa',
    'Mekelle',
    'Gondar',
    'Bahir Dar',
    'Hawassa',
    'Jimma',
    'Dessie',
    'Axum',
    'Lalibela',
  ]);
  Rx<String> chosenCity = "Addis Ababa".obs;
  Rx<DataModel?> model = Rx<DataModel?>(null);
  Rx<Hours?> hours= Rx<Hours?>(null);
  Rx<int> currentIndex=0.obs;
  RxBool animator=false.obs;

  int getCurrentIndex() => currentIndex.value;
  bool compareIndex(int index) => index==currentIndex.value;
  String getHour(int index) => Utils.formateTimeWithout(model.value!.days![0].hours![index].datetime);
  String getImage(int index)=>  Utils.imageMap[model.value!.days![0].hours![index].conditions.toString()]==null ? ImageAssets.nightStarRain : Utils.imageMap[model.value!.days![0].hours![index].conditions.toString()]!;
  String getAddress()=>'${model.value!.address.toString()}, Ethiopia';
  String getCondition() =>hours.value!.conditions.toString();
  String getCurrentTemp()=>hours.value!.temp.toInt().toString();
  String getFeelLike()=>hours.value!.feelslike.toString();
  String getCloudOver()=>hours.value!.cloudcover.toInt().toString();
  String getWindSpeed()=>hours.value!.windspeed.toInt().toString();
  String getHumidity()=>hours.value!.humidity.toInt().toString();

  getData(){
    isLoading.value = true;
    HomeReposirty.hitApi(chosenCity.value).then((value) {
      model.value=DataModel.fromJson(value);
      for(int i=0;i<model.value!.days![0].hours!.length;i++){
        if(Utils.checkTime(model.value!.days![0].hours![i].datetime)){
          hours.value=model.value!.days![0].hours![i];
          currentIndex.value=i;
          break;
      }
      }
      isLoading.value = false;
      Get.to(const HomeScreen());
    });
  }

  setChosenCity(String city){
    chosenCity.value = city;
    getData();
  }
  setHour(int index){
    Timer(Duration(milliseconds: 100),() => animator.value=true,);
    currentIndex.value=index;
    hours.value=model.value!.days![0].hours![index];
    Timer(Duration(milliseconds: 100),() => animator.value=false,);
  }

}