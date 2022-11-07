// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getHomeSreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getHomeSreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getHomeSreenData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHomeSreenData value) getHomeSreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHomeSreenData value)? getHomeSreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHomeSreenData value)? getHomeSreenData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetHomeSreenDataCopyWith<$Res> {
  factory _$$GetHomeSreenDataCopyWith(
          _$GetHomeSreenData value, $Res Function(_$GetHomeSreenData) then) =
      __$$GetHomeSreenDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetHomeSreenDataCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$GetHomeSreenData>
    implements _$$GetHomeSreenDataCopyWith<$Res> {
  __$$GetHomeSreenDataCopyWithImpl(
      _$GetHomeSreenData _value, $Res Function(_$GetHomeSreenData) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetHomeSreenData implements GetHomeSreenData {
  const _$GetHomeSreenData();

  @override
  String toString() {
    return 'HomeEvent.getHomeSreenData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetHomeSreenData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getHomeSreenData,
  }) {
    return getHomeSreenData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getHomeSreenData,
  }) {
    return getHomeSreenData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getHomeSreenData,
    required TResult orElse(),
  }) {
    if (getHomeSreenData != null) {
      return getHomeSreenData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHomeSreenData value) getHomeSreenData,
  }) {
    return getHomeSreenData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHomeSreenData value)? getHomeSreenData,
  }) {
    return getHomeSreenData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHomeSreenData value)? getHomeSreenData,
    required TResult orElse(),
  }) {
    if (getHomeSreenData != null) {
      return getHomeSreenData(this);
    }
    return orElse();
  }
}

abstract class GetHomeSreenData implements HomeEvent {
  const factory GetHomeSreenData() = _$GetHomeSreenData;
}

