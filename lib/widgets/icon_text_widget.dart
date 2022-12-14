import 'package:app_delivery/utils/dimentions.dart';
import 'package:app_delivery/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconAndTextWidget({super.key, 
    required this.icon, 
    required this.text, 
    required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: Dimentios.iconSize24,),
        const SizedBox(width: 5,),
        SmallText(text: text)
      ],
    );
  }
}