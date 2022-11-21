import 'package:app_delivery/utils/colors.dart';
import 'package:app_delivery/utils/dimentions.dart';
import 'package:app_delivery/widgets/app_icon.dart';
import 'package:app_delivery/widgets/big_text.dart';
import 'package:app_delivery/widgets/expandable_text.dart';
import 'package:flutter/material.dart';

class RecommendedItemDetail extends StatelessWidget {
  const RecommendedItemDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 300,
            backgroundColor: AppColors.yellowColor,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_bag_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Center(
                  child: BigText(text: "Silver app bar", size: Dimentios.font20,)
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimentios.radius20),
                    topRight: Radius.circular(Dimentios.radius20)
                  )
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/orange1.png",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: Dimentios.width20, right: Dimentios.width20),
                  child: ExpandableText(
                    text: "Lorem Ipsum is simply dummy text of " +
                          "the printing and typesetting industry. Lorem Ipsum has been " +
                          "the industry's standard dummy text ever since the 1500s, " + 
                          "when an unknown printer took a galley of type and scrambled " + 
                          "it to make a type specimen book. It has survived not only five " + 
                          "centuries, but also the leap into electronic typesetting, " + 
                          "remaining essentially unchanged. It was popularised in the 1960s " + 
                          "with the release of Letraset sheets containing Lorem Ipsum passages, " + 
                          "and more recently with desktop publishing software like Aldus PageMaker " + 
                          "including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of " +
                          "the printing and typesetting industry. Lorem Ipsum has been " +
                          "the industry's standard dummy text ever since the 1500s, " + 
                          "when an unknown printer took a galley of type and scrambled " + 
                          "it to make a type specimen book. It has survived not only five " + 
                          "centuries, but also the leap into electronic typesetting, " + 
                          "remaining essentially unchanged. It was popularised in the 1960s " + 
                          "with the release of Letraset sheets containing Lorem Ipsum passages, " + 
                          "and more recently with desktop publishing software like Aldus PageMaker " + 
                          "including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of " +
                          "the printing and typesetting industry. Lorem Ipsum has been " +
                          "the industry's standard dummy text ever since the 1500s, " + 
                          "when an unknown printer took a galley of type and scrambled " + 
                          "it to make a type specimen book."
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: Dimentios.width20 * 2.5,
              right: Dimentios.width20 * 2.5,
              top: Dimentios.height10,
              bottom: Dimentios.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove, 
                  backgroundColor: AppColors.mainColor, 
                  iconColor: Colors.white,
                  iconSize: Dimentios.iconSize24,
                ),
                BigText(
                  text: "\$12.88 " + " X " + " 0", 
                  color: AppColors.mainBLackColor,
                  size: Dimentios.font26,
                ),
                AppIcon(
                  icon: Icons.add, 
                  backgroundColor: AppColors.mainColor, 
                  iconColor: Colors.white,
                  iconSize: Dimentios.iconSize24,
                )
              ],
            ),
          ),
          Container(
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
                    left: Dimentios.width20, 
                    right: Dimentios.width20,
                    top: Dimentios.height20,
                    bottom: Dimentios.height20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimentios.radius20),
                    color: Colors.white
                  ),
                  child: Icon(Icons.favorite, color: AppColors.mainColor,),
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
        ],
      ),
    );
  }
}