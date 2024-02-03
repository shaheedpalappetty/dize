part of 'dize_bloc.dart';

abstract class DizeEvent {}

class FetchDataEvent extends DizeEvent {}

class ButtonClickedEvent extends DizeEvent {
  

  ButtonClickedEvent();
}

class ResetCountDownClickedEvent extends DizeEvent {
  
  ResetCountDownClickedEvent();
}

class ResetCountDownNotClickedEvent extends DizeEvent {
  ResetCountDownNotClickedEvent();
}
