// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Donation _$DonationFromJson(Map<String, dynamic> json) {
  return Donation(
    id: json['id'] as String,
    ammount: (json['ammount'] as num)?.toDouble(),
    dayPeriod: json['dayPeriod'] as int,
    isPeriodic: json['isPeriodic'] as bool,
    organizationId: json['organizationId'] as String,
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$DonationToJson(Donation instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'organizationId': instance.organizationId,
      'isPeriodic': instance.isPeriodic,
      'dayPeriod': instance.dayPeriod,
      'ammount': instance.ammount,
    };
