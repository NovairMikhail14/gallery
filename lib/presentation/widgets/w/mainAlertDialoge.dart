import 'package:flutter/material.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/color_manger.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/value_manager.dart';
import 'action_button.dart';

mainLaertDialoge(Function()? getFromGallery,Function()?  getFromCamera){
  return AlertDialog(
    contentPadding: EdgeInsets.all(AppSize.s36),
    backgroundColor:
    ColorManager.general.withOpacity(0.6),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(AppSize.s48))),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ActionButton(
          background: ColorManager.btnColor1,
          title: AppStrings.gallery,
          onPress: getFromGallery,
          imagePath: ImageAssets.gallery,
          roundedRadius: AppSize.s48,
          height: AppSize.s52,
        ),
        SizedBox(height: AppSize.s12,),
        ActionButton(
          background: ColorManager.btnColor2,
          title: AppStrings.camera,
          onPress: getFromCamera,
          imagePath: ImageAssets.camera,
          roundedRadius: AppSize.s48,
          height: AppSize.s52,
        ),
      ],
    ),
  );
}