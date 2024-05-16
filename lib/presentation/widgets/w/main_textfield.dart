import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallery/resources/color_manger.dart';
import 'package:gallery/resources/value_manager.dart';

class MainTextField extends StatefulWidget {
  String hintText;
  bool isTitle;
  bool isTitleBlack;
  IconData icon;
  bool iconAppear;
  String? initialValue;
  String? validationMessage;
  TextEditingController? controller;
  bool isPassword;
  Function(String)? onChanged;

  MainTextField(
      {this.icon = Icons.add,
      this.isTitleBlack = false,
      this.isTitle = false,
      this.onChanged,
      this.isPassword = false,
      this.initialValue,
      this.validationMessage,
      this.iconAppear = false,
      required this.hintText,
      this.controller,
      super.key});

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  bool notPassword = true ;

  @override
  Widget build(BuildContext context) {
    // validation(validationMessage){
    //   validationMessage == null ? null : validationMessage;
    // }
    return Container(
      margin: EdgeInsets.only(top: AppMargin.m10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.isTitle ? widget.hintText : "",
            style: widget.isTitleBlack
                ? Theme.of(context).textTheme.titleMedium
                : Theme.of(context).textTheme.bodyMedium,
          ),
          TextFormField(
              obscureText: widget.isPassword?notPassword:false,
              controller: widget.controller,
              initialValue: widget.initialValue,
              // keyboardType: isPassword?TextInputType.,
              onChanged: widget.onChanged,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'field is required';
                }
                return null;
              },
              decoration: InputDecoration(
                fillColor: ColorManager.general,
                  filled: true,

                  contentPadding: const EdgeInsets.fromLTRB(AppPadding.p17,
                      AppPadding.p12, AppPadding.p17, AppPadding.p12),
                  prefixIcon: widget.iconAppear ? Icon(widget.icon) : null,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        notPassword = !notPassword;
                      });
                    },
                    icon: widget.isPassword
                        ? (notPassword
                            ? FaIcon(
                                FontAwesomeIcons.eyeSlash,
                                size: AppSize.s20,
                              )
                            : FaIcon(
                                FontAwesomeIcons.eye,
                                size: AppSize.s20,
                              ))
                        : FaIcon(
                            null,
                            size: AppSize.s20,
                          ),
                  ),
                  hintText: widget.hintText,
                  errorText: (widget.validationMessage == "null"
                      ? null
                      : widget.validationMessage),
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  border: const OutlineInputBorder())),
        ],
      ),
    );
  }
}
