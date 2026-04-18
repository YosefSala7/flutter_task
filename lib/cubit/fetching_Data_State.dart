import 'package:equatable/equatable.dart';

sealed class FetchingDataState extends Equatable {
  const FetchingDataState();
}

class DataLoading extends FetchingDataState {
  const DataLoading();
  @override
  List<Object?> get props => [];
}

class InitState extends FetchingDataState {
  const InitState();
  @override
  List<Object?> get props => [];
}

class DataSuccess extends FetchingDataState {
  final Map<String, String> data;
  const DataSuccess({required this.data});
  @override
  List<Object?> get props => [data];
}

class DataError extends FetchingDataState {
  final String errorMsg;
  const DataError({required this.errorMsg});
  @override
  List<Object?> get props => [errorMsg];
}
