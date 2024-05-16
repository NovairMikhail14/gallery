import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/resources/assets_manager.dart';
import 'package:gallery/presentation/widgets/w/main_button.dart';
import 'package:gallery/presentation/widgets/w/main_textfield.dart';
import 'package:gallery/resources/color_manger.dart';
import 'package:gallery/resources/routes_manager.dart';
import 'package:gallery/resources/strings_manager.dart';
import 'package:gallery/resources/value_manager.dart';
import '../../../widgets/w/background.dart';
import '../cubit/login_cubit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui' as ui;

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey();
  String? email, password;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushReplacementNamed(context, Routes.HomeScreenViewRoute);
        }
      },
      builder: (context, state) {
        return BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            print("---------$state");
            if(state is LoginSuccess){
              Navigator.pushReplacementNamed(context, Routes.HomeScreenViewRoute);
            }
            },
          builder: (context, state) {

            return Scaffold(
              body: Stack(
                children: [
                  ...backgroundWidget(context),
                  Positioned(
                    top: -100,
                    left: -100,
                    child: SvgPicture.asset(
                      ImageAssets.loginIcons,
                      allowDrawingOutsideViewBox: true,
                      width: MediaQuery.of(context).size.width - 100,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SvgPicture.asset(
                    ImageAssets.lovePhotography,
                    width: 200,
                    height: 600,
                    fit: BoxFit.fitHeight,
                  ),
                  Positioned(
                    left: 50,
                    top: 50,
                    child: Image.asset(
                      ImageAssets.lovePhotography,
                      width: 100,
                    ),
                  ),
                  PositionedDirectional(
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Container(
                            margin: EdgeInsets.only(top: 150, bottom: 20),
                            child: Text(
                              textAlign: TextAlign.center,
                              AppStrings.myGallery,
                              maxLines: 2,
                              style: TextStyle(
                                  color: ColorManager.textColor,
                                  height: 1,
                                  fontSize: AppSize.s50,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Form(
                            key: formKey,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppPadding.p42),
                              child: Container(
                                padding: EdgeInsets.all(AppPadding.p18),
                                decoration: BoxDecoration(
                                    color:
                                        ColorManager.general.withOpacity(0.5),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(AppSize.s32))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      AppStrings.loginTitle,
                                      style: TextStyle(
                                          color: ColorManager.textColor,
                                          fontSize: AppSize.s30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: AppSize.s16,
                                    ),
                                    MainTextField(
                                      onChanged: (data) {
                                        email = data;
                                      },
                                      icon: Icons.person_2_outlined,
                                      hintText: AppStrings.username,
                                    ),
                                    MainTextField(
                                      onChanged: (data) {
                                        password = data;
                                      },
                                      icon: Icons.lock_outline,
                                      isPassword: true,
                                      hintText: AppStrings.password,
                                    ),
                                    // Spacer(flex: AppSize.s1.toInt()),
                                    SizedBox(
                                      height: AppSize.s16,
                                    ),

                                    MainButton(
                                        text: AppStrings.submit,
                                        onPress: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            BlocProvider.of<LoginCubit>(context)
                                                .login(email!, password!);
                                          }
                                          print("---------$state");
                                        }),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
