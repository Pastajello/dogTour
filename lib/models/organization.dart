import 'package:json_annotation/json_annotation.dart';
part 'organization.g.dart';

@JsonSerializable()
class Organization {
  final String id;
  final String fullName;
  final String email;

  Organization({this.id, this.fullName, this.email});

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);
  Map<String, dynamic> toJson() => _$OrganizationToJson(this);
}
