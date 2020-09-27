// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pet _$PetFromJson(Map<String, dynamic> json) {
  return Pet(
    description: json['description'] as String,
    name: json['name'] as String,
    picsUrl: (json['picsUrl'] as List)?.map((e) => e as String)?.toList(),
    profilePicUrl: json['profilePicUrl'] as String,
    tags: (json['tags'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$PetToJson(Pet instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'profilePicUrl': instance.profilePicUrl,
      'tags': instance.tags,
      'picsUrl': instance.picsUrl,
    };
