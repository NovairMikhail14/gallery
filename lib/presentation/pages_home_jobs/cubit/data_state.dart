part of 'data_cubit.dart';

@immutable
abstract class DataState {}

class DataInitial extends DataState {}
class  DataStateSuccess extends DataState {}
class  DataStateFailed extends DataState {}