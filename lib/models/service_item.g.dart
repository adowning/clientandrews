// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ServiceItem> _$serviceItemSerializer = new _$ServiceItemSerializer();
Serializer<Picture> _$pictureSerializer = new _$PictureSerializer();

class _$ServiceItemSerializer implements StructuredSerializer<ServiceItem> {
  @override
  final Iterable<Type> types = const [ServiceItem, _$ServiceItem];
  @override
  final String wireName = 'ServiceItem';

  @override
  Iterable serialize(Serializers serializers, ServiceItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'primaryPictureUrl',
      serializers.serialize(object.primaryPictureUrl,
          specifiedType: const FullType(String)),
      'length',
      serializers.serialize(object.length, specifiedType: const FullType(int)),
      'width',
      serializers.serialize(object.width, specifiedType: const FullType(int)),
      'price',
      serializers.serialize(object.price, specifiedType: const FullType(int)),
      'isDone',
      serializers.serialize(object.isDone, specifiedType: const FullType(bool)),
      'pictures',
      serializers.serialize(object.pictures,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Picture)])),
    ];
    if (object.smGUID != null) {
      result
        ..add('smGUID')
        ..add(serializers.serialize(object.smGUID,
            specifiedType: const FullType(String)));
    }
    if (object.status != null) {
      result
        ..add('status')
        ..add(serializers.serialize(object.status,
            specifiedType: const FullType(String)));
    }
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.quantity != null) {
      result
        ..add('quantity')
        ..add(serializers.serialize(object.quantity,
            specifiedType: const FullType(int)));
    }
    if (object.smServiceItemId != null) {
      result
        ..add('smServiceItemId')
        ..add(serializers.serialize(object.smServiceItemId,
            specifiedType: const FullType(String)));
    }
    if (object.needsRepair != null) {
      result
        ..add('needsRepair')
        ..add(serializers.serialize(object.needsRepair,
            specifiedType: const FullType(bool)));
    }
    if (object.createdAt != null) {
      result
        ..add('createdAt')
        ..add(serializers.serialize(object.createdAt,
            specifiedType: const FullType(int)));
    }
    if (object.prettyCreatedAt != null) {
      result
        ..add('prettyCreatedAt')
        ..add(serializers.serialize(object.prettyCreatedAt,
            specifiedType: const FullType(String)));
    }
    if (object.priority != null) {
      result
        ..add('priority')
        ..add(serializers.serialize(object.priority,
            specifiedType: const FullType(String)));
    }
    if (object.createdById != null) {
      result
        ..add('createdById')
        ..add(serializers.serialize(object.createdById,
            specifiedType: const FullType(String)));
    }
    if (object.createdByName != null) {
      result
        ..add('createdByName')
        ..add(serializers.serialize(object.createdByName,
            specifiedType: const FullType(String)));
    }
    if (object.prettyDueAt != null) {
      result
        ..add('prettyDueAt')
        ..add(serializers.serialize(object.prettyDueAt,
            specifiedType: const FullType(String)));
    }
    if (object.notes != null) {
      result
        ..add('notes')
        ..add(serializers.serialize(object.notes,
            specifiedType: const FullType(String)));
    }
    if (object.serviceName != null) {
      result
        ..add('serviceName')
        ..add(serializers.serialize(object.serviceName,
            specifiedType: const FullType(String)));
    }
    if (object.tagId != null) {
      result
        ..add('tagId')
        ..add(serializers.serialize(object.tagId,
            specifiedType: const FullType(String)));
    }
    if (object.tagColor != null) {
      result
        ..add('tagColor')
        ..add(serializers.serialize(object.tagColor,
            specifiedType: const FullType(String)));
    }
    if (object.intake_notes != null) {
      result
        ..add('intake_notes')
        ..add(serializers.serialize(object.intake_notes,
            specifiedType: const FullType(String)));
    }
    if (object.workorderId != null) {
      result
        ..add('workorderId')
        ..add(serializers.serialize(object.workorderId,
            specifiedType: const FullType(String)));
    }
    if (object.smWorkorderId != null) {
      result
        ..add('smWorkorderId')
        ..add(serializers.serialize(object.smWorkorderId,
            specifiedType: const FullType(String)));
    }
    if (object.hasUrine != null) {
      result
        ..add('hasUrine')
        ..add(serializers.serialize(object.hasUrine,
            specifiedType: const FullType(bool)));
    }
    if (object.dueDateTime != null) {
      result
        ..add('dueDateTime')
        ..add(serializers.serialize(object.dueDateTime,
            specifiedType: const FullType(DateTime)));
    }

    return result;
  }

  @override
  ServiceItem deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ServiceItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'smGUID':
          result.smGUID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'quantity':
          result.quantity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'smServiceItemId':
          result.smServiceItemId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'needsRepair':
          result.needsRepair = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'prettyCreatedAt':
          result.prettyCreatedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'priority':
          result.priority = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'createdById':
          result.createdById = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'createdByName':
          result.createdByName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'prettyDueAt':
          result.prettyDueAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'notes':
          result.notes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'serviceName':
          result.serviceName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tagId':
          result.tagId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tagColor':
          result.tagColor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'primaryPictureUrl':
          result.primaryPictureUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'intake_notes':
          result.intake_notes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'workorderId':
          result.workorderId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'smWorkorderId':
          result.smWorkorderId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'length':
          result.length = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'width':
          result.width = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'hasUrine':
          result.hasUrine = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'dueDateTime':
          result.dueDateTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'isDone':
          result.isDone = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'pictures':
          result.pictures.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(Picture)])) as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$PictureSerializer implements StructuredSerializer<Picture> {
  @override
  final Iterable<Type> types = const [Picture, _$Picture];
  @override
  final String wireName = 'Picture';

  @override
  Iterable serialize(Serializers serializers, Picture object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Picture deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PictureBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ServiceItem extends ServiceItem {
  @override
  final String smGUID;
  @override
  final String status;
  @override
  final String id;
  @override
  final int quantity;
  @override
  final String smServiceItemId;
  @override
  final bool needsRepair;
  @override
  final int createdAt;
  @override
  final String prettyCreatedAt;
  @override
  final String priority;
  @override
  final String createdById;
  @override
  final String createdByName;
  @override
  final String prettyDueAt;
  @override
  final String notes;
  @override
  final String serviceName;
  @override
  final String tagId;
  @override
  final String tagColor;
  @override
  final String primaryPictureUrl;
  @override
  final String intake_notes;
  @override
  final String workorderId;
  @override
  final String smWorkorderId;
  @override
  final int length;
  @override
  final int width;
  @override
  final int price;
  @override
  final bool hasUrine;
  @override
  final DateTime dueDateTime;
  @override
  final bool isDone;
  @override
  final BuiltList<Picture> pictures;

  factory _$ServiceItem([void Function(ServiceItemBuilder) updates]) =>
      (new ServiceItemBuilder()..update(updates)).build();

  _$ServiceItem._(
      {this.smGUID,
      this.status,
      this.id,
      this.quantity,
      this.smServiceItemId,
      this.needsRepair,
      this.createdAt,
      this.prettyCreatedAt,
      this.priority,
      this.createdById,
      this.createdByName,
      this.prettyDueAt,
      this.notes,
      this.serviceName,
      this.tagId,
      this.tagColor,
      this.primaryPictureUrl,
      this.intake_notes,
      this.workorderId,
      this.smWorkorderId,
      this.length,
      this.width,
      this.price,
      this.hasUrine,
      this.dueDateTime,
      this.isDone,
      this.pictures})
      : super._() {
    if (primaryPictureUrl == null) {
      throw new BuiltValueNullFieldError('ServiceItem', 'primaryPictureUrl');
    }
    if (length == null) {
      throw new BuiltValueNullFieldError('ServiceItem', 'length');
    }
    if (width == null) {
      throw new BuiltValueNullFieldError('ServiceItem', 'width');
    }
    if (price == null) {
      throw new BuiltValueNullFieldError('ServiceItem', 'price');
    }
    if (isDone == null) {
      throw new BuiltValueNullFieldError('ServiceItem', 'isDone');
    }
    if (pictures == null) {
      throw new BuiltValueNullFieldError('ServiceItem', 'pictures');
    }
  }

  @override
  ServiceItem rebuild(void Function(ServiceItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServiceItemBuilder toBuilder() => new ServiceItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServiceItem &&
        smGUID == other.smGUID &&
        status == other.status &&
        id == other.id &&
        quantity == other.quantity &&
        smServiceItemId == other.smServiceItemId &&
        needsRepair == other.needsRepair &&
        createdAt == other.createdAt &&
        prettyCreatedAt == other.prettyCreatedAt &&
        priority == other.priority &&
        createdById == other.createdById &&
        createdByName == other.createdByName &&
        prettyDueAt == other.prettyDueAt &&
        notes == other.notes &&
        serviceName == other.serviceName &&
        tagId == other.tagId &&
        tagColor == other.tagColor &&
        primaryPictureUrl == other.primaryPictureUrl &&
        intake_notes == other.intake_notes &&
        workorderId == other.workorderId &&
        smWorkorderId == other.smWorkorderId &&
        length == other.length &&
        width == other.width &&
        price == other.price &&
        hasUrine == other.hasUrine &&
        dueDateTime == other.dueDateTime &&
        isDone == other.isDone &&
        pictures == other.pictures;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc(0, smGUID.hashCode), status.hashCode), id.hashCode), quantity.hashCode), smServiceItemId.hashCode), needsRepair.hashCode), createdAt.hashCode), prettyCreatedAt.hashCode),
                                                                                priority.hashCode),
                                                                            createdById.hashCode),
                                                                        createdByName.hashCode),
                                                                    prettyDueAt.hashCode),
                                                                notes.hashCode),
                                                            serviceName.hashCode),
                                                        tagId.hashCode),
                                                    tagColor.hashCode),
                                                primaryPictureUrl.hashCode),
                                            intake_notes.hashCode),
                                        workorderId.hashCode),
                                    smWorkorderId.hashCode),
                                length.hashCode),
                            width.hashCode),
                        price.hashCode),
                    hasUrine.hashCode),
                dueDateTime.hashCode),
            isDone.hashCode),
        pictures.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ServiceItem')
          ..add('smGUID', smGUID)
          ..add('status', status)
          ..add('id', id)
          ..add('quantity', quantity)
          ..add('smServiceItemId', smServiceItemId)
          ..add('needsRepair', needsRepair)
          ..add('createdAt', createdAt)
          ..add('prettyCreatedAt', prettyCreatedAt)
          ..add('priority', priority)
          ..add('createdById', createdById)
          ..add('createdByName', createdByName)
          ..add('prettyDueAt', prettyDueAt)
          ..add('notes', notes)
          ..add('serviceName', serviceName)
          ..add('tagId', tagId)
          ..add('tagColor', tagColor)
          ..add('primaryPictureUrl', primaryPictureUrl)
          ..add('intake_notes', intake_notes)
          ..add('workorderId', workorderId)
          ..add('smWorkorderId', smWorkorderId)
          ..add('length', length)
          ..add('width', width)
          ..add('price', price)
          ..add('hasUrine', hasUrine)
          ..add('dueDateTime', dueDateTime)
          ..add('isDone', isDone)
          ..add('pictures', pictures))
        .toString();
  }
}

