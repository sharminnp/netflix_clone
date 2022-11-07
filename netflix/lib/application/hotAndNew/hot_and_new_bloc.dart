import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/hot_and_new/hot_and_new_service.dart';
import 'package:netflix/domain/hot_and_new/models/hot_and_new.dart';
part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService _hotAndNewService;
  HotAndNewBloc(this._hotAndNewService) : super(HotAndNewState.initial()) {
    on<LoadDataInComingSoon>((event, emit) async {
      emit(HotAndNewState(
          comingsoonList: [],
          everyOneIsWatchingList: [],
          isLoading: true,
          hasError: false));
      final _result = await _hotAndNewService.getHotAndNewMovieData();
      final newstate = _result.fold((MainFailure failure) {
        return HotAndNewState(
            comingsoonList: [],
            everyOneIsWatchingList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResp resp) {
        return HotAndNewState(
            comingsoonList: resp.results,
            everyOneIsWatchingList: state.everyOneIsWatchingList,
            isLoading: false,
            hasError: false);
      });
      emit(newstate);
    });
    on<LoadDataInEveryoneIsWatching>((event, emit) async {
      emit(HotAndNewState(
          comingsoonList: [],
          everyOneIsWatchingList: [],
          isLoading: true,
          hasError: false));
      final _result = await _hotAndNewService.getHotAndNewTvData();
      final newstate = _result.fold((MainFailure failure) {
        return HotAndNewState(
            comingsoonList: [],
            everyOneIsWatchingList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResp resp) {
        return HotAndNewState(
            comingsoonList: state.comingsoonList,
            everyOneIsWatchingList: resp.results,
            isLoading: false,
            hasError: false);
      });
      emit(newstate);
    });
  }
}
