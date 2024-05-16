import 'package:dio/dio.dart';
import 'package:gallery/domain/usecase/data_usecase/data_usecase.dart';
import 'package:gallery/presentation/pages_home_jobs/cubit/data_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:gallery/app/app_pref.dart';
import 'package:gallery/data/network/network_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/data_source/remote_data_source.dart';
import '../data/network/app_api.dart';
import '../data/network/dio_factory.dart';
import '../data/repository/repository_impl.dart';
import '../domain/repository/repository.dart';
import '../domain/usecase/auth_usecase/login_usecase.dart';
import '../presentation/pages_auth/login/cubit/login_cubit.dart';



final instance = GetIt.instance;
Future<void> initAppModule() async{
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  instance.registerLazySingleton<AppPreferences>(() => AppPreferences(instance<SharedPreferences>()));
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));
  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImp(instance()));
  instance.registerLazySingleton<Repository>(() => RepositoryImpl(instance(),instance()));
  instance.registerLazySingleton<GetAllDataUseCaseUseCase>(() => GetAllDataUseCaseUseCase(instance()));
  instance.registerLazySingleton<SendAllDataUseCaseUseCase>(() => SendAllDataUseCaseUseCase(instance()));
  instance.registerLazySingleton<DataCubit>(() => DataCubit(instance(),instance()));
}

initLoginModule(){
  if(!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginCubit>(() => LoginCubit(instance()));

  }

}
