import 'package:app_delivery/utils/colors.dart';
import 'package:app_delivery/utils/dimentions.dart';
import 'package:app_delivery/widgets/app_column.dart';
import 'package:app_delivery/widgets/app_icon.dart';
import 'package:app_delivery/widgets/big_text.dart';
import 'package:app_delivery/widgets/expandable_text.dart';
import 'package:flutter/material.dart';

class PopularItemDetail extends StatelessWidget {
  const PopularItemDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimentios.popularItemImgSize,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/orange1.png")
                )
              ),
            )
          ),
          // icons widgets
          Positioned(
            top: Dimentios.height45,
            left: Dimentios.width20,
            right: Dimentios.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_bag_outlined),
              ],
            )
          ),
          // title item
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimentios.popularItemImgSize - 20,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimentios.width20, 
                right: Dimentios.width20,
                top: Dimentios.height20
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimentios.radius20),
                  topRight: Radius.circular(Dimentios.radius20),
                ),
                color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: "Orange Drink"),
                  SizedBox(height: Dimentios.height20,),
                  BigText(text: "Introduce"),
                  SizedBox(height: Dimentios.height20,),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableText(text: "Lorem Ipsum is simply dummy text of " +
                        "the printing and typesetting industry. Lorem Ipsum has been " +
                        "the industry's standard dummy text ever since the 1500s, " + 
                        "when an unknown printer took a galley of type and scrambled " + 
                        "it to make a type specimen book. It has survived not only five " + 
                        "centuries, but also the leap into electronic typesetting, " + 
                        "remaining essentially unchanged. It was popularised in the 1960s " + 
                        "with the release of Letraset sheets containing Lorem Ipsum passages, " + 
                        "and more recently with desktop publishing software like Aldus PageMaker " + 
                        "including versions of Lorem Ipsum."),
                    ),
                  )
                ],
              ),
            )
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimentios.bottomHeightBar,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimentios.radius20*2),
            topRight: Radius.circular(Dimentios.radius20*2),
          ),
          color: AppColors.buttonBackGroundColor,
        ),
        padding: EdgeInsets.only(
          bottom: Dimentios.height30,
          top: Dimentios.height30,
          left: Dimentios.width20,
          right: Dimentios.width20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: Dimentios.width10, 
                right: Dimentios.width10,
                top: Dimentios.height20,
                bottom: Dimentios.height20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimentios.radius20),
                color: Colors.white
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.remove, color: AppColors.signColor,),
                  SizedBox(width: Dimentios.width10,),
                  BigText(text: "0"),
                  SizedBox(width: Dimentios.width10,),
                  Icon(Icons.add, color: AppColors.signColor,),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: Dimentios.width10, 
                right: Dimentios.width10,
                top: Dimentios.height20,
                bottom: Dimentios.height20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimentios.radius20),
                color: AppColors.mainColor,
              ),
              child: BigText(text: "\$10 | Add to cart", color: Colors.white,),
            )
          ],
        ),
      ),
    );
  }
}