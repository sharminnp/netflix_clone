import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:netflix/domain/downloads/models/i_downloads_repo.dart';
import 'package:netflix/domain/search/models/search_response/result.dart';
part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final dummyvideoUrl = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"
];
ValueNotifier<Set<int>> likedVideoIdsNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(IDownloadsRepo _downloadsService)
      : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      //send loading to ui
      emit(FastLaughState(
        videosList: [],
        isLoading: true,
        isError: false,
      ));
      //get trending movies
      final _result = await _downloadsService.getDownloadImage();
      final _state = _result.fold((l) {
        return FastLaughState(
          videosList: [],
          isLoading: false,
          isError: true,
        );
      },
          (resp) => FastLaughState(
                videosList: resp,
                isLoading: false,
                isError: false,
              ));
      //get ui
      emit(_state);
    });
    on<LikedVideo>((event, emit) {
      likedVideoIdsNotifier.value.add(event.id);
      likedVideoIdsNotifier.notifyListeners();
    });
    on<UnlikedVideo>((event, emit) {
      likedVideoIdsNotifier.value.remove(event.id);
      likedVideoIdsNotifier.notifyListeners();
    });
  }
}