class ServiceItemBuilder implements Builder<ServiceItem, ServiceItemBuilder> {
  _$ServiceItem _$v;

  String _smGUID;
  String get smGUID => _$this._smGUID;
  set smGUID(String smGUID) => _$this._smGUID = smGUID;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  int _quantity;
  int get quantity => _$this._quantity;
  set quantity(int quantity) => _$this._quantity = quantity;

  String _smServiceItemId;
  String get smServiceItemId => _$this._smServiceItemId;
  set smServiceItemId(String smServiceItemId) =>
      _$this._smServiceItemId = smServiceItemId;

  bool _needsRepair;
  bool get needsRepair => _$this._needsRepair;
  set needsRepair(bool needsRepair) => _$this._needsRepair = needsRepair;

  int _createdAt;
  int get createdAt => _$this._createdAt;
  set createdAt(int createdAt) => _$this._createdAt = createdAt;

  String _prettyCreatedAt;
  String get prettyCreatedAt => _$this._prettyCreatedAt;
  set prettyCreatedAt(String prettyCreatedAt) =>
      _$this._prettyCreatedAt = prettyCreatedAt;

  String _priority;
  String get priority => _$this._priority;
  set priority(String priority) => _$this._priority = priority;

  String _createdById;
  String get createdById => _$this._createdById;
  set createdById(String createdById) => _$this._createdById = createdById;

  String _createdByName;
  String get createdByName => _$this._createdByName;
  set createdByName(String createdByName) =>
      _$this._createdByName = createdByName;

  String _prettyDueAt;
  String get prettyDueAt => _$this._prettyDueAt;
  set prettyDueAt(String prettyDueAt) => _$this._prettyDueAt = prettyDueAt;

  String _notes;
  String get notes => _$this._notes;
  set notes(String notes) => _$this._notes = notes;

  String _serviceName;
  String get serviceName => _$this._serviceName;
  set serviceName(String serviceName) => _$this._serviceName = serviceName;

  String _tagId;
  String get tagId => _$this._tagId;
  set tagId(String tagId) => _$this._tagId = tagId;

  String _tagColor;
  String get tagColor => _$this._tagColor;
  set tagColor(String tagColor) => _$this._tagColor = tagColor;

  String _primaryPictureUrl;
  String get primaryPictureUrl => _$this._primaryPictureUrl;
  set primaryPictureUrl(String primaryPictureUrl) =>
      _$this._primaryPictureUrl = primaryPictureUrl;

  String _intake_notes;
  String get intake_notes => _$this._intake_notes;
  set intake_notes(String intake_notes) => _$this._intake_notes = intake_notes;

  String _workorderId;
  String get workorderId => _$this._workorderId;
  set workorderId(String workorderId) => _$this._workorderId = workorderId;

