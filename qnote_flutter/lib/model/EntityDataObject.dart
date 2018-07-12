import 'package:json_annotation/json_annotation.dart';

part 'EntityDataObject.g.dart';

@JsonSerializable()
class EntityDataObject extends Object with _$EntityDataObjectSerializerMixin {
  String url;
  String name;
  String type;
  Object meta;

  EntityDataObject(this.url, this.name, this.type, this.meta);

  factory EntityDataObject.fromJson(Map<String, dynamic> json) =>
      _$EntityDataObjectFromJson(json);
}
