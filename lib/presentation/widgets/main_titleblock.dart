import 'package:flutter/material.dart';
import 'package:gallery/resources/value_manager.dart';

class MainTitleBlock extends StatelessWidget {
  String title;
  String subtitle;
  CrossAxisAlignment alignment;
  TextAlign textAlign;
  MainTitleBlock({required this.title, required this.subtitle,this.alignment =CrossAxisAlignment.start, this.textAlign =TextAlign.start });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: AppMargin.m8),
          child: Column(
            crossAxisAlignment: alignment,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.w500),textAlign: textAlign ,
                  maxLines: 2,
                ),
              ),
              SizedBox(
                height: AppSize.s4,
              ),
              SizedBox(
                child: Text(
                  subtitle,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.w500),textAlign: textAlign ,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