/// @nodoc
mixin _$HomeState {
  String get stateId => throw _privateConstructorUsedError;
  List<HotAndNewData> get pastYearmovieList =>
      throw _privateConstructorUsedError;
  List<HotAndNewData> get trendingmovieList =>
      throw _privateConstructorUsedError;
  List<HotAndNewData> get tenseDramasmovieList =>
      throw _privateConstructorUsedError;
  List<HotAndNewData> get southindianmovieList =>
      throw _privateConstructorUsedError;
  List<HotAndNewData> get trendingTvList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {String stateId,
      List<HotAndNewData> pastYearmovieList,
      List<HotAndNewData> trendingmovieList,
      List<HotAndNewData> tenseDramasmovieList,
      List<HotAndNewData> southindianmovieList,
      List<HotAndNewData> trendingTvList,
      bool isLoading,
      bool hasError});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateId = null,
    Object? pastYearmovieList = null,
    Object? trendingmovieList = null,
    Object? tenseDramasmovieList = null,
    Object? southindianmovieList = null,
    Object? trendingTvList = null,
    Object? isLoading = null,
    Object? hasError = null,
  }) {
    return _then(_value.copyWith(
      stateId: null == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String,
      pastYearmovieList: null == pastYearmovieList
          ? _value.pastYearmovieList
          : pastYearmovieList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      trendingmovieList: null == trendingmovieList
          ? _value.trendingmovieList
          : trendingmovieList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      tenseDramasmovieList: null == tenseDramasmovieList
          ? _value.tenseDramasmovieList
          : tenseDramasmovieList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      southindianmovieList: null == southindianmovieList
          ? _value.southindianmovieList
          : southindianmovieList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      trendingTvList: null == trendingTvList
          ? _value.trendingTvList
          : trendingTvList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String stateId,
      List<HotAndNewData> pastYearmovieList,
      List<HotAndNewData> trendingmovieList,
      List<HotAndNewData> tenseDramasmovieList,
      List<HotAndNewData> southindianmovieList,
      List<HotAndNewData> trendingTvList,
      bool isLoading,
      bool hasError});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateId = null,
    Object? pastYearmovieList = null,
    Object? trendingmovieList = null,
    Object? tenseDramasmovieList = null,
    Object? southindianmovieList = null,
    Object? trendingTvList = null,
    Object? isLoading = null,
    Object? hasError = null,
  }) {
    return _then(_$_Initial(
      stateId: null == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String,
      pastYearmovieList: null == pastYearmovieList
          ? _value._pastYearmovieList
          : pastYearmovieList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      trendingmovieList: null == trendingmovieList
          ? _value._trendingmovieList
          : trendingmovieList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      tenseDramasmovieList: null == tenseDramasmovieList
          ? _value._tenseDramasmovieList
          : tenseDramasmovieList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      southindianmovieList: null == southindianmovieList
          ? _value._southindianmovieList
          : southindianmovieList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      trendingTvList: null == trendingTvList
          ? _value._trendingTvList
          : trendingTvList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.stateId,
      required final List<HotAndNewData> pastYearmovieList,
      required final List<HotAndNewData> trendingmovieList,
      required final List<HotAndNewData> tenseDramasmovieList,
      required final List<HotAndNewData> southindianmovieList,
      required final List<HotAndNewData> trendingTvList,
      required this.isLoading,
      required this.hasError})
      : _pastYearmovieList = pastYearmovieList,
        _trendingmovieList = trendingmovieList,
        _tenseDramasmovieList = tenseDramasmovieList,
        _southindianmovieList = southindianmovieList,
        _trendingTvList = trendingTvList;

  @override
  final String stateId;
  final List<HotAndNewData> _pastYearmovieList;
  @override
  List<HotAndNewData> get pastYearmovieList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pastYearmovieList);
  }

  final List<HotAndNewData> _trendingmovieList;
  @override
  List<HotAndNewData> get trendingmovieList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trendingmovieList);
  }

  final List<HotAndNewData> _tenseDramasmovieList;
  @override
  List<HotAndNewData> get tenseDramasmovieList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tenseDramasmovieList);
  }

  final List<HotAndNewData> _southindianmovieList;
  @override
  List<HotAndNewData> get southindianmovieList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_southindianmovieList);
  }

  final List<HotAndNewData> _trendingTvList;
  @override
  List<HotAndNewData> get trendingTvList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trendingTvList);
  }

  @override
  final bool isLoading;
  @override
  final bool hasError;

  @override
  String toString() {
    return 'HomeState(stateId: $stateId, pastYearmovieList: $pastYearmovieList, trendingmovieList: $trendingmovieList, tenseDramasmovieList: $tenseDramasmovieList, southindianmovieList: $southindianmovieList, trendingTvList: $trendingTvList, isLoading: $isLoading, hasError: $hasError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.stateId, stateId) || other.stateId == stateId) &&
            const DeepCollectionEquality()
                .equals(other._pastYearmovieList, _pastYearmovieList) &&
            const DeepCollectionEquality()
                .equals(other._trendingmovieList, _trendingmovieList) &&
            const DeepCollectionEquality()
                .equals(other._tenseDramasmovieList, _tenseDramasmovieList) &&
            const DeepCollectionEquality()
                .equals(other._southindianmovieList, _southindianmovieList) &&
            const DeepCollectionEquality()
                .equals(other._trendingTvList, _trendingTvList) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      stateId,
      const DeepCollectionEquality().hash(_pastYearmovieList),
      const DeepCollectionEquality().hash(_trendingmovieList),
      const DeepCollectionEquality().hash(_tenseDramasmovieList),
      const DeepCollectionEquality().hash(_southindianmovieList),
      const DeepCollectionEquality().hash(_trendingTvList),
      isLoading,
      hasError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements HomeState {
  const factory _Initial(
      {required final String stateId,
      required final List<HotAndNewData> pastYearmovieList,
      required final List<HotAndNewData> trendingmovieList,
      required final List<HotAndNewData> tenseDramasmovieList,
      required final List<HotAndNewData> southindianmovieList,
      required final List<HotAndNewData> trendingTvList,
      required final bool isLoading,
      required final bool hasError}) = _$_Initial;

  @override
  String get stateId;
  @override
  List<HotAndNewData> get pastYearmovieList;
  @override
  List<HotAndNewData> get trendingmovieList;
  @override
  List<HotAndNewData> get tenseDramasmovieList;
  @override
  List<HotAndNewData> get southindianmovieList;
  @override
  List<HotAndNewData> get trendingTvList;
  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
