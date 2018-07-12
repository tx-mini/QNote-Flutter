import 'package:json_annotation/json_annotation.dart';
import 'package:qnote_flutter/model/BlockObject.dart';
import 'package:qnote_flutter/model/EntityMapObject.dart';

part 'NoteContent.g.dart';

@JsonSerializable()
class NoteContent extends Object with _$NoteContentSerializerMixin {
  List<BlockObject> blocks;
  Map<String, EntityMapObject> entityMap;

  NoteContent(this.blocks, this.entityMap);

  factory NoteContent.fromJson(Map<String, dynamic> json) =>
      _$NoteContentFromJson(json);
}
