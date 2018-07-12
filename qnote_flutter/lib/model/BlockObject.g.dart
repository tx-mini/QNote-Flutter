// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BlockObject.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

BlockObject _$BlockObjectFromJson(Map<String, dynamic> json) => new BlockObject(
    json['key'] as String,
    json['text'] as String,
    json['type'] as String,
    json['depth'] as int,
    json['inlineStyleRanges'] as List,
    json['entityRanges'] as List,
    json['data']);

abstract class _$BlockObjectSerializerMixin {
  String get key;
  String get text;
  String get type;
  int get depth;
  List<dynamic> get inlineStyleRanges;
  List<dynamic> get entityRanges;
  Object get data;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'key': key,
        'text': text,
        'type': type,
        'depth': depth,
        'inlineStyleRanges': inlineStyleRanges,
        'entityRanges': entityRanges,
        'data': data
      };
}
