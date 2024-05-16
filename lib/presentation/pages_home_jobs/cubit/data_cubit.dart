
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../app/app_pref.dart';
import '../../../app/di.dart';
import '../../../domain/usecase/data_usecase/data_usecase.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit(this.sendAllDataUseCaseUseCase, this.getAllDataUseCaseUseCase)
      : super(DataInitial());
  final AppPreferences _shearedPref = instance<AppPreferences>();
  GetAllDataUseCaseUseCase getAllDataUseCaseUseCase;
  SendAllDataUseCaseUseCase sendAllDataUseCaseUseCase;
  List<String> images = [];

  getData() async {
    String? token = await _shearedPref.getAppToken();

    try {
      (await getAllDataUseCaseUseCase.execute(GetAllDataUseCaseInput(token!)))
          .fold(
        (l) {
          emit(DataStateFailed());
          return l;
        },
        (r) {
          images = r.images;
          emit(DataStateSuccess());
          return r;
        },
      );
    } catch (error) {
      print(error);
    }
  }

  sendImage(String imagePath) async {
    String? token = await _shearedPref.getAppToken();
    try {
      (await sendAllDataUseCaseUseCase
              .execute(SendAllDataUseCaseInput(token!, imagePath)))
          .fold(
        (l) {
          emit(DataStateFailed());
          return l;
        },
        (r) {
          images = r.images;
          emit(DataStateSuccess());
          return r;
        },
      );
    } catch (error) {
      print(error);
    }
  }
}
