import 'package:flutter_application_4/cubit/fetching_Data_State.dart';
import 'package:flutter_application_4/saving_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchingDataCubit extends Cubit<FetchingDataState> {
  FetchingDataCubit() : super(InitState());
  void toggle(Map<String,String> data) async {
    emit(DataLoading());
    await Future.delayed(Duration(seconds: 2));
    try {
      fetch(data);
      emit(DataSuccess(data: data));
      saveUserData(data);
    } catch (e) {
      emit(DataError(errorMsg: e.toString()));
      
    }
  }
}

Map fetch(Map data) {
  if (data.isNotEmpty) {
    return data;
  } else {
    return throw Exception("check your network");
  }
}