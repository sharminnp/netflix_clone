part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String stateId,
    required List<HotAndNewData> pastYearmovieList,
    required List<HotAndNewData> trendingmovieList,
    required List<HotAndNewData> tenseDramasmovieList,
    required List<HotAndNewData> southindianmovieList,
    required List<HotAndNewData> trendingTvList,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;

  factory HomeState.initial() => const HomeState(
      pastYearmovieList: [],
      trendingmovieList: [],
      tenseDramasmovieList: [],
      southindianmovieList: [],
      trendingTvList: [],
      isLoading: false,
      hasError: false,
      stateId: '0');
}
