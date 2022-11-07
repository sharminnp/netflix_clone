// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:netflix/domain/downloads/models/i_downloads_repo.dart';
import 'package:netflix/domain/search/models/search_response/result.dart';
import 'package:netflix/domain/search/models/search_response/search_response.dart';
import 'package:netflix/domain/search/search_service.dart';

part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsService;
  final SearchService _searchService;
  SearchBloc(this._searchService, this._downloadsService)
      : super(SearchState.initial()) {
    //idlestate
    on<Initialize>((event, emit) async {
      if (state.idleList.isEmpty) {
        emit(
          SearchState(
              searchResultList: [],
              idleList: state.idleList,
              isLoading: false,
              isError: false),
        );
        //return;
      }
      emit(SearchState(
          searchResultList: [], idleList: [], isLoading: true, isError: false));
      //get trending
      final _result = await _downloadsService.getDownloadImage();
      final _State = _result.fold((MainFailure f) {
        return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true);
      }, (List<Downloads> list) {
        return SearchState(
            searchResultList: [],
            idleList: list,
            isLoading: false,
            isError: false);
      });
      emit(_State);
      //show to ui
    });

    //searchstate
    on<SearchMovies>((event, emit) async {
      //call search movie api
      log('searching for${event.movieQuery}');
      emit(SearchState(
          searchResultList: [], idleList: [], isLoading: true, isError: false));
      final _result =
          await _searchService.searchmovies(movieQuery: event.movieQuery);
      print(_result);
      final _state = _result.fold((MainFailure f) {
        return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true);
      }, (SearchResponse r) {
        return SearchState(
            searchResultList: r.results,
            idleList: [],
            isLoading: false,
            isError: false);
      });
      emit(_state);
    });
    //show to ui
  }
}
