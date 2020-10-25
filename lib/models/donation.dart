import 'package:json_annotation/json_annotation.dart';

part 'donation.g.dart';

@JsonSerializable()
class Donation {
  String id;
  String userId;
  String organizationId;
  bool isPeriodic;
  int dayPeriod;
  double ammount;
  Donation(
      {this.id,
      this.ammount,
      this.dayPeriod,
      this.isPeriodic,
      this.organizationId,
      this.userId});

  factory Donation.fromJson(Map<String, dynamic> json) =>
      _$DonationFromJson(json);
  Map<String, dynamic> toJson() => _$DonationToJson(this);
}
