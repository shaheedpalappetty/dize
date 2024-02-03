part of 'dize_bloc.dart';

abstract class DizeState {}

final class DizeInitial extends DizeState {}

final class ValueGeneratedState extends DizeState {
  DataModel datamodel;
  final bool ismatched;

  ValueGeneratedState({required this.ismatched, required this.datamodel});
}

final class ResetCountDownClickedState extends DizeState {
  bool isClicked;
  ResetCountDownClickedState({required this.isClicked});
}

final class ResetCountDownNotClickedState extends DizeState {}
