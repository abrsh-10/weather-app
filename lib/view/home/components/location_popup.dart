import 'package:flutter/material.dart';
import 'package:weather/view_model/controllers/home_controller.dart';

Widget LocationPopUp(BuildContext context , HomeController controller){
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    backgroundColor: Colors.white,
    scrollable: true,
    title: Center(child: Text("Choose a city",style:TextStyle(fontSize: 20))),
    titlePadding: EdgeInsets.only(top: 15),
    contentTextStyle: TextStyle(color: Colors.black),
    contentPadding: EdgeInsets.only(top: 10),
    content: Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.4,
      padding: EdgeInsets.only(left:10,right: 10),
      child: ScrollbarTheme(
        data: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
              return Colors.blue[200]!;
            },
          ),
        ),
        child: Scrollbar(
          thumbVisibility: true,
          thickness: 5,
          radius: Radius.circular(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                for(int i = 0 ; i < controller.cities.length ; i++)
                  Padding(
                      padding: EdgeInsets.only(bottom: 10,right: 20),
                  child: CityCard(context, controller.cities[i], controller))
                ]
              ,
            ),
          ),
        ),
      ),
    ),
    actionsAlignment: MainAxisAlignment.center,
    actionsPadding: EdgeInsets.symmetric(vertical: 20),
    actions: [],
  );
}

Widget CityCard(BuildContext context , String city , HomeController controller){
  return InkWell(
    onTap: (){
      controller.setChosenCity(city);
      Navigator.pop(context);
    },
    child: Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blue,width: 1.2)
      ),
      child: Row(
        children: [
          Icon(Icons.location_on_outlined , color: Colors.blue,),
          SizedBox(width: 10,),
          Text(city,style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.normal),)
        ],
      ),
    ),
  );
}