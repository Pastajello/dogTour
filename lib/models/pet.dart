import 'package:json_annotation/json_annotation.dart';
part 'pet.g.dart';

@JsonSerializable()
class Pet {
  String name;
  String description;
  String profilePicUrl;
  double age;
  double weight;
  String color;
  String race;
  List<String> tags;
  List<String> picsUrl;

  Pet(
      {this.description,
      this.name,
      this.picsUrl,
      this.profilePicUrl,
      this.tags,
      this.age,
      this.color,
      this.race,
      this.weight});

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);
  Map<String, dynamic> toJson() => _$PetToJson(this);
}
