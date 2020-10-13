// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Calendar _$CalendarFromJson(Map<String, dynamic> json) {
  return Calendar(
    isBlocked: json['isBlocked'] as bool,
    petId: json['petId'] as String,
  );
}

Map<String, dynamic> _$CalendarToJson(Calendar instance) => <String, dynamic>{
      'petId': instance.petId,
      'isBlocked': instance.isBlocked,
    };
