import 'package:flutter/material.dart';
import '../../../res/images/image_assets.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       SizedBox(width: 10,),
        Text("Ethio Weather App",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 26),),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            ImageAssets.nightRain,
            height: 30,
            width: 30,
          ),
        )
      ],
    );
  }
}
