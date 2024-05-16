import 'package:flutter/material.dart';

import '../../../resources/color_manger.dart';
import '../../../resources/value_manager.dart';

List<Widget> BlurBackground (BuildContext context) {
return [
  Positioned(
    top: 0,
    right: AppSize.s100,
    child: Container(
      height: AppSize.s100,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: ColorManager.general.withOpacity(0.5),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppSize.s48)
          )
      ),

    ),
  ),
  Positioned(
    right: 0,
    top: AppSize.s100,
    child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: ColorManager.general.withOpacity(0.5),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppSize.s48)
          )
      ),

    ),
  ),
  Positioned(
    child: Align(
      alignment: AlignmentDirectional.topEnd,
      child: Container(
        height: 100,
        width:100 ,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: ColorManager.general.withOpacity(0.5),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSize.s36),
              bottomRight: Radius.circular(AppSize.s36),

            )
        ),
      ),
    ),
  ),
  Positioned(
    child: Align(
      alignment: AlignmentDirectional.topEnd,
      child: Container(
        height: 102,
        width:102 ,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: ColorManager.background,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(AppSize.s36),
              topLeft: Radius.circular(AppSize.s36),
              bottomRight: Radius.circular(AppSize.s36),
            )
        ),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: AppSize.s66 / 2,
        ),
      ),
    ),
  )
];
}
