// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EntityMapObject.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

EntityMapObject _$EntityMapObjectFromJson(Map<String, dynamic> json) =>
    new EntityMapObject(
        json['type'] as String,
        json['mutability'] as String,
        json['data'] == null
            ? null
            : new EntityDataObject.fromJson(
                json['data'] as Map<String, dynamic>));

abstract class _$EntityMapObjectSerializerMixin {
  String get type;
  String get mutability;
  EntityDataObject get data;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'type': type, 'mutability': mutability, 'data': data};
}
