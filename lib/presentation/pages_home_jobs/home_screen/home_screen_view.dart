import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery/presentation/pages_home_jobs/cubit/data_cubit.dart';
import 'package:gallery/presentation/widgets/main_titleblock.dart';
import 'package:gallery/resources/assets_manager.dart';
import 'package:gallery/resources/color_manger.dart';
import 'package:gallery/resources/value_manager.dart';
import 'package:image_picker/image_picker.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../pages_auth/login/cubit/login_cubit.dart';
import '../../widgets/w/action_button.dart';
import '../../widgets/w/background.dart';
import '../../widgets/w/blurBackground.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/w/mainAlertDialoge.dart';

class HomeScreenView extends StatefulWidget {
  HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  bool switchVar = true;
  ImagePicker imagePicker = ImagePicker();
  List<XFile> pickImage = [];
  Future<void> pickFromCamera () async{
    try{
      var image = await imagePicker.pickImage(source: ImageSource.camera);
      if(image != null){
        setState(() {
          pickImage.add(image);
          BlocProvider.of<DataCubit>(context).sendImage(image as File);
        });
      }else{
        setState(() {
          pickImage = [image!];
        });
      }
    }catch(error){print(error);}
  }
  Future<void> pickFromGallery () async{
    try{
      var images = await imagePicker.pickImage(source: ImageSource.gallery);
      if(images != null){
        setState(() {
          pickImage.add(images);
          BlocProvider.of<DataCubit>(context).sendImage(images as File);
        });
      }else{
        setState(() {
          pickImage = [images!];
        });
      }
    }catch(error){print(error);}
  }

  @override
  Widget build(BuildContext context) {
    List<String > images = [];
    BlocProvider.of<DataCubit>(context).getData();

    return SafeArea(
      child: BlocConsumer<DataCubit, DataState>(
  listener: (context, state) {
    if(state is DataStateSuccess){
      images =     BlocProvider.of<DataCubit>(context).images;
    }
  },
  builder: (context, state) {
    return Scaffold(
          backgroundColor: ColorManager.background,
          body: Stack(
            children: [
              ...backgroundWidget(context),
              ...BlurBackground(context),
              CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    toolbarHeight: AppSize.s125,
                    primary: true,
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MainTitleBlock(
                            title: AppStrings.welcome,
                            subtitle:  BlocProvider.of<LoginCubit>(context).name,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.all(AppPadding.p16),
                    sliver: SliverToBoxAdapter(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ActionButton(
                            background: ColorManager.general,
                            title: AppStrings.logout,
                            onPress: () {
                              Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
                            },
                            imagePath: ImageAssets.logout,
                            roundedRadius: AppSize.s12,
                            height: AppSize.s26,
                          ),
                          ActionButton(
                            background: ColorManager.general,
                            title: AppStrings.upload,
                            roundedRadius: AppSize.s12,
                            height: AppSize.s26,
                            onPress: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return mainLaertDialoge(pickFromGallery,pickFromCamera);
                                },
                              );
                            },
                            imagePath: ImageAssets.upload,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.all(AppPadding.p16),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: AppSize.s26,
                        mainAxisSpacing: AppSize.s26,
                        childAspectRatio: 1,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        childCount: images.length,
                        (context, index) {
                          return Container(
                            width: AppSize.s20,
                            height: AppSize.s20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(AppSize.s12))
                            ),
                            child: Image.network(images[index]),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ));
  },
),
    );
  }
}
