import 'package:json_annotation/json_annotation.dart';
part 'pet.g.dart';

@JsonSerializable()
class Pet {
  String name;
  String description;
  String profilePicUrl;
  List<String> tags;
  List<String> picsUrl;

  Pet(
      {this.description,
      this.name,
      this.picsUrl,
      this.profilePicUrl,
      this.tags});

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);
  Map<String, dynamic> toJson() => _$PetToJson(this);
}
