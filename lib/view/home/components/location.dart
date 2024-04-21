import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/view/home/components/location_popup.dart';
import 'package:weather/view_model/controllers/home_controller.dart';
import '../../../res/images/image_assets.dart';
import '../../../utils/utils.dart';
class Location extends StatelessWidget {
   Location({super.key});
  final controller=Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
                showDialog(
                  context: context,
                  builder: (BuildContext dialogContext) {
                    return LocationPopUp(context, controller);
                  },
                );
              },
              child: Card(
                elevation: 10,
                shadowColor : Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: Container(
                  width: MediaQuery.of(context).size.width *0.5,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(25)),
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => controller.isLoading.value?
                        Text(
                          "Loading Data ... ",
                          style: const TextStyle(
                              height: 0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ):
                        Text(
                          controller.getAddress(),
                          style: const TextStyle(
                              height: 0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            overflow: TextOverflow.clip
                          ),
                        ),),
                        Text(
                          Utils.formateDate(DateTime.now()),
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                            fontSize: 13
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 130,
          width: MediaQuery.of(context).size.width *0.345,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ClipRRect(borderRadius :BorderRadius.circular(20) ,child: Image.asset(ImageAssets.map,fit: BoxFit.cover,)),
          ),
        )
      ],
    );
  }
}
