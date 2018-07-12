import 'package:json_annotation/json_annotation.dart';

part 'BlockObject.g.dart';

@JsonSerializable()
class BlockObject extends Object with _$BlockObjectSerializerMixin {
  String key;
  String text;
  String type;
  int depth;
  List inlineStyleRanges;
  List entityRanges;
  Object data;

  BlockObject(this.key, this.text, this.type, this.depth,
      this.inlineStyleRanges, this.entityRanges, this.data);

  factory BlockObject.fromJson(Map<String, dynamic> json) =>
      _$BlockObjectFromJson(json);
}
