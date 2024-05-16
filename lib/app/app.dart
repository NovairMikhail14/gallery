
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/app/di.dart';
import 'package:gallery/presentation/pages_home_jobs/cubit/data_cubit.dart';
import 'package:gallery/resources/theme_manager.dart';

import '../presentation/pages_auth/login/cubit/login_cubit.dart';
import '../resources/routes_manager.dart';

class MyApp extends StatelessWidget {
  MyApp._internal();
  static final MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => instance<LoginCubit>()),
        BlocProvider(create: (context) => instance<DataCubit>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: getApplicationTheme(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.loginRoute,
        // home: HomeScreenView(),
      ),
    );
  }
}