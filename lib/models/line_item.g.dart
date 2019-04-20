// GENERATED CODE - DO NOT MODIFY BY HAND

part of line_item;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LineItem> _$lineItemSerializer = new _$LineItemSerializer();

class _$LineItemSerializer implements StructuredSerializer<LineItem> {
  @override
  final Iterable<Type> types = const [LineItem, _$LineItem];
  @override
  final String wireName = 'LineItem';

  @override
  Iterable serialize(Serializers serializers, LineItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'row_number',
      serializers.serialize(object.rowNumber,
          specifiedType: const FullType(int)),
      'lineItemID',
      serializers.serialize(object.lineItemID,
          specifiedType: const FullType(String)),
      'companyID',
      serializers.serialize(object.companyID,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'discountAmount',
      serializers.serialize(object.discountAmount,
          specifiedType: const FullType(int)),
      'discountPercent',
      serializers.serialize(object.discountPercent,
          specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'itemID',
      serializers.serialize(object.itemID,
          specifiedType: const FullType(String)),
      'orderID',
      serializers.serialize(object.orderID,
          specifiedType: const FullType(String)),
      'price',
      serializers.serialize(object.price, specifiedType: const FullType(int)),
      'quantity',
      serializers.serialize(object.quantity,
          specifiedType: const FullType(int)),
      'rowIndex',
      serializers.serialize(object.rowIndex,
          specifiedType: const FullType(int)),
      'taxed',
      serializers.serialize(object.taxed, specifiedType: const FullType(bool)),
      'total',
      serializers.serialize(object.total, specifiedType: const FullType(int)),
      'upsale',
      serializers.serialize(object.upsale, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  LineItem deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LineItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'row_number':
          result.rowNumber = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'lineItemID':
          result.lineItemID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'companyID':
          result.companyID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'discountAmount':
          result.discountAmount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'discountPercent':
          result.discountPercent = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'itemID':
          result.itemID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'orderID':
          result.orderID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'quantity':
          result.quantity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'rowIndex':
          result.rowIndex = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'taxed':
          result.taxed = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'upsale':
          result.upsale = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$LineItem extends LineItem {
  @override
  final int rowNumber;
  @override
  final String lineItemID;
  @override
  final String companyID;
  @override
  final String description;
  @override
  final int discountAmount;
  @override
  final int discountPercent;
  @override
  final String name;
  @override
  final String itemID;
  @override
  final String orderID;
  @override
  final int price;
  @override
  final int quantity;
  @override
  final int rowIndex;
  @override
  final bool taxed;
  @override
  final int total;
  @override
  final bool upsale;

  factory _$LineItem([void Function(LineItemBuilder) updates]) =>
      (new LineItemBuilder()..update(updates)).build();

  _$LineItem._(
      {this.rowNumber,
      this.lineItemID,
      this.companyID,
      this.description,
      this.discountAmount,
      this.discountPercent,
      this.name,
      this.itemID,
      this.orderID,
      this.price,
      this.quantity,
      this.rowIndex,
      this.taxed,
      this.total,
      this.upsale})
      : super._() {
    if (rowNumber == null) {
      throw new BuiltValueNullFieldError('LineItem', 'rowNumber');
    }
    if (lineItemID == null) {
      throw new BuiltValueNullFieldError('LineItem', 'lineItemID');
    }
    if (companyID == null) {
      throw new BuiltValueNullFieldError('LineItem', 'companyID');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('LineItem', 'description');
    }
    if (discountAmount == null) {
      throw new BuiltValueNullFieldError('LineItem', 'discountAmount');
    }
    if (discountPercent == null) {
      throw new BuiltValueNullFieldError('LineItem', 'discountPercent');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('LineItem', 'name');
    }
    if (itemID == null) {
      throw new BuiltValueNullFieldError('LineItem', 'itemID');
    }
    if (orderID == null) {
      throw new BuiltValueNullFieldError('LineItem', 'orderID');
    }
    if (price == null) {
      throw new BuiltValueNullFieldError('LineItem', 'price');
    }
    if (quantity == null) {
      throw new BuiltValueNullFieldError('LineItem', 'quantity');
    }
    if (rowIndex == null) {
      throw new BuiltValueNullFieldError('LineItem', 'rowIndex');
    }
    if (taxed == null) {
      throw new BuiltValueNullFieldError('LineItem', 'taxed');
    }
    if (total == null) {
      throw new BuiltValueNullFieldError('LineItem', 'total');
    }
    if (upsale == null) {
      throw new BuiltValueNullFieldError('LineItem', 'upsale');
    }
  }

  @override
  LineItem rebuild(void Function(LineItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LineItemBuilder toBuilder() => new LineItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LineItem &&
        rowNumber == other.rowNumber &&
        lineItemID == other.lineItemID &&
        companyID == other.companyID &&
        description == other.description &&
        discountAmount == other.discountAmount &&
        discountPercent == other.discountPercent &&
        name == other.name &&
        itemID == other.itemID &&
        orderID == other.orderID &&
        price == other.price &&
        quantity == other.quantity &&
        rowIndex == other.rowIndex &&
        taxed == other.taxed &&
        total == other.total &&
        upsale == other.upsale;
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
                                                                0,
                                                                rowNumber
                                                                    .hashCode),
                                                            lineItemID
                                                                .hashCode),
                                                        companyID.hashCode),
                                                    description.hashCode),
                                                discountAmount.hashCode),
                                            discountPercent.hashCode),
                                        name.hashCode),
                                    itemID.hashCode),
                                orderID.hashCode),
                            price.hashCode),
                        quantity.hashCode),
                    rowIndex.hashCode),
                taxed.hashCode),
            total.hashCode),
        upsale.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LineItem')
          ..add('rowNumber', rowNumber)
          ..add('lineItemID', lineItemID)
          ..add('companyID', companyID)
          ..add('description', description)
          ..add('discountAmount', discountAmount)
          ..add('discountPercent', discountPercent)
          ..add('name', name)
          ..add('itemID', itemID)
          ..add('orderID', orderID)
          ..add('price', price)
          ..add('quantity', quantity)
          ..add('rowIndex', rowIndex)
          ..add('taxed', taxed)
          ..add('total', total)
          ..add('upsale', upsale))
        .toString();
  }
}

