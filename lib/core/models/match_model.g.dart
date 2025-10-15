// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchModelImpl _$$MatchModelImplFromJson(Map<String, dynamic> json) =>
    _$MatchModelImpl(
      matchId: json['matchId'] as String,
      status: json['status'] as String,
      relatedTravelPlanId: json['relatedTravelPlanId'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
      users: (json['users'] as List<dynamic>).map((e) => e as String).toList(),
      initiatorId: json['initiatorId'] as String,
    );

Map<String, dynamic> _$$MatchModelImplToJson(_$MatchModelImpl instance) =>
    <String, dynamic>{
      'matchId': instance.matchId,
      'status': instance.status,
      'relatedTravelPlanId': instance.relatedTravelPlanId,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'users': instance.users,
      'initiatorId': instance.initiatorId,
    };
