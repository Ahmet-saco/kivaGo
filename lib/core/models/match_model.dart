import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../utils/timestamp_converter.dart';

part 'match_model.freezed.dart';
part 'match_model.g.dart';

/// Match model for Firestore matches collection
@freezed
class MatchModel with _$MatchModel {
  const factory MatchModel({
    required String matchId,
    required String status,
    required String relatedTravelPlanId,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,
    required List<String> users,
    required String initiatorId,
  }) = _MatchModel;

  factory MatchModel.fromJson(Map<String, dynamic> json) =>
      _$MatchModelFromJson(json);
}