  String _smWorkorderId;
  String get smWorkorderId => _$this._smWorkorderId;
  set smWorkorderId(String smWorkorderId) =>
      _$this._smWorkorderId = smWorkorderId;

  int _length;
  int get length => _$this._length;
  set length(int length) => _$this._length = length;

  int _width;
  int get width => _$this._width;
  set width(int width) => _$this._width = width;

  int _price;
  int get price => _$this._price;
  set price(int price) => _$this._price = price;

  bool _hasUrine;
  bool get hasUrine => _$this._hasUrine;
  set hasUrine(bool hasUrine) => _$this._hasUrine = hasUrine;

  DateTime _dueDateTime;
  DateTime get dueDateTime => _$this._dueDateTime;
  set dueDateTime(DateTime dueDateTime) => _$this._dueDateTime = dueDateTime;

  bool _isDone;
  bool get isDone => _$this._isDone;
  set isDone(bool isDone) => _$this._isDone = isDone;

  ListBuilder<Picture> _pictures;
  ListBuilder<Picture> get pictures =>
      _$this._pictures ??= new ListBuilder<Picture>();
  set pictures(ListBuilder<Picture> pictures) => _$this._pictures = pictures;

  ServiceItemBuilder();

  ServiceItemBuilder get _$this {
    if (_$v != null) {
      _smGUID = _$v.smGUID;
      _status = _$v.status;
      _id = _$v.id;
      _quantity = _$v.quantity;
      _smServiceItemId = _$v.smServiceItemId;
      _needsRepair = _$v.needsRepair;
      _createdAt = _$v.createdAt;
      _prettyCreatedAt = _$v.prettyCreatedAt;
      _priority = _$v.priority;
      _createdById = _$v.createdById;
      _createdByName = _$v.createdByName;
      _prettyDueAt = _$v.prettyDueAt;
      _notes = _$v.notes;
      _serviceName = _$v.serviceName;
      _tagId = _$v.tagId;
      _tagColor = _$v.tagColor;
      _primaryPictureUrl = _$v.primaryPictureUrl;
      _intake_notes = _$v.intake_notes;
      _workorderId = _$v.workorderId;
      _smWorkorderId = _$v.smWorkorderId;
      _length = _$v.length;
      _width = _$v.width;
      _price = _$v.price;
      _hasUrine = _$v.hasUrine;
      _dueDateTime = _$v.dueDateTime;
      _isDone = _$v.isDone;
      _pictures = _$v.pictures?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServiceItem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ServiceItem;
  }

  @override
  void update(void Function(ServiceItemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ServiceItem build() {
    _$ServiceItem _$result;
    try {
      _$result = _$v ??
          new _$ServiceItem._(
              smGUID: smGUID,
              status: status,
              id: id,
              quantity: quantity,
              smServiceItemId: smServiceItemId,
              needsRepair: needsRepair,
              createdAt: createdAt,
              prettyCreatedAt: prettyCreatedAt,
              priority: priority,
              createdById: createdById,
              createdByName: createdByName,
              prettyDueAt: prettyDueAt,
              notes: notes,
              serviceName: serviceName,
              tagId: tagId,
              tagColor: tagColor,
              primaryPictureUrl: primaryPictureUrl,
              intake_notes: intake_notes,
              workorderId: workorderId,
              smWorkorderId: smWorkorderId,
              length: length,
              width: width,
              price: price,
              hasUrine: hasUrine,
              dueDateTime: dueDateTime,
              isDone: isDone,
              pictures: pictures.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'pictures';
        pictures.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ServiceItem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Picture extends Picture {
  @override
  final String id;
  @override
  final String url;

  factory _$Picture([void Function(PictureBuilder) updates]) =>
      (new PictureBuilder()..update(updates)).build();

  _$Picture._({this.id, this.url}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Picture', 'id');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('Picture', 'url');
    }
  }

  @override
  Picture rebuild(void Function(PictureBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PictureBuilder toBuilder() => new PictureBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Picture && id == other.id && url == other.url;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Picture')
          ..add('id', id)
          ..add('url', url))
        .toString();
  }
}

class PictureBuilder implements Builder<Picture, PictureBuilder> {
  _$Picture _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  PictureBuilder();

  PictureBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _url = _$v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Picture other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Picture;
  }

  @override
  void update(void Function(PictureBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Picture build() {
    final _$result = _$v ?? new _$Picture._(id: id, url: url);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
