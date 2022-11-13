import 'package:app_delivery/utils/colors.dart';
import 'package:app_delivery/utils/dimentions.dart';
import 'package:app_delivery/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({super.key, required this.text});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = Dimentios.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if(widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    }else{
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty ? SmallText(text: firstHalf, size: Dimentios.font16, color: AppColors.paraColor, height: 1.8) : Column(
        children: [
          SmallText(
            text: hiddenText ? ("$firstHalf...") : (firstHalf + secondHalf),
            size: Dimentios.font16,
            color: AppColors.paraColor,
            height: 1.8,
          ),
          InkWell(
            onTap: () {
              setState(() {
                hiddenText = !hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(
                  text: hiddenText ? "Show more" : "Show less", 
                  color: AppColors.mainColor,
                ),
                Icon(
                  hiddenText ? Icons.arrow_drop_down : Icons.arrow_drop_up, 
                  color: AppColors.mainColor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}