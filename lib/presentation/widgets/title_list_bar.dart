import 'package:flutter/material.dart';

import '../../resources/color_manger.dart';
import '../../resources/strings_manager.dart';
import '../../resources/value_manager.dart';

class TitleListBar extends StatelessWidget {
String title;
Function() onPressed;

TitleListBar({required this.title,required  this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.neutral200,
      margin: EdgeInsets.symmetric(vertical: AppMargin.m10),
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title
           ,
            style: Theme.of(context).textTheme.titleMedium!.apply(
            ),
          ),
          Spacer(flex: AppSize.s1.toInt()),
          TextButton(
            child: Text(AppStrings.welcome,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .apply(color: ColorManager.primary)),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
// ?