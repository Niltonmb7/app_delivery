import 'package:app_delivery/utils/colors.dart';
import 'package:app_delivery/utils/dimentions.dart';
import 'package:app_delivery/widgets/big_text.dart';
import 'package:app_delivery/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'body_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // header and search
          Container(
            child: Container(
              margin: EdgeInsets.only(top:Dimentios.height45, bottom: Dimentios.height15),
              padding: EdgeInsets.only(left:Dimentios.width20, right: Dimentios.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Hola NMB", color: AppColors.mainColor),
                      Row(
                        children: [
                          SmallText(text: "Inicio", color: Colors.black54,),
                          const Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimentios.height45,
                      height: Dimentios.height45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimentios.radius15),
                        color: AppColors.mainColor
                      ),
                      child: Icon(Icons.search, color: Colors.white, size: Dimentios.iconSize24,),
                    ),
                  )
                ],
              ),
            ),
          ),
          // most valuates
          Expanded(child: SingleChildScrollView(
            child: ItemPageBody(),
          )),
        ],
      )
    );
  }
}