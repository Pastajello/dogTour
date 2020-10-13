import 'package:json_annotation/json_annotation.dart';
import 'package:dogtour_admin/models/reserved_spot.dart';

part 'calendar.g.dart';

@JsonSerializable()
class Calendar {
  String petId;
  bool isBlocked;
  @JsonKey(ignore: true)
  List<ReservedSpot> reservedHours;
  Calendar({this.isBlocked, this.petId});

  factory Calendar.fromJson(Map<String, dynamic> json) =>
      _$CalendarFromJson(json);
  Map<String, dynamic> toJson() => _$CalendarToJson(this);
}
