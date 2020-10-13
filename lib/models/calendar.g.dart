// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Calendar _$CalendarFromJson(Map<String, dynamic> json) {
  return Calendar(
    isBlocked: json['isBlocked'] as bool,
    petId: json['petId'] as String,
    reservedHours: (json['reservedHours'] as List)
        ?.map((e) =>
            e == null ? null : ReservedSpot.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CalendarToJson(Calendar instance) => <String, dynamic>{
      'petId': instance.petId,
      'isBlocked': instance.isBlocked,
      'reservedHours': instance.reservedHours,
    };
