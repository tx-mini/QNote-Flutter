// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NoteContent.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

NoteContent _$NoteContentFromJson(Map<String, dynamic> json) => new NoteContent(
    (json['blocks'] as List)
        ?.map((e) => e == null
            ? null
            : new BlockObject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['entityMap'] == null
        ? null
        : new Map<String, EntityMapObject>.fromIterables(
            (json['entityMap'] as Map<String, dynamic>).keys,
            (json['entityMap'] as Map).values.map((e) => e == null
                ? null
                : new EntityMapObject.fromJson(e as Map<String, dynamic>))));

abstract class _$NoteContentSerializerMixin {
  List<BlockObject> get blocks;
  Map<String, EntityMapObject> get entityMap;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'blocks': blocks, 'entityMap': entityMap};
}
