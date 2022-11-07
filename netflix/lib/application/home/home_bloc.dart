import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/hot_and_new/hot_and_new_service.dart';
import 'package:netflix/domain/hot_and_new/models/hot_and_new.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewService _homeService;
  HomeBloc(this._homeService) : super(HomeState.initial()) {
    //*on event get home screen data*//
    on<GetHomeSreenData>((event, emit) async {
      //send loading to ui

      emit(state.copyWith(isLoading: true, hasError: false));

      //get data

      final _movieResult = await _homeService.getHotAndNewMovieData();
      final _tvResult = await _homeService.getHotAndNewTvData();

      //transform data

      final _state1 = _movieResult.fold((MainFailure failure) {
        return HomeState(
            pastYearmovieList: [],
            trendingmovieList: [],
            tenseDramasmovieList: [],
            southindianmovieList: [],
            trendingTvList: [],
            isLoading: false,
            hasError: true,
            stateId: DateTime.now().microsecondsSinceEpoch.toString());
      }, (HotAndNewResp resp) {
        final pastYear = resp.results;
        final trending = resp.results;
        final dramas = resp.results;
        final southIndian = resp.results;
        pastYear.shuffle();
        trending.shuffle();
        dramas.shuffle();
        southIndian.shuffle();
        return HomeState(
            pastYearmovieList: resp.results,
            trendingmovieList: resp.results,
            tenseDramasmovieList: resp.results,
            southindianmovieList: resp.results,
            trendingTvList: state.trendingTvList,
            isLoading: false,
            hasError: false,
            stateId: DateTime.now().microsecondsSinceEpoch.toString());
      });
      emit(_state1);

      final _state2 = _tvResult.fold((MainFailure failure) {
        return HomeState(
            pastYearmovieList: [],
            trendingmovieList: [],
            tenseDramasmovieList: [],
            southindianmovieList: [],
            trendingTvList: [],
            isLoading: false,
            hasError: true,
            stateId: DateTime.now().microsecondsSinceEpoch.toString());
      }, (HotAndNewResp resp) {
        final top10List = resp.results;
        return HomeState(
            pastYearmovieList: state.pastYearmovieList,
            trendingmovieList: state.trendingmovieList,
            tenseDramasmovieList: state.tenseDramasmovieList,
            southindianmovieList: state.southindianmovieList,
            trendingTvList: top10List,
            isLoading: false,
            hasError: false,
            stateId: DateTime.now().microsecondsSinceEpoch.toString());
      });
      emit(_state2);
    });
  }
}
