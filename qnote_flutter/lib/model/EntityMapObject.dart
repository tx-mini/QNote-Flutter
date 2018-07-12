import 'package:json_annotation/json_annotation.dart';
import 'package:qnote_flutter/model/EntityDataObject.dart';

part 'EntityMapObject.g.dart';

@JsonSerializable()
class EntityMapObject extends Object with _$EntityMapObjectSerializerMixin {
  String type;
  String mutability;
  EntityDataObject data;

  EntityMapObject(this.type, this.mutability, this.data);

  factory EntityMapObject.fromJson(Map<String, dynamic> json) =>
      _$EntityMapObjectFromJson(json);
}
