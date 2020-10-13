// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reserved_spot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservedSpot _$ReservedSpotFromJson(Map<String, dynamic> json) {
  return ReservedSpot(
    start:
        json['start'] == null ? null : DateTime.parse(json['start'] as String),
    end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$ReservedSpotToJson(ReservedSpot instance) =>
    <String, dynamic>{
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'userId': instance.userId,
    };
