// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetMangaCollection on Isar {
  IsarCollection<Manga> get mangas => getCollection();
}

const MangaSchema = CollectionSchema(
  name: 'Manga',
  schema:
      '{"name":"Manga","idName":"id","properties":[{"name":"name","type":"String"},{"name":"uri","type":"String"}],"indexes":[{"name":"uri","unique":true,"properties":[{"name":"uri","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: 'id',
  propertyIds: {'name': 0, 'uri': 1},
  listProperties: {},
  indexIds: {'uri': 0},
  indexValueTypes: {
    'uri': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _mangaGetId,
  setId: _mangaSetId,
  getLinks: _mangaGetLinks,
  attachLinks: _mangaAttachLinks,
  serializeNative: _mangaSerializeNative,
  deserializeNative: _mangaDeserializeNative,
  deserializePropNative: _mangaDeserializePropNative,
  serializeWeb: _mangaSerializeWeb,
  deserializeWeb: _mangaDeserializeWeb,
  deserializePropWeb: _mangaDeserializePropWeb,
  version: 3,
);

int? _mangaGetId(Manga object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _mangaSetId(Manga object, int id) {
  object.id = id;
}

List<IsarLinkBase> _mangaGetLinks(Manga object) {
  return [];
}

void _mangaSerializeNative(
    IsarCollection<Manga> collection,
    IsarRawObject rawObj,
    Manga object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.name;
  final _name = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_name.length) as int;
  final value1 = object.uri;
  final _uri = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_uri.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _name);
  writer.writeBytes(offsets[1], _uri);
}

Manga _mangaDeserializeNative(IsarCollection<Manga> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Manga();
  object.id = id;
  object.name = reader.readString(offsets[0]);
  object.uri = reader.readString(offsets[1]);
  return object;
}

P _mangaDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _mangaSerializeWeb(IsarCollection<Manga> collection, Manga object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'name', object.name);
  IsarNative.jsObjectSet(jsObj, 'uri', object.uri);
  return jsObj;
}

Manga _mangaDeserializeWeb(IsarCollection<Manga> collection, dynamic jsObj) {
  final object = Manga();
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.name = IsarNative.jsObjectGet(jsObj, 'name') ?? '';
  object.uri = IsarNative.jsObjectGet(jsObj, 'uri') ?? '';
  return object;
}

P _mangaDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'name':
      return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
    case 'uri':
      return (IsarNative.jsObjectGet(jsObj, 'uri') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _mangaAttachLinks(IsarCollection col, int id, Manga object) {}

extension MangaByIndex on IsarCollection<Manga> {
  Future<Manga?> getByUri(String uri) {
    return getByIndex('uri', [uri]);
  }

  Manga? getByUriSync(String uri) {
    return getByIndexSync('uri', [uri]);
  }

  Future<bool> deleteByUri(String uri) {
    return deleteByIndex('uri', [uri]);
  }

  bool deleteByUriSync(String uri) {
    return deleteByIndexSync('uri', [uri]);
  }

  Future<List<Manga?>> getAllByUri(List<String> uriValues) {
    final values = uriValues.map((e) => [e]).toList();
    return getAllByIndex('uri', values);
  }

  List<Manga?> getAllByUriSync(List<String> uriValues) {
    final values = uriValues.map((e) => [e]).toList();
    return getAllByIndexSync('uri', values);
  }

  Future<int> deleteAllByUri(List<String> uriValues) {
    final values = uriValues.map((e) => [e]).toList();
    return deleteAllByIndex('uri', values);
  }

  int deleteAllByUriSync(List<String> uriValues) {
    final values = uriValues.map((e) => [e]).toList();
    return deleteAllByIndexSync('uri', values);
  }
}

extension MangaQueryWhereSort on QueryBuilder<Manga, Manga, QWhere> {
  QueryBuilder<Manga, Manga, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<Manga, Manga, QAfterWhere> anyUri() {
    return addWhereClauseInternal(const IndexWhereClause.any(indexName: 'uri'));
  }
}

extension MangaQueryWhere on QueryBuilder<Manga, Manga, QWhereClause> {
  QueryBuilder<Manga, Manga, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Manga, Manga, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<Manga, Manga, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Manga, Manga, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Manga, Manga, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Manga, Manga, QAfterWhereClause> uriEqualTo(String uri) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'uri',
      value: [uri],
    ));
  }

  QueryBuilder<Manga, Manga, QAfterWhereClause> uriNotEqualTo(String uri) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'uri',
        upper: [uri],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'uri',
        lower: [uri],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'uri',
        lower: [uri],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'uri',
        upper: [uri],
        includeUpper: false,
      ));
    }
  }
}

extension MangaQueryFilter on QueryBuilder<Manga, Manga, QFilterCondition> {
  QueryBuilder<Manga, Manga, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> nameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'name',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> uriEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'uri',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> uriGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'uri',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> uriLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'uri',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> uriBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'uri',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> uriStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'uri',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> uriEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'uri',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> uriContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'uri',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Manga, Manga, QAfterFilterCondition> uriMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'uri',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension MangaQueryLinks on QueryBuilder<Manga, Manga, QFilterCondition> {}

extension MangaQueryWhereSortBy on QueryBuilder<Manga, Manga, QSortBy> {
  QueryBuilder<Manga, Manga, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByUri() {
    return addSortByInternal('uri', Sort.asc);
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> sortByUriDesc() {
    return addSortByInternal('uri', Sort.desc);
  }
}

extension MangaQueryWhereSortThenBy on QueryBuilder<Manga, Manga, QSortThenBy> {
  QueryBuilder<Manga, Manga, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByUri() {
    return addSortByInternal('uri', Sort.asc);
  }

  QueryBuilder<Manga, Manga, QAfterSortBy> thenByUriDesc() {
    return addSortByInternal('uri', Sort.desc);
  }
}

extension MangaQueryWhereDistinct on QueryBuilder<Manga, Manga, QDistinct> {
  QueryBuilder<Manga, Manga, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }

  QueryBuilder<Manga, Manga, QDistinct> distinctByUri(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('uri', caseSensitive: caseSensitive);
  }
}

extension MangaQueryProperty on QueryBuilder<Manga, Manga, QQueryProperty> {
  QueryBuilder<Manga, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Manga, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }

  QueryBuilder<Manga, String, QQueryOperations> uriProperty() {
    return addPropertyNameInternal('uri');
  }
}
