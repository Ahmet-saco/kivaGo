import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../utils/timestamp_converter.dart';

part 'travel_plan_model.freezed.dart';
part 'travel_plan_model.g.dart';

/// Travel plan model for Firestore travelPlans collection
@freezed
class TravelPlanModel with _$TravelPlanModel {
  const factory TravelPlanModel({
    required String planId,
    required String ownerId,
    required String title,
    required String status,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,
    required String experienceManifesto,
    required List<String> moodKeywords,
    required List<SuggestedRouteItemModel> suggestedRoute,
    required List<AiConversationItemModel> aiConversationHistory,
  }) = _TravelPlanModel;

  factory TravelPlanModel.fromJson(Map<String, dynamic> json) =>
      _$TravelPlanModelFromJson(json);
}

/// Suggested route item model for travel plan routes
@freezed
class SuggestedRouteItemModel with _$SuggestedRouteItemModel {
  const factory SuggestedRouteItemModel({
    required String locationName,
    required int durationDays,
    required String reasoning,
    required List<String> activities,
  }) = _SuggestedRouteItemModel;

  factory SuggestedRouteItemModel.fromJson(Map<String, dynamic> json) =>
      _$SuggestedRouteItemModelFromJson(json);
}

/// AI conversation item model for chat history
@freezed
class AiConversationItemModel with _$AiConversationItemModel {
  const factory AiConversationItemModel({
    required String role, // 'user' or 'assistant'
    required String content,
  }) = _AiConversationItemModel;

  factory AiConversationItemModel.fromJson(Map<String, dynamic> json) =>
      _$AiConversationItemModelFromJson(json);
}
