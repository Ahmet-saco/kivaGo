// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_plan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TravelPlanModel _$TravelPlanModelFromJson(Map<String, dynamic> json) {
  return _TravelPlanModel.fromJson(json);
}

/// @nodoc
mixin _$TravelPlanModel {
  String get planId => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get experienceManifesto => throw _privateConstructorUsedError;
  List<String> get moodKeywords => throw _privateConstructorUsedError;
  List<SuggestedRouteItemModel> get suggestedRoute =>
      throw _privateConstructorUsedError;
  List<AiConversationItemModel> get aiConversationHistory =>
      throw _privateConstructorUsedError;

  /// Serializes this TravelPlanModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TravelPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelPlanModelCopyWith<TravelPlanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelPlanModelCopyWith<$Res> {
  factory $TravelPlanModelCopyWith(
          TravelPlanModel value, $Res Function(TravelPlanModel) then) =
      _$TravelPlanModelCopyWithImpl<$Res, TravelPlanModel>;
  @useResult
  $Res call(
      {String planId,
      String ownerId,
      String title,
      String status,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt,
      String experienceManifesto,
      List<String> moodKeywords,
      List<SuggestedRouteItemModel> suggestedRoute,
      List<AiConversationItemModel> aiConversationHistory});
}

/// @nodoc
class _$TravelPlanModelCopyWithImpl<$Res, $Val extends TravelPlanModel>
    implements $TravelPlanModelCopyWith<$Res> {
  _$TravelPlanModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planId = null,
    Object? ownerId = null,
    Object? title = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? experienceManifesto = null,
    Object? moodKeywords = null,
    Object? suggestedRoute = null,
    Object? aiConversationHistory = null,
  }) {
    return _then(_value.copyWith(
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      experienceManifesto: null == experienceManifesto
          ? _value.experienceManifesto
          : experienceManifesto // ignore: cast_nullable_to_non_nullable
              as String,
      moodKeywords: null == moodKeywords
          ? _value.moodKeywords
          : moodKeywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      suggestedRoute: null == suggestedRoute
          ? _value.suggestedRoute
          : suggestedRoute // ignore: cast_nullable_to_non_nullable
              as List<SuggestedRouteItemModel>,
      aiConversationHistory: null == aiConversationHistory
          ? _value.aiConversationHistory
          : aiConversationHistory // ignore: cast_nullable_to_non_nullable
              as List<AiConversationItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TravelPlanModelImplCopyWith<$Res>
    implements $TravelPlanModelCopyWith<$Res> {
  factory _$$TravelPlanModelImplCopyWith(_$TravelPlanModelImpl value,
          $Res Function(_$TravelPlanModelImpl) then) =
      __$$TravelPlanModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String planId,
      String ownerId,
      String title,
      String status,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt,
      String experienceManifesto,
      List<String> moodKeywords,
      List<SuggestedRouteItemModel> suggestedRoute,
      List<AiConversationItemModel> aiConversationHistory});
}

/// @nodoc
class __$$TravelPlanModelImplCopyWithImpl<$Res>
    extends _$TravelPlanModelCopyWithImpl<$Res, _$TravelPlanModelImpl>
    implements _$$TravelPlanModelImplCopyWith<$Res> {
  __$$TravelPlanModelImplCopyWithImpl(
      _$TravelPlanModelImpl _value, $Res Function(_$TravelPlanModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TravelPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planId = null,
    Object? ownerId = null,
    Object? title = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? experienceManifesto = null,
    Object? moodKeywords = null,
    Object? suggestedRoute = null,
    Object? aiConversationHistory = null,
  }) {
    return _then(_$TravelPlanModelImpl(
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      experienceManifesto: null == experienceManifesto
          ? _value.experienceManifesto
          : experienceManifesto // ignore: cast_nullable_to_non_nullable
              as String,
      moodKeywords: null == moodKeywords
          ? _value._moodKeywords
          : moodKeywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      suggestedRoute: null == suggestedRoute
          ? _value._suggestedRoute
          : suggestedRoute // ignore: cast_nullable_to_non_nullable
              as List<SuggestedRouteItemModel>,
      aiConversationHistory: null == aiConversationHistory
          ? _value._aiConversationHistory
          : aiConversationHistory // ignore: cast_nullable_to_non_nullable
              as List<AiConversationItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TravelPlanModelImpl implements _TravelPlanModel {
  const _$TravelPlanModelImpl(
      {required this.planId,
      required this.ownerId,
      required this.title,
      required this.status,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt,
      required this.experienceManifesto,
      required final List<String> moodKeywords,
      required final List<SuggestedRouteItemModel> suggestedRoute,
      required final List<AiConversationItemModel> aiConversationHistory})
      : _moodKeywords = moodKeywords,
        _suggestedRoute = suggestedRoute,
        _aiConversationHistory = aiConversationHistory;

  factory _$TravelPlanModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravelPlanModelImplFromJson(json);

  @override
  final String planId;
  @override
  final String ownerId;
  @override
  final String title;
  @override
  final String status;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @TimestampConverter()
  final DateTime updatedAt;
  @override
  final String experienceManifesto;
  final List<String> _moodKeywords;
  @override
  List<String> get moodKeywords {
    if (_moodKeywords is EqualUnmodifiableListView) return _moodKeywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_moodKeywords);
  }

  final List<SuggestedRouteItemModel> _suggestedRoute;
  @override
  List<SuggestedRouteItemModel> get suggestedRoute {
    if (_suggestedRoute is EqualUnmodifiableListView) return _suggestedRoute;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestedRoute);
  }

  final List<AiConversationItemModel> _aiConversationHistory;
  @override
  List<AiConversationItemModel> get aiConversationHistory {
    if (_aiConversationHistory is EqualUnmodifiableListView)
      return _aiConversationHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_aiConversationHistory);
  }

  @override
  String toString() {
    return 'TravelPlanModel(planId: $planId, ownerId: $ownerId, title: $title, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, experienceManifesto: $experienceManifesto, moodKeywords: $moodKeywords, suggestedRoute: $suggestedRoute, aiConversationHistory: $aiConversationHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelPlanModelImpl &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.experienceManifesto, experienceManifesto) ||
                other.experienceManifesto == experienceManifesto) &&
            const DeepCollectionEquality()
                .equals(other._moodKeywords, _moodKeywords) &&
            const DeepCollectionEquality()
                .equals(other._suggestedRoute, _suggestedRoute) &&
            const DeepCollectionEquality()
                .equals(other._aiConversationHistory, _aiConversationHistory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      planId,
      ownerId,
      title,
      status,
      createdAt,
      updatedAt,
      experienceManifesto,
      const DeepCollectionEquality().hash(_moodKeywords),
      const DeepCollectionEquality().hash(_suggestedRoute),
      const DeepCollectionEquality().hash(_aiConversationHistory));

  /// Create a copy of TravelPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelPlanModelImplCopyWith<_$TravelPlanModelImpl> get copyWith =>
      __$$TravelPlanModelImplCopyWithImpl<_$TravelPlanModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TravelPlanModelImplToJson(
      this,
    );
  }
}

abstract class _TravelPlanModel implements TravelPlanModel {
  const factory _TravelPlanModel(
          {required final String planId,
          required final String ownerId,
          required final String title,
          required final String status,
          @TimestampConverter() required final DateTime createdAt,
          @TimestampConverter() required final DateTime updatedAt,
          required final String experienceManifesto,
          required final List<String> moodKeywords,
          required final List<SuggestedRouteItemModel> suggestedRoute,
          required final List<AiConversationItemModel> aiConversationHistory}) =
      _$TravelPlanModelImpl;

  factory _TravelPlanModel.fromJson(Map<String, dynamic> json) =
      _$TravelPlanModelImpl.fromJson;

  @override
  String get planId;
  @override
  String get ownerId;
  @override
  String get title;
  @override
  String get status;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @TimestampConverter()
  DateTime get updatedAt;
  @override
  String get experienceManifesto;
  @override
  List<String> get moodKeywords;
  @override
  List<SuggestedRouteItemModel> get suggestedRoute;
  @override
  List<AiConversationItemModel> get aiConversationHistory;

  /// Create a copy of TravelPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelPlanModelImplCopyWith<_$TravelPlanModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SuggestedRouteItemModel _$SuggestedRouteItemModelFromJson(
    Map<String, dynamic> json) {
  return _SuggestedRouteItemModel.fromJson(json);
}

/// @nodoc
mixin _$SuggestedRouteItemModel {
  String get locationName => throw _privateConstructorUsedError;
  int get durationDays => throw _privateConstructorUsedError;
  String get reasoning => throw _privateConstructorUsedError;
  List<String> get activities => throw _privateConstructorUsedError;

  /// Serializes this SuggestedRouteItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SuggestedRouteItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SuggestedRouteItemModelCopyWith<SuggestedRouteItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestedRouteItemModelCopyWith<$Res> {
  factory $SuggestedRouteItemModelCopyWith(SuggestedRouteItemModel value,
          $Res Function(SuggestedRouteItemModel) then) =
      _$SuggestedRouteItemModelCopyWithImpl<$Res, SuggestedRouteItemModel>;
  @useResult
  $Res call(
      {String locationName,
      int durationDays,
      String reasoning,
      List<String> activities});
}

/// @nodoc
class _$SuggestedRouteItemModelCopyWithImpl<$Res,
        $Val extends SuggestedRouteItemModel>
    implements $SuggestedRouteItemModelCopyWith<$Res> {
  _$SuggestedRouteItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SuggestedRouteItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationName = null,
    Object? durationDays = null,
    Object? reasoning = null,
    Object? activities = null,
  }) {
    return _then(_value.copyWith(
      locationName: null == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      durationDays: null == durationDays
          ? _value.durationDays
          : durationDays // ignore: cast_nullable_to_non_nullable
              as int,
      reasoning: null == reasoning
          ? _value.reasoning
          : reasoning // ignore: cast_nullable_to_non_nullable
              as String,
      activities: null == activities
          ? _value.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuggestedRouteItemModelImplCopyWith<$Res>
    implements $SuggestedRouteItemModelCopyWith<$Res> {
  factory _$$SuggestedRouteItemModelImplCopyWith(
          _$SuggestedRouteItemModelImpl value,
          $Res Function(_$SuggestedRouteItemModelImpl) then) =
      __$$SuggestedRouteItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String locationName,
      int durationDays,
      String reasoning,
      List<String> activities});
}

/// @nodoc
class __$$SuggestedRouteItemModelImplCopyWithImpl<$Res>
    extends _$SuggestedRouteItemModelCopyWithImpl<$Res,
        _$SuggestedRouteItemModelImpl>
    implements _$$SuggestedRouteItemModelImplCopyWith<$Res> {
  __$$SuggestedRouteItemModelImplCopyWithImpl(
      _$SuggestedRouteItemModelImpl _value,
      $Res Function(_$SuggestedRouteItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SuggestedRouteItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationName = null,
    Object? durationDays = null,
    Object? reasoning = null,
    Object? activities = null,
  }) {
    return _then(_$SuggestedRouteItemModelImpl(
      locationName: null == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      durationDays: null == durationDays
          ? _value.durationDays
          : durationDays // ignore: cast_nullable_to_non_nullable
              as int,
      reasoning: null == reasoning
          ? _value.reasoning
          : reasoning // ignore: cast_nullable_to_non_nullable
              as String,
      activities: null == activities
          ? _value._activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuggestedRouteItemModelImpl implements _SuggestedRouteItemModel {
  const _$SuggestedRouteItemModelImpl(
      {required this.locationName,
      required this.durationDays,
      required this.reasoning,
      required final List<String> activities})
      : _activities = activities;

  factory _$SuggestedRouteItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuggestedRouteItemModelImplFromJson(json);

  @override
  final String locationName;
  @override
  final int durationDays;
  @override
  final String reasoning;
  final List<String> _activities;
  @override
  List<String> get activities {
    if (_activities is EqualUnmodifiableListView) return _activities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activities);
  }

  @override
  String toString() {
    return 'SuggestedRouteItemModel(locationName: $locationName, durationDays: $durationDays, reasoning: $reasoning, activities: $activities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestedRouteItemModelImpl &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.durationDays, durationDays) ||
                other.durationDays == durationDays) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning) &&
            const DeepCollectionEquality()
                .equals(other._activities, _activities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, locationName, durationDays,
      reasoning, const DeepCollectionEquality().hash(_activities));

  /// Create a copy of SuggestedRouteItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestedRouteItemModelImplCopyWith<_$SuggestedRouteItemModelImpl>
      get copyWith => __$$SuggestedRouteItemModelImplCopyWithImpl<
          _$SuggestedRouteItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SuggestedRouteItemModelImplToJson(
      this,
    );
  }
}

abstract class _SuggestedRouteItemModel implements SuggestedRouteItemModel {
  const factory _SuggestedRouteItemModel(
      {required final String locationName,
      required final int durationDays,
      required final String reasoning,
      required final List<String> activities}) = _$SuggestedRouteItemModelImpl;

  factory _SuggestedRouteItemModel.fromJson(Map<String, dynamic> json) =
      _$SuggestedRouteItemModelImpl.fromJson;

  @override
  String get locationName;
  @override
  int get durationDays;
  @override
  String get reasoning;
  @override
  List<String> get activities;

  /// Create a copy of SuggestedRouteItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuggestedRouteItemModelImplCopyWith<_$SuggestedRouteItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AiConversationItemModel _$AiConversationItemModelFromJson(
    Map<String, dynamic> json) {
  return _AiConversationItemModel.fromJson(json);
}

/// @nodoc
mixin _$AiConversationItemModel {
  String get role =>
      throw _privateConstructorUsedError; // 'user' or 'assistant'
  String get content => throw _privateConstructorUsedError;

  /// Serializes this AiConversationItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiConversationItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiConversationItemModelCopyWith<AiConversationItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiConversationItemModelCopyWith<$Res> {
  factory $AiConversationItemModelCopyWith(AiConversationItemModel value,
          $Res Function(AiConversationItemModel) then) =
      _$AiConversationItemModelCopyWithImpl<$Res, AiConversationItemModel>;
  @useResult
  $Res call({String role, String content});
}

/// @nodoc
class _$AiConversationItemModelCopyWithImpl<$Res,
        $Val extends AiConversationItemModel>
    implements $AiConversationItemModelCopyWith<$Res> {
  _$AiConversationItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiConversationItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AiConversationItemModelImplCopyWith<$Res>
    implements $AiConversationItemModelCopyWith<$Res> {
  factory _$$AiConversationItemModelImplCopyWith(
          _$AiConversationItemModelImpl value,
          $Res Function(_$AiConversationItemModelImpl) then) =
      __$$AiConversationItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String role, String content});
}

/// @nodoc
class __$$AiConversationItemModelImplCopyWithImpl<$Res>
    extends _$AiConversationItemModelCopyWithImpl<$Res,
        _$AiConversationItemModelImpl>
    implements _$$AiConversationItemModelImplCopyWith<$Res> {
  __$$AiConversationItemModelImplCopyWithImpl(
      _$AiConversationItemModelImpl _value,
      $Res Function(_$AiConversationItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AiConversationItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = null,
  }) {
    return _then(_$AiConversationItemModelImpl(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AiConversationItemModelImpl implements _AiConversationItemModel {
  const _$AiConversationItemModelImpl(
      {required this.role, required this.content});

  factory _$AiConversationItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiConversationItemModelImplFromJson(json);

  @override
  final String role;
// 'user' or 'assistant'
  @override
  final String content;

  @override
  String toString() {
    return 'AiConversationItemModel(role: $role, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiConversationItemModelImpl &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, role, content);

  /// Create a copy of AiConversationItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiConversationItemModelImplCopyWith<_$AiConversationItemModelImpl>
      get copyWith => __$$AiConversationItemModelImplCopyWithImpl<
          _$AiConversationItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AiConversationItemModelImplToJson(
      this,
    );
  }
}

abstract class _AiConversationItemModel implements AiConversationItemModel {
  const factory _AiConversationItemModel(
      {required final String role,
      required final String content}) = _$AiConversationItemModelImpl;

  factory _AiConversationItemModel.fromJson(Map<String, dynamic> json) =
      _$AiConversationItemModelImpl.fromJson;

  @override
  String get role; // 'user' or 'assistant'
  @override
  String get content;

  /// Create a copy of AiConversationItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiConversationItemModelImplCopyWith<_$AiConversationItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
