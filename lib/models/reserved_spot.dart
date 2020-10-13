import 'package:json_annotation/json_annotation.dart';
part 'reserved_spot.g.dart';

@JsonSerializable()
class ReservedSpot {
  DateTime start;
  DateTime end;
  String userId;
  ReservedSpot({this.start, this.end, this.userId});

  factory ReservedSpot.fromJson(Map<String, dynamic> json) =>
      _$ReservedSpotFromJson(json);
  Map<String, dynamic> toJson() => _$ReservedSpotToJson(this);
}
