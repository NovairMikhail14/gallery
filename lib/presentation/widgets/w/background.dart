import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manger.dart';
import 'dart:ui' as ui;

List<Widget> backgroundWidget (BuildContext context ){
  return  [
    Positioned(
        top: -20,
        left: -320,
        child: CircleAvatar(
          backgroundColor: ColorManager.background1.withOpacity(0.8),
          radius: 250,
        )),
    Positioned(
        bottom: -200,
        child: CircleAvatar(
          backgroundColor: ColorManager.background3.withOpacity(0.3),
          radius: 300,
        )),
    Positioned(
        top: -200,
        right: -320,
        child: CircleAvatar(
          backgroundColor: ColorManager.background2.withOpacity(0.8),
          radius: 320,
        )),
    Positioned(
      bottom: 50,
      left: 50,
      child: SvgPicture.asset(
        ImageAssets.backgroundIcons,
        allowDrawingOutsideViewBox: true,
        width: MediaQuery.of(context).size.width-100,
        fit: BoxFit.fitWidth,
      ),),
    BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: 12.0,
          sigmaY: 12.0,
        ),
        child: Container(
          color: Colors.transparent,
        )),
  ];
}
