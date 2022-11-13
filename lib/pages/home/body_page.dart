import 'package:app_delivery/utils/colors.dart';
import 'package:app_delivery/utils/dimentions.dart';
import 'package:app_delivery/widgets/app_column.dart';
import 'package:app_delivery/widgets/big_text.dart';
import 'package:app_delivery/widgets/icon_text_widget.dart';
import 'package:app_delivery/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class ItemPageBody extends StatefulWidget {
  const ItemPageBody({super.key});

  @override
  State<ItemPageBody> createState() => _ItemPageBodyState();
}

class _ItemPageBodyState extends State<ItemPageBody> {
  PageController pageController = PageController(viewportFraction: 0.9);
  var _currentPageValue = 0.0;
  var _scaleFactor = 0.8;
  var _height = Dimentios.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slider section
        Container(
          height: Dimentios.pageView,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
          }),
        ),
        // dots
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        SizedBox(height: Dimentios.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimentios.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimentios.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color: Colors.black26,),
              ),
              SizedBox(width: Dimentios.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food pairing"),
              ),
            ],
          ),
        ),
        // list of food 
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index){
            return Container(
              margin: EdgeInsets.only(
                left: Dimentios.width20, 
                right: Dimentios.width20,
                bottom: Dimentios.height10
              ),
              child: Row(
                children: [
                  // imagen section
                  Container(
                    width: Dimentios.listViewImgSize,
                    height: Dimentios.listViewImgSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimentios.radius20),
                      color: Colors.redAccent,
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/image/icecream1.png")
                      )
                    ),
                  ),
                  // text container
                  Expanded(
                    child: Container(
                      height: Dimentios.listViewTextContSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(Dimentios.radius20),
                          topRight: Radius.circular(Dimentios.radius20),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: Dimentios.width10, right: Dimentios.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(text: "Sushi notorio de pescado fresco"),
                            SizedBox(height: Dimentios.height10),
                            SmallText(text: "Con verdura cocida y arroz"),
                            SizedBox(height: Dimentios.height10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconAndTextWidget(
                                  icon: Icons.circle_sharp, 
                                  text: "Normal", 
                                  iconColor: AppColors.iconColor1
                                ),
                                IconAndTextWidget(
                                  icon: Icons.location_on, 
                                  text: "1.7km", 
                                  iconColor: AppColors.mainColor
                                ),
                                IconAndTextWidget(
                                  icon: Icons.access_time_rounded, 
                                  text: "32min", 
                                  iconColor: AppColors.iconColor2
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        ),
      ],
    );
  }

  Widget _buildPageItem(int position) {
    Matrix4 matrix = Matrix4.identity();
    if (position == _currentPageValue.floor()){
      var currentScale = 1 - (_currentPageValue - position)*(1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale)/2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTrans, 1);
    }else if(position == _currentPageValue.floor()+1) {
      var currentScale = _scaleFactor + (_currentPageValue - position + 1)*(1-_scaleFactor);
      var currentTrans = _height * (1 - currentScale)/2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTrans, 1);
    }else if(position == _currentPageValue.floor()-1) {
      var currentScale = 1 - (_currentPageValue - position)*(1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale)/2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTrans, 1);
    }else{
      var currentScale = 0.8;
      var currentTrans = _height * (1 - currentScale)/2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTrans, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimentios.pageViewContainer,
            margin: EdgeInsets.only(left: Dimentios.width10, right: Dimentios.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimentios.radius30),
              color: position.isEven? const Color(0xFF69c5df): const Color(0xFF9294cc),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/image/orange1.png"
                )
              )
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimentios.pageViewTextContainer,
              margin: EdgeInsets.only(
                left: Dimentios.width30, 
                right: Dimentios.width30, 
                bottom: Dimentios.height30
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimentios.radius20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5)
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0)
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0)
                  )
                ]
              ),
              child: Container(
                padding: EdgeInsets.only(top: Dimentios.height15, left: 15, right: 15),
                child: AppColumn(text: "Oragne Drink"),
              ),
            ),
          )
        ],
      ),
    );
  }
}