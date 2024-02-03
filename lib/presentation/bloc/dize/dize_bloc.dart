import 'dart:async';
import 'dart:math';
import 'package:dize/data/repository/dize_repository.dart';
import 'package:dize/domain/model/data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'dize_event.dart';
part 'dize_state.dart';

class DizeBloc extends Bloc<DizeEvent, DizeState> {
  final DizeRepo repo;
  late DataModel dataModel;
  DizeBloc(this.repo) : super(DizeInitial()) {
    on<ButtonClickedEvent>(buttonClickedEvent);
    on<FetchDataEvent>(fetchDataEvent);
    on<ResetCountDownNotClickedEvent>(resetCountDownNotClickedEvent);
  }

  FutureOr<void> buttonClickedEvent(
      ButtonClickedEvent event, Emitter<DizeState> emit) async {
    emit(DizeInitial());

    dataModel.randomNumber = Random().nextInt(60);
    dataModel.currentSecond = DateTime.now().second;
    dataModel.valueGenerated = true;
    dataModel.randomNumber == dataModel.currentSecond
        ? dataModel.successCount++
        : dataModel.failureCount++;
    dataModel.attempts++;

    emit(ResetCountDownClickedState(isClicked: true));

    await repo.saveData(dataModel);
    bool isMatched = dataModel.valueGenerated && true
        ? dataModel.currentSecond == dataModel.randomNumber
        : false;

    emit(ValueGeneratedState(ismatched: isMatched, datamodel: dataModel));
  }

  FutureOr<void> fetchDataEvent(
      FetchDataEvent event, Emitter<DizeState> emit) async {
    dataModel = await repo.getData();

    bool isMatched = dataModel.valueGenerated
        ? dataModel.currentSecond == dataModel.randomNumber
        : false;

    emit(ValueGeneratedState(ismatched: isMatched, datamodel: dataModel));
  }

  FutureOr<void> resetCountDownNotClickedEvent(
      ResetCountDownNotClickedEvent event, Emitter<DizeState> emit) async {
    dataModel.failureCount++;
    dataModel.attempts++;

    emit(ResetCountDownNotClickedState());
    emit(ValueGeneratedState(ismatched: false, datamodel: dataModel));

    await repo.saveData(dataModel);
  }
}