class LineItemBuilder implements Builder<LineItem, LineItemBuilder> {
  _$LineItem _$v;

  int _rowNumber;
  int get rowNumber => _$this._rowNumber;
  set rowNumber(int rowNumber) => _$this._rowNumber = rowNumber;

  String _lineItemID;
  String get lineItemID => _$this._lineItemID;
  set lineItemID(String lineItemID) => _$this._lineItemID = lineItemID;

  String _companyID;
  String get companyID => _$this._companyID;
  set companyID(String companyID) => _$this._companyID = companyID;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  int _discountAmount;
  int get discountAmount => _$this._discountAmount;
  set discountAmount(int discountAmount) =>
      _$this._discountAmount = discountAmount;

  int _discountPercent;
  int get discountPercent => _$this._discountPercent;
  set discountPercent(int discountPercent) =>
      _$this._discountPercent = discountPercent;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _itemID;
  String get itemID => _$this._itemID;
  set itemID(String itemID) => _$this._itemID = itemID;

  String _orderID;
  String get orderID => _$this._orderID;
  set orderID(String orderID) => _$this._orderID = orderID;

  int _price;
  int get price => _$this._price;
  set price(int price) => _$this._price = price;

  int _quantity;
  int get quantity => _$this._quantity;
  set quantity(int quantity) => _$this._quantity = quantity;

  int _rowIndex;
  int get rowIndex => _$this._rowIndex;
  set rowIndex(int rowIndex) => _$this._rowIndex = rowIndex;

  bool _taxed;
  bool get taxed => _$this._taxed;
  set taxed(bool taxed) => _$this._taxed = taxed;

  int _total;
  int get total => _$this._total;
  set total(int total) => _$this._total = total;

  bool _upsale;
  bool get upsale => _$this._upsale;
  set upsale(bool upsale) => _$this._upsale = upsale;

  LineItemBuilder();

  LineItemBuilder get _$this {
    if (_$v != null) {
      _rowNumber = _$v.rowNumber;
      _lineItemID = _$v.lineItemID;
      _companyID = _$v.companyID;
      _description = _$v.description;
      _discountAmount = _$v.discountAmount;
      _discountPercent = _$v.discountPercent;
      _name = _$v.name;
      _itemID = _$v.itemID;
      _orderID = _$v.orderID;
      _price = _$v.price;
      _quantity = _$v.quantity;
      _rowIndex = _$v.rowIndex;
      _taxed = _$v.taxed;
      _total = _$v.total;
      _upsale = _$v.upsale;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LineItem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LineItem;
  }

  @override
  void update(void Function(LineItemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LineItem build() {
    final _$result = _$v ??
        new _$LineItem._(
            rowNumber: rowNumber,
            lineItemID: lineItemID,
            companyID: companyID,
            description: description,
            discountAmount: discountAmount,
            discountPercent: discountPercent,
            name: name,
            itemID: itemID,
            orderID: orderID,
            price: price,
            quantity: quantity,
            rowIndex: rowIndex,
            taxed: taxed,
            total: total,
            upsale: upsale);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
