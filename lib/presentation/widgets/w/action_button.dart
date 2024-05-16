import 'package:flutter/material.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/color_manger.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/value_manager.dart';

class ActionButton extends StatefulWidget {
  String imagePath ;
  String title;
  Color background;
  void Function()? onPress;
  double roundedRadius;
  double height;

  ActionButton({required this.imagePath,required this.height, required this.title,required this.onPress,required this.background,required this.roundedRadius});

  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {



  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPress,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(AppSize.s125, widget.height.toDouble()),
        padding: EdgeInsets.all(AppPadding.p10),
          backgroundColor: widget.background,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(widget.roundedRadius.toDouble())))),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(widget.imagePath),
          SizedBox(width: AppSize.s8,height: AppSize.s8,),
          Text(
              widget.title,
            style: TextStyle(color: ColorManager.textColor),
          ),
        ],
      ),
    );
  }
}
