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
    age: (json['age'] as num)?.toDouble(),
    color: json['color'] as String,
    race: json['race'] as String,
    weight: (json['weight'] as num)?.toDouble(),
  )
    ..id = json['id'] as String
    ..calendar = json['calendar'] == null
        ? null
        : Calendar.fromJson(json['calendar'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PetToJson(Pet instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'profilePicUrl': instance.profilePicUrl,
      'age': instance.age,
      'weight': instance.weight,
      'color': instance.color,
      'race': instance.race,
      'tags': instance.tags,
      'picsUrl': instance.picsUrl,
      'calendar': instance.calendar,
    };
