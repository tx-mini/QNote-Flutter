// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EntityDataObject.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

EntityDataObject _$EntityDataObjectFromJson(Map<String, dynamic> json) =>
    new EntityDataObject(json['url'] as String, json['name'] as String,
        json['type'] as String, json['meta']);

abstract class _$EntityDataObjectSerializerMixin {
  String get url;
  String get name;
  String get type;
  Object get meta;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'url': url, 'name': name, 'type': type, 'meta': meta};
}
