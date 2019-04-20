import 'package:meta/meta.dart';
import 'package:meta/meta.dart';
// import 'timesheet.dart';
import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

part 'service_item.g.dart';

abstract class ServiceItem implements Built<ServiceItem, ServiceItemBuilder> {
  @nullable
  String get smGUID;
  @nullable
  String get status;
  @nullable
  String get id;
  @nullable
  int get quantity;
  @nullable
  String get smServiceItemId;
  @nullable
  bool get needsRepair;
  @nullable
  @nullable
  int get createdAt;
  @nullable
  String get prettyCreatedAt;
  @nullable
  String get priority;
  @nullable
  String get createdById;
  @nullable
  String get createdByName;
  @nullable
  String get prettyDueAt;
  @nullable
  String get notes;
  @nullable
  String get serviceName;
  @nullable
  String get tagId;
  @nullable
  String get tagColor;
  String get primaryPictureUrl;
  @nullable
  String get intake_notes;
  @nullable
  String get workorderId;
  @nullable
  String get smWorkorderId;
  int get length;
  int get width;
  int get price;
  @nullable
  bool get hasUrine;
  @nullable
  DateTime get dueDateTime;
  bool get isDone;
  BuiltList<Picture> get pictures;
  ServiceItem._();
  factory ServiceItem([updates(ServiceItemBuilder b)]) = _$ServiceItem;
  static Serializer<ServiceItem> get serializer => _$serviceItemSerializer;
}

abstract class Picture implements Built<Picture, PictureBuilder> {
  String get id;
  String get url;

  Picture._();
  factory Picture([updates(PictureBuilder b)]) = _$Picture;
  static Serializer<Picture> get serializer => _$pictureSerializer;
}
