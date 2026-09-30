// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SubjectsTable extends Subjects with TableInfo<$SubjectsTable, Subject> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sort_orderMeta = const VerificationMeta(
    'sort_order',
  );
  @override
  late final GeneratedColumn<int> sort_order = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _is_defaultMeta = const VerificationMeta(
    'is_default',
  );
  @override
  late final GeneratedColumn<int> is_default = GeneratedColumn<int>(
    'is_default',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _created_atMeta = const VerificationMeta(
    'created_at',
  );
  @override
  late final GeneratedColumn<int> created_at = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updated_atMeta = const VerificationMeta(
    'updated_at',
  );
  @override
  late final GeneratedColumn<int> updated_at = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    sort_order,
    is_default,
    created_at,
    updated_at,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subjects';
  @override
  VerificationContext validateIntegrity(
    Insertable<Subject> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sort_orderMeta,
        sort_order.isAcceptableOrUnknown(data['sort_order']!, _sort_orderMeta),
      );
    }
    if (data.containsKey('is_default')) {
      context.handle(
        _is_defaultMeta,
        is_default.isAcceptableOrUnknown(data['is_default']!, _is_defaultMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _created_atMeta,
        created_at.isAcceptableOrUnknown(data['created_at']!, _created_atMeta),
      );
    } else if (isInserting) {
      context.missing(_created_atMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updated_atMeta,
        updated_at.isAcceptableOrUnknown(data['updated_at']!, _updated_atMeta),
      );
    } else if (isInserting) {
      context.missing(_updated_atMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Subject map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Subject(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      sort_order: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      is_default: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_default'],
      )!,
      created_at: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updated_at: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SubjectsTable createAlias(String alias) {
    return $SubjectsTable(attachedDatabase, alias);
  }
}

class Subject extends DataClass implements Insertable<Subject> {
  /// 学科ID，主键
  final String id;

  /// 学科名称
  final String name;

  /// 学科描述
  final String? description;

  /// 显示顺序，默认 0
  final int sort_order;

  /// 是否默认学科，0 否 / 1 是，默认 0
  final int is_default;

  /// 创建时间，毫秒级时间戳
  final int created_at;

  /// 修改时间，毫秒级时间戳
  final int updated_at;
  const Subject({
    required this.id,
    required this.name,
    this.description,
    required this.sort_order,
    required this.is_default,
    required this.created_at,
    required this.updated_at,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['sort_order'] = Variable<int>(sort_order);
    map['is_default'] = Variable<int>(is_default);
    map['created_at'] = Variable<int>(created_at);
    map['updated_at'] = Variable<int>(updated_at);
    return map;
  }

  SubjectsCompanion toCompanion(bool nullToAbsent) {
    return SubjectsCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      sort_order: Value(sort_order),
      is_default: Value(is_default),
      created_at: Value(created_at),
      updated_at: Value(updated_at),
    );
  }

  factory Subject.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Subject(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      sort_order: serializer.fromJson<int>(json['sort_order']),
      is_default: serializer.fromJson<int>(json['is_default']),
      created_at: serializer.fromJson<int>(json['created_at']),
      updated_at: serializer.fromJson<int>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'sort_order': serializer.toJson<int>(sort_order),
      'is_default': serializer.toJson<int>(is_default),
      'created_at': serializer.toJson<int>(created_at),
      'updated_at': serializer.toJson<int>(updated_at),
    };
  }

  Subject copyWith({
    String? id,
    String? name,
    Value<String?> description = const Value.absent(),
    int? sort_order,
    int? is_default,
    int? created_at,
    int? updated_at,
  }) => Subject(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    sort_order: sort_order ?? this.sort_order,
    is_default: is_default ?? this.is_default,
    created_at: created_at ?? this.created_at,
    updated_at: updated_at ?? this.updated_at,
  );
  Subject copyWithCompanion(SubjectsCompanion data) {
    return Subject(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      sort_order: data.sort_order.present
          ? data.sort_order.value
          : this.sort_order,
      is_default: data.is_default.present
          ? data.is_default.value
          : this.is_default,
      created_at: data.created_at.present
          ? data.created_at.value
          : this.created_at,
      updated_at: data.updated_at.present
          ? data.updated_at.value
          : this.updated_at,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Subject(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('sort_order: $sort_order, ')
          ..write('is_default: $is_default, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    description,
    sort_order,
    is_default,
    created_at,
    updated_at,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Subject &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.sort_order == this.sort_order &&
          other.is_default == this.is_default &&
          other.created_at == this.created_at &&
          other.updated_at == this.updated_at);
}

class SubjectsCompanion extends UpdateCompanion<Subject> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<int> sort_order;
  final Value<int> is_default;
  final Value<int> created_at;
  final Value<int> updated_at;
  final Value<int> rowid;
  const SubjectsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.sort_order = const Value.absent(),
    this.is_default = const Value.absent(),
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SubjectsCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    this.sort_order = const Value.absent(),
    this.is_default = const Value.absent(),
    required int created_at,
    required int updated_at,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       created_at = Value(created_at),
       updated_at = Value(updated_at);
  static Insertable<Subject> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? sort_order,
    Expression<int>? is_default,
    Expression<int>? created_at,
    Expression<int>? updated_at,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (sort_order != null) 'sort_order': sort_order,
      if (is_default != null) 'is_default': is_default,
      if (created_at != null) 'created_at': created_at,
      if (updated_at != null) 'updated_at': updated_at,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SubjectsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<int>? sort_order,
    Value<int>? is_default,
    Value<int>? created_at,
    Value<int>? updated_at,
    Value<int>? rowid,
  }) {
    return SubjectsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      sort_order: sort_order ?? this.sort_order,
      is_default: is_default ?? this.is_default,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (sort_order.present) {
      map['sort_order'] = Variable<int>(sort_order.value);
    }
    if (is_default.present) {
      map['is_default'] = Variable<int>(is_default.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<int>(created_at.value);
    }
    if (updated_at.present) {
      map['updated_at'] = Variable<int>(updated_at.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubjectsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('sort_order: $sort_order, ')
          ..write('is_default: $is_default, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StudyItemsTable extends StudyItems
    with TableInfo<$StudyItemsTable, StudyItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudyItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _content_typeMeta = const VerificationMeta(
    'content_type',
  );
  @override
  late final GeneratedColumn<String> content_type = GeneratedColumn<String>(
    'content_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _subject_idMeta = const VerificationMeta(
    'subject_id',
  );
  @override
  late final GeneratedColumn<String> subject_id = GeneratedColumn<String>(
    'subject_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _category_idMeta = const VerificationMeta(
    'category_id',
  );
  @override
  late final GeneratedColumn<String> category_id = GeneratedColumn<String>(
    'category_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _my_answerMeta = const VerificationMeta(
    'my_answer',
  );
  @override
  late final GeneratedColumn<String> my_answer = GeneratedColumn<String>(
    'my_answer',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _standard_answerMeta = const VerificationMeta(
    'standard_answer',
  );
  @override
  late final GeneratedColumn<String> standard_answer = GeneratedColumn<String>(
    'standard_answer',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _personal_noteMeta = const VerificationMeta(
    'personal_note',
  );
  @override
  late final GeneratedColumn<String> personal_note = GeneratedColumn<String>(
    'personal_note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mastery_levelMeta = const VerificationMeta(
    'mastery_level',
  );
  @override
  late final GeneratedColumn<String> mastery_level = GeneratedColumn<String>(
    'mastery_level',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _is_mistakeMeta = const VerificationMeta(
    'is_mistake',
  );
  @override
  late final GeneratedColumn<int> is_mistake = GeneratedColumn<int>(
    'is_mistake',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _is_favoriteMeta = const VerificationMeta(
    'is_favorite',
  );
  @override
  late final GeneratedColumn<int> is_favorite = GeneratedColumn<int>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _difficultyMeta = const VerificationMeta(
    'difficulty',
  );
  @override
  late final GeneratedColumn<String> difficulty = GeneratedColumn<String>(
    'difficulty',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _risk_levelMeta = const VerificationMeta(
    'risk_level',
  );
  @override
  late final GeneratedColumn<String> risk_level = GeneratedColumn<String>(
    'risk_level',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _created_atMeta = const VerificationMeta(
    'created_at',
  );
  @override
  late final GeneratedColumn<int> created_at = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updated_atMeta = const VerificationMeta(
    'updated_at',
  );
  @override
  late final GeneratedColumn<int> updated_at = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deleted_atMeta = const VerificationMeta(
    'deleted_at',
  );
  @override
  late final GeneratedColumn<int> deleted_at = GeneratedColumn<int>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    content_type,
    title,
    subject_id,
    category_id,
    content,
    my_answer,
    standard_answer,
    personal_note,
    mastery_level,
    is_mistake,
    is_favorite,
    difficulty,
    risk_level,
    created_at,
    updated_at,
    deleted_at,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'study_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<StudyItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('content_type')) {
      context.handle(
        _content_typeMeta,
        content_type.isAcceptableOrUnknown(
          data['content_type']!,
          _content_typeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_content_typeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('subject_id')) {
      context.handle(
        _subject_idMeta,
        subject_id.isAcceptableOrUnknown(data['subject_id']!, _subject_idMeta),
      );
    } else if (isInserting) {
      context.missing(_subject_idMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _category_idMeta,
        category_id.isAcceptableOrUnknown(
          data['category_id']!,
          _category_idMeta,
        ),
      );
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    }
    if (data.containsKey('my_answer')) {
      context.handle(
        _my_answerMeta,
        my_answer.isAcceptableOrUnknown(data['my_answer']!, _my_answerMeta),
      );
    }
    if (data.containsKey('standard_answer')) {
      context.handle(
        _standard_answerMeta,
        standard_answer.isAcceptableOrUnknown(
          data['standard_answer']!,
          _standard_answerMeta,
        ),
      );
    }
    if (data.containsKey('personal_note')) {
      context.handle(
        _personal_noteMeta,
        personal_note.isAcceptableOrUnknown(
          data['personal_note']!,
          _personal_noteMeta,
        ),
      );
    }
    if (data.containsKey('mastery_level')) {
      context.handle(
        _mastery_levelMeta,
        mastery_level.isAcceptableOrUnknown(
          data['mastery_level']!,
          _mastery_levelMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_mastery_levelMeta);
    }
    if (data.containsKey('is_mistake')) {
      context.handle(
        _is_mistakeMeta,
        is_mistake.isAcceptableOrUnknown(data['is_mistake']!, _is_mistakeMeta),
      );
    } else if (isInserting) {
      context.missing(_is_mistakeMeta);
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _is_favoriteMeta,
        is_favorite.isAcceptableOrUnknown(
          data['is_favorite']!,
          _is_favoriteMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_is_favoriteMeta);
    }
    if (data.containsKey('difficulty')) {
      context.handle(
        _difficultyMeta,
        difficulty.isAcceptableOrUnknown(data['difficulty']!, _difficultyMeta),
      );
    }
    if (data.containsKey('risk_level')) {
      context.handle(
        _risk_levelMeta,
        risk_level.isAcceptableOrUnknown(data['risk_level']!, _risk_levelMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _created_atMeta,
        created_at.isAcceptableOrUnknown(data['created_at']!, _created_atMeta),
      );
    } else if (isInserting) {
      context.missing(_created_atMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updated_atMeta,
        updated_at.isAcceptableOrUnknown(data['updated_at']!, _updated_atMeta),
      );
    } else if (isInserting) {
      context.missing(_updated_atMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deleted_atMeta,
        deleted_at.isAcceptableOrUnknown(data['deleted_at']!, _deleted_atMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StudyItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudyItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      content_type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content_type'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      ),
      subject_id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subject_id'],
      )!,
      category_id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_id'],
      ),
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      ),
      my_answer: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}my_answer'],
      ),
      standard_answer: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}standard_answer'],
      ),
      personal_note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}personal_note'],
      ),
      mastery_level: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mastery_level'],
      )!,
      is_mistake: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_mistake'],
      )!,
      is_favorite: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_favorite'],
      )!,
      difficulty: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}difficulty'],
      ),
      risk_level: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}risk_level'],
      ),
      created_at: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updated_at: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      deleted_at: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $StudyItemsTable createAlias(String alias) {
    return $StudyItemsTable(attachedDatabase, alias);
  }
}

class StudyItem extends DataClass implements Insertable<StudyItem> {
  /// 学习内容ID，主键
  final String id;

  /// question / knowledge / note
  final String content_type;

  /// 标题
  final String? title;

  /// 所属学科
  final String subject_id;

  /// 所属分类
  final String? category_id;

  /// 正文内容
  final String? content;

  /// 我的解答
  final String? my_answer;

  /// 标准答案
  final String? standard_answer;

  /// 个人备注
  final String? personal_note;

  /// red / yellow / green
  final String mastery_level;

  /// 是否错题
  final int is_mistake;

  /// 是否收藏
  final int is_favorite;

  /// easy / medium / hard
  final String? difficulty;

  /// low / medium / high / very_high
  final String? risk_level;

  /// 创建时间，毫秒级时间戳
  final int created_at;

  /// 修改时间，毫秒级时间戳
  final int updated_at;

  /// 删除时间，毫秒级时间戳，未删除为空
  final int? deleted_at;
  const StudyItem({
    required this.id,
    required this.content_type,
    this.title,
    required this.subject_id,
    this.category_id,
    this.content,
    this.my_answer,
    this.standard_answer,
    this.personal_note,
    required this.mastery_level,
    required this.is_mistake,
    required this.is_favorite,
    this.difficulty,
    this.risk_level,
    required this.created_at,
    required this.updated_at,
    this.deleted_at,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['content_type'] = Variable<String>(content_type);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    map['subject_id'] = Variable<String>(subject_id);
    if (!nullToAbsent || category_id != null) {
      map['category_id'] = Variable<String>(category_id);
    }
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    if (!nullToAbsent || my_answer != null) {
      map['my_answer'] = Variable<String>(my_answer);
    }
    if (!nullToAbsent || standard_answer != null) {
      map['standard_answer'] = Variable<String>(standard_answer);
    }
    if (!nullToAbsent || personal_note != null) {
      map['personal_note'] = Variable<String>(personal_note);
    }
    map['mastery_level'] = Variable<String>(mastery_level);
    map['is_mistake'] = Variable<int>(is_mistake);
    map['is_favorite'] = Variable<int>(is_favorite);
    if (!nullToAbsent || difficulty != null) {
      map['difficulty'] = Variable<String>(difficulty);
    }
    if (!nullToAbsent || risk_level != null) {
      map['risk_level'] = Variable<String>(risk_level);
    }
    map['created_at'] = Variable<int>(created_at);
    map['updated_at'] = Variable<int>(updated_at);
    if (!nullToAbsent || deleted_at != null) {
      map['deleted_at'] = Variable<int>(deleted_at);
    }
    return map;
  }

  StudyItemsCompanion toCompanion(bool nullToAbsent) {
    return StudyItemsCompanion(
      id: Value(id),
      content_type: Value(content_type),
      title: title == null && nullToAbsent
          ? const Value.absent()
          : Value(title),
      subject_id: Value(subject_id),
      category_id: category_id == null && nullToAbsent
          ? const Value.absent()
          : Value(category_id),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      my_answer: my_answer == null && nullToAbsent
          ? const Value.absent()
          : Value(my_answer),
      standard_answer: standard_answer == null && nullToAbsent
          ? const Value.absent()
          : Value(standard_answer),
      personal_note: personal_note == null && nullToAbsent
          ? const Value.absent()
          : Value(personal_note),
      mastery_level: Value(mastery_level),
      is_mistake: Value(is_mistake),
      is_favorite: Value(is_favorite),
      difficulty: difficulty == null && nullToAbsent
          ? const Value.absent()
          : Value(difficulty),
      risk_level: risk_level == null && nullToAbsent
          ? const Value.absent()
          : Value(risk_level),
      created_at: Value(created_at),
      updated_at: Value(updated_at),
      deleted_at: deleted_at == null && nullToAbsent
          ? const Value.absent()
          : Value(deleted_at),
    );
  }

  factory StudyItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudyItem(
      id: serializer.fromJson<String>(json['id']),
      content_type: serializer.fromJson<String>(json['content_type']),
      title: serializer.fromJson<String?>(json['title']),
      subject_id: serializer.fromJson<String>(json['subject_id']),
      category_id: serializer.fromJson<String?>(json['category_id']),
      content: serializer.fromJson<String?>(json['content']),
      my_answer: serializer.fromJson<String?>(json['my_answer']),
      standard_answer: serializer.fromJson<String?>(json['standard_answer']),
      personal_note: serializer.fromJson<String?>(json['personal_note']),
      mastery_level: serializer.fromJson<String>(json['mastery_level']),
      is_mistake: serializer.fromJson<int>(json['is_mistake']),
      is_favorite: serializer.fromJson<int>(json['is_favorite']),
      difficulty: serializer.fromJson<String?>(json['difficulty']),
      risk_level: serializer.fromJson<String?>(json['risk_level']),
      created_at: serializer.fromJson<int>(json['created_at']),
      updated_at: serializer.fromJson<int>(json['updated_at']),
      deleted_at: serializer.fromJson<int?>(json['deleted_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'content_type': serializer.toJson<String>(content_type),
      'title': serializer.toJson<String?>(title),
      'subject_id': serializer.toJson<String>(subject_id),
      'category_id': serializer.toJson<String?>(category_id),
      'content': serializer.toJson<String?>(content),
      'my_answer': serializer.toJson<String?>(my_answer),
      'standard_answer': serializer.toJson<String?>(standard_answer),
      'personal_note': serializer.toJson<String?>(personal_note),
      'mastery_level': serializer.toJson<String>(mastery_level),
      'is_mistake': serializer.toJson<int>(is_mistake),
      'is_favorite': serializer.toJson<int>(is_favorite),
      'difficulty': serializer.toJson<String?>(difficulty),
      'risk_level': serializer.toJson<String?>(risk_level),
      'created_at': serializer.toJson<int>(created_at),
      'updated_at': serializer.toJson<int>(updated_at),
      'deleted_at': serializer.toJson<int?>(deleted_at),
    };
  }

  StudyItem copyWith({
    String? id,
    String? content_type,
    Value<String?> title = const Value.absent(),
    String? subject_id,
    Value<String?> category_id = const Value.absent(),
    Value<String?> content = const Value.absent(),
    Value<String?> my_answer = const Value.absent(),
    Value<String?> standard_answer = const Value.absent(),
    Value<String?> personal_note = const Value.absent(),
    String? mastery_level,
    int? is_mistake,
    int? is_favorite,
    Value<String?> difficulty = const Value.absent(),
    Value<String?> risk_level = const Value.absent(),
    int? created_at,
    int? updated_at,
    Value<int?> deleted_at = const Value.absent(),
  }) => StudyItem(
    id: id ?? this.id,
    content_type: content_type ?? this.content_type,
    title: title.present ? title.value : this.title,
    subject_id: subject_id ?? this.subject_id,
    category_id: category_id.present ? category_id.value : this.category_id,
    content: content.present ? content.value : this.content,
    my_answer: my_answer.present ? my_answer.value : this.my_answer,
    standard_answer: standard_answer.present
        ? standard_answer.value
        : this.standard_answer,
    personal_note: personal_note.present
        ? personal_note.value
        : this.personal_note,
    mastery_level: mastery_level ?? this.mastery_level,
    is_mistake: is_mistake ?? this.is_mistake,
    is_favorite: is_favorite ?? this.is_favorite,
    difficulty: difficulty.present ? difficulty.value : this.difficulty,
    risk_level: risk_level.present ? risk_level.value : this.risk_level,
    created_at: created_at ?? this.created_at,
    updated_at: updated_at ?? this.updated_at,
    deleted_at: deleted_at.present ? deleted_at.value : this.deleted_at,
  );
  StudyItem copyWithCompanion(StudyItemsCompanion data) {
    return StudyItem(
      id: data.id.present ? data.id.value : this.id,
      content_type: data.content_type.present
          ? data.content_type.value
          : this.content_type,
      title: data.title.present ? data.title.value : this.title,
      subject_id: data.subject_id.present
          ? data.subject_id.value
          : this.subject_id,
      category_id: data.category_id.present
          ? data.category_id.value
          : this.category_id,
      content: data.content.present ? data.content.value : this.content,
      my_answer: data.my_answer.present ? data.my_answer.value : this.my_answer,
      standard_answer: data.standard_answer.present
          ? data.standard_answer.value
          : this.standard_answer,
      personal_note: data.personal_note.present
          ? data.personal_note.value
          : this.personal_note,
      mastery_level: data.mastery_level.present
          ? data.mastery_level.value
          : this.mastery_level,
      is_mistake: data.is_mistake.present
          ? data.is_mistake.value
          : this.is_mistake,
      is_favorite: data.is_favorite.present
          ? data.is_favorite.value
          : this.is_favorite,
      difficulty: data.difficulty.present
          ? data.difficulty.value
          : this.difficulty,
      risk_level: data.risk_level.present
          ? data.risk_level.value
          : this.risk_level,
      created_at: data.created_at.present
          ? data.created_at.value
          : this.created_at,
      updated_at: data.updated_at.present
          ? data.updated_at.value
          : this.updated_at,
      deleted_at: data.deleted_at.present
          ? data.deleted_at.value
          : this.deleted_at,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StudyItem(')
          ..write('id: $id, ')
          ..write('content_type: $content_type, ')
          ..write('title: $title, ')
          ..write('subject_id: $subject_id, ')
          ..write('category_id: $category_id, ')
          ..write('content: $content, ')
          ..write('my_answer: $my_answer, ')
          ..write('standard_answer: $standard_answer, ')
          ..write('personal_note: $personal_note, ')
          ..write('mastery_level: $mastery_level, ')
          ..write('is_mistake: $is_mistake, ')
          ..write('is_favorite: $is_favorite, ')
          ..write('difficulty: $difficulty, ')
          ..write('risk_level: $risk_level, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at, ')
          ..write('deleted_at: $deleted_at')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    content_type,
    title,
    subject_id,
    category_id,
    content,
    my_answer,
    standard_answer,
    personal_note,
    mastery_level,
    is_mistake,
    is_favorite,
    difficulty,
    risk_level,
    created_at,
    updated_at,
    deleted_at,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudyItem &&
          other.id == this.id &&
          other.content_type == this.content_type &&
          other.title == this.title &&
          other.subject_id == this.subject_id &&
          other.category_id == this.category_id &&
          other.content == this.content &&
          other.my_answer == this.my_answer &&
          other.standard_answer == this.standard_answer &&
          other.personal_note == this.personal_note &&
          other.mastery_level == this.mastery_level &&
          other.is_mistake == this.is_mistake &&
          other.is_favorite == this.is_favorite &&
          other.difficulty == this.difficulty &&
          other.risk_level == this.risk_level &&
          other.created_at == this.created_at &&
          other.updated_at == this.updated_at &&
          other.deleted_at == this.deleted_at);
}

class StudyItemsCompanion extends UpdateCompanion<StudyItem> {
  final Value<String> id;
  final Value<String> content_type;
  final Value<String?> title;
  final Value<String> subject_id;
  final Value<String?> category_id;
  final Value<String?> content;
  final Value<String?> my_answer;
  final Value<String?> standard_answer;
  final Value<String?> personal_note;
  final Value<String> mastery_level;
  final Value<int> is_mistake;
  final Value<int> is_favorite;
  final Value<String?> difficulty;
  final Value<String?> risk_level;
  final Value<int> created_at;
  final Value<int> updated_at;
  final Value<int?> deleted_at;
  final Value<int> rowid;
  const StudyItemsCompanion({
    this.id = const Value.absent(),
    this.content_type = const Value.absent(),
    this.title = const Value.absent(),
    this.subject_id = const Value.absent(),
    this.category_id = const Value.absent(),
    this.content = const Value.absent(),
    this.my_answer = const Value.absent(),
    this.standard_answer = const Value.absent(),
    this.personal_note = const Value.absent(),
    this.mastery_level = const Value.absent(),
    this.is_mistake = const Value.absent(),
    this.is_favorite = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.risk_level = const Value.absent(),
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
    this.deleted_at = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StudyItemsCompanion.insert({
    required String id,
    required String content_type,
    this.title = const Value.absent(),
    required String subject_id,
    this.category_id = const Value.absent(),
    this.content = const Value.absent(),
    this.my_answer = const Value.absent(),
    this.standard_answer = const Value.absent(),
    this.personal_note = const Value.absent(),
    required String mastery_level,
    required int is_mistake,
    required int is_favorite,
    this.difficulty = const Value.absent(),
    this.risk_level = const Value.absent(),
    required int created_at,
    required int updated_at,
    this.deleted_at = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       content_type = Value(content_type),
       subject_id = Value(subject_id),
       mastery_level = Value(mastery_level),
       is_mistake = Value(is_mistake),
       is_favorite = Value(is_favorite),
       created_at = Value(created_at),
       updated_at = Value(updated_at);
  static Insertable<StudyItem> custom({
    Expression<String>? id,
    Expression<String>? content_type,
    Expression<String>? title,
    Expression<String>? subject_id,
    Expression<String>? category_id,
    Expression<String>? content,
    Expression<String>? my_answer,
    Expression<String>? standard_answer,
    Expression<String>? personal_note,
    Expression<String>? mastery_level,
    Expression<int>? is_mistake,
    Expression<int>? is_favorite,
    Expression<String>? difficulty,
    Expression<String>? risk_level,
    Expression<int>? created_at,
    Expression<int>? updated_at,
    Expression<int>? deleted_at,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (content_type != null) 'content_type': content_type,
      if (title != null) 'title': title,
      if (subject_id != null) 'subject_id': subject_id,
      if (category_id != null) 'category_id': category_id,
      if (content != null) 'content': content,
      if (my_answer != null) 'my_answer': my_answer,
      if (standard_answer != null) 'standard_answer': standard_answer,
      if (personal_note != null) 'personal_note': personal_note,
      if (mastery_level != null) 'mastery_level': mastery_level,
      if (is_mistake != null) 'is_mistake': is_mistake,
      if (is_favorite != null) 'is_favorite': is_favorite,
      if (difficulty != null) 'difficulty': difficulty,
      if (risk_level != null) 'risk_level': risk_level,
      if (created_at != null) 'created_at': created_at,
      if (updated_at != null) 'updated_at': updated_at,
      if (deleted_at != null) 'deleted_at': deleted_at,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StudyItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? content_type,
    Value<String?>? title,
    Value<String>? subject_id,
    Value<String?>? category_id,
    Value<String?>? content,
    Value<String?>? my_answer,
    Value<String?>? standard_answer,
    Value<String?>? personal_note,
    Value<String>? mastery_level,
    Value<int>? is_mistake,
    Value<int>? is_favorite,
    Value<String?>? difficulty,
    Value<String?>? risk_level,
    Value<int>? created_at,
    Value<int>? updated_at,
    Value<int?>? deleted_at,
    Value<int>? rowid,
  }) {
    return StudyItemsCompanion(
      id: id ?? this.id,
      content_type: content_type ?? this.content_type,
      title: title ?? this.title,
      subject_id: subject_id ?? this.subject_id,
      category_id: category_id ?? this.category_id,
      content: content ?? this.content,
      my_answer: my_answer ?? this.my_answer,
      standard_answer: standard_answer ?? this.standard_answer,
      personal_note: personal_note ?? this.personal_note,
      mastery_level: mastery_level ?? this.mastery_level,
      is_mistake: is_mistake ?? this.is_mistake,
      is_favorite: is_favorite ?? this.is_favorite,
      difficulty: difficulty ?? this.difficulty,
      risk_level: risk_level ?? this.risk_level,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      deleted_at: deleted_at ?? this.deleted_at,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (content_type.present) {
      map['content_type'] = Variable<String>(content_type.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (subject_id.present) {
      map['subject_id'] = Variable<String>(subject_id.value);
    }
    if (category_id.present) {
      map['category_id'] = Variable<String>(category_id.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (my_answer.present) {
      map['my_answer'] = Variable<String>(my_answer.value);
    }
    if (standard_answer.present) {
      map['standard_answer'] = Variable<String>(standard_answer.value);
    }
    if (personal_note.present) {
      map['personal_note'] = Variable<String>(personal_note.value);
    }
    if (mastery_level.present) {
      map['mastery_level'] = Variable<String>(mastery_level.value);
    }
    if (is_mistake.present) {
      map['is_mistake'] = Variable<int>(is_mistake.value);
    }
    if (is_favorite.present) {
      map['is_favorite'] = Variable<int>(is_favorite.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<String>(difficulty.value);
    }
    if (risk_level.present) {
      map['risk_level'] = Variable<String>(risk_level.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<int>(created_at.value);
    }
    if (updated_at.present) {
      map['updated_at'] = Variable<int>(updated_at.value);
    }
    if (deleted_at.present) {
      map['deleted_at'] = Variable<int>(deleted_at.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudyItemsCompanion(')
          ..write('id: $id, ')
          ..write('content_type: $content_type, ')
          ..write('title: $title, ')
          ..write('subject_id: $subject_id, ')
          ..write('category_id: $category_id, ')
          ..write('content: $content, ')
          ..write('my_answer: $my_answer, ')
          ..write('standard_answer: $standard_answer, ')
          ..write('personal_note: $personal_note, ')
          ..write('mastery_level: $mastery_level, ')
          ..write('is_mistake: $is_mistake, ')
          ..write('is_favorite: $is_favorite, ')
          ..write('difficulty: $difficulty, ')
          ..write('risk_level: $risk_level, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at, ')
          ..write('deleted_at: $deleted_at, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subject_idMeta = const VerificationMeta(
    'subject_id',
  );
  @override
  late final GeneratedColumn<String> subject_id = GeneratedColumn<String>(
    'subject_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _parent_idMeta = const VerificationMeta(
    'parent_id',
  );
  @override
  late final GeneratedColumn<String> parent_id = GeneratedColumn<String>(
    'parent_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
    'level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sort_orderMeta = const VerificationMeta(
    'sort_order',
  );
  @override
  late final GeneratedColumn<int> sort_order = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _created_atMeta = const VerificationMeta(
    'created_at',
  );
  @override
  late final GeneratedColumn<int> created_at = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updated_atMeta = const VerificationMeta(
    'updated_at',
  );
  @override
  late final GeneratedColumn<int> updated_at = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    subject_id,
    parent_id,
    name,
    level,
    sort_order,
    description,
    created_at,
    updated_at,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<Category> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('subject_id')) {
      context.handle(
        _subject_idMeta,
        subject_id.isAcceptableOrUnknown(data['subject_id']!, _subject_idMeta),
      );
    } else if (isInserting) {
      context.missing(_subject_idMeta);
    }
    if (data.containsKey('parent_id')) {
      context.handle(
        _parent_idMeta,
        parent_id.isAcceptableOrUnknown(data['parent_id']!, _parent_idMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
        _levelMeta,
        level.isAcceptableOrUnknown(data['level']!, _levelMeta),
      );
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sort_orderMeta,
        sort_order.isAcceptableOrUnknown(data['sort_order']!, _sort_orderMeta),
      );
    } else if (isInserting) {
      context.missing(_sort_orderMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _created_atMeta,
        created_at.isAcceptableOrUnknown(data['created_at']!, _created_atMeta),
      );
    } else if (isInserting) {
      context.missing(_created_atMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updated_atMeta,
        updated_at.isAcceptableOrUnknown(data['updated_at']!, _updated_atMeta),
      );
    } else if (isInserting) {
      context.missing(_updated_atMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      subject_id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subject_id'],
      )!,
      parent_id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      level: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}level'],
      )!,
      sort_order: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      created_at: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updated_at: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  /// 分类ID，主键
  final String id;

  /// 所属学科
  final String subject_id;

  /// 父分类ID，顶级分类为空
  final String? parent_id;

  /// 分类名称
  final String name;

  /// 分类层级
  final int level;

  /// 同级排序
  final int sort_order;

  /// 分类描述
  final String? description;

  /// 创建时间，毫秒级时间戳
  final int created_at;

  /// 修改时间，毫秒级时间戳
  final int updated_at;
  const Category({
    required this.id,
    required this.subject_id,
    this.parent_id,
    required this.name,
    required this.level,
    required this.sort_order,
    this.description,
    required this.created_at,
    required this.updated_at,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['subject_id'] = Variable<String>(subject_id);
    if (!nullToAbsent || parent_id != null) {
      map['parent_id'] = Variable<String>(parent_id);
    }
    map['name'] = Variable<String>(name);
    map['level'] = Variable<int>(level);
    map['sort_order'] = Variable<int>(sort_order);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['created_at'] = Variable<int>(created_at);
    map['updated_at'] = Variable<int>(updated_at);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      subject_id: Value(subject_id),
      parent_id: parent_id == null && nullToAbsent
          ? const Value.absent()
          : Value(parent_id),
      name: Value(name),
      level: Value(level),
      sort_order: Value(sort_order),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      created_at: Value(created_at),
      updated_at: Value(updated_at),
    );
  }

  factory Category.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<String>(json['id']),
      subject_id: serializer.fromJson<String>(json['subject_id']),
      parent_id: serializer.fromJson<String?>(json['parent_id']),
      name: serializer.fromJson<String>(json['name']),
      level: serializer.fromJson<int>(json['level']),
      sort_order: serializer.fromJson<int>(json['sort_order']),
      description: serializer.fromJson<String?>(json['description']),
      created_at: serializer.fromJson<int>(json['created_at']),
      updated_at: serializer.fromJson<int>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'subject_id': serializer.toJson<String>(subject_id),
      'parent_id': serializer.toJson<String?>(parent_id),
      'name': serializer.toJson<String>(name),
      'level': serializer.toJson<int>(level),
      'sort_order': serializer.toJson<int>(sort_order),
      'description': serializer.toJson<String?>(description),
      'created_at': serializer.toJson<int>(created_at),
      'updated_at': serializer.toJson<int>(updated_at),
    };
  }

  Category copyWith({
    String? id,
    String? subject_id,
    Value<String?> parent_id = const Value.absent(),
    String? name,
    int? level,
    int? sort_order,
    Value<String?> description = const Value.absent(),
    int? created_at,
    int? updated_at,
  }) => Category(
    id: id ?? this.id,
    subject_id: subject_id ?? this.subject_id,
    parent_id: parent_id.present ? parent_id.value : this.parent_id,
    name: name ?? this.name,
    level: level ?? this.level,
    sort_order: sort_order ?? this.sort_order,
    description: description.present ? description.value : this.description,
    created_at: created_at ?? this.created_at,
    updated_at: updated_at ?? this.updated_at,
  );
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      id: data.id.present ? data.id.value : this.id,
      subject_id: data.subject_id.present
          ? data.subject_id.value
          : this.subject_id,
      parent_id: data.parent_id.present ? data.parent_id.value : this.parent_id,
      name: data.name.present ? data.name.value : this.name,
      level: data.level.present ? data.level.value : this.level,
      sort_order: data.sort_order.present
          ? data.sort_order.value
          : this.sort_order,
      description: data.description.present
          ? data.description.value
          : this.description,
      created_at: data.created_at.present
          ? data.created_at.value
          : this.created_at,
      updated_at: data.updated_at.present
          ? data.updated_at.value
          : this.updated_at,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('subject_id: $subject_id, ')
          ..write('parent_id: $parent_id, ')
          ..write('name: $name, ')
          ..write('level: $level, ')
          ..write('sort_order: $sort_order, ')
          ..write('description: $description, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    subject_id,
    parent_id,
    name,
    level,
    sort_order,
    description,
    created_at,
    updated_at,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.subject_id == this.subject_id &&
          other.parent_id == this.parent_id &&
          other.name == this.name &&
          other.level == this.level &&
          other.sort_order == this.sort_order &&
          other.description == this.description &&
          other.created_at == this.created_at &&
          other.updated_at == this.updated_at);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<String> id;
  final Value<String> subject_id;
  final Value<String?> parent_id;
  final Value<String> name;
  final Value<int> level;
  final Value<int> sort_order;
  final Value<String?> description;
  final Value<int> created_at;
  final Value<int> updated_at;
  final Value<int> rowid;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.subject_id = const Value.absent(),
    this.parent_id = const Value.absent(),
    this.name = const Value.absent(),
    this.level = const Value.absent(),
    this.sort_order = const Value.absent(),
    this.description = const Value.absent(),
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoriesCompanion.insert({
    required String id,
    required String subject_id,
    this.parent_id = const Value.absent(),
    required String name,
    required int level,
    required int sort_order,
    this.description = const Value.absent(),
    required int created_at,
    required int updated_at,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       subject_id = Value(subject_id),
       name = Value(name),
       level = Value(level),
       sort_order = Value(sort_order),
       created_at = Value(created_at),
       updated_at = Value(updated_at);
  static Insertable<Category> custom({
    Expression<String>? id,
    Expression<String>? subject_id,
    Expression<String>? parent_id,
    Expression<String>? name,
    Expression<int>? level,
    Expression<int>? sort_order,
    Expression<String>? description,
    Expression<int>? created_at,
    Expression<int>? updated_at,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subject_id != null) 'subject_id': subject_id,
      if (parent_id != null) 'parent_id': parent_id,
      if (name != null) 'name': name,
      if (level != null) 'level': level,
      if (sort_order != null) 'sort_order': sort_order,
      if (description != null) 'description': description,
      if (created_at != null) 'created_at': created_at,
      if (updated_at != null) 'updated_at': updated_at,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoriesCompanion copyWith({
    Value<String>? id,
    Value<String>? subject_id,
    Value<String?>? parent_id,
    Value<String>? name,
    Value<int>? level,
    Value<int>? sort_order,
    Value<String?>? description,
    Value<int>? created_at,
    Value<int>? updated_at,
    Value<int>? rowid,
  }) {
    return CategoriesCompanion(
      id: id ?? this.id,
      subject_id: subject_id ?? this.subject_id,
      parent_id: parent_id ?? this.parent_id,
      name: name ?? this.name,
      level: level ?? this.level,
      sort_order: sort_order ?? this.sort_order,
      description: description ?? this.description,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (subject_id.present) {
      map['subject_id'] = Variable<String>(subject_id.value);
    }
    if (parent_id.present) {
      map['parent_id'] = Variable<String>(parent_id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (sort_order.present) {
      map['sort_order'] = Variable<int>(sort_order.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<int>(created_at.value);
    }
    if (updated_at.present) {
      map['updated_at'] = Variable<int>(updated_at.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('subject_id: $subject_id, ')
          ..write('parent_id: $parent_id, ')
          ..write('name: $name, ')
          ..write('level: $level, ')
          ..write('sort_order: $sort_order, ')
          ..write('description: $description, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ImagesTable extends Images with TableInfo<$ImagesTable, ImageRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ImagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _study_item_idMeta = const VerificationMeta(
    'study_item_id',
  );
  @override
  late final GeneratedColumn<String> study_item_id = GeneratedColumn<String>(
    'study_item_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _file_pathMeta = const VerificationMeta(
    'file_path',
  );
  @override
  late final GeneratedColumn<String> file_path = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _thumbnail_pathMeta = const VerificationMeta(
    'thumbnail_path',
  );
  @override
  late final GeneratedColumn<String> thumbnail_path = GeneratedColumn<String>(
    'thumbnail_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _original_widthMeta = const VerificationMeta(
    'original_width',
  );
  @override
  late final GeneratedColumn<int> original_width = GeneratedColumn<int>(
    'original_width',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _original_heightMeta = const VerificationMeta(
    'original_height',
  );
  @override
  late final GeneratedColumn<int> original_height = GeneratedColumn<int>(
    'original_height',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _file_sizeMeta = const VerificationMeta(
    'file_size',
  );
  @override
  late final GeneratedColumn<int> file_size = GeneratedColumn<int>(
    'file_size',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sort_orderMeta = const VerificationMeta(
    'sort_order',
  );
  @override
  late final GeneratedColumn<int> sort_order = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _created_atMeta = const VerificationMeta(
    'created_at',
  );
  @override
  late final GeneratedColumn<int> created_at = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    study_item_id,
    file_path,
    thumbnail_path,
    original_width,
    original_height,
    file_size,
    sort_order,
    created_at,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'images';
  @override
  VerificationContext validateIntegrity(
    Insertable<ImageRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('study_item_id')) {
      context.handle(
        _study_item_idMeta,
        study_item_id.isAcceptableOrUnknown(
          data['study_item_id']!,
          _study_item_idMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_study_item_idMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(
        _file_pathMeta,
        file_path.isAcceptableOrUnknown(data['file_path']!, _file_pathMeta),
      );
    } else if (isInserting) {
      context.missing(_file_pathMeta);
    }
    if (data.containsKey('thumbnail_path')) {
      context.handle(
        _thumbnail_pathMeta,
        thumbnail_path.isAcceptableOrUnknown(
          data['thumbnail_path']!,
          _thumbnail_pathMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_thumbnail_pathMeta);
    }
    if (data.containsKey('original_width')) {
      context.handle(
        _original_widthMeta,
        original_width.isAcceptableOrUnknown(
          data['original_width']!,
          _original_widthMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_original_widthMeta);
    }
    if (data.containsKey('original_height')) {
      context.handle(
        _original_heightMeta,
        original_height.isAcceptableOrUnknown(
          data['original_height']!,
          _original_heightMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_original_heightMeta);
    }
    if (data.containsKey('file_size')) {
      context.handle(
        _file_sizeMeta,
        file_size.isAcceptableOrUnknown(data['file_size']!, _file_sizeMeta),
      );
    } else if (isInserting) {
      context.missing(_file_sizeMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sort_orderMeta,
        sort_order.isAcceptableOrUnknown(data['sort_order']!, _sort_orderMeta),
      );
    } else if (isInserting) {
      context.missing(_sort_orderMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _created_atMeta,
        created_at.isAcceptableOrUnknown(data['created_at']!, _created_atMeta),
      );
    } else if (isInserting) {
      context.missing(_created_atMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ImageRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ImageRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      study_item_id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}study_item_id'],
      )!,
      file_path: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      )!,
      thumbnail_path: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thumbnail_path'],
      )!,
      original_width: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}original_width'],
      )!,
      original_height: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}original_height'],
      )!,
      file_size: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}file_size'],
      )!,
      sort_order: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      created_at: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ImagesTable createAlias(String alias) {
    return $ImagesTable(attachedDatabase, alias);
  }
}

class ImageRecord extends DataClass implements Insertable<ImageRecord> {
  /// 图片ID，主键
  final String id;

  /// 所属学习内容
  final String study_item_id;

  /// 原图路径
  final String file_path;

  /// 缩略图路径
  final String thumbnail_path;

  /// 原始宽度
  final int original_width;

  /// 原始高度
  final int original_height;

  /// 文件大小
  final int file_size;

  /// 图片顺序
  final int sort_order;

  /// 添加时间，毫秒级时间戳
  final int created_at;
  const ImageRecord({
    required this.id,
    required this.study_item_id,
    required this.file_path,
    required this.thumbnail_path,
    required this.original_width,
    required this.original_height,
    required this.file_size,
    required this.sort_order,
    required this.created_at,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['study_item_id'] = Variable<String>(study_item_id);
    map['file_path'] = Variable<String>(file_path);
    map['thumbnail_path'] = Variable<String>(thumbnail_path);
    map['original_width'] = Variable<int>(original_width);
    map['original_height'] = Variable<int>(original_height);
    map['file_size'] = Variable<int>(file_size);
    map['sort_order'] = Variable<int>(sort_order);
    map['created_at'] = Variable<int>(created_at);
    return map;
  }

  ImagesCompanion toCompanion(bool nullToAbsent) {
    return ImagesCompanion(
      id: Value(id),
      study_item_id: Value(study_item_id),
      file_path: Value(file_path),
      thumbnail_path: Value(thumbnail_path),
      original_width: Value(original_width),
      original_height: Value(original_height),
      file_size: Value(file_size),
      sort_order: Value(sort_order),
      created_at: Value(created_at),
    );
  }

  factory ImageRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ImageRecord(
      id: serializer.fromJson<String>(json['id']),
      study_item_id: serializer.fromJson<String>(json['study_item_id']),
      file_path: serializer.fromJson<String>(json['file_path']),
      thumbnail_path: serializer.fromJson<String>(json['thumbnail_path']),
      original_width: serializer.fromJson<int>(json['original_width']),
      original_height: serializer.fromJson<int>(json['original_height']),
      file_size: serializer.fromJson<int>(json['file_size']),
      sort_order: serializer.fromJson<int>(json['sort_order']),
      created_at: serializer.fromJson<int>(json['created_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'study_item_id': serializer.toJson<String>(study_item_id),
      'file_path': serializer.toJson<String>(file_path),
      'thumbnail_path': serializer.toJson<String>(thumbnail_path),
      'original_width': serializer.toJson<int>(original_width),
      'original_height': serializer.toJson<int>(original_height),
      'file_size': serializer.toJson<int>(file_size),
      'sort_order': serializer.toJson<int>(sort_order),
      'created_at': serializer.toJson<int>(created_at),
    };
  }

  ImageRecord copyWith({
    String? id,
    String? study_item_id,
    String? file_path,
    String? thumbnail_path,
    int? original_width,
    int? original_height,
    int? file_size,
    int? sort_order,
    int? created_at,
  }) => ImageRecord(
    id: id ?? this.id,
    study_item_id: study_item_id ?? this.study_item_id,
    file_path: file_path ?? this.file_path,
    thumbnail_path: thumbnail_path ?? this.thumbnail_path,
    original_width: original_width ?? this.original_width,
    original_height: original_height ?? this.original_height,
    file_size: file_size ?? this.file_size,
    sort_order: sort_order ?? this.sort_order,
    created_at: created_at ?? this.created_at,
  );
  ImageRecord copyWithCompanion(ImagesCompanion data) {
    return ImageRecord(
      id: data.id.present ? data.id.value : this.id,
      study_item_id: data.study_item_id.present
          ? data.study_item_id.value
          : this.study_item_id,
      file_path: data.file_path.present ? data.file_path.value : this.file_path,
      thumbnail_path: data.thumbnail_path.present
          ? data.thumbnail_path.value
          : this.thumbnail_path,
      original_width: data.original_width.present
          ? data.original_width.value
          : this.original_width,
      original_height: data.original_height.present
          ? data.original_height.value
          : this.original_height,
      file_size: data.file_size.present ? data.file_size.value : this.file_size,
      sort_order: data.sort_order.present
          ? data.sort_order.value
          : this.sort_order,
      created_at: data.created_at.present
          ? data.created_at.value
          : this.created_at,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ImageRecord(')
          ..write('id: $id, ')
          ..write('study_item_id: $study_item_id, ')
          ..write('file_path: $file_path, ')
          ..write('thumbnail_path: $thumbnail_path, ')
          ..write('original_width: $original_width, ')
          ..write('original_height: $original_height, ')
          ..write('file_size: $file_size, ')
          ..write('sort_order: $sort_order, ')
          ..write('created_at: $created_at')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    study_item_id,
    file_path,
    thumbnail_path,
    original_width,
    original_height,
    file_size,
    sort_order,
    created_at,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImageRecord &&
          other.id == this.id &&
          other.study_item_id == this.study_item_id &&
          other.file_path == this.file_path &&
          other.thumbnail_path == this.thumbnail_path &&
          other.original_width == this.original_width &&
          other.original_height == this.original_height &&
          other.file_size == this.file_size &&
          other.sort_order == this.sort_order &&
          other.created_at == this.created_at);
}

class ImagesCompanion extends UpdateCompanion<ImageRecord> {
  final Value<String> id;
  final Value<String> study_item_id;
  final Value<String> file_path;
  final Value<String> thumbnail_path;
  final Value<int> original_width;
  final Value<int> original_height;
  final Value<int> file_size;
  final Value<int> sort_order;
  final Value<int> created_at;
  final Value<int> rowid;
  const ImagesCompanion({
    this.id = const Value.absent(),
    this.study_item_id = const Value.absent(),
    this.file_path = const Value.absent(),
    this.thumbnail_path = const Value.absent(),
    this.original_width = const Value.absent(),
    this.original_height = const Value.absent(),
    this.file_size = const Value.absent(),
    this.sort_order = const Value.absent(),
    this.created_at = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ImagesCompanion.insert({
    required String id,
    required String study_item_id,
    required String file_path,
    required String thumbnail_path,
    required int original_width,
    required int original_height,
    required int file_size,
    required int sort_order,
    required int created_at,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       study_item_id = Value(study_item_id),
       file_path = Value(file_path),
       thumbnail_path = Value(thumbnail_path),
       original_width = Value(original_width),
       original_height = Value(original_height),
       file_size = Value(file_size),
       sort_order = Value(sort_order),
       created_at = Value(created_at);
  static Insertable<ImageRecord> custom({
    Expression<String>? id,
    Expression<String>? study_item_id,
    Expression<String>? file_path,
    Expression<String>? thumbnail_path,
    Expression<int>? original_width,
    Expression<int>? original_height,
    Expression<int>? file_size,
    Expression<int>? sort_order,
    Expression<int>? created_at,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (study_item_id != null) 'study_item_id': study_item_id,
      if (file_path != null) 'file_path': file_path,
      if (thumbnail_path != null) 'thumbnail_path': thumbnail_path,
      if (original_width != null) 'original_width': original_width,
      if (original_height != null) 'original_height': original_height,
      if (file_size != null) 'file_size': file_size,
      if (sort_order != null) 'sort_order': sort_order,
      if (created_at != null) 'created_at': created_at,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ImagesCompanion copyWith({
    Value<String>? id,
    Value<String>? study_item_id,
    Value<String>? file_path,
    Value<String>? thumbnail_path,
    Value<int>? original_width,
    Value<int>? original_height,
    Value<int>? file_size,
    Value<int>? sort_order,
    Value<int>? created_at,
    Value<int>? rowid,
  }) {
    return ImagesCompanion(
      id: id ?? this.id,
      study_item_id: study_item_id ?? this.study_item_id,
      file_path: file_path ?? this.file_path,
      thumbnail_path: thumbnail_path ?? this.thumbnail_path,
      original_width: original_width ?? this.original_width,
      original_height: original_height ?? this.original_height,
      file_size: file_size ?? this.file_size,
      sort_order: sort_order ?? this.sort_order,
      created_at: created_at ?? this.created_at,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (study_item_id.present) {
      map['study_item_id'] = Variable<String>(study_item_id.value);
    }
    if (file_path.present) {
      map['file_path'] = Variable<String>(file_path.value);
    }
    if (thumbnail_path.present) {
      map['thumbnail_path'] = Variable<String>(thumbnail_path.value);
    }
    if (original_width.present) {
      map['original_width'] = Variable<int>(original_width.value);
    }
    if (original_height.present) {
      map['original_height'] = Variable<int>(original_height.value);
    }
    if (file_size.present) {
      map['file_size'] = Variable<int>(file_size.value);
    }
    if (sort_order.present) {
      map['sort_order'] = Variable<int>(sort_order.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<int>(created_at.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ImagesCompanion(')
          ..write('id: $id, ')
          ..write('study_item_id: $study_item_id, ')
          ..write('file_path: $file_path, ')
          ..write('thumbnail_path: $thumbnail_path, ')
          ..write('original_width: $original_width, ')
          ..write('original_height: $original_height, ')
          ..write('file_size: $file_size, ')
          ..write('sort_order: $sort_order, ')
          ..write('created_at: $created_at, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TagsTable extends Tags with TableInfo<$TagsTable, TagRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _created_atMeta = const VerificationMeta(
    'created_at',
  );
  @override
  late final GeneratedColumn<int> created_at = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updated_atMeta = const VerificationMeta(
    'updated_at',
  );
  @override
  late final GeneratedColumn<int> updated_at = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, created_at, updated_at];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tags';
  @override
  VerificationContext validateIntegrity(
    Insertable<TagRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _created_atMeta,
        created_at.isAcceptableOrUnknown(data['created_at']!, _created_atMeta),
      );
    } else if (isInserting) {
      context.missing(_created_atMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updated_atMeta,
        updated_at.isAcceptableOrUnknown(data['updated_at']!, _updated_atMeta),
      );
    } else if (isInserting) {
      context.missing(_updated_atMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TagRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TagRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      created_at: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updated_at: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $TagsTable createAlias(String alias) {
    return $TagsTable(attachedDatabase, alias);
  }
}

class TagRecord extends DataClass implements Insertable<TagRecord> {
  /// 标签ID，主键
  final String id;

  /// 标签名称
  final String name;

  /// 创建时间，毫秒级时间戳
  final int created_at;

  /// 修改时间，毫秒级时间戳
  final int updated_at;
  const TagRecord({
    required this.id,
    required this.name,
    required this.created_at,
    required this.updated_at,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<int>(created_at);
    map['updated_at'] = Variable<int>(updated_at);
    return map;
  }

  TagsCompanion toCompanion(bool nullToAbsent) {
    return TagsCompanion(
      id: Value(id),
      name: Value(name),
      created_at: Value(created_at),
      updated_at: Value(updated_at),
    );
  }

  factory TagRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TagRecord(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      created_at: serializer.fromJson<int>(json['created_at']),
      updated_at: serializer.fromJson<int>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'created_at': serializer.toJson<int>(created_at),
      'updated_at': serializer.toJson<int>(updated_at),
    };
  }

  TagRecord copyWith({
    String? id,
    String? name,
    int? created_at,
    int? updated_at,
  }) => TagRecord(
    id: id ?? this.id,
    name: name ?? this.name,
    created_at: created_at ?? this.created_at,
    updated_at: updated_at ?? this.updated_at,
  );
  TagRecord copyWithCompanion(TagsCompanion data) {
    return TagRecord(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      created_at: data.created_at.present
          ? data.created_at.value
          : this.created_at,
      updated_at: data.updated_at.present
          ? data.updated_at.value
          : this.updated_at,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TagRecord(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, created_at, updated_at);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TagRecord &&
          other.id == this.id &&
          other.name == this.name &&
          other.created_at == this.created_at &&
          other.updated_at == this.updated_at);
}

class TagsCompanion extends UpdateCompanion<TagRecord> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> created_at;
  final Value<int> updated_at;
  final Value<int> rowid;
  const TagsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TagsCompanion.insert({
    required String id,
    required String name,
    required int created_at,
    required int updated_at,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       created_at = Value(created_at),
       updated_at = Value(updated_at);
  static Insertable<TagRecord> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? created_at,
    Expression<int>? updated_at,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (created_at != null) 'created_at': created_at,
      if (updated_at != null) 'updated_at': updated_at,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TagsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? created_at,
    Value<int>? updated_at,
    Value<int>? rowid,
  }) {
    return TagsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<int>(created_at.value);
    }
    if (updated_at.present) {
      map['updated_at'] = Variable<int>(updated_at.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StudyItemTagsTable extends StudyItemTags
    with TableInfo<$StudyItemTagsTable, StudyItemTagRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudyItemTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _study_item_idMeta = const VerificationMeta(
    'study_item_id',
  );
  @override
  late final GeneratedColumn<String> study_item_id = GeneratedColumn<String>(
    'study_item_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tag_idMeta = const VerificationMeta('tag_id');
  @override
  late final GeneratedColumn<String> tag_id = GeneratedColumn<String>(
    'tag_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [study_item_id, tag_id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'study_item_tags';
  @override
  VerificationContext validateIntegrity(
    Insertable<StudyItemTagRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('study_item_id')) {
      context.handle(
        _study_item_idMeta,
        study_item_id.isAcceptableOrUnknown(
          data['study_item_id']!,
          _study_item_idMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_study_item_idMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
        _tag_idMeta,
        tag_id.isAcceptableOrUnknown(data['tag_id']!, _tag_idMeta),
      );
    } else if (isInserting) {
      context.missing(_tag_idMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {study_item_id, tag_id};
  @override
  StudyItemTagRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudyItemTagRecord(
      study_item_id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}study_item_id'],
      )!,
      tag_id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tag_id'],
      )!,
    );
  }

  @override
  $StudyItemTagsTable createAlias(String alias) {
    return $StudyItemTagsTable(attachedDatabase, alias);
  }
}

class StudyItemTagRecord extends DataClass
    implements Insertable<StudyItemTagRecord> {
  /// 学习内容ID
  final String study_item_id;

  /// 标签ID
  final String tag_id;
  const StudyItemTagRecord({required this.study_item_id, required this.tag_id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['study_item_id'] = Variable<String>(study_item_id);
    map['tag_id'] = Variable<String>(tag_id);
    return map;
  }

  StudyItemTagsCompanion toCompanion(bool nullToAbsent) {
    return StudyItemTagsCompanion(
      study_item_id: Value(study_item_id),
      tag_id: Value(tag_id),
    );
  }

  factory StudyItemTagRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudyItemTagRecord(
      study_item_id: serializer.fromJson<String>(json['study_item_id']),
      tag_id: serializer.fromJson<String>(json['tag_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'study_item_id': serializer.toJson<String>(study_item_id),
      'tag_id': serializer.toJson<String>(tag_id),
    };
  }

  StudyItemTagRecord copyWith({String? study_item_id, String? tag_id}) =>
      StudyItemTagRecord(
        study_item_id: study_item_id ?? this.study_item_id,
        tag_id: tag_id ?? this.tag_id,
      );
  StudyItemTagRecord copyWithCompanion(StudyItemTagsCompanion data) {
    return StudyItemTagRecord(
      study_item_id: data.study_item_id.present
          ? data.study_item_id.value
          : this.study_item_id,
      tag_id: data.tag_id.present ? data.tag_id.value : this.tag_id,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StudyItemTagRecord(')
          ..write('study_item_id: $study_item_id, ')
          ..write('tag_id: $tag_id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(study_item_id, tag_id);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudyItemTagRecord &&
          other.study_item_id == this.study_item_id &&
          other.tag_id == this.tag_id);
}

class StudyItemTagsCompanion extends UpdateCompanion<StudyItemTagRecord> {
  final Value<String> study_item_id;
  final Value<String> tag_id;
  final Value<int> rowid;
  const StudyItemTagsCompanion({
    this.study_item_id = const Value.absent(),
    this.tag_id = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StudyItemTagsCompanion.insert({
    required String study_item_id,
    required String tag_id,
    this.rowid = const Value.absent(),
  }) : study_item_id = Value(study_item_id),
       tag_id = Value(tag_id);
  static Insertable<StudyItemTagRecord> custom({
    Expression<String>? study_item_id,
    Expression<String>? tag_id,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (study_item_id != null) 'study_item_id': study_item_id,
      if (tag_id != null) 'tag_id': tag_id,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StudyItemTagsCompanion copyWith({
    Value<String>? study_item_id,
    Value<String>? tag_id,
    Value<int>? rowid,
  }) {
    return StudyItemTagsCompanion(
      study_item_id: study_item_id ?? this.study_item_id,
      tag_id: tag_id ?? this.tag_id,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (study_item_id.present) {
      map['study_item_id'] = Variable<String>(study_item_id.value);
    }
    if (tag_id.present) {
      map['tag_id'] = Variable<String>(tag_id.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudyItemTagsCompanion(')
          ..write('study_item_id: $study_item_id, ')
          ..write('tag_id: $tag_id, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FsrsCardsTable extends FsrsCards
    with TableInfo<$FsrsCardsTable, FsrsCardRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FsrsCardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _study_item_idMeta = const VerificationMeta(
    'study_item_id',
  );
  @override
  late final GeneratedColumn<String> study_item_id = GeneratedColumn<String>(
    'study_item_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dueMeta = const VerificationMeta('due');
  @override
  late final GeneratedColumn<int> due = GeneratedColumn<int>(
    'due',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stabilityMeta = const VerificationMeta(
    'stability',
  );
  @override
  late final GeneratedColumn<double> stability = GeneratedColumn<double>(
    'stability',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _difficultyMeta = const VerificationMeta(
    'difficulty',
  );
  @override
  late final GeneratedColumn<double> difficulty = GeneratedColumn<double>(
    'difficulty',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _elapsed_daysMeta = const VerificationMeta(
    'elapsed_days',
  );
  @override
  late final GeneratedColumn<int> elapsed_days = GeneratedColumn<int>(
    'elapsed_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scheduled_daysMeta = const VerificationMeta(
    'scheduled_days',
  );
  @override
  late final GeneratedColumn<int> scheduled_days = GeneratedColumn<int>(
    'scheduled_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _repsMeta = const VerificationMeta('reps');
  @override
  late final GeneratedColumn<int> reps = GeneratedColumn<int>(
    'reps',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lapsesMeta = const VerificationMeta('lapses');
  @override
  late final GeneratedColumn<int> lapses = GeneratedColumn<int>(
    'lapses',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<int> state = GeneratedColumn<int>(
    'state',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _last_reviewMeta = const VerificationMeta(
    'last_review',
  );
  @override
  late final GeneratedColumn<int> last_review = GeneratedColumn<int>(
    'last_review',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _created_atMeta = const VerificationMeta(
    'created_at',
  );
  @override
  late final GeneratedColumn<int> created_at = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updated_atMeta = const VerificationMeta(
    'updated_at',
  );
  @override
  late final GeneratedColumn<int> updated_at = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    study_item_id,
    due,
    stability,
    difficulty,
    elapsed_days,
    scheduled_days,
    reps,
    lapses,
    state,
    last_review,
    created_at,
    updated_at,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fsrs_cards';
  @override
  VerificationContext validateIntegrity(
    Insertable<FsrsCardRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('study_item_id')) {
      context.handle(
        _study_item_idMeta,
        study_item_id.isAcceptableOrUnknown(
          data['study_item_id']!,
          _study_item_idMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_study_item_idMeta);
    }
    if (data.containsKey('due')) {
      context.handle(
        _dueMeta,
        due.isAcceptableOrUnknown(data['due']!, _dueMeta),
      );
    } else if (isInserting) {
      context.missing(_dueMeta);
    }
    if (data.containsKey('stability')) {
      context.handle(
        _stabilityMeta,
        stability.isAcceptableOrUnknown(data['stability']!, _stabilityMeta),
      );
    } else if (isInserting) {
      context.missing(_stabilityMeta);
    }
    if (data.containsKey('difficulty')) {
      context.handle(
        _difficultyMeta,
        difficulty.isAcceptableOrUnknown(data['difficulty']!, _difficultyMeta),
      );
    } else if (isInserting) {
      context.missing(_difficultyMeta);
    }
    if (data.containsKey('elapsed_days')) {
      context.handle(
        _elapsed_daysMeta,
        elapsed_days.isAcceptableOrUnknown(
          data['elapsed_days']!,
          _elapsed_daysMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_elapsed_daysMeta);
    }
    if (data.containsKey('scheduled_days')) {
      context.handle(
        _scheduled_daysMeta,
        scheduled_days.isAcceptableOrUnknown(
          data['scheduled_days']!,
          _scheduled_daysMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduled_daysMeta);
    }
    if (data.containsKey('reps')) {
      context.handle(
        _repsMeta,
        reps.isAcceptableOrUnknown(data['reps']!, _repsMeta),
      );
    } else if (isInserting) {
      context.missing(_repsMeta);
    }
    if (data.containsKey('lapses')) {
      context.handle(
        _lapsesMeta,
        lapses.isAcceptableOrUnknown(data['lapses']!, _lapsesMeta),
      );
    } else if (isInserting) {
      context.missing(_lapsesMeta);
    }
    if (data.containsKey('state')) {
      context.handle(
        _stateMeta,
        state.isAcceptableOrUnknown(data['state']!, _stateMeta),
      );
    } else if (isInserting) {
      context.missing(_stateMeta);
    }
    if (data.containsKey('last_review')) {
      context.handle(
        _last_reviewMeta,
        last_review.isAcceptableOrUnknown(
          data['last_review']!,
          _last_reviewMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _created_atMeta,
        created_at.isAcceptableOrUnknown(data['created_at']!, _created_atMeta),
      );
    } else if (isInserting) {
      context.missing(_created_atMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updated_atMeta,
        updated_at.isAcceptableOrUnknown(data['updated_at']!, _updated_atMeta),
      );
    } else if (isInserting) {
      context.missing(_updated_atMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {study_item_id};
  @override
  FsrsCardRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FsrsCardRecord(
      study_item_id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}study_item_id'],
      )!,
      due: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}due'],
      )!,
      stability: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}stability'],
      )!,
      difficulty: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}difficulty'],
      )!,
      elapsed_days: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}elapsed_days'],
      )!,
      scheduled_days: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}scheduled_days'],
      )!,
      reps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reps'],
      )!,
      lapses: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}lapses'],
      )!,
      state: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}state'],
      )!,
      last_review: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_review'],
      ),
      created_at: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updated_at: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $FsrsCardsTable createAlias(String alias) {
    return $FsrsCardsTable(attachedDatabase, alias);
  }
}

class FsrsCardRecord extends DataClass implements Insertable<FsrsCardRecord> {
  /// 学习内容ID，主键
  final String study_item_id;

  /// 下一次到期时间，毫秒级时间戳
  final int due;

  /// FSRS 稳定性
  final double stability;

  /// FSRS 内部难度
  final double difficulty;

  /// 距上次复习天数
  final int elapsed_days;

  /// 当前计划间隔
  final int scheduled_days;

  /// 复习次数
  final int reps;

  /// Again / 遗忘次数
  final int lapses;

  /// FSRS 状态
  final int state;

  /// 上一次复习时间，毫秒级时间戳；尚未复习过的新卡片为空
  final int? last_review;

  /// 创建时间，毫秒级时间戳
  final int created_at;

  /// 修改时间，毫秒级时间戳
  final int updated_at;
  const FsrsCardRecord({
    required this.study_item_id,
    required this.due,
    required this.stability,
    required this.difficulty,
    required this.elapsed_days,
    required this.scheduled_days,
    required this.reps,
    required this.lapses,
    required this.state,
    this.last_review,
    required this.created_at,
    required this.updated_at,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['study_item_id'] = Variable<String>(study_item_id);
    map['due'] = Variable<int>(due);
    map['stability'] = Variable<double>(stability);
    map['difficulty'] = Variable<double>(difficulty);
    map['elapsed_days'] = Variable<int>(elapsed_days);
    map['scheduled_days'] = Variable<int>(scheduled_days);
    map['reps'] = Variable<int>(reps);
    map['lapses'] = Variable<int>(lapses);
    map['state'] = Variable<int>(state);
    if (!nullToAbsent || last_review != null) {
      map['last_review'] = Variable<int>(last_review);
    }
    map['created_at'] = Variable<int>(created_at);
    map['updated_at'] = Variable<int>(updated_at);
    return map;
  }

  FsrsCardsCompanion toCompanion(bool nullToAbsent) {
    return FsrsCardsCompanion(
      study_item_id: Value(study_item_id),
      due: Value(due),
      stability: Value(stability),
      difficulty: Value(difficulty),
      elapsed_days: Value(elapsed_days),
      scheduled_days: Value(scheduled_days),
      reps: Value(reps),
      lapses: Value(lapses),
      state: Value(state),
      last_review: last_review == null && nullToAbsent
          ? const Value.absent()
          : Value(last_review),
      created_at: Value(created_at),
      updated_at: Value(updated_at),
    );
  }

  factory FsrsCardRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FsrsCardRecord(
      study_item_id: serializer.fromJson<String>(json['study_item_id']),
      due: serializer.fromJson<int>(json['due']),
      stability: serializer.fromJson<double>(json['stability']),
      difficulty: serializer.fromJson<double>(json['difficulty']),
      elapsed_days: serializer.fromJson<int>(json['elapsed_days']),
      scheduled_days: serializer.fromJson<int>(json['scheduled_days']),
      reps: serializer.fromJson<int>(json['reps']),
      lapses: serializer.fromJson<int>(json['lapses']),
      state: serializer.fromJson<int>(json['state']),
      last_review: serializer.fromJson<int?>(json['last_review']),
      created_at: serializer.fromJson<int>(json['created_at']),
      updated_at: serializer.fromJson<int>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'study_item_id': serializer.toJson<String>(study_item_id),
      'due': serializer.toJson<int>(due),
      'stability': serializer.toJson<double>(stability),
      'difficulty': serializer.toJson<double>(difficulty),
      'elapsed_days': serializer.toJson<int>(elapsed_days),
      'scheduled_days': serializer.toJson<int>(scheduled_days),
      'reps': serializer.toJson<int>(reps),
      'lapses': serializer.toJson<int>(lapses),
      'state': serializer.toJson<int>(state),
      'last_review': serializer.toJson<int?>(last_review),
      'created_at': serializer.toJson<int>(created_at),
      'updated_at': serializer.toJson<int>(updated_at),
    };
  }

  FsrsCardRecord copyWith({
    String? study_item_id,
    int? due,
    double? stability,
    double? difficulty,
    int? elapsed_days,
    int? scheduled_days,
    int? reps,
    int? lapses,
    int? state,
    Value<int?> last_review = const Value.absent(),
    int? created_at,
    int? updated_at,
  }) => FsrsCardRecord(
    study_item_id: study_item_id ?? this.study_item_id,
    due: due ?? this.due,
    stability: stability ?? this.stability,
    difficulty: difficulty ?? this.difficulty,
    elapsed_days: elapsed_days ?? this.elapsed_days,
    scheduled_days: scheduled_days ?? this.scheduled_days,
    reps: reps ?? this.reps,
    lapses: lapses ?? this.lapses,
    state: state ?? this.state,
    last_review: last_review.present ? last_review.value : this.last_review,
    created_at: created_at ?? this.created_at,
    updated_at: updated_at ?? this.updated_at,
  );
  FsrsCardRecord copyWithCompanion(FsrsCardsCompanion data) {
    return FsrsCardRecord(
      study_item_id: data.study_item_id.present
          ? data.study_item_id.value
          : this.study_item_id,
      due: data.due.present ? data.due.value : this.due,
      stability: data.stability.present ? data.stability.value : this.stability,
      difficulty: data.difficulty.present
          ? data.difficulty.value
          : this.difficulty,
      elapsed_days: data.elapsed_days.present
          ? data.elapsed_days.value
          : this.elapsed_days,
      scheduled_days: data.scheduled_days.present
          ? data.scheduled_days.value
          : this.scheduled_days,
      reps: data.reps.present ? data.reps.value : this.reps,
      lapses: data.lapses.present ? data.lapses.value : this.lapses,
      state: data.state.present ? data.state.value : this.state,
      last_review: data.last_review.present
          ? data.last_review.value
          : this.last_review,
      created_at: data.created_at.present
          ? data.created_at.value
          : this.created_at,
      updated_at: data.updated_at.present
          ? data.updated_at.value
          : this.updated_at,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FsrsCardRecord(')
          ..write('study_item_id: $study_item_id, ')
          ..write('due: $due, ')
          ..write('stability: $stability, ')
          ..write('difficulty: $difficulty, ')
          ..write('elapsed_days: $elapsed_days, ')
          ..write('scheduled_days: $scheduled_days, ')
          ..write('reps: $reps, ')
          ..write('lapses: $lapses, ')
          ..write('state: $state, ')
          ..write('last_review: $last_review, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    study_item_id,
    due,
    stability,
    difficulty,
    elapsed_days,
    scheduled_days,
    reps,
    lapses,
    state,
    last_review,
    created_at,
    updated_at,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FsrsCardRecord &&
          other.study_item_id == this.study_item_id &&
          other.due == this.due &&
          other.stability == this.stability &&
          other.difficulty == this.difficulty &&
          other.elapsed_days == this.elapsed_days &&
          other.scheduled_days == this.scheduled_days &&
          other.reps == this.reps &&
          other.lapses == this.lapses &&
          other.state == this.state &&
          other.last_review == this.last_review &&
          other.created_at == this.created_at &&
          other.updated_at == this.updated_at);
}

class FsrsCardsCompanion extends UpdateCompanion<FsrsCardRecord> {
  final Value<String> study_item_id;
  final Value<int> due;
  final Value<double> stability;
  final Value<double> difficulty;
  final Value<int> elapsed_days;
  final Value<int> scheduled_days;
  final Value<int> reps;
  final Value<int> lapses;
  final Value<int> state;
  final Value<int?> last_review;
  final Value<int> created_at;
  final Value<int> updated_at;
  final Value<int> rowid;
  const FsrsCardsCompanion({
    this.study_item_id = const Value.absent(),
    this.due = const Value.absent(),
    this.stability = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.elapsed_days = const Value.absent(),
    this.scheduled_days = const Value.absent(),
    this.reps = const Value.absent(),
    this.lapses = const Value.absent(),
    this.state = const Value.absent(),
    this.last_review = const Value.absent(),
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FsrsCardsCompanion.insert({
    required String study_item_id,
    required int due,
    required double stability,
    required double difficulty,
    required int elapsed_days,
    required int scheduled_days,
    required int reps,
    required int lapses,
    required int state,
    this.last_review = const Value.absent(),
    required int created_at,
    required int updated_at,
    this.rowid = const Value.absent(),
  }) : study_item_id = Value(study_item_id),
       due = Value(due),
       stability = Value(stability),
       difficulty = Value(difficulty),
       elapsed_days = Value(elapsed_days),
       scheduled_days = Value(scheduled_days),
       reps = Value(reps),
       lapses = Value(lapses),
       state = Value(state),
       created_at = Value(created_at),
       updated_at = Value(updated_at);
  static Insertable<FsrsCardRecord> custom({
    Expression<String>? study_item_id,
    Expression<int>? due,
    Expression<double>? stability,
    Expression<double>? difficulty,
    Expression<int>? elapsed_days,
    Expression<int>? scheduled_days,
    Expression<int>? reps,
    Expression<int>? lapses,
    Expression<int>? state,
    Expression<int>? last_review,
    Expression<int>? created_at,
    Expression<int>? updated_at,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (study_item_id != null) 'study_item_id': study_item_id,
      if (due != null) 'due': due,
      if (stability != null) 'stability': stability,
      if (difficulty != null) 'difficulty': difficulty,
      if (elapsed_days != null) 'elapsed_days': elapsed_days,
      if (scheduled_days != null) 'scheduled_days': scheduled_days,
      if (reps != null) 'reps': reps,
      if (lapses != null) 'lapses': lapses,
      if (state != null) 'state': state,
      if (last_review != null) 'last_review': last_review,
      if (created_at != null) 'created_at': created_at,
      if (updated_at != null) 'updated_at': updated_at,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FsrsCardsCompanion copyWith({
    Value<String>? study_item_id,
    Value<int>? due,
    Value<double>? stability,
    Value<double>? difficulty,
    Value<int>? elapsed_days,
    Value<int>? scheduled_days,
    Value<int>? reps,
    Value<int>? lapses,
    Value<int>? state,
    Value<int?>? last_review,
    Value<int>? created_at,
    Value<int>? updated_at,
    Value<int>? rowid,
  }) {
    return FsrsCardsCompanion(
      study_item_id: study_item_id ?? this.study_item_id,
      due: due ?? this.due,
      stability: stability ?? this.stability,
      difficulty: difficulty ?? this.difficulty,
      elapsed_days: elapsed_days ?? this.elapsed_days,
      scheduled_days: scheduled_days ?? this.scheduled_days,
      reps: reps ?? this.reps,
      lapses: lapses ?? this.lapses,
      state: state ?? this.state,
      last_review: last_review ?? this.last_review,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (study_item_id.present) {
      map['study_item_id'] = Variable<String>(study_item_id.value);
    }
    if (due.present) {
      map['due'] = Variable<int>(due.value);
    }
    if (stability.present) {
      map['stability'] = Variable<double>(stability.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<double>(difficulty.value);
    }
    if (elapsed_days.present) {
      map['elapsed_days'] = Variable<int>(elapsed_days.value);
    }
    if (scheduled_days.present) {
      map['scheduled_days'] = Variable<int>(scheduled_days.value);
    }
    if (reps.present) {
      map['reps'] = Variable<int>(reps.value);
    }
    if (lapses.present) {
      map['lapses'] = Variable<int>(lapses.value);
    }
    if (state.present) {
      map['state'] = Variable<int>(state.value);
    }
    if (last_review.present) {
      map['last_review'] = Variable<int>(last_review.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<int>(created_at.value);
    }
    if (updated_at.present) {
      map['updated_at'] = Variable<int>(updated_at.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FsrsCardsCompanion(')
          ..write('study_item_id: $study_item_id, ')
          ..write('due: $due, ')
          ..write('stability: $stability, ')
          ..write('difficulty: $difficulty, ')
          ..write('elapsed_days: $elapsed_days, ')
          ..write('scheduled_days: $scheduled_days, ')
          ..write('reps: $reps, ')
          ..write('lapses: $lapses, ')
          ..write('state: $state, ')
          ..write('last_review: $last_review, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReviewRecordsTable extends ReviewRecords
    with TableInfo<$ReviewRecordsTable, ReviewRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReviewRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _study_item_idMeta = const VerificationMeta(
    'study_item_id',
  );
  @override
  late final GeneratedColumn<String> study_item_id = GeneratedColumn<String>(
    'study_item_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _review_timeMeta = const VerificationMeta(
    'review_time',
  );
  @override
  late final GeneratedColumn<int> review_time = GeneratedColumn<int>(
    'review_time',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<String> rating = GeneratedColumn<String>(
    'rating',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _response_timeMeta = const VerificationMeta(
    'response_time',
  );
  @override
  late final GeneratedColumn<int> response_time = GeneratedColumn<int>(
    'response_time',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _previous_dueMeta = const VerificationMeta(
    'previous_due',
  );
  @override
  late final GeneratedColumn<int> previous_due = GeneratedColumn<int>(
    'previous_due',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _next_dueMeta = const VerificationMeta(
    'next_due',
  );
  @override
  late final GeneratedColumn<int> next_due = GeneratedColumn<int>(
    'next_due',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scheduled_daysMeta = const VerificationMeta(
    'scheduled_days',
  );
  @override
  late final GeneratedColumn<int> scheduled_days = GeneratedColumn<int>(
    'scheduled_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _is_overdueMeta = const VerificationMeta(
    'is_overdue',
  );
  @override
  late final GeneratedColumn<int> is_overdue = GeneratedColumn<int>(
    'is_overdue',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _created_atMeta = const VerificationMeta(
    'created_at',
  );
  @override
  late final GeneratedColumn<int> created_at = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    study_item_id,
    review_time,
    rating,
    response_time,
    previous_due,
    next_due,
    scheduled_days,
    is_overdue,
    created_at,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'review_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReviewRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('study_item_id')) {
      context.handle(
        _study_item_idMeta,
        study_item_id.isAcceptableOrUnknown(
          data['study_item_id']!,
          _study_item_idMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_study_item_idMeta);
    }
    if (data.containsKey('review_time')) {
      context.handle(
        _review_timeMeta,
        review_time.isAcceptableOrUnknown(
          data['review_time']!,
          _review_timeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_review_timeMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('response_time')) {
      context.handle(
        _response_timeMeta,
        response_time.isAcceptableOrUnknown(
          data['response_time']!,
          _response_timeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_response_timeMeta);
    }
    if (data.containsKey('previous_due')) {
      context.handle(
        _previous_dueMeta,
        previous_due.isAcceptableOrUnknown(
          data['previous_due']!,
          _previous_dueMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_previous_dueMeta);
    }
    if (data.containsKey('next_due')) {
      context.handle(
        _next_dueMeta,
        next_due.isAcceptableOrUnknown(data['next_due']!, _next_dueMeta),
      );
    } else if (isInserting) {
      context.missing(_next_dueMeta);
    }
    if (data.containsKey('scheduled_days')) {
      context.handle(
        _scheduled_daysMeta,
        scheduled_days.isAcceptableOrUnknown(
          data['scheduled_days']!,
          _scheduled_daysMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduled_daysMeta);
    }
    if (data.containsKey('is_overdue')) {
      context.handle(
        _is_overdueMeta,
        is_overdue.isAcceptableOrUnknown(data['is_overdue']!, _is_overdueMeta),
      );
    } else if (isInserting) {
      context.missing(_is_overdueMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _created_atMeta,
        created_at.isAcceptableOrUnknown(data['created_at']!, _created_atMeta),
      );
    } else if (isInserting) {
      context.missing(_created_atMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReviewRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReviewRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      study_item_id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}study_item_id'],
      )!,
      review_time: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}review_time'],
      )!,
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rating'],
      )!,
      response_time: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}response_time'],
      )!,
      previous_due: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}previous_due'],
      )!,
      next_due: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}next_due'],
      )!,
      scheduled_days: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}scheduled_days'],
      )!,
      is_overdue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_overdue'],
      )!,
      created_at: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ReviewRecordsTable createAlias(String alias) {
    return $ReviewRecordsTable(attachedDatabase, alias);
  }
}

class ReviewRecord extends DataClass implements Insertable<ReviewRecord> {
  /// 复习记录ID，主键
  final String id;

  /// 学习内容ID
  final String study_item_id;

  /// 复习时间，毫秒级时间戳
  final int review_time;

  /// 复习评价：Again / Hard / Good / Easy
  final String rating;

  /// 复习耗时
  final int response_time;

  /// 复习前到期时间，毫秒级时间戳
  final int previous_due;

  /// 复习后时间，毫秒级时间戳
  final int next_due;

  /// 本次计划间隔
  final int scheduled_days;

  /// 是否逾期
  final int is_overdue;

  /// 创建时间，毫秒级时间戳
  final int created_at;
  const ReviewRecord({
    required this.id,
    required this.study_item_id,
    required this.review_time,
    required this.rating,
    required this.response_time,
    required this.previous_due,
    required this.next_due,
    required this.scheduled_days,
    required this.is_overdue,
    required this.created_at,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['study_item_id'] = Variable<String>(study_item_id);
    map['review_time'] = Variable<int>(review_time);
    map['rating'] = Variable<String>(rating);
    map['response_time'] = Variable<int>(response_time);
    map['previous_due'] = Variable<int>(previous_due);
    map['next_due'] = Variable<int>(next_due);
    map['scheduled_days'] = Variable<int>(scheduled_days);
    map['is_overdue'] = Variable<int>(is_overdue);
    map['created_at'] = Variable<int>(created_at);
    return map;
  }

  ReviewRecordsCompanion toCompanion(bool nullToAbsent) {
    return ReviewRecordsCompanion(
      id: Value(id),
      study_item_id: Value(study_item_id),
      review_time: Value(review_time),
      rating: Value(rating),
      response_time: Value(response_time),
      previous_due: Value(previous_due),
      next_due: Value(next_due),
      scheduled_days: Value(scheduled_days),
      is_overdue: Value(is_overdue),
      created_at: Value(created_at),
    );
  }

  factory ReviewRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReviewRecord(
      id: serializer.fromJson<String>(json['id']),
      study_item_id: serializer.fromJson<String>(json['study_item_id']),
      review_time: serializer.fromJson<int>(json['review_time']),
      rating: serializer.fromJson<String>(json['rating']),
      response_time: serializer.fromJson<int>(json['response_time']),
      previous_due: serializer.fromJson<int>(json['previous_due']),
      next_due: serializer.fromJson<int>(json['next_due']),
      scheduled_days: serializer.fromJson<int>(json['scheduled_days']),
      is_overdue: serializer.fromJson<int>(json['is_overdue']),
      created_at: serializer.fromJson<int>(json['created_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'study_item_id': serializer.toJson<String>(study_item_id),
      'review_time': serializer.toJson<int>(review_time),
      'rating': serializer.toJson<String>(rating),
      'response_time': serializer.toJson<int>(response_time),
      'previous_due': serializer.toJson<int>(previous_due),
      'next_due': serializer.toJson<int>(next_due),
      'scheduled_days': serializer.toJson<int>(scheduled_days),
      'is_overdue': serializer.toJson<int>(is_overdue),
      'created_at': serializer.toJson<int>(created_at),
    };
  }

  ReviewRecord copyWith({
    String? id,
    String? study_item_id,
    int? review_time,
    String? rating,
    int? response_time,
    int? previous_due,
    int? next_due,
    int? scheduled_days,
    int? is_overdue,
    int? created_at,
  }) => ReviewRecord(
    id: id ?? this.id,
    study_item_id: study_item_id ?? this.study_item_id,
    review_time: review_time ?? this.review_time,
    rating: rating ?? this.rating,
    response_time: response_time ?? this.response_time,
    previous_due: previous_due ?? this.previous_due,
    next_due: next_due ?? this.next_due,
    scheduled_days: scheduled_days ?? this.scheduled_days,
    is_overdue: is_overdue ?? this.is_overdue,
    created_at: created_at ?? this.created_at,
  );
  ReviewRecord copyWithCompanion(ReviewRecordsCompanion data) {
    return ReviewRecord(
      id: data.id.present ? data.id.value : this.id,
      study_item_id: data.study_item_id.present
          ? data.study_item_id.value
          : this.study_item_id,
      review_time: data.review_time.present
          ? data.review_time.value
          : this.review_time,
      rating: data.rating.present ? data.rating.value : this.rating,
      response_time: data.response_time.present
          ? data.response_time.value
          : this.response_time,
      previous_due: data.previous_due.present
          ? data.previous_due.value
          : this.previous_due,
      next_due: data.next_due.present ? data.next_due.value : this.next_due,
      scheduled_days: data.scheduled_days.present
          ? data.scheduled_days.value
          : this.scheduled_days,
      is_overdue: data.is_overdue.present
          ? data.is_overdue.value
          : this.is_overdue,
      created_at: data.created_at.present
          ? data.created_at.value
          : this.created_at,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReviewRecord(')
          ..write('id: $id, ')
          ..write('study_item_id: $study_item_id, ')
          ..write('review_time: $review_time, ')
          ..write('rating: $rating, ')
          ..write('response_time: $response_time, ')
          ..write('previous_due: $previous_due, ')
          ..write('next_due: $next_due, ')
          ..write('scheduled_days: $scheduled_days, ')
          ..write('is_overdue: $is_overdue, ')
          ..write('created_at: $created_at')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    study_item_id,
    review_time,
    rating,
    response_time,
    previous_due,
    next_due,
    scheduled_days,
    is_overdue,
    created_at,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReviewRecord &&
          other.id == this.id &&
          other.study_item_id == this.study_item_id &&
          other.review_time == this.review_time &&
          other.rating == this.rating &&
          other.response_time == this.response_time &&
          other.previous_due == this.previous_due &&
          other.next_due == this.next_due &&
          other.scheduled_days == this.scheduled_days &&
          other.is_overdue == this.is_overdue &&
          other.created_at == this.created_at);
}

class ReviewRecordsCompanion extends UpdateCompanion<ReviewRecord> {
  final Value<String> id;
  final Value<String> study_item_id;
  final Value<int> review_time;
  final Value<String> rating;
  final Value<int> response_time;
  final Value<int> previous_due;
  final Value<int> next_due;
  final Value<int> scheduled_days;
  final Value<int> is_overdue;
  final Value<int> created_at;
  final Value<int> rowid;
  const ReviewRecordsCompanion({
    this.id = const Value.absent(),
    this.study_item_id = const Value.absent(),
    this.review_time = const Value.absent(),
    this.rating = const Value.absent(),
    this.response_time = const Value.absent(),
    this.previous_due = const Value.absent(),
    this.next_due = const Value.absent(),
    this.scheduled_days = const Value.absent(),
    this.is_overdue = const Value.absent(),
    this.created_at = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReviewRecordsCompanion.insert({
    required String id,
    required String study_item_id,
    required int review_time,
    required String rating,
    required int response_time,
    required int previous_due,
    required int next_due,
    required int scheduled_days,
    required int is_overdue,
    required int created_at,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       study_item_id = Value(study_item_id),
       review_time = Value(review_time),
       rating = Value(rating),
       response_time = Value(response_time),
       previous_due = Value(previous_due),
       next_due = Value(next_due),
       scheduled_days = Value(scheduled_days),
       is_overdue = Value(is_overdue),
       created_at = Value(created_at);
  static Insertable<ReviewRecord> custom({
    Expression<String>? id,
    Expression<String>? study_item_id,
    Expression<int>? review_time,
    Expression<String>? rating,
    Expression<int>? response_time,
    Expression<int>? previous_due,
    Expression<int>? next_due,
    Expression<int>? scheduled_days,
    Expression<int>? is_overdue,
    Expression<int>? created_at,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (study_item_id != null) 'study_item_id': study_item_id,
      if (review_time != null) 'review_time': review_time,
      if (rating != null) 'rating': rating,
      if (response_time != null) 'response_time': response_time,
      if (previous_due != null) 'previous_due': previous_due,
      if (next_due != null) 'next_due': next_due,
      if (scheduled_days != null) 'scheduled_days': scheduled_days,
      if (is_overdue != null) 'is_overdue': is_overdue,
      if (created_at != null) 'created_at': created_at,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReviewRecordsCompanion copyWith({
    Value<String>? id,
    Value<String>? study_item_id,
    Value<int>? review_time,
    Value<String>? rating,
    Value<int>? response_time,
    Value<int>? previous_due,
    Value<int>? next_due,
    Value<int>? scheduled_days,
    Value<int>? is_overdue,
    Value<int>? created_at,
    Value<int>? rowid,
  }) {
    return ReviewRecordsCompanion(
      id: id ?? this.id,
      study_item_id: study_item_id ?? this.study_item_id,
      review_time: review_time ?? this.review_time,
      rating: rating ?? this.rating,
      response_time: response_time ?? this.response_time,
      previous_due: previous_due ?? this.previous_due,
      next_due: next_due ?? this.next_due,
      scheduled_days: scheduled_days ?? this.scheduled_days,
      is_overdue: is_overdue ?? this.is_overdue,
      created_at: created_at ?? this.created_at,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (study_item_id.present) {
      map['study_item_id'] = Variable<String>(study_item_id.value);
    }
    if (review_time.present) {
      map['review_time'] = Variable<int>(review_time.value);
    }
    if (rating.present) {
      map['rating'] = Variable<String>(rating.value);
    }
    if (response_time.present) {
      map['response_time'] = Variable<int>(response_time.value);
    }
    if (previous_due.present) {
      map['previous_due'] = Variable<int>(previous_due.value);
    }
    if (next_due.present) {
      map['next_due'] = Variable<int>(next_due.value);
    }
    if (scheduled_days.present) {
      map['scheduled_days'] = Variable<int>(scheduled_days.value);
    }
    if (is_overdue.present) {
      map['is_overdue'] = Variable<int>(is_overdue.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<int>(created_at.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReviewRecordsCompanion(')
          ..write('id: $id, ')
          ..write('study_item_id: $study_item_id, ')
          ..write('review_time: $review_time, ')
          ..write('rating: $rating, ')
          ..write('response_time: $response_time, ')
          ..write('previous_due: $previous_due, ')
          ..write('next_due: $next_due, ')
          ..write('scheduled_days: $scheduled_days, ')
          ..write('is_overdue: $is_overdue, ')
          ..write('created_at: $created_at, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MistakeRecordsTable extends MistakeRecords
    with TableInfo<$MistakeRecordsTable, MistakeRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MistakeRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _study_item_idMeta = const VerificationMeta(
    'study_item_id',
  );
  @override
  late final GeneratedColumn<String> study_item_id = GeneratedColumn<String>(
    'study_item_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _first_marked_atMeta = const VerificationMeta(
    'first_marked_at',
  );
  @override
  late final GeneratedColumn<int> first_marked_at = GeneratedColumn<int>(
    'first_marked_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _last_error_atMeta = const VerificationMeta(
    'last_error_at',
  );
  @override
  late final GeneratedColumn<int> last_error_at = GeneratedColumn<int>(
    'last_error_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _error_countMeta = const VerificationMeta(
    'error_count',
  );
  @override
  late final GeneratedColumn<int> error_count = GeneratedColumn<int>(
    'error_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _last_error_reasonMeta = const VerificationMeta(
    'last_error_reason',
  );
  @override
  late final GeneratedColumn<String> last_error_reason =
      GeneratedColumn<String>(
        'last_error_reason',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _created_atMeta = const VerificationMeta(
    'created_at',
  );
  @override
  late final GeneratedColumn<int> created_at = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updated_atMeta = const VerificationMeta(
    'updated_at',
  );
  @override
  late final GeneratedColumn<int> updated_at = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    study_item_id,
    first_marked_at,
    last_error_at,
    error_count,
    last_error_reason,
    created_at,
    updated_at,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mistake_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<MistakeRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('study_item_id')) {
      context.handle(
        _study_item_idMeta,
        study_item_id.isAcceptableOrUnknown(
          data['study_item_id']!,
          _study_item_idMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_study_item_idMeta);
    }
    if (data.containsKey('first_marked_at')) {
      context.handle(
        _first_marked_atMeta,
        first_marked_at.isAcceptableOrUnknown(
          data['first_marked_at']!,
          _first_marked_atMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_first_marked_atMeta);
    }
    if (data.containsKey('last_error_at')) {
      context.handle(
        _last_error_atMeta,
        last_error_at.isAcceptableOrUnknown(
          data['last_error_at']!,
          _last_error_atMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_last_error_atMeta);
    }
    if (data.containsKey('error_count')) {
      context.handle(
        _error_countMeta,
        error_count.isAcceptableOrUnknown(
          data['error_count']!,
          _error_countMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_error_countMeta);
    }
    if (data.containsKey('last_error_reason')) {
      context.handle(
        _last_error_reasonMeta,
        last_error_reason.isAcceptableOrUnknown(
          data['last_error_reason']!,
          _last_error_reasonMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _created_atMeta,
        created_at.isAcceptableOrUnknown(data['created_at']!, _created_atMeta),
      );
    } else if (isInserting) {
      context.missing(_created_atMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updated_atMeta,
        updated_at.isAcceptableOrUnknown(data['updated_at']!, _updated_atMeta),
      );
    } else if (isInserting) {
      context.missing(_updated_atMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MistakeRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MistakeRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      study_item_id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}study_item_id'],
      )!,
      first_marked_at: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}first_marked_at'],
      )!,
      last_error_at: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_error_at'],
      )!,
      error_count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}error_count'],
      )!,
      last_error_reason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_error_reason'],
      ),
      created_at: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updated_at: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $MistakeRecordsTable createAlias(String alias) {
    return $MistakeRecordsTable(attachedDatabase, alias);
  }
}

class MistakeRecord extends DataClass implements Insertable<MistakeRecord> {
  /// 错题记录ID，主键
  final String id;

  /// 学习内容ID
  final String study_item_id;

  /// 首次标记时间，毫秒级时间戳
  final int first_marked_at;

  /// 最近错误时间，毫秒级时间戳
  final int last_error_at;

  /// 历史错误次数
  final int error_count;

  /// 最近错误原因摘要；尚未填写过错误原因时为空
  final String? last_error_reason;

  /// 创建时间，毫秒级时间戳
  final int created_at;

  /// 修改时间，毫秒级时间戳
  final int updated_at;
  const MistakeRecord({
    required this.id,
    required this.study_item_id,
    required this.first_marked_at,
    required this.last_error_at,
    required this.error_count,
    this.last_error_reason,
    required this.created_at,
    required this.updated_at,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['study_item_id'] = Variable<String>(study_item_id);
    map['first_marked_at'] = Variable<int>(first_marked_at);
    map['last_error_at'] = Variable<int>(last_error_at);
    map['error_count'] = Variable<int>(error_count);
    if (!nullToAbsent || last_error_reason != null) {
      map['last_error_reason'] = Variable<String>(last_error_reason);
    }
    map['created_at'] = Variable<int>(created_at);
    map['updated_at'] = Variable<int>(updated_at);
    return map;
  }

  MistakeRecordsCompanion toCompanion(bool nullToAbsent) {
    return MistakeRecordsCompanion(
      id: Value(id),
      study_item_id: Value(study_item_id),
      first_marked_at: Value(first_marked_at),
      last_error_at: Value(last_error_at),
      error_count: Value(error_count),
      last_error_reason: last_error_reason == null && nullToAbsent
          ? const Value.absent()
          : Value(last_error_reason),
      created_at: Value(created_at),
      updated_at: Value(updated_at),
    );
  }

  factory MistakeRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MistakeRecord(
      id: serializer.fromJson<String>(json['id']),
      study_item_id: serializer.fromJson<String>(json['study_item_id']),
      first_marked_at: serializer.fromJson<int>(json['first_marked_at']),
      last_error_at: serializer.fromJson<int>(json['last_error_at']),
      error_count: serializer.fromJson<int>(json['error_count']),
      last_error_reason: serializer.fromJson<String?>(
        json['last_error_reason'],
      ),
      created_at: serializer.fromJson<int>(json['created_at']),
      updated_at: serializer.fromJson<int>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'study_item_id': serializer.toJson<String>(study_item_id),
      'first_marked_at': serializer.toJson<int>(first_marked_at),
      'last_error_at': serializer.toJson<int>(last_error_at),
      'error_count': serializer.toJson<int>(error_count),
      'last_error_reason': serializer.toJson<String?>(last_error_reason),
      'created_at': serializer.toJson<int>(created_at),
      'updated_at': serializer.toJson<int>(updated_at),
    };
  }

  MistakeRecord copyWith({
    String? id,
    String? study_item_id,
    int? first_marked_at,
    int? last_error_at,
    int? error_count,
    Value<String?> last_error_reason = const Value.absent(),
    int? created_at,
    int? updated_at,
  }) => MistakeRecord(
    id: id ?? this.id,
    study_item_id: study_item_id ?? this.study_item_id,
    first_marked_at: first_marked_at ?? this.first_marked_at,
    last_error_at: last_error_at ?? this.last_error_at,
    error_count: error_count ?? this.error_count,
    last_error_reason: last_error_reason.present
        ? last_error_reason.value
        : this.last_error_reason,
    created_at: created_at ?? this.created_at,
    updated_at: updated_at ?? this.updated_at,
  );
  MistakeRecord copyWithCompanion(MistakeRecordsCompanion data) {
    return MistakeRecord(
      id: data.id.present ? data.id.value : this.id,
      study_item_id: data.study_item_id.present
          ? data.study_item_id.value
          : this.study_item_id,
      first_marked_at: data.first_marked_at.present
          ? data.first_marked_at.value
          : this.first_marked_at,
      last_error_at: data.last_error_at.present
          ? data.last_error_at.value
          : this.last_error_at,
      error_count: data.error_count.present
          ? data.error_count.value
          : this.error_count,
      last_error_reason: data.last_error_reason.present
          ? data.last_error_reason.value
          : this.last_error_reason,
      created_at: data.created_at.present
          ? data.created_at.value
          : this.created_at,
      updated_at: data.updated_at.present
          ? data.updated_at.value
          : this.updated_at,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MistakeRecord(')
          ..write('id: $id, ')
          ..write('study_item_id: $study_item_id, ')
          ..write('first_marked_at: $first_marked_at, ')
          ..write('last_error_at: $last_error_at, ')
          ..write('error_count: $error_count, ')
          ..write('last_error_reason: $last_error_reason, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    study_item_id,
    first_marked_at,
    last_error_at,
    error_count,
    last_error_reason,
    created_at,
    updated_at,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MistakeRecord &&
          other.id == this.id &&
          other.study_item_id == this.study_item_id &&
          other.first_marked_at == this.first_marked_at &&
          other.last_error_at == this.last_error_at &&
          other.error_count == this.error_count &&
          other.last_error_reason == this.last_error_reason &&
          other.created_at == this.created_at &&
          other.updated_at == this.updated_at);
}

class MistakeRecordsCompanion extends UpdateCompanion<MistakeRecord> {
  final Value<String> id;
  final Value<String> study_item_id;
  final Value<int> first_marked_at;
  final Value<int> last_error_at;
  final Value<int> error_count;
  final Value<String?> last_error_reason;
  final Value<int> created_at;
  final Value<int> updated_at;
  final Value<int> rowid;
  const MistakeRecordsCompanion({
    this.id = const Value.absent(),
    this.study_item_id = const Value.absent(),
    this.first_marked_at = const Value.absent(),
    this.last_error_at = const Value.absent(),
    this.error_count = const Value.absent(),
    this.last_error_reason = const Value.absent(),
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MistakeRecordsCompanion.insert({
    required String id,
    required String study_item_id,
    required int first_marked_at,
    required int last_error_at,
    required int error_count,
    this.last_error_reason = const Value.absent(),
    required int created_at,
    required int updated_at,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       study_item_id = Value(study_item_id),
       first_marked_at = Value(first_marked_at),
       last_error_at = Value(last_error_at),
       error_count = Value(error_count),
       created_at = Value(created_at),
       updated_at = Value(updated_at);
  static Insertable<MistakeRecord> custom({
    Expression<String>? id,
    Expression<String>? study_item_id,
    Expression<int>? first_marked_at,
    Expression<int>? last_error_at,
    Expression<int>? error_count,
    Expression<String>? last_error_reason,
    Expression<int>? created_at,
    Expression<int>? updated_at,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (study_item_id != null) 'study_item_id': study_item_id,
      if (first_marked_at != null) 'first_marked_at': first_marked_at,
      if (last_error_at != null) 'last_error_at': last_error_at,
      if (error_count != null) 'error_count': error_count,
      if (last_error_reason != null) 'last_error_reason': last_error_reason,
      if (created_at != null) 'created_at': created_at,
      if (updated_at != null) 'updated_at': updated_at,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MistakeRecordsCompanion copyWith({
    Value<String>? id,
    Value<String>? study_item_id,
    Value<int>? first_marked_at,
    Value<int>? last_error_at,
    Value<int>? error_count,
    Value<String?>? last_error_reason,
    Value<int>? created_at,
    Value<int>? updated_at,
    Value<int>? rowid,
  }) {
    return MistakeRecordsCompanion(
      id: id ?? this.id,
      study_item_id: study_item_id ?? this.study_item_id,
      first_marked_at: first_marked_at ?? this.first_marked_at,
      last_error_at: last_error_at ?? this.last_error_at,
      error_count: error_count ?? this.error_count,
      last_error_reason: last_error_reason ?? this.last_error_reason,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (study_item_id.present) {
      map['study_item_id'] = Variable<String>(study_item_id.value);
    }
    if (first_marked_at.present) {
      map['first_marked_at'] = Variable<int>(first_marked_at.value);
    }
    if (last_error_at.present) {
      map['last_error_at'] = Variable<int>(last_error_at.value);
    }
    if (error_count.present) {
      map['error_count'] = Variable<int>(error_count.value);
    }
    if (last_error_reason.present) {
      map['last_error_reason'] = Variable<String>(last_error_reason.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<int>(created_at.value);
    }
    if (updated_at.present) {
      map['updated_at'] = Variable<int>(updated_at.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MistakeRecordsCompanion(')
          ..write('id: $id, ')
          ..write('study_item_id: $study_item_id, ')
          ..write('first_marked_at: $first_marked_at, ')
          ..write('last_error_at: $last_error_at, ')
          ..write('error_count: $error_count, ')
          ..write('last_error_reason: $last_error_reason, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MistakeReasonsTable extends MistakeReasons
    with TableInfo<$MistakeReasonsTable, MistakeReason> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MistakeReasonsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sort_orderMeta = const VerificationMeta(
    'sort_order',
  );
  @override
  late final GeneratedColumn<int> sort_order = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _is_defaultMeta = const VerificationMeta(
    'is_default',
  );
  @override
  late final GeneratedColumn<int> is_default = GeneratedColumn<int>(
    'is_default',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _created_atMeta = const VerificationMeta(
    'created_at',
  );
  @override
  late final GeneratedColumn<int> created_at = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    sort_order,
    is_default,
    created_at,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mistake_reasons';
  @override
  VerificationContext validateIntegrity(
    Insertable<MistakeReason> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sort_orderMeta,
        sort_order.isAcceptableOrUnknown(data['sort_order']!, _sort_orderMeta),
      );
    } else if (isInserting) {
      context.missing(_sort_orderMeta);
    }
    if (data.containsKey('is_default')) {
      context.handle(
        _is_defaultMeta,
        is_default.isAcceptableOrUnknown(data['is_default']!, _is_defaultMeta),
      );
    } else if (isInserting) {
      context.missing(_is_defaultMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _created_atMeta,
        created_at.isAcceptableOrUnknown(data['created_at']!, _created_atMeta),
      );
    } else if (isInserting) {
      context.missing(_created_atMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MistakeReason map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MistakeReason(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      sort_order: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      is_default: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_default'],
      )!,
      created_at: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $MistakeReasonsTable createAlias(String alias) {
    return $MistakeReasonsTable(attachedDatabase, alias);
  }
}

class MistakeReason extends DataClass implements Insertable<MistakeReason> {
  /// 原因ID，主键
  final String id;

  /// 原因名称
  final String name;

  /// 显示顺序
  final int sort_order;

  /// 是否默认原因
  final int is_default;

  /// 创建时间，毫秒级时间戳
  final int created_at;
  const MistakeReason({
    required this.id,
    required this.name,
    required this.sort_order,
    required this.is_default,
    required this.created_at,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['sort_order'] = Variable<int>(sort_order);
    map['is_default'] = Variable<int>(is_default);
    map['created_at'] = Variable<int>(created_at);
    return map;
  }

  MistakeReasonsCompanion toCompanion(bool nullToAbsent) {
    return MistakeReasonsCompanion(
      id: Value(id),
      name: Value(name),
      sort_order: Value(sort_order),
      is_default: Value(is_default),
      created_at: Value(created_at),
    );
  }

  factory MistakeReason.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MistakeReason(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      sort_order: serializer.fromJson<int>(json['sort_order']),
      is_default: serializer.fromJson<int>(json['is_default']),
      created_at: serializer.fromJson<int>(json['created_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'sort_order': serializer.toJson<int>(sort_order),
      'is_default': serializer.toJson<int>(is_default),
      'created_at': serializer.toJson<int>(created_at),
    };
  }

  MistakeReason copyWith({
    String? id,
    String? name,
    int? sort_order,
    int? is_default,
    int? created_at,
  }) => MistakeReason(
    id: id ?? this.id,
    name: name ?? this.name,
    sort_order: sort_order ?? this.sort_order,
    is_default: is_default ?? this.is_default,
    created_at: created_at ?? this.created_at,
  );
  MistakeReason copyWithCompanion(MistakeReasonsCompanion data) {
    return MistakeReason(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      sort_order: data.sort_order.present
          ? data.sort_order.value
          : this.sort_order,
      is_default: data.is_default.present
          ? data.is_default.value
          : this.is_default,
      created_at: data.created_at.present
          ? data.created_at.value
          : this.created_at,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MistakeReason(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sort_order: $sort_order, ')
          ..write('is_default: $is_default, ')
          ..write('created_at: $created_at')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, sort_order, is_default, created_at);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MistakeReason &&
          other.id == this.id &&
          other.name == this.name &&
          other.sort_order == this.sort_order &&
          other.is_default == this.is_default &&
          other.created_at == this.created_at);
}

class MistakeReasonsCompanion extends UpdateCompanion<MistakeReason> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> sort_order;
  final Value<int> is_default;
  final Value<int> created_at;
  final Value<int> rowid;
  const MistakeReasonsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.sort_order = const Value.absent(),
    this.is_default = const Value.absent(),
    this.created_at = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MistakeReasonsCompanion.insert({
    required String id,
    required String name,
    required int sort_order,
    required int is_default,
    required int created_at,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       sort_order = Value(sort_order),
       is_default = Value(is_default),
       created_at = Value(created_at);
  static Insertable<MistakeReason> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? sort_order,
    Expression<int>? is_default,
    Expression<int>? created_at,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (sort_order != null) 'sort_order': sort_order,
      if (is_default != null) 'is_default': is_default,
      if (created_at != null) 'created_at': created_at,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MistakeReasonsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? sort_order,
    Value<int>? is_default,
    Value<int>? created_at,
    Value<int>? rowid,
  }) {
    return MistakeReasonsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      sort_order: sort_order ?? this.sort_order,
      is_default: is_default ?? this.is_default,
      created_at: created_at ?? this.created_at,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (sort_order.present) {
      map['sort_order'] = Variable<int>(sort_order.value);
    }
    if (is_default.present) {
      map['is_default'] = Variable<int>(is_default.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<int>(created_at.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MistakeReasonsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sort_order: $sort_order, ')
          ..write('is_default: $is_default, ')
          ..write('created_at: $created_at, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MistakeRecordReasonsTable extends MistakeRecordReasons
    with TableInfo<$MistakeRecordReasonsTable, MistakeRecordReason> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MistakeRecordReasonsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _mistake_record_idMeta = const VerificationMeta(
    'mistake_record_id',
  );
  @override
  late final GeneratedColumn<String> mistake_record_id =
      GeneratedColumn<String>(
        'mistake_record_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _reason_idMeta = const VerificationMeta(
    'reason_id',
  );
  @override
  late final GeneratedColumn<String> reason_id = GeneratedColumn<String>(
    'reason_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [mistake_record_id, reason_id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mistake_record_reasons';
  @override
  VerificationContext validateIntegrity(
    Insertable<MistakeRecordReason> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('mistake_record_id')) {
      context.handle(
        _mistake_record_idMeta,
        mistake_record_id.isAcceptableOrUnknown(
          data['mistake_record_id']!,
          _mistake_record_idMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_mistake_record_idMeta);
    }
    if (data.containsKey('reason_id')) {
      context.handle(
        _reason_idMeta,
        reason_id.isAcceptableOrUnknown(data['reason_id']!, _reason_idMeta),
      );
    } else if (isInserting) {
      context.missing(_reason_idMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {mistake_record_id, reason_id};
  @override
  MistakeRecordReason map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MistakeRecordReason(
      mistake_record_id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mistake_record_id'],
      )!,
      reason_id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reason_id'],
      )!,
    );
  }

  @override
  $MistakeRecordReasonsTable createAlias(String alias) {
    return $MistakeRecordReasonsTable(attachedDatabase, alias);
  }
}

class MistakeRecordReason extends DataClass
    implements Insertable<MistakeRecordReason> {
  /// 错误记录ID
  final String mistake_record_id;

  /// 错误原因ID
  final String reason_id;
  const MistakeRecordReason({
    required this.mistake_record_id,
    required this.reason_id,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['mistake_record_id'] = Variable<String>(mistake_record_id);
    map['reason_id'] = Variable<String>(reason_id);
    return map;
  }

  MistakeRecordReasonsCompanion toCompanion(bool nullToAbsent) {
    return MistakeRecordReasonsCompanion(
      mistake_record_id: Value(mistake_record_id),
      reason_id: Value(reason_id),
    );
  }

  factory MistakeRecordReason.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MistakeRecordReason(
      mistake_record_id: serializer.fromJson<String>(json['mistake_record_id']),
      reason_id: serializer.fromJson<String>(json['reason_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mistake_record_id': serializer.toJson<String>(mistake_record_id),
      'reason_id': serializer.toJson<String>(reason_id),
    };
  }

  MistakeRecordReason copyWith({
    String? mistake_record_id,
    String? reason_id,
  }) => MistakeRecordReason(
    mistake_record_id: mistake_record_id ?? this.mistake_record_id,
    reason_id: reason_id ?? this.reason_id,
  );
  MistakeRecordReason copyWithCompanion(MistakeRecordReasonsCompanion data) {
    return MistakeRecordReason(
      mistake_record_id: data.mistake_record_id.present
          ? data.mistake_record_id.value
          : this.mistake_record_id,
      reason_id: data.reason_id.present ? data.reason_id.value : this.reason_id,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MistakeRecordReason(')
          ..write('mistake_record_id: $mistake_record_id, ')
          ..write('reason_id: $reason_id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(mistake_record_id, reason_id);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MistakeRecordReason &&
          other.mistake_record_id == this.mistake_record_id &&
          other.reason_id == this.reason_id);
}

class MistakeRecordReasonsCompanion
    extends UpdateCompanion<MistakeRecordReason> {
  final Value<String> mistake_record_id;
  final Value<String> reason_id;
  final Value<int> rowid;
  const MistakeRecordReasonsCompanion({
    this.mistake_record_id = const Value.absent(),
    this.reason_id = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MistakeRecordReasonsCompanion.insert({
    required String mistake_record_id,
    required String reason_id,
    this.rowid = const Value.absent(),
  }) : mistake_record_id = Value(mistake_record_id),
       reason_id = Value(reason_id);
  static Insertable<MistakeRecordReason> custom({
    Expression<String>? mistake_record_id,
    Expression<String>? reason_id,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (mistake_record_id != null) 'mistake_record_id': mistake_record_id,
      if (reason_id != null) 'reason_id': reason_id,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MistakeRecordReasonsCompanion copyWith({
    Value<String>? mistake_record_id,
    Value<String>? reason_id,
    Value<int>? rowid,
  }) {
    return MistakeRecordReasonsCompanion(
      mistake_record_id: mistake_record_id ?? this.mistake_record_id,
      reason_id: reason_id ?? this.reason_id,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mistake_record_id.present) {
      map['mistake_record_id'] = Variable<String>(mistake_record_id.value);
    }
    if (reason_id.present) {
      map['reason_id'] = Variable<String>(reason_id.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MistakeRecordReasonsCompanion(')
          ..write('mistake_record_id: $mistake_record_id, ')
          ..write('reason_id: $reason_id, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PracticePlansTable extends PracticePlans
    with TableInfo<$PracticePlansTable, PracticePlan> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PracticePlansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _filter_configMeta = const VerificationMeta(
    'filter_config',
  );
  @override
  late final GeneratedColumn<String> filter_config = GeneratedColumn<String>(
    'filter_config',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _question_countMeta = const VerificationMeta(
    'question_count',
  );
  @override
  late final GeneratedColumn<int> question_count = GeneratedColumn<int>(
    'question_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sort_typeMeta = const VerificationMeta(
    'sort_type',
  );
  @override
  late final GeneratedColumn<String> sort_type = GeneratedColumn<String>(
    'sort_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _created_atMeta = const VerificationMeta(
    'created_at',
  );
  @override
  late final GeneratedColumn<int> created_at = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updated_atMeta = const VerificationMeta(
    'updated_at',
  );
  @override
  late final GeneratedColumn<int> updated_at = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    filter_config,
    question_count,
    sort_type,
    created_at,
    updated_at,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'practice_plans';
  @override
  VerificationContext validateIntegrity(
    Insertable<PracticePlan> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('filter_config')) {
      context.handle(
        _filter_configMeta,
        filter_config.isAcceptableOrUnknown(
          data['filter_config']!,
          _filter_configMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_filter_configMeta);
    }
    if (data.containsKey('question_count')) {
      context.handle(
        _question_countMeta,
        question_count.isAcceptableOrUnknown(
          data['question_count']!,
          _question_countMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_question_countMeta);
    }
    if (data.containsKey('sort_type')) {
      context.handle(
        _sort_typeMeta,
        sort_type.isAcceptableOrUnknown(data['sort_type']!, _sort_typeMeta),
      );
    } else if (isInserting) {
      context.missing(_sort_typeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _created_atMeta,
        created_at.isAcceptableOrUnknown(data['created_at']!, _created_atMeta),
      );
    } else if (isInserting) {
      context.missing(_created_atMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updated_atMeta,
        updated_at.isAcceptableOrUnknown(data['updated_at']!, _updated_atMeta),
      );
    } else if (isInserting) {
      context.missing(_updated_atMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PracticePlan map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PracticePlan(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      filter_config: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}filter_config'],
      )!,
      question_count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}question_count'],
      )!,
      sort_type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sort_type'],
      )!,
      created_at: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updated_at: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $PracticePlansTable createAlias(String alias) {
    return $PracticePlansTable(attachedDatabase, alias);
  }
}

class PracticePlan extends DataClass implements Insertable<PracticePlan> {
  /// 方案ID，主键
  final String id;

  /// 方案名称
  final String name;

  /// JSON格式筛选条件
  final String filter_config;

  /// 刷题数量
  final int question_count;

  /// 排序方式
  final String sort_type;

  /// 创建时间，毫秒级时间戳
  final int created_at;

  /// 修改时间，毫秒级时间戳
  final int updated_at;
  const PracticePlan({
    required this.id,
    required this.name,
    required this.filter_config,
    required this.question_count,
    required this.sort_type,
    required this.created_at,
    required this.updated_at,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['filter_config'] = Variable<String>(filter_config);
    map['question_count'] = Variable<int>(question_count);
    map['sort_type'] = Variable<String>(sort_type);
    map['created_at'] = Variable<int>(created_at);
    map['updated_at'] = Variable<int>(updated_at);
    return map;
  }

  PracticePlansCompanion toCompanion(bool nullToAbsent) {
    return PracticePlansCompanion(
      id: Value(id),
      name: Value(name),
      filter_config: Value(filter_config),
      question_count: Value(question_count),
      sort_type: Value(sort_type),
      created_at: Value(created_at),
      updated_at: Value(updated_at),
    );
  }

  factory PracticePlan.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PracticePlan(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      filter_config: serializer.fromJson<String>(json['filter_config']),
      question_count: serializer.fromJson<int>(json['question_count']),
      sort_type: serializer.fromJson<String>(json['sort_type']),
      created_at: serializer.fromJson<int>(json['created_at']),
      updated_at: serializer.fromJson<int>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'filter_config': serializer.toJson<String>(filter_config),
      'question_count': serializer.toJson<int>(question_count),
      'sort_type': serializer.toJson<String>(sort_type),
      'created_at': serializer.toJson<int>(created_at),
      'updated_at': serializer.toJson<int>(updated_at),
    };
  }

  PracticePlan copyWith({
    String? id,
    String? name,
    String? filter_config,
    int? question_count,
    String? sort_type,
    int? created_at,
    int? updated_at,
  }) => PracticePlan(
    id: id ?? this.id,
    name: name ?? this.name,
    filter_config: filter_config ?? this.filter_config,
    question_count: question_count ?? this.question_count,
    sort_type: sort_type ?? this.sort_type,
    created_at: created_at ?? this.created_at,
    updated_at: updated_at ?? this.updated_at,
  );
  PracticePlan copyWithCompanion(PracticePlansCompanion data) {
    return PracticePlan(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      filter_config: data.filter_config.present
          ? data.filter_config.value
          : this.filter_config,
      question_count: data.question_count.present
          ? data.question_count.value
          : this.question_count,
      sort_type: data.sort_type.present ? data.sort_type.value : this.sort_type,
      created_at: data.created_at.present
          ? data.created_at.value
          : this.created_at,
      updated_at: data.updated_at.present
          ? data.updated_at.value
          : this.updated_at,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PracticePlan(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('filter_config: $filter_config, ')
          ..write('question_count: $question_count, ')
          ..write('sort_type: $sort_type, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    filter_config,
    question_count,
    sort_type,
    created_at,
    updated_at,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PracticePlan &&
          other.id == this.id &&
          other.name == this.name &&
          other.filter_config == this.filter_config &&
          other.question_count == this.question_count &&
          other.sort_type == this.sort_type &&
          other.created_at == this.created_at &&
          other.updated_at == this.updated_at);
}

class PracticePlansCompanion extends UpdateCompanion<PracticePlan> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> filter_config;
  final Value<int> question_count;
  final Value<String> sort_type;
  final Value<int> created_at;
  final Value<int> updated_at;
  final Value<int> rowid;
  const PracticePlansCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.filter_config = const Value.absent(),
    this.question_count = const Value.absent(),
    this.sort_type = const Value.absent(),
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PracticePlansCompanion.insert({
    required String id,
    required String name,
    required String filter_config,
    required int question_count,
    required String sort_type,
    required int created_at,
    required int updated_at,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       filter_config = Value(filter_config),
       question_count = Value(question_count),
       sort_type = Value(sort_type),
       created_at = Value(created_at),
       updated_at = Value(updated_at);
  static Insertable<PracticePlan> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? filter_config,
    Expression<int>? question_count,
    Expression<String>? sort_type,
    Expression<int>? created_at,
    Expression<int>? updated_at,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (filter_config != null) 'filter_config': filter_config,
      if (question_count != null) 'question_count': question_count,
      if (sort_type != null) 'sort_type': sort_type,
      if (created_at != null) 'created_at': created_at,
      if (updated_at != null) 'updated_at': updated_at,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PracticePlansCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? filter_config,
    Value<int>? question_count,
    Value<String>? sort_type,
    Value<int>? created_at,
    Value<int>? updated_at,
    Value<int>? rowid,
  }) {
    return PracticePlansCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      filter_config: filter_config ?? this.filter_config,
      question_count: question_count ?? this.question_count,
      sort_type: sort_type ?? this.sort_type,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (filter_config.present) {
      map['filter_config'] = Variable<String>(filter_config.value);
    }
    if (question_count.present) {
      map['question_count'] = Variable<int>(question_count.value);
    }
    if (sort_type.present) {
      map['sort_type'] = Variable<String>(sort_type.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<int>(created_at.value);
    }
    if (updated_at.present) {
      map['updated_at'] = Variable<int>(updated_at.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PracticePlansCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('filter_config: $filter_config, ')
          ..write('question_count: $question_count, ')
          ..write('sort_type: $sort_type, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PracticeSessionsTable extends PracticeSessions
    with TableInfo<$PracticeSessionsTable, PracticeSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PracticeSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _plan_idMeta = const VerificationMeta(
    'plan_id',
  );
  @override
  late final GeneratedColumn<String> plan_id = GeneratedColumn<String>(
    'plan_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _started_atMeta = const VerificationMeta(
    'started_at',
  );
  @override
  late final GeneratedColumn<int> started_at = GeneratedColumn<int>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _finished_atMeta = const VerificationMeta(
    'finished_at',
  );
  @override
  late final GeneratedColumn<int> finished_at = GeneratedColumn<int>(
    'finished_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _total_countMeta = const VerificationMeta(
    'total_count',
  );
  @override
  late final GeneratedColumn<int> total_count = GeneratedColumn<int>(
    'total_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _correct_countMeta = const VerificationMeta(
    'correct_count',
  );
  @override
  late final GeneratedColumn<int> correct_count = GeneratedColumn<int>(
    'correct_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wrong_countMeta = const VerificationMeta(
    'wrong_count',
  );
  @override
  late final GeneratedColumn<int> wrong_count = GeneratedColumn<int>(
    'wrong_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _skipped_countMeta = const VerificationMeta(
    'skipped_count',
  );
  @override
  late final GeneratedColumn<int> skipped_count = GeneratedColumn<int>(
    'skipped_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hesitated_countMeta = const VerificationMeta(
    'hesitated_count',
  );
  @override
  late final GeneratedColumn<int> hesitated_count = GeneratedColumn<int>(
    'hesitated_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _total_timeMeta = const VerificationMeta(
    'total_time',
  );
  @override
  late final GeneratedColumn<int> total_time = GeneratedColumn<int>(
    'total_time',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _average_timeMeta = const VerificationMeta(
    'average_time',
  );
  @override
  late final GeneratedColumn<double> average_time = GeneratedColumn<double>(
    'average_time',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _count_as_reviewMeta = const VerificationMeta(
    'count_as_review',
  );
  @override
  late final GeneratedColumn<int> count_as_review = GeneratedColumn<int>(
    'count_as_review',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _created_atMeta = const VerificationMeta(
    'created_at',
  );
  @override
  late final GeneratedColumn<int> created_at = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    plan_id,
    started_at,
    finished_at,
    total_count,
    correct_count,
    wrong_count,
    skipped_count,
    hesitated_count,
    total_time,
    average_time,
    count_as_review,
    created_at,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'practice_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<PracticeSession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('plan_id')) {
      context.handle(
        _plan_idMeta,
        plan_id.isAcceptableOrUnknown(data['plan_id']!, _plan_idMeta),
      );
    } else if (isInserting) {
      context.missing(_plan_idMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _started_atMeta,
        started_at.isAcceptableOrUnknown(data['started_at']!, _started_atMeta),
      );
    } else if (isInserting) {
      context.missing(_started_atMeta);
    }
    if (data.containsKey('finished_at')) {
      context.handle(
        _finished_atMeta,
        finished_at.isAcceptableOrUnknown(
          data['finished_at']!,
          _finished_atMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_finished_atMeta);
    }
    if (data.containsKey('total_count')) {
      context.handle(
        _total_countMeta,
        total_count.isAcceptableOrUnknown(
          data['total_count']!,
          _total_countMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_total_countMeta);
    }
    if (data.containsKey('correct_count')) {
      context.handle(
        _correct_countMeta,
        correct_count.isAcceptableOrUnknown(
          data['correct_count']!,
          _correct_countMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_correct_countMeta);
    }
    if (data.containsKey('wrong_count')) {
      context.handle(
        _wrong_countMeta,
        wrong_count.isAcceptableOrUnknown(
          data['wrong_count']!,
          _wrong_countMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_wrong_countMeta);
    }
    if (data.containsKey('skipped_count')) {
      context.handle(
        _skipped_countMeta,
        skipped_count.isAcceptableOrUnknown(
          data['skipped_count']!,
          _skipped_countMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_skipped_countMeta);
    }
    if (data.containsKey('hesitated_count')) {
      context.handle(
        _hesitated_countMeta,
        hesitated_count.isAcceptableOrUnknown(
          data['hesitated_count']!,
          _hesitated_countMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_hesitated_countMeta);
    }
    if (data.containsKey('total_time')) {
      context.handle(
        _total_timeMeta,
        total_time.isAcceptableOrUnknown(data['total_time']!, _total_timeMeta),
      );
    } else if (isInserting) {
      context.missing(_total_timeMeta);
    }
    if (data.containsKey('average_time')) {
      context.handle(
        _average_timeMeta,
        average_time.isAcceptableOrUnknown(
          data['average_time']!,
          _average_timeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_average_timeMeta);
    }
    if (data.containsKey('count_as_review')) {
      context.handle(
        _count_as_reviewMeta,
        count_as_review.isAcceptableOrUnknown(
          data['count_as_review']!,
          _count_as_reviewMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_count_as_reviewMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _created_atMeta,
        created_at.isAcceptableOrUnknown(data['created_at']!, _created_atMeta),
      );
    } else if (isInserting) {
      context.missing(_created_atMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PracticeSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PracticeSession(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      plan_id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}plan_id'],
      )!,
      started_at: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}started_at'],
      )!,
      finished_at: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}finished_at'],
      )!,
      total_count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_count'],
      )!,
      correct_count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}correct_count'],
      )!,
      wrong_count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}wrong_count'],
      )!,
      skipped_count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}skipped_count'],
      )!,
      hesitated_count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hesitated_count'],
      )!,
      total_time: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_time'],
      )!,
      average_time: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}average_time'],
      )!,
      count_as_review: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}count_as_review'],
      )!,
      created_at: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PracticeSessionsTable createAlias(String alias) {
    return $PracticeSessionsTable(attachedDatabase, alias);
  }
}

class PracticeSession extends DataClass implements Insertable<PracticeSession> {
  /// 刷题活动ID，主键
  final String id;

  /// 使用的方案
  final String plan_id;

  /// 开始时间，毫秒级时间戳
  final int started_at;

  /// 结束时间，毫秒级时间戳
  final int finished_at;

  /// 总题数
  final int total_count;

  /// 正确数量
  final int correct_count;

  /// 错误数量
  final int wrong_count;

  /// 跳过数量
  final int skipped_count;

  /// 困难/犹豫数量
  final int hesitated_count;

  /// 总耗时
  final int total_time;

  /// 平均每题耗时
  final double average_time;

  /// 是否计入复习系统
  final int count_as_review;

  /// 创建时间，毫秒级时间戳
  final int created_at;
  const PracticeSession({
    required this.id,
    required this.plan_id,
    required this.started_at,
    required this.finished_at,
    required this.total_count,
    required this.correct_count,
    required this.wrong_count,
    required this.skipped_count,
    required this.hesitated_count,
    required this.total_time,
    required this.average_time,
    required this.count_as_review,
    required this.created_at,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['plan_id'] = Variable<String>(plan_id);
    map['started_at'] = Variable<int>(started_at);
    map['finished_at'] = Variable<int>(finished_at);
    map['total_count'] = Variable<int>(total_count);
    map['correct_count'] = Variable<int>(correct_count);
    map['wrong_count'] = Variable<int>(wrong_count);
    map['skipped_count'] = Variable<int>(skipped_count);
    map['hesitated_count'] = Variable<int>(hesitated_count);
    map['total_time'] = Variable<int>(total_time);
    map['average_time'] = Variable<double>(average_time);
    map['count_as_review'] = Variable<int>(count_as_review);
    map['created_at'] = Variable<int>(created_at);
    return map;
  }

  PracticeSessionsCompanion toCompanion(bool nullToAbsent) {
    return PracticeSessionsCompanion(
      id: Value(id),
      plan_id: Value(plan_id),
      started_at: Value(started_at),
      finished_at: Value(finished_at),
      total_count: Value(total_count),
      correct_count: Value(correct_count),
      wrong_count: Value(wrong_count),
      skipped_count: Value(skipped_count),
      hesitated_count: Value(hesitated_count),
      total_time: Value(total_time),
      average_time: Value(average_time),
      count_as_review: Value(count_as_review),
      created_at: Value(created_at),
    );
  }

  factory PracticeSession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PracticeSession(
      id: serializer.fromJson<String>(json['id']),
      plan_id: serializer.fromJson<String>(json['plan_id']),
      started_at: serializer.fromJson<int>(json['started_at']),
      finished_at: serializer.fromJson<int>(json['finished_at']),
      total_count: serializer.fromJson<int>(json['total_count']),
      correct_count: serializer.fromJson<int>(json['correct_count']),
      wrong_count: serializer.fromJson<int>(json['wrong_count']),
      skipped_count: serializer.fromJson<int>(json['skipped_count']),
      hesitated_count: serializer.fromJson<int>(json['hesitated_count']),
      total_time: serializer.fromJson<int>(json['total_time']),
      average_time: serializer.fromJson<double>(json['average_time']),
      count_as_review: serializer.fromJson<int>(json['count_as_review']),
      created_at: serializer.fromJson<int>(json['created_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'plan_id': serializer.toJson<String>(plan_id),
      'started_at': serializer.toJson<int>(started_at),
      'finished_at': serializer.toJson<int>(finished_at),
      'total_count': serializer.toJson<int>(total_count),
      'correct_count': serializer.toJson<int>(correct_count),
      'wrong_count': serializer.toJson<int>(wrong_count),
      'skipped_count': serializer.toJson<int>(skipped_count),
      'hesitated_count': serializer.toJson<int>(hesitated_count),
      'total_time': serializer.toJson<int>(total_time),
      'average_time': serializer.toJson<double>(average_time),
      'count_as_review': serializer.toJson<int>(count_as_review),
      'created_at': serializer.toJson<int>(created_at),
    };
  }

  PracticeSession copyWith({
    String? id,
    String? plan_id,
    int? started_at,
    int? finished_at,
    int? total_count,
    int? correct_count,
    int? wrong_count,
    int? skipped_count,
    int? hesitated_count,
    int? total_time,
    double? average_time,
    int? count_as_review,
    int? created_at,
  }) => PracticeSession(
    id: id ?? this.id,
    plan_id: plan_id ?? this.plan_id,
    started_at: started_at ?? this.started_at,
    finished_at: finished_at ?? this.finished_at,
    total_count: total_count ?? this.total_count,
    correct_count: correct_count ?? this.correct_count,
    wrong_count: wrong_count ?? this.wrong_count,
    skipped_count: skipped_count ?? this.skipped_count,
    hesitated_count: hesitated_count ?? this.hesitated_count,
    total_time: total_time ?? this.total_time,
    average_time: average_time ?? this.average_time,
    count_as_review: count_as_review ?? this.count_as_review,
    created_at: created_at ?? this.created_at,
  );
  PracticeSession copyWithCompanion(PracticeSessionsCompanion data) {
    return PracticeSession(
      id: data.id.present ? data.id.value : this.id,
      plan_id: data.plan_id.present ? data.plan_id.value : this.plan_id,
      started_at: data.started_at.present
          ? data.started_at.value
          : this.started_at,
      finished_at: data.finished_at.present
          ? data.finished_at.value
          : this.finished_at,
      total_count: data.total_count.present
          ? data.total_count.value
          : this.total_count,
      correct_count: data.correct_count.present
          ? data.correct_count.value
          : this.correct_count,
      wrong_count: data.wrong_count.present
          ? data.wrong_count.value
          : this.wrong_count,
      skipped_count: data.skipped_count.present
          ? data.skipped_count.value
          : this.skipped_count,
      hesitated_count: data.hesitated_count.present
          ? data.hesitated_count.value
          : this.hesitated_count,
      total_time: data.total_time.present
          ? data.total_time.value
          : this.total_time,
      average_time: data.average_time.present
          ? data.average_time.value
          : this.average_time,
      count_as_review: data.count_as_review.present
          ? data.count_as_review.value
          : this.count_as_review,
      created_at: data.created_at.present
          ? data.created_at.value
          : this.created_at,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PracticeSession(')
          ..write('id: $id, ')
          ..write('plan_id: $plan_id, ')
          ..write('started_at: $started_at, ')
          ..write('finished_at: $finished_at, ')
          ..write('total_count: $total_count, ')
          ..write('correct_count: $correct_count, ')
          ..write('wrong_count: $wrong_count, ')
          ..write('skipped_count: $skipped_count, ')
          ..write('hesitated_count: $hesitated_count, ')
          ..write('total_time: $total_time, ')
          ..write('average_time: $average_time, ')
          ..write('count_as_review: $count_as_review, ')
          ..write('created_at: $created_at')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    plan_id,
    started_at,
    finished_at,
    total_count,
    correct_count,
    wrong_count,
    skipped_count,
    hesitated_count,
    total_time,
    average_time,
    count_as_review,
    created_at,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PracticeSession &&
          other.id == this.id &&
          other.plan_id == this.plan_id &&
          other.started_at == this.started_at &&
          other.finished_at == this.finished_at &&
          other.total_count == this.total_count &&
          other.correct_count == this.correct_count &&
          other.wrong_count == this.wrong_count &&
          other.skipped_count == this.skipped_count &&
          other.hesitated_count == this.hesitated_count &&
          other.total_time == this.total_time &&
          other.average_time == this.average_time &&
          other.count_as_review == this.count_as_review &&
          other.created_at == this.created_at);
}

class PracticeSessionsCompanion extends UpdateCompanion<PracticeSession> {
  final Value<String> id;
  final Value<String> plan_id;
  final Value<int> started_at;
  final Value<int> finished_at;
  final Value<int> total_count;
  final Value<int> correct_count;
  final Value<int> wrong_count;
  final Value<int> skipped_count;
  final Value<int> hesitated_count;
  final Value<int> total_time;
  final Value<double> average_time;
  final Value<int> count_as_review;
  final Value<int> created_at;
  final Value<int> rowid;
  const PracticeSessionsCompanion({
    this.id = const Value.absent(),
    this.plan_id = const Value.absent(),
    this.started_at = const Value.absent(),
    this.finished_at = const Value.absent(),
    this.total_count = const Value.absent(),
    this.correct_count = const Value.absent(),
    this.wrong_count = const Value.absent(),
    this.skipped_count = const Value.absent(),
    this.hesitated_count = const Value.absent(),
    this.total_time = const Value.absent(),
    this.average_time = const Value.absent(),
    this.count_as_review = const Value.absent(),
    this.created_at = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PracticeSessionsCompanion.insert({
    required String id,
    required String plan_id,
    required int started_at,
    required int finished_at,
    required int total_count,
    required int correct_count,
    required int wrong_count,
    required int skipped_count,
    required int hesitated_count,
    required int total_time,
    required double average_time,
    required int count_as_review,
    required int created_at,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       plan_id = Value(plan_id),
       started_at = Value(started_at),
       finished_at = Value(finished_at),
       total_count = Value(total_count),
       correct_count = Value(correct_count),
       wrong_count = Value(wrong_count),
       skipped_count = Value(skipped_count),
       hesitated_count = Value(hesitated_count),
       total_time = Value(total_time),
       average_time = Value(average_time),
       count_as_review = Value(count_as_review),
       created_at = Value(created_at);
  static Insertable<PracticeSession> custom({
    Expression<String>? id,
    Expression<String>? plan_id,
    Expression<int>? started_at,
    Expression<int>? finished_at,
    Expression<int>? total_count,
    Expression<int>? correct_count,
    Expression<int>? wrong_count,
    Expression<int>? skipped_count,
    Expression<int>? hesitated_count,
    Expression<int>? total_time,
    Expression<double>? average_time,
    Expression<int>? count_as_review,
    Expression<int>? created_at,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (plan_id != null) 'plan_id': plan_id,
      if (started_at != null) 'started_at': started_at,
      if (finished_at != null) 'finished_at': finished_at,
      if (total_count != null) 'total_count': total_count,
      if (correct_count != null) 'correct_count': correct_count,
      if (wrong_count != null) 'wrong_count': wrong_count,
      if (skipped_count != null) 'skipped_count': skipped_count,
      if (hesitated_count != null) 'hesitated_count': hesitated_count,
      if (total_time != null) 'total_time': total_time,
      if (average_time != null) 'average_time': average_time,
      if (count_as_review != null) 'count_as_review': count_as_review,
      if (created_at != null) 'created_at': created_at,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PracticeSessionsCompanion copyWith({
    Value<String>? id,
    Value<String>? plan_id,
    Value<int>? started_at,
    Value<int>? finished_at,
    Value<int>? total_count,
    Value<int>? correct_count,
    Value<int>? wrong_count,
    Value<int>? skipped_count,
    Value<int>? hesitated_count,
    Value<int>? total_time,
    Value<double>? average_time,
    Value<int>? count_as_review,
    Value<int>? created_at,
    Value<int>? rowid,
  }) {
    return PracticeSessionsCompanion(
      id: id ?? this.id,
      plan_id: plan_id ?? this.plan_id,
      started_at: started_at ?? this.started_at,
      finished_at: finished_at ?? this.finished_at,
      total_count: total_count ?? this.total_count,
      correct_count: correct_count ?? this.correct_count,
      wrong_count: wrong_count ?? this.wrong_count,
      skipped_count: skipped_count ?? this.skipped_count,
      hesitated_count: hesitated_count ?? this.hesitated_count,
      total_time: total_time ?? this.total_time,
      average_time: average_time ?? this.average_time,
      count_as_review: count_as_review ?? this.count_as_review,
      created_at: created_at ?? this.created_at,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (plan_id.present) {
      map['plan_id'] = Variable<String>(plan_id.value);
    }
    if (started_at.present) {
      map['started_at'] = Variable<int>(started_at.value);
    }
    if (finished_at.present) {
      map['finished_at'] = Variable<int>(finished_at.value);
    }
    if (total_count.present) {
      map['total_count'] = Variable<int>(total_count.value);
    }
    if (correct_count.present) {
      map['correct_count'] = Variable<int>(correct_count.value);
    }
    if (wrong_count.present) {
      map['wrong_count'] = Variable<int>(wrong_count.value);
    }
    if (skipped_count.present) {
      map['skipped_count'] = Variable<int>(skipped_count.value);
    }
    if (hesitated_count.present) {
      map['hesitated_count'] = Variable<int>(hesitated_count.value);
    }
    if (total_time.present) {
      map['total_time'] = Variable<int>(total_time.value);
    }
    if (average_time.present) {
      map['average_time'] = Variable<double>(average_time.value);
    }
    if (count_as_review.present) {
      map['count_as_review'] = Variable<int>(count_as_review.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<int>(created_at.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PracticeSessionsCompanion(')
          ..write('id: $id, ')
          ..write('plan_id: $plan_id, ')
          ..write('started_at: $started_at, ')
          ..write('finished_at: $finished_at, ')
          ..write('total_count: $total_count, ')
          ..write('correct_count: $correct_count, ')
          ..write('wrong_count: $wrong_count, ')
          ..write('skipped_count: $skipped_count, ')
          ..write('hesitated_count: $hesitated_count, ')
          ..write('total_time: $total_time, ')
          ..write('average_time: $average_time, ')
          ..write('count_as_review: $count_as_review, ')
          ..write('created_at: $created_at, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PracticeRecordsTable extends PracticeRecords
    with TableInfo<$PracticeRecordsTable, PracticeRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PracticeRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _session_idMeta = const VerificationMeta(
    'session_id',
  );
  @override
  late final GeneratedColumn<String> session_id = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _study_item_idMeta = const VerificationMeta(
    'study_item_id',
  );
  @override
  late final GeneratedColumn<String> study_item_id = GeneratedColumn<String>(
    'study_item_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _resultMeta = const VerificationMeta('result');
  @override
  late final GeneratedColumn<String> result = GeneratedColumn<String>(
    'result',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _response_timeMeta = const VerificationMeta(
    'response_time',
  );
  @override
  late final GeneratedColumn<int> response_time = GeneratedColumn<int>(
    'response_time',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _created_atMeta = const VerificationMeta(
    'created_at',
  );
  @override
  late final GeneratedColumn<int> created_at = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    session_id,
    study_item_id,
    result,
    response_time,
    created_at,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'practice_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<PracticeRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _session_idMeta,
        session_id.isAcceptableOrUnknown(data['session_id']!, _session_idMeta),
      );
    } else if (isInserting) {
      context.missing(_session_idMeta);
    }
    if (data.containsKey('study_item_id')) {
      context.handle(
        _study_item_idMeta,
        study_item_id.isAcceptableOrUnknown(
          data['study_item_id']!,
          _study_item_idMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_study_item_idMeta);
    }
    if (data.containsKey('result')) {
      context.handle(
        _resultMeta,
        result.isAcceptableOrUnknown(data['result']!, _resultMeta),
      );
    } else if (isInserting) {
      context.missing(_resultMeta);
    }
    if (data.containsKey('response_time')) {
      context.handle(
        _response_timeMeta,
        response_time.isAcceptableOrUnknown(
          data['response_time']!,
          _response_timeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_response_timeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _created_atMeta,
        created_at.isAcceptableOrUnknown(data['created_at']!, _created_atMeta),
      );
    } else if (isInserting) {
      context.missing(_created_atMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PracticeRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PracticeRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      session_id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      )!,
      study_item_id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}study_item_id'],
      )!,
      result: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}result'],
      )!,
      response_time: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}response_time'],
      )!,
      created_at: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PracticeRecordsTable createAlias(String alias) {
    return $PracticeRecordsTable(attachedDatabase, alias);
  }
}

class PracticeRecord extends DataClass implements Insertable<PracticeRecord> {
  /// 记录ID，主键
  final String id;

  /// 刷题活动ID
  final String session_id;

  /// 学习内容ID
  final String study_item_id;

  /// 做题结果：correct / wrong / hesitated / skipped
  final String result;

  /// 做题耗时
  final int response_time;

  /// 做题时间，毫秒级时间戳
  final int created_at;
  const PracticeRecord({
    required this.id,
    required this.session_id,
    required this.study_item_id,
    required this.result,
    required this.response_time,
    required this.created_at,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['session_id'] = Variable<String>(session_id);
    map['study_item_id'] = Variable<String>(study_item_id);
    map['result'] = Variable<String>(result);
    map['response_time'] = Variable<int>(response_time);
    map['created_at'] = Variable<int>(created_at);
    return map;
  }

  PracticeRecordsCompanion toCompanion(bool nullToAbsent) {
    return PracticeRecordsCompanion(
      id: Value(id),
      session_id: Value(session_id),
      study_item_id: Value(study_item_id),
      result: Value(result),
      response_time: Value(response_time),
      created_at: Value(created_at),
    );
  }

  factory PracticeRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PracticeRecord(
      id: serializer.fromJson<String>(json['id']),
      session_id: serializer.fromJson<String>(json['session_id']),
      study_item_id: serializer.fromJson<String>(json['study_item_id']),
      result: serializer.fromJson<String>(json['result']),
      response_time: serializer.fromJson<int>(json['response_time']),
      created_at: serializer.fromJson<int>(json['created_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'session_id': serializer.toJson<String>(session_id),
      'study_item_id': serializer.toJson<String>(study_item_id),
      'result': serializer.toJson<String>(result),
      'response_time': serializer.toJson<int>(response_time),
      'created_at': serializer.toJson<int>(created_at),
    };
  }

  PracticeRecord copyWith({
    String? id,
    String? session_id,
    String? study_item_id,
    String? result,
    int? response_time,
    int? created_at,
  }) => PracticeRecord(
    id: id ?? this.id,
    session_id: session_id ?? this.session_id,
    study_item_id: study_item_id ?? this.study_item_id,
    result: result ?? this.result,
    response_time: response_time ?? this.response_time,
    created_at: created_at ?? this.created_at,
  );
  PracticeRecord copyWithCompanion(PracticeRecordsCompanion data) {
    return PracticeRecord(
      id: data.id.present ? data.id.value : this.id,
      session_id: data.session_id.present
          ? data.session_id.value
          : this.session_id,
      study_item_id: data.study_item_id.present
          ? data.study_item_id.value
          : this.study_item_id,
      result: data.result.present ? data.result.value : this.result,
      response_time: data.response_time.present
          ? data.response_time.value
          : this.response_time,
      created_at: data.created_at.present
          ? data.created_at.value
          : this.created_at,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PracticeRecord(')
          ..write('id: $id, ')
          ..write('session_id: $session_id, ')
          ..write('study_item_id: $study_item_id, ')
          ..write('result: $result, ')
          ..write('response_time: $response_time, ')
          ..write('created_at: $created_at')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    session_id,
    study_item_id,
    result,
    response_time,
    created_at,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PracticeRecord &&
          other.id == this.id &&
          other.session_id == this.session_id &&
          other.study_item_id == this.study_item_id &&
          other.result == this.result &&
          other.response_time == this.response_time &&
          other.created_at == this.created_at);
}

class PracticeRecordsCompanion extends UpdateCompanion<PracticeRecord> {
  final Value<String> id;
  final Value<String> session_id;
  final Value<String> study_item_id;
  final Value<String> result;
  final Value<int> response_time;
  final Value<int> created_at;
  final Value<int> rowid;
  const PracticeRecordsCompanion({
    this.id = const Value.absent(),
    this.session_id = const Value.absent(),
    this.study_item_id = const Value.absent(),
    this.result = const Value.absent(),
    this.response_time = const Value.absent(),
    this.created_at = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PracticeRecordsCompanion.insert({
    required String id,
    required String session_id,
    required String study_item_id,
    required String result,
    required int response_time,
    required int created_at,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       session_id = Value(session_id),
       study_item_id = Value(study_item_id),
       result = Value(result),
       response_time = Value(response_time),
       created_at = Value(created_at);
  static Insertable<PracticeRecord> custom({
    Expression<String>? id,
    Expression<String>? session_id,
    Expression<String>? study_item_id,
    Expression<String>? result,
    Expression<int>? response_time,
    Expression<int>? created_at,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (session_id != null) 'session_id': session_id,
      if (study_item_id != null) 'study_item_id': study_item_id,
      if (result != null) 'result': result,
      if (response_time != null) 'response_time': response_time,
      if (created_at != null) 'created_at': created_at,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PracticeRecordsCompanion copyWith({
    Value<String>? id,
    Value<String>? session_id,
    Value<String>? study_item_id,
    Value<String>? result,
    Value<int>? response_time,
    Value<int>? created_at,
    Value<int>? rowid,
  }) {
    return PracticeRecordsCompanion(
      id: id ?? this.id,
      session_id: session_id ?? this.session_id,
      study_item_id: study_item_id ?? this.study_item_id,
      result: result ?? this.result,
      response_time: response_time ?? this.response_time,
      created_at: created_at ?? this.created_at,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (session_id.present) {
      map['session_id'] = Variable<String>(session_id.value);
    }
    if (study_item_id.present) {
      map['study_item_id'] = Variable<String>(study_item_id.value);
    }
    if (result.present) {
      map['result'] = Variable<String>(result.value);
    }
    if (response_time.present) {
      map['response_time'] = Variable<int>(response_time.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<int>(created_at.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PracticeRecordsCompanion(')
          ..write('id: $id, ')
          ..write('session_id: $session_id, ')
          ..write('study_item_id: $study_item_id, ')
          ..write('result: $result, ')
          ..write('response_time: $response_time, ')
          ..write('created_at: $created_at, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _daily_review_limitMeta =
      const VerificationMeta('daily_review_limit');
  @override
  late final GeneratedColumn<int> daily_review_limit = GeneratedColumn<int>(
    'daily_review_limit',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _daily_new_limitMeta = const VerificationMeta(
    'daily_new_limit',
  );
  @override
  late final GeneratedColumn<int> daily_new_limit = GeneratedColumn<int>(
    'daily_new_limit',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _default_sort_typeMeta = const VerificationMeta(
    'default_sort_type',
  );
  @override
  late final GeneratedColumn<String> default_sort_type =
      GeneratedColumn<String>(
        'default_sort_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _image_qualityMeta = const VerificationMeta(
    'image_quality',
  );
  @override
  late final GeneratedColumn<int> image_quality = GeneratedColumn<int>(
    'image_quality',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _generate_thumbnailMeta =
      const VerificationMeta('generate_thumbnail');
  @override
  late final GeneratedColumn<int> generate_thumbnail = GeneratedColumn<int>(
    'generate_thumbnail',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _show_next_review_timeMeta =
      const VerificationMeta('show_next_review_time');
  @override
  late final GeneratedColumn<int> show_next_review_time = GeneratedColumn<int>(
    'show_next_review_time',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _count_practice_as_reviewMeta =
      const VerificationMeta('count_practice_as_review');
  @override
  late final GeneratedColumn<int> count_practice_as_review =
      GeneratedColumn<int>(
        'count_practice_as_review',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _initial_red_daysMeta = const VerificationMeta(
    'initial_red_days',
  );
  @override
  late final GeneratedColumn<int> initial_red_days = GeneratedColumn<int>(
    'initial_red_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _initial_yellow_daysMeta =
      const VerificationMeta('initial_yellow_days');
  @override
  late final GeneratedColumn<int> initial_yellow_days = GeneratedColumn<int>(
    'initial_yellow_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _initial_green_daysMeta =
      const VerificationMeta('initial_green_days');
  @override
  late final GeneratedColumn<int> initial_green_days = GeneratedColumn<int>(
    'initial_green_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _backup_reminder_daysMeta =
      const VerificationMeta('backup_reminder_days');
  @override
  late final GeneratedColumn<int> backup_reminder_days = GeneratedColumn<int>(
    'backup_reminder_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _theme_modeMeta = const VerificationMeta(
    'theme_mode',
  );
  @override
  late final GeneratedColumn<String> theme_mode = GeneratedColumn<String>(
    'theme_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updated_atMeta = const VerificationMeta(
    'updated_at',
  );
  @override
  late final GeneratedColumn<int> updated_at = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    daily_review_limit,
    daily_new_limit,
    default_sort_type,
    image_quality,
    generate_thumbnail,
    show_next_review_time,
    count_practice_as_review,
    initial_red_days,
    initial_yellow_days,
    initial_green_days,
    backup_reminder_days,
    theme_mode,
    updated_at,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('daily_review_limit')) {
      context.handle(
        _daily_review_limitMeta,
        daily_review_limit.isAcceptableOrUnknown(
          data['daily_review_limit']!,
          _daily_review_limitMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_daily_review_limitMeta);
    }
    if (data.containsKey('daily_new_limit')) {
      context.handle(
        _daily_new_limitMeta,
        daily_new_limit.isAcceptableOrUnknown(
          data['daily_new_limit']!,
          _daily_new_limitMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_daily_new_limitMeta);
    }
    if (data.containsKey('default_sort_type')) {
      context.handle(
        _default_sort_typeMeta,
        default_sort_type.isAcceptableOrUnknown(
          data['default_sort_type']!,
          _default_sort_typeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_default_sort_typeMeta);
    }
    if (data.containsKey('image_quality')) {
      context.handle(
        _image_qualityMeta,
        image_quality.isAcceptableOrUnknown(
          data['image_quality']!,
          _image_qualityMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_image_qualityMeta);
    }
    if (data.containsKey('generate_thumbnail')) {
      context.handle(
        _generate_thumbnailMeta,
        generate_thumbnail.isAcceptableOrUnknown(
          data['generate_thumbnail']!,
          _generate_thumbnailMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_generate_thumbnailMeta);
    }
    if (data.containsKey('show_next_review_time')) {
      context.handle(
        _show_next_review_timeMeta,
        show_next_review_time.isAcceptableOrUnknown(
          data['show_next_review_time']!,
          _show_next_review_timeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_show_next_review_timeMeta);
    }
    if (data.containsKey('count_practice_as_review')) {
      context.handle(
        _count_practice_as_reviewMeta,
        count_practice_as_review.isAcceptableOrUnknown(
          data['count_practice_as_review']!,
          _count_practice_as_reviewMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_count_practice_as_reviewMeta);
    }
    if (data.containsKey('initial_red_days')) {
      context.handle(
        _initial_red_daysMeta,
        initial_red_days.isAcceptableOrUnknown(
          data['initial_red_days']!,
          _initial_red_daysMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_initial_red_daysMeta);
    }
    if (data.containsKey('initial_yellow_days')) {
      context.handle(
        _initial_yellow_daysMeta,
        initial_yellow_days.isAcceptableOrUnknown(
          data['initial_yellow_days']!,
          _initial_yellow_daysMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_initial_yellow_daysMeta);
    }
    if (data.containsKey('initial_green_days')) {
      context.handle(
        _initial_green_daysMeta,
        initial_green_days.isAcceptableOrUnknown(
          data['initial_green_days']!,
          _initial_green_daysMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_initial_green_daysMeta);
    }
    if (data.containsKey('backup_reminder_days')) {
      context.handle(
        _backup_reminder_daysMeta,
        backup_reminder_days.isAcceptableOrUnknown(
          data['backup_reminder_days']!,
          _backup_reminder_daysMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_backup_reminder_daysMeta);
    }
    if (data.containsKey('theme_mode')) {
      context.handle(
        _theme_modeMeta,
        theme_mode.isAcceptableOrUnknown(data['theme_mode']!, _theme_modeMeta),
      );
    } else if (isInserting) {
      context.missing(_theme_modeMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updated_atMeta,
        updated_at.isAcceptableOrUnknown(data['updated_at']!, _updated_atMeta),
      );
    } else if (isInserting) {
      context.missing(_updated_atMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      daily_review_limit: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}daily_review_limit'],
      )!,
      daily_new_limit: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}daily_new_limit'],
      )!,
      default_sort_type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}default_sort_type'],
      )!,
      image_quality: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}image_quality'],
      )!,
      generate_thumbnail: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}generate_thumbnail'],
      )!,
      show_next_review_time: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}show_next_review_time'],
      )!,
      count_practice_as_review: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}count_practice_as_review'],
      )!,
      initial_red_days: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}initial_red_days'],
      )!,
      initial_yellow_days: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}initial_yellow_days'],
      )!,
      initial_green_days: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}initial_green_days'],
      )!,
      backup_reminder_days: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}backup_reminder_days'],
      )!,
      theme_mode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}theme_mode'],
      )!,
      updated_at: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  /// 主键，业务约定固定为 1
  final int id;

  /// 每日复习上限
  final int daily_review_limit;

  /// 每日新内容上限
  final int daily_new_limit;

  /// 默认排序方式
  final String default_sort_type;

  /// 图片压缩质量
  final int image_quality;

  /// 是否生成缩略图
  final int generate_thumbnail;

  /// 是否显示下一次复习时间
  final int show_next_review_time;

  /// 专项刷题是否计入复习
  final int count_practice_as_review;

  /// 红色首次复习间隔
  final int initial_red_days;

  /// 黄色首次复习间隔
  final int initial_yellow_days;

  /// 绿色首次复习间隔
  final int initial_green_days;

  /// 备份提醒周期
  final int backup_reminder_days;

  /// system / light / dark
  final String theme_mode;

  /// 修改时间，毫秒级时间戳
  final int updated_at;
  const AppSetting({
    required this.id,
    required this.daily_review_limit,
    required this.daily_new_limit,
    required this.default_sort_type,
    required this.image_quality,
    required this.generate_thumbnail,
    required this.show_next_review_time,
    required this.count_practice_as_review,
    required this.initial_red_days,
    required this.initial_yellow_days,
    required this.initial_green_days,
    required this.backup_reminder_days,
    required this.theme_mode,
    required this.updated_at,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['daily_review_limit'] = Variable<int>(daily_review_limit);
    map['daily_new_limit'] = Variable<int>(daily_new_limit);
    map['default_sort_type'] = Variable<String>(default_sort_type);
    map['image_quality'] = Variable<int>(image_quality);
    map['generate_thumbnail'] = Variable<int>(generate_thumbnail);
    map['show_next_review_time'] = Variable<int>(show_next_review_time);
    map['count_practice_as_review'] = Variable<int>(count_practice_as_review);
    map['initial_red_days'] = Variable<int>(initial_red_days);
    map['initial_yellow_days'] = Variable<int>(initial_yellow_days);
    map['initial_green_days'] = Variable<int>(initial_green_days);
    map['backup_reminder_days'] = Variable<int>(backup_reminder_days);
    map['theme_mode'] = Variable<String>(theme_mode);
    map['updated_at'] = Variable<int>(updated_at);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      id: Value(id),
      daily_review_limit: Value(daily_review_limit),
      daily_new_limit: Value(daily_new_limit),
      default_sort_type: Value(default_sort_type),
      image_quality: Value(image_quality),
      generate_thumbnail: Value(generate_thumbnail),
      show_next_review_time: Value(show_next_review_time),
      count_practice_as_review: Value(count_practice_as_review),
      initial_red_days: Value(initial_red_days),
      initial_yellow_days: Value(initial_yellow_days),
      initial_green_days: Value(initial_green_days),
      backup_reminder_days: Value(backup_reminder_days),
      theme_mode: Value(theme_mode),
      updated_at: Value(updated_at),
    );
  }

  factory AppSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      id: serializer.fromJson<int>(json['id']),
      daily_review_limit: serializer.fromJson<int>(json['daily_review_limit']),
      daily_new_limit: serializer.fromJson<int>(json['daily_new_limit']),
      default_sort_type: serializer.fromJson<String>(json['default_sort_type']),
      image_quality: serializer.fromJson<int>(json['image_quality']),
      generate_thumbnail: serializer.fromJson<int>(json['generate_thumbnail']),
      show_next_review_time: serializer.fromJson<int>(
        json['show_next_review_time'],
      ),
      count_practice_as_review: serializer.fromJson<int>(
        json['count_practice_as_review'],
      ),
      initial_red_days: serializer.fromJson<int>(json['initial_red_days']),
      initial_yellow_days: serializer.fromJson<int>(
        json['initial_yellow_days'],
      ),
      initial_green_days: serializer.fromJson<int>(json['initial_green_days']),
      backup_reminder_days: serializer.fromJson<int>(
        json['backup_reminder_days'],
      ),
      theme_mode: serializer.fromJson<String>(json['theme_mode']),
      updated_at: serializer.fromJson<int>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'daily_review_limit': serializer.toJson<int>(daily_review_limit),
      'daily_new_limit': serializer.toJson<int>(daily_new_limit),
      'default_sort_type': serializer.toJson<String>(default_sort_type),
      'image_quality': serializer.toJson<int>(image_quality),
      'generate_thumbnail': serializer.toJson<int>(generate_thumbnail),
      'show_next_review_time': serializer.toJson<int>(show_next_review_time),
      'count_practice_as_review': serializer.toJson<int>(
        count_practice_as_review,
      ),
      'initial_red_days': serializer.toJson<int>(initial_red_days),
      'initial_yellow_days': serializer.toJson<int>(initial_yellow_days),
      'initial_green_days': serializer.toJson<int>(initial_green_days),
      'backup_reminder_days': serializer.toJson<int>(backup_reminder_days),
      'theme_mode': serializer.toJson<String>(theme_mode),
      'updated_at': serializer.toJson<int>(updated_at),
    };
  }

  AppSetting copyWith({
    int? id,
    int? daily_review_limit,
    int? daily_new_limit,
    String? default_sort_type,
    int? image_quality,
    int? generate_thumbnail,
    int? show_next_review_time,
    int? count_practice_as_review,
    int? initial_red_days,
    int? initial_yellow_days,
    int? initial_green_days,
    int? backup_reminder_days,
    String? theme_mode,
    int? updated_at,
  }) => AppSetting(
    id: id ?? this.id,
    daily_review_limit: daily_review_limit ?? this.daily_review_limit,
    daily_new_limit: daily_new_limit ?? this.daily_new_limit,
    default_sort_type: default_sort_type ?? this.default_sort_type,
    image_quality: image_quality ?? this.image_quality,
    generate_thumbnail: generate_thumbnail ?? this.generate_thumbnail,
    show_next_review_time: show_next_review_time ?? this.show_next_review_time,
    count_practice_as_review:
        count_practice_as_review ?? this.count_practice_as_review,
    initial_red_days: initial_red_days ?? this.initial_red_days,
    initial_yellow_days: initial_yellow_days ?? this.initial_yellow_days,
    initial_green_days: initial_green_days ?? this.initial_green_days,
    backup_reminder_days: backup_reminder_days ?? this.backup_reminder_days,
    theme_mode: theme_mode ?? this.theme_mode,
    updated_at: updated_at ?? this.updated_at,
  );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      id: data.id.present ? data.id.value : this.id,
      daily_review_limit: data.daily_review_limit.present
          ? data.daily_review_limit.value
          : this.daily_review_limit,
      daily_new_limit: data.daily_new_limit.present
          ? data.daily_new_limit.value
          : this.daily_new_limit,
      default_sort_type: data.default_sort_type.present
          ? data.default_sort_type.value
          : this.default_sort_type,
      image_quality: data.image_quality.present
          ? data.image_quality.value
          : this.image_quality,
      generate_thumbnail: data.generate_thumbnail.present
          ? data.generate_thumbnail.value
          : this.generate_thumbnail,
      show_next_review_time: data.show_next_review_time.present
          ? data.show_next_review_time.value
          : this.show_next_review_time,
      count_practice_as_review: data.count_practice_as_review.present
          ? data.count_practice_as_review.value
          : this.count_practice_as_review,
      initial_red_days: data.initial_red_days.present
          ? data.initial_red_days.value
          : this.initial_red_days,
      initial_yellow_days: data.initial_yellow_days.present
          ? data.initial_yellow_days.value
          : this.initial_yellow_days,
      initial_green_days: data.initial_green_days.present
          ? data.initial_green_days.value
          : this.initial_green_days,
      backup_reminder_days: data.backup_reminder_days.present
          ? data.backup_reminder_days.value
          : this.backup_reminder_days,
      theme_mode: data.theme_mode.present
          ? data.theme_mode.value
          : this.theme_mode,
      updated_at: data.updated_at.present
          ? data.updated_at.value
          : this.updated_at,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('id: $id, ')
          ..write('daily_review_limit: $daily_review_limit, ')
          ..write('daily_new_limit: $daily_new_limit, ')
          ..write('default_sort_type: $default_sort_type, ')
          ..write('image_quality: $image_quality, ')
          ..write('generate_thumbnail: $generate_thumbnail, ')
          ..write('show_next_review_time: $show_next_review_time, ')
          ..write('count_practice_as_review: $count_practice_as_review, ')
          ..write('initial_red_days: $initial_red_days, ')
          ..write('initial_yellow_days: $initial_yellow_days, ')
          ..write('initial_green_days: $initial_green_days, ')
          ..write('backup_reminder_days: $backup_reminder_days, ')
          ..write('theme_mode: $theme_mode, ')
          ..write('updated_at: $updated_at')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    daily_review_limit,
    daily_new_limit,
    default_sort_type,
    image_quality,
    generate_thumbnail,
    show_next_review_time,
    count_practice_as_review,
    initial_red_days,
    initial_yellow_days,
    initial_green_days,
    backup_reminder_days,
    theme_mode,
    updated_at,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.id == this.id &&
          other.daily_review_limit == this.daily_review_limit &&
          other.daily_new_limit == this.daily_new_limit &&
          other.default_sort_type == this.default_sort_type &&
          other.image_quality == this.image_quality &&
          other.generate_thumbnail == this.generate_thumbnail &&
          other.show_next_review_time == this.show_next_review_time &&
          other.count_practice_as_review == this.count_practice_as_review &&
          other.initial_red_days == this.initial_red_days &&
          other.initial_yellow_days == this.initial_yellow_days &&
          other.initial_green_days == this.initial_green_days &&
          other.backup_reminder_days == this.backup_reminder_days &&
          other.theme_mode == this.theme_mode &&
          other.updated_at == this.updated_at);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<int> id;
  final Value<int> daily_review_limit;
  final Value<int> daily_new_limit;
  final Value<String> default_sort_type;
  final Value<int> image_quality;
  final Value<int> generate_thumbnail;
  final Value<int> show_next_review_time;
  final Value<int> count_practice_as_review;
  final Value<int> initial_red_days;
  final Value<int> initial_yellow_days;
  final Value<int> initial_green_days;
  final Value<int> backup_reminder_days;
  final Value<String> theme_mode;
  final Value<int> updated_at;
  const AppSettingsCompanion({
    this.id = const Value.absent(),
    this.daily_review_limit = const Value.absent(),
    this.daily_new_limit = const Value.absent(),
    this.default_sort_type = const Value.absent(),
    this.image_quality = const Value.absent(),
    this.generate_thumbnail = const Value.absent(),
    this.show_next_review_time = const Value.absent(),
    this.count_practice_as_review = const Value.absent(),
    this.initial_red_days = const Value.absent(),
    this.initial_yellow_days = const Value.absent(),
    this.initial_green_days = const Value.absent(),
    this.backup_reminder_days = const Value.absent(),
    this.theme_mode = const Value.absent(),
    this.updated_at = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    this.id = const Value.absent(),
    required int daily_review_limit,
    required int daily_new_limit,
    required String default_sort_type,
    required int image_quality,
    required int generate_thumbnail,
    required int show_next_review_time,
    required int count_practice_as_review,
    required int initial_red_days,
    required int initial_yellow_days,
    required int initial_green_days,
    required int backup_reminder_days,
    required String theme_mode,
    required int updated_at,
  }) : daily_review_limit = Value(daily_review_limit),
       daily_new_limit = Value(daily_new_limit),
       default_sort_type = Value(default_sort_type),
       image_quality = Value(image_quality),
       generate_thumbnail = Value(generate_thumbnail),
       show_next_review_time = Value(show_next_review_time),
       count_practice_as_review = Value(count_practice_as_review),
       initial_red_days = Value(initial_red_days),
       initial_yellow_days = Value(initial_yellow_days),
       initial_green_days = Value(initial_green_days),
       backup_reminder_days = Value(backup_reminder_days),
       theme_mode = Value(theme_mode),
       updated_at = Value(updated_at);
  static Insertable<AppSetting> custom({
    Expression<int>? id,
    Expression<int>? daily_review_limit,
    Expression<int>? daily_new_limit,
    Expression<String>? default_sort_type,
    Expression<int>? image_quality,
    Expression<int>? generate_thumbnail,
    Expression<int>? show_next_review_time,
    Expression<int>? count_practice_as_review,
    Expression<int>? initial_red_days,
    Expression<int>? initial_yellow_days,
    Expression<int>? initial_green_days,
    Expression<int>? backup_reminder_days,
    Expression<String>? theme_mode,
    Expression<int>? updated_at,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (daily_review_limit != null) 'daily_review_limit': daily_review_limit,
      if (daily_new_limit != null) 'daily_new_limit': daily_new_limit,
      if (default_sort_type != null) 'default_sort_type': default_sort_type,
      if (image_quality != null) 'image_quality': image_quality,
      if (generate_thumbnail != null) 'generate_thumbnail': generate_thumbnail,
      if (show_next_review_time != null)
        'show_next_review_time': show_next_review_time,
      if (count_practice_as_review != null)
        'count_practice_as_review': count_practice_as_review,
      if (initial_red_days != null) 'initial_red_days': initial_red_days,
      if (initial_yellow_days != null)
        'initial_yellow_days': initial_yellow_days,
      if (initial_green_days != null) 'initial_green_days': initial_green_days,
      if (backup_reminder_days != null)
        'backup_reminder_days': backup_reminder_days,
      if (theme_mode != null) 'theme_mode': theme_mode,
      if (updated_at != null) 'updated_at': updated_at,
    });
  }

  AppSettingsCompanion copyWith({
    Value<int>? id,
    Value<int>? daily_review_limit,
    Value<int>? daily_new_limit,
    Value<String>? default_sort_type,
    Value<int>? image_quality,
    Value<int>? generate_thumbnail,
    Value<int>? show_next_review_time,
    Value<int>? count_practice_as_review,
    Value<int>? initial_red_days,
    Value<int>? initial_yellow_days,
    Value<int>? initial_green_days,
    Value<int>? backup_reminder_days,
    Value<String>? theme_mode,
    Value<int>? updated_at,
  }) {
    return AppSettingsCompanion(
      id: id ?? this.id,
      daily_review_limit: daily_review_limit ?? this.daily_review_limit,
      daily_new_limit: daily_new_limit ?? this.daily_new_limit,
      default_sort_type: default_sort_type ?? this.default_sort_type,
      image_quality: image_quality ?? this.image_quality,
      generate_thumbnail: generate_thumbnail ?? this.generate_thumbnail,
      show_next_review_time:
          show_next_review_time ?? this.show_next_review_time,
      count_practice_as_review:
          count_practice_as_review ?? this.count_practice_as_review,
      initial_red_days: initial_red_days ?? this.initial_red_days,
      initial_yellow_days: initial_yellow_days ?? this.initial_yellow_days,
      initial_green_days: initial_green_days ?? this.initial_green_days,
      backup_reminder_days: backup_reminder_days ?? this.backup_reminder_days,
      theme_mode: theme_mode ?? this.theme_mode,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (daily_review_limit.present) {
      map['daily_review_limit'] = Variable<int>(daily_review_limit.value);
    }
    if (daily_new_limit.present) {
      map['daily_new_limit'] = Variable<int>(daily_new_limit.value);
    }
    if (default_sort_type.present) {
      map['default_sort_type'] = Variable<String>(default_sort_type.value);
    }
    if (image_quality.present) {
      map['image_quality'] = Variable<int>(image_quality.value);
    }
    if (generate_thumbnail.present) {
      map['generate_thumbnail'] = Variable<int>(generate_thumbnail.value);
    }
    if (show_next_review_time.present) {
      map['show_next_review_time'] = Variable<int>(show_next_review_time.value);
    }
    if (count_practice_as_review.present) {
      map['count_practice_as_review'] = Variable<int>(
        count_practice_as_review.value,
      );
    }
    if (initial_red_days.present) {
      map['initial_red_days'] = Variable<int>(initial_red_days.value);
    }
    if (initial_yellow_days.present) {
      map['initial_yellow_days'] = Variable<int>(initial_yellow_days.value);
    }
    if (initial_green_days.present) {
      map['initial_green_days'] = Variable<int>(initial_green_days.value);
    }
    if (backup_reminder_days.present) {
      map['backup_reminder_days'] = Variable<int>(backup_reminder_days.value);
    }
    if (theme_mode.present) {
      map['theme_mode'] = Variable<String>(theme_mode.value);
    }
    if (updated_at.present) {
      map['updated_at'] = Variable<int>(updated_at.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('id: $id, ')
          ..write('daily_review_limit: $daily_review_limit, ')
          ..write('daily_new_limit: $daily_new_limit, ')
          ..write('default_sort_type: $default_sort_type, ')
          ..write('image_quality: $image_quality, ')
          ..write('generate_thumbnail: $generate_thumbnail, ')
          ..write('show_next_review_time: $show_next_review_time, ')
          ..write('count_practice_as_review: $count_practice_as_review, ')
          ..write('initial_red_days: $initial_red_days, ')
          ..write('initial_yellow_days: $initial_yellow_days, ')
          ..write('initial_green_days: $initial_green_days, ')
          ..write('backup_reminder_days: $backup_reminder_days, ')
          ..write('theme_mode: $theme_mode, ')
          ..write('updated_at: $updated_at')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SubjectsTable subjects = $SubjectsTable(this);
  late final $StudyItemsTable studyItems = $StudyItemsTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $ImagesTable images = $ImagesTable(this);
  late final $TagsTable tags = $TagsTable(this);
  late final $StudyItemTagsTable studyItemTags = $StudyItemTagsTable(this);
  late final $FsrsCardsTable fsrsCards = $FsrsCardsTable(this);
  late final $ReviewRecordsTable reviewRecords = $ReviewRecordsTable(this);
  late final $MistakeRecordsTable mistakeRecords = $MistakeRecordsTable(this);
  late final $MistakeReasonsTable mistakeReasons = $MistakeReasonsTable(this);
  late final $MistakeRecordReasonsTable mistakeRecordReasons =
      $MistakeRecordReasonsTable(this);
  late final $PracticePlansTable practicePlans = $PracticePlansTable(this);
  late final $PracticeSessionsTable practiceSessions = $PracticeSessionsTable(
    this,
  );
  late final $PracticeRecordsTable practiceRecords = $PracticeRecordsTable(
    this,
  );
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    subjects,
    studyItems,
    categories,
    images,
    tags,
    studyItemTags,
    fsrsCards,
    reviewRecords,
    mistakeRecords,
    mistakeReasons,
    mistakeRecordReasons,
    practicePlans,
    practiceSessions,
    practiceRecords,
    appSettings,
  ];
}

typedef $$SubjectsTableCreateCompanionBuilder = SubjectsCompanion Function({
  required String id,
  required String name,
  Value<String?> description,
  Value<int> sort_order,
  Value<int> is_default,
  required int created_at,
  required int updated_at,
  Value<int> rowid,
});
typedef $$SubjectsTableUpdateCompanionBuilder = SubjectsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String?> description,
  Value<int> sort_order,
  Value<int> is_default,
  Value<int> created_at,
  Value<int> updated_at,
  Value<int> rowid,
});

class $$SubjectsTableFilterComposer
    extends Composer<_$AppDatabase, $SubjectsTable> {
  $$SubjectsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sort_order => $composableBuilder(
    column: $table.sort_order,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get is_default => $composableBuilder(
    column: $table.is_default,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updated_at => $composableBuilder(
    column: $table.updated_at,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SubjectsTableOrderingComposer
    extends Composer<_$AppDatabase, $SubjectsTable> {
  $$SubjectsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sort_order => $composableBuilder(
    column: $table.sort_order,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get is_default => $composableBuilder(
    column: $table.is_default,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updated_at => $composableBuilder(
    column: $table.updated_at,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SubjectsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubjectsTable> {
  $$SubjectsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sort_order => $composableBuilder(
    column: $table.sort_order,
    builder: (column) => column,
  );

  GeneratedColumn<int> get is_default => $composableBuilder(
    column: $table.is_default,
    builder: (column) => column,
  );

  GeneratedColumn<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => column,
  );

  GeneratedColumn<int> get updated_at => $composableBuilder(
    column: $table.updated_at,
    builder: (column) => column,
  );
}

class $$SubjectsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SubjectsTable,
          Subject,
          $$SubjectsTableFilterComposer,
          $$SubjectsTableOrderingComposer,
          $$SubjectsTableAnnotationComposer,
          $$SubjectsTableCreateCompanionBuilder,
          $$SubjectsTableUpdateCompanionBuilder,
          (Subject, BaseReferences<_$AppDatabase, $SubjectsTable, Subject>),
          Subject,
          PrefetchHooks Function()
        > {
  $$SubjectsTableTableManager(_$AppDatabase db, $SubjectsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubjectsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubjectsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubjectsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> sort_order = const Value.absent(),
                Value<int> is_default = const Value.absent(),
                Value<int> created_at = const Value.absent(),
                Value<int> updated_at = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SubjectsCompanion(
                id: id,
                name: name,
                description: description,
                sort_order: sort_order,
                is_default: is_default,
                created_at: created_at,
                updated_at: updated_at,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<int> sort_order = const Value.absent(),
                Value<int> is_default = const Value.absent(),
                required int created_at,
                required int updated_at,
                Value<int> rowid = const Value.absent(),
              }) => SubjectsCompanion.insert(
                id: id,
                name: name,
                description: description,
                sort_order: sort_order,
                is_default: is_default,
                created_at: created_at,
                updated_at: updated_at,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SubjectsTable, Subject>(table),
                  BaseReferences<_$AppDatabase, $SubjectsTable, Subject>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SubjectsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SubjectsTable,
      Subject,
      $$SubjectsTableFilterComposer,
      $$SubjectsTableOrderingComposer,
      $$SubjectsTableAnnotationComposer,
      $$SubjectsTableCreateCompanionBuilder,
      $$SubjectsTableUpdateCompanionBuilder,
      (Subject, BaseReferences<_$AppDatabase, $SubjectsTable, Subject>),
      Subject,
      PrefetchHooks Function()
    >;
typedef $$StudyItemsTableCreateCompanionBuilder = StudyItemsCompanion Function({
  required String id,
  required String content_type,
  Value<String?> title,
  required String subject_id,
  Value<String?> category_id,
  Value<String?> content,
  Value<String?> my_answer,
  Value<String?> standard_answer,
  Value<String?> personal_note,
  required String mastery_level,
  required int is_mistake,
  required int is_favorite,
  Value<String?> difficulty,
  Value<String?> risk_level,
  required int created_at,
  required int updated_at,
  Value<int?> deleted_at,
  Value<int> rowid,
});
typedef $$StudyItemsTableUpdateCompanionBuilder = StudyItemsCompanion Function({
  Value<String> id,
  Value<String> content_type,
  Value<String?> title,
  Value<String> subject_id,
  Value<String?> category_id,
  Value<String?> content,
  Value<String?> my_answer,
  Value<String?> standard_answer,
  Value<String?> personal_note,
  Value<String> mastery_level,
  Value<int> is_mistake,
  Value<int> is_favorite,
  Value<String?> difficulty,
  Value<String?> risk_level,
  Value<int> created_at,
  Value<int> updated_at,
  Value<int?> deleted_at,
  Value<int> rowid,
});

class $$StudyItemsTableFilterComposer
    extends Composer<_$AppDatabase, $StudyItemsTable> {
  $$StudyItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content_type => $composableBuilder(
    column: $table.content_type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subject_id => $composableBuilder(
    column: $table.subject_id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category_id => $composableBuilder(
    column: $table.category_id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get my_answer => $composableBuilder(
    column: $table.my_answer,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get standard_answer => $composableBuilder(
    column: $table.standard_answer,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get personal_note => $composableBuilder(
    column: $table.personal_note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mastery_level => $composableBuilder(
    column: $table.mastery_level,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get is_mistake => $composableBuilder(
    column: $table.is_mistake,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get is_favorite => $composableBuilder(
    column: $table.is_favorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get risk_level => $composableBuilder(
    column: $table.risk_level,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updated_at => $composableBuilder(
    column: $table.updated_at,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deleted_at => $composableBuilder(
    column: $table.deleted_at,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StudyItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $StudyItemsTable> {
  $$StudyItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content_type => $composableBuilder(
    column: $table.content_type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subject_id => $composableBuilder(
    column: $table.subject_id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category_id => $composableBuilder(
    column: $table.category_id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get my_answer => $composableBuilder(
    column: $table.my_answer,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get standard_answer => $composableBuilder(
    column: $table.standard_answer,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get personal_note => $composableBuilder(
    column: $table.personal_note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mastery_level => $composableBuilder(
    column: $table.mastery_level,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get is_mistake => $composableBuilder(
    column: $table.is_mistake,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get is_favorite => $composableBuilder(
    column: $table.is_favorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get risk_level => $composableBuilder(
    column: $table.risk_level,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updated_at => $composableBuilder(
    column: $table.updated_at,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deleted_at => $composableBuilder(
    column: $table.deleted_at,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StudyItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StudyItemsTable> {
  $$StudyItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get content_type => $composableBuilder(
    column: $table.content_type,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get subject_id => $composableBuilder(
    column: $table.subject_id,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category_id => $composableBuilder(
    column: $table.category_id,
    builder: (column) => column,
  );

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get my_answer =>
      $composableBuilder(column: $table.my_answer, builder: (column) => column);

  GeneratedColumn<String> get standard_answer => $composableBuilder(
    column: $table.standard_answer,
    builder: (column) => column,
  );

  GeneratedColumn<String> get personal_note => $composableBuilder(
    column: $table.personal_note,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mastery_level => $composableBuilder(
    column: $table.mastery_level,
    builder: (column) => column,
  );

  GeneratedColumn<int> get is_mistake => $composableBuilder(
    column: $table.is_mistake,
    builder: (column) => column,
  );

  GeneratedColumn<int> get is_favorite => $composableBuilder(
    column: $table.is_favorite,
    builder: (column) => column,
  );

  GeneratedColumn<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => column,
  );

  GeneratedColumn<String> get risk_level => $composableBuilder(
    column: $table.risk_level,
    builder: (column) => column,
  );

  GeneratedColumn<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => column,
  );

  GeneratedColumn<int> get updated_at => $composableBuilder(
    column: $table.updated_at,
    builder: (column) => column,
  );

  GeneratedColumn<int> get deleted_at => $composableBuilder(
    column: $table.deleted_at,
    builder: (column) => column,
  );
}

class $$StudyItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StudyItemsTable,
          StudyItem,
          $$StudyItemsTableFilterComposer,
          $$StudyItemsTableOrderingComposer,
          $$StudyItemsTableAnnotationComposer,
          $$StudyItemsTableCreateCompanionBuilder,
          $$StudyItemsTableUpdateCompanionBuilder,
          (
            StudyItem,
            BaseReferences<_$AppDatabase, $StudyItemsTable, StudyItem>,
          ),
          StudyItem,
          PrefetchHooks Function()
        > {
  $$StudyItemsTableTableManager(_$AppDatabase db, $StudyItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudyItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudyItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudyItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> content_type = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String> subject_id = const Value.absent(),
                Value<String?> category_id = const Value.absent(),
                Value<String?> content = const Value.absent(),
                Value<String?> my_answer = const Value.absent(),
                Value<String?> standard_answer = const Value.absent(),
                Value<String?> personal_note = const Value.absent(),
                Value<String> mastery_level = const Value.absent(),
                Value<int> is_mistake = const Value.absent(),
                Value<int> is_favorite = const Value.absent(),
                Value<String?> difficulty = const Value.absent(),
                Value<String?> risk_level = const Value.absent(),
                Value<int> created_at = const Value.absent(),
                Value<int> updated_at = const Value.absent(),
                Value<int?> deleted_at = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StudyItemsCompanion(
                id: id,
                content_type: content_type,
                title: title,
                subject_id: subject_id,
                category_id: category_id,
                content: content,
                my_answer: my_answer,
                standard_answer: standard_answer,
                personal_note: personal_note,
                mastery_level: mastery_level,
                is_mistake: is_mistake,
                is_favorite: is_favorite,
                difficulty: difficulty,
                risk_level: risk_level,
                created_at: created_at,
                updated_at: updated_at,
                deleted_at: deleted_at,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String content_type,
                Value<String?> title = const Value.absent(),
                required String subject_id,
                Value<String?> category_id = const Value.absent(),
                Value<String?> content = const Value.absent(),
                Value<String?> my_answer = const Value.absent(),
                Value<String?> standard_answer = const Value.absent(),
                Value<String?> personal_note = const Value.absent(),
                required String mastery_level,
                required int is_mistake,
                required int is_favorite,
                Value<String?> difficulty = const Value.absent(),
                Value<String?> risk_level = const Value.absent(),
                required int created_at,
                required int updated_at,
                Value<int?> deleted_at = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StudyItemsCompanion.insert(
                id: id,
                content_type: content_type,
                title: title,
                subject_id: subject_id,
                category_id: category_id,
                content: content,
                my_answer: my_answer,
                standard_answer: standard_answer,
                personal_note: personal_note,
                mastery_level: mastery_level,
                is_mistake: is_mistake,
                is_favorite: is_favorite,
                difficulty: difficulty,
                risk_level: risk_level,
                created_at: created_at,
                updated_at: updated_at,
                deleted_at: deleted_at,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$StudyItemsTable, StudyItem>(table),
                  BaseReferences<_$AppDatabase, $StudyItemsTable, StudyItem>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StudyItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StudyItemsTable,
      StudyItem,
      $$StudyItemsTableFilterComposer,
      $$StudyItemsTableOrderingComposer,
      $$StudyItemsTableAnnotationComposer,
      $$StudyItemsTableCreateCompanionBuilder,
      $$StudyItemsTableUpdateCompanionBuilder,
      (StudyItem, BaseReferences<_$AppDatabase, $StudyItemsTable, StudyItem>),
      StudyItem,
      PrefetchHooks Function()
    >;
typedef $$CategoriesTableCreateCompanionBuilder = CategoriesCompanion Function({
  required String id,
  required String subject_id,
  Value<String?> parent_id,
  required String name,
  required int level,
  required int sort_order,
  Value<String?> description,
  required int created_at,
  required int updated_at,
  Value<int> rowid,
});
typedef $$CategoriesTableUpdateCompanionBuilder = CategoriesCompanion Function({
  Value<String> id,
  Value<String> subject_id,
  Value<String?> parent_id,
  Value<String> name,
  Value<int> level,
  Value<int> sort_order,
  Value<String?> description,
  Value<int> created_at,
  Value<int> updated_at,
  Value<int> rowid,
});

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subject_id => $composableBuilder(
    column: $table.subject_id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parent_id => $composableBuilder(
    column: $table.parent_id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sort_order => $composableBuilder(
    column: $table.sort_order,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updated_at => $composableBuilder(
    column: $table.updated_at,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subject_id => $composableBuilder(
    column: $table.subject_id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parent_id => $composableBuilder(
    column: $table.parent_id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sort_order => $composableBuilder(
    column: $table.sort_order,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updated_at => $composableBuilder(
    column: $table.updated_at,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get subject_id => $composableBuilder(
    column: $table.subject_id,
    builder: (column) => column,
  );

  GeneratedColumn<String> get parent_id =>
      $composableBuilder(column: $table.parent_id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<int> get sort_order => $composableBuilder(
    column: $table.sort_order,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => column,
  );

  GeneratedColumn<int> get updated_at => $composableBuilder(
    column: $table.updated_at,
    builder: (column) => column,
  );
}

class $$CategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesTable,
          Category,
          $$CategoriesTableFilterComposer,
          $$CategoriesTableOrderingComposer,
          $$CategoriesTableAnnotationComposer,
          $$CategoriesTableCreateCompanionBuilder,
          $$CategoriesTableUpdateCompanionBuilder,
          (Category, BaseReferences<_$AppDatabase, $CategoriesTable, Category>),
          Category,
          PrefetchHooks Function()
        > {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> subject_id = const Value.absent(),
                Value<String?> parent_id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> level = const Value.absent(),
                Value<int> sort_order = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> created_at = const Value.absent(),
                Value<int> updated_at = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoriesCompanion(
                id: id,
                subject_id: subject_id,
                parent_id: parent_id,
                name: name,
                level: level,
                sort_order: sort_order,
                description: description,
                created_at: created_at,
                updated_at: updated_at,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String subject_id,
                Value<String?> parent_id = const Value.absent(),
                required String name,
                required int level,
                required int sort_order,
                Value<String?> description = const Value.absent(),
                required int created_at,
                required int updated_at,
                Value<int> rowid = const Value.absent(),
              }) => CategoriesCompanion.insert(
                id: id,
                subject_id: subject_id,
                parent_id: parent_id,
                name: name,
                level: level,
                sort_order: sort_order,
                description: description,
                created_at: created_at,
                updated_at: updated_at,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CategoriesTable, Category>(table),
                  BaseReferences<_$AppDatabase, $CategoriesTable, Category>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesTable,
      Category,
      $$CategoriesTableFilterComposer,
      $$CategoriesTableOrderingComposer,
      $$CategoriesTableAnnotationComposer,
      $$CategoriesTableCreateCompanionBuilder,
      $$CategoriesTableUpdateCompanionBuilder,
      (Category, BaseReferences<_$AppDatabase, $CategoriesTable, Category>),
      Category,
      PrefetchHooks Function()
    >;
typedef $$ImagesTableCreateCompanionBuilder = ImagesCompanion Function({
  required String id,
  required String study_item_id,
  required String file_path,
  required String thumbnail_path,
  required int original_width,
  required int original_height,
  required int file_size,
  required int sort_order,
  required int created_at,
  Value<int> rowid,
});
typedef $$ImagesTableUpdateCompanionBuilder = ImagesCompanion Function({
  Value<String> id,
  Value<String> study_item_id,
  Value<String> file_path,
  Value<String> thumbnail_path,
  Value<int> original_width,
  Value<int> original_height,
  Value<int> file_size,
  Value<int> sort_order,
  Value<int> created_at,
  Value<int> rowid,
});

class $$ImagesTableFilterComposer
    extends Composer<_$AppDatabase, $ImagesTable> {
  $$ImagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get study_item_id => $composableBuilder(
    column: $table.study_item_id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get file_path => $composableBuilder(
    column: $table.file_path,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thumbnail_path => $composableBuilder(
    column: $table.thumbnail_path,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get original_width => $composableBuilder(
    column: $table.original_width,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get original_height => $composableBuilder(
    column: $table.original_height,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get file_size => $composableBuilder(
    column: $table.file_size,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sort_order => $composableBuilder(
    column: $table.sort_order,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ImagesTableOrderingComposer
    extends Composer<_$AppDatabase, $ImagesTable> {
  $$ImagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get study_item_id => $composableBuilder(
    column: $table.study_item_id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get file_path => $composableBuilder(
    column: $table.file_path,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbnail_path => $composableBuilder(
    column: $table.thumbnail_path,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get original_width => $composableBuilder(
    column: $table.original_width,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get original_height => $composableBuilder(
    column: $table.original_height,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get file_size => $composableBuilder(
    column: $table.file_size,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sort_order => $composableBuilder(
    column: $table.sort_order,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ImagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ImagesTable> {
  $$ImagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get study_item_id => $composableBuilder(
    column: $table.study_item_id,
    builder: (column) => column,
  );

  GeneratedColumn<String> get file_path =>
      $composableBuilder(column: $table.file_path, builder: (column) => column);

  GeneratedColumn<String> get thumbnail_path => $composableBuilder(
    column: $table.thumbnail_path,
    builder: (column) => column,
  );

  GeneratedColumn<int> get original_width => $composableBuilder(
    column: $table.original_width,
    builder: (column) => column,
  );

  GeneratedColumn<int> get original_height => $composableBuilder(
    column: $table.original_height,
    builder: (column) => column,
  );

  GeneratedColumn<int> get file_size =>
      $composableBuilder(column: $table.file_size, builder: (column) => column);

  GeneratedColumn<int> get sort_order => $composableBuilder(
    column: $table.sort_order,
    builder: (column) => column,
  );

  GeneratedColumn<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => column,
  );
}

class $$ImagesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ImagesTable,
          ImageRecord,
          $$ImagesTableFilterComposer,
          $$ImagesTableOrderingComposer,
          $$ImagesTableAnnotationComposer,
          $$ImagesTableCreateCompanionBuilder,
          $$ImagesTableUpdateCompanionBuilder,
          (
            ImageRecord,
            BaseReferences<_$AppDatabase, $ImagesTable, ImageRecord>,
          ),
          ImageRecord,
          PrefetchHooks Function()
        > {
  $$ImagesTableTableManager(_$AppDatabase db, $ImagesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ImagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ImagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ImagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> study_item_id = const Value.absent(),
                Value<String> file_path = const Value.absent(),
                Value<String> thumbnail_path = const Value.absent(),
                Value<int> original_width = const Value.absent(),
                Value<int> original_height = const Value.absent(),
                Value<int> file_size = const Value.absent(),
                Value<int> sort_order = const Value.absent(),
                Value<int> created_at = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ImagesCompanion(
                id: id,
                study_item_id: study_item_id,
                file_path: file_path,
                thumbnail_path: thumbnail_path,
                original_width: original_width,
                original_height: original_height,
                file_size: file_size,
                sort_order: sort_order,
                created_at: created_at,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String study_item_id,
                required String file_path,
                required String thumbnail_path,
                required int original_width,
                required int original_height,
                required int file_size,
                required int sort_order,
                required int created_at,
                Value<int> rowid = const Value.absent(),
              }) => ImagesCompanion.insert(
                id: id,
                study_item_id: study_item_id,
                file_path: file_path,
                thumbnail_path: thumbnail_path,
                original_width: original_width,
                original_height: original_height,
                file_size: file_size,
                sort_order: sort_order,
                created_at: created_at,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ImagesTable, ImageRecord>(table),
                  BaseReferences<_$AppDatabase, $ImagesTable, ImageRecord>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ImagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ImagesTable,
      ImageRecord,
      $$ImagesTableFilterComposer,
      $$ImagesTableOrderingComposer,
      $$ImagesTableAnnotationComposer,
      $$ImagesTableCreateCompanionBuilder,
      $$ImagesTableUpdateCompanionBuilder,
      (ImageRecord, BaseReferences<_$AppDatabase, $ImagesTable, ImageRecord>),
      ImageRecord,
      PrefetchHooks Function()
    >;
typedef $$TagsTableCreateCompanionBuilder = TagsCompanion Function({
  required String id,
  required String name,
  required int created_at,
  required int updated_at,
  Value<int> rowid,
});
typedef $$TagsTableUpdateCompanionBuilder = TagsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<int> created_at,
  Value<int> updated_at,
  Value<int> rowid,
});

class $$TagsTableFilterComposer extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updated_at => $composableBuilder(
    column: $table.updated_at,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TagsTableOrderingComposer extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updated_at => $composableBuilder(
    column: $table.updated_at,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => column,
  );

  GeneratedColumn<int> get updated_at => $composableBuilder(
    column: $table.updated_at,
    builder: (column) => column,
  );
}

class $$TagsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TagsTable,
          TagRecord,
          $$TagsTableFilterComposer,
          $$TagsTableOrderingComposer,
          $$TagsTableAnnotationComposer,
          $$TagsTableCreateCompanionBuilder,
          $$TagsTableUpdateCompanionBuilder,
          (TagRecord, BaseReferences<_$AppDatabase, $TagsTable, TagRecord>),
          TagRecord,
          PrefetchHooks Function()
        > {
  $$TagsTableTableManager(_$AppDatabase db, $TagsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> created_at = const Value.absent(),
                Value<int> updated_at = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TagsCompanion(
                id: id,
                name: name,
                created_at: created_at,
                updated_at: updated_at,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required int created_at,
                required int updated_at,
                Value<int> rowid = const Value.absent(),
              }) => TagsCompanion.insert(
                id: id,
                name: name,
                created_at: created_at,
                updated_at: updated_at,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TagsTable, TagRecord>(table),
                  BaseReferences<_$AppDatabase, $TagsTable, TagRecord>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TagsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TagsTable,
      TagRecord,
      $$TagsTableFilterComposer,
      $$TagsTableOrderingComposer,
      $$TagsTableAnnotationComposer,
      $$TagsTableCreateCompanionBuilder,
      $$TagsTableUpdateCompanionBuilder,
      (TagRecord, BaseReferences<_$AppDatabase, $TagsTable, TagRecord>),
      TagRecord,
      PrefetchHooks Function()
    >;
typedef $$StudyItemTagsTableCreateCompanionBuilder =
    StudyItemTagsCompanion Function({
      required String study_item_id,
      required String tag_id,
      Value<int> rowid,
    });
typedef $$StudyItemTagsTableUpdateCompanionBuilder =
    StudyItemTagsCompanion Function({
      Value<String> study_item_id,
      Value<String> tag_id,
      Value<int> rowid,
    });

class $$StudyItemTagsTableFilterComposer
    extends Composer<_$AppDatabase, $StudyItemTagsTable> {
  $$StudyItemTagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get study_item_id => $composableBuilder(
    column: $table.study_item_id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tag_id => $composableBuilder(
    column: $table.tag_id,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StudyItemTagsTableOrderingComposer
    extends Composer<_$AppDatabase, $StudyItemTagsTable> {
  $$StudyItemTagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get study_item_id => $composableBuilder(
    column: $table.study_item_id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tag_id => $composableBuilder(
    column: $table.tag_id,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StudyItemTagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StudyItemTagsTable> {
  $$StudyItemTagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get study_item_id => $composableBuilder(
    column: $table.study_item_id,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tag_id =>
      $composableBuilder(column: $table.tag_id, builder: (column) => column);
}

class $$StudyItemTagsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StudyItemTagsTable,
          StudyItemTagRecord,
          $$StudyItemTagsTableFilterComposer,
          $$StudyItemTagsTableOrderingComposer,
          $$StudyItemTagsTableAnnotationComposer,
          $$StudyItemTagsTableCreateCompanionBuilder,
          $$StudyItemTagsTableUpdateCompanionBuilder,
          (
            StudyItemTagRecord,
            BaseReferences<
              _$AppDatabase,
              $StudyItemTagsTable,
              StudyItemTagRecord
            >,
          ),
          StudyItemTagRecord,
          PrefetchHooks Function()
        > {
  $$StudyItemTagsTableTableManager(_$AppDatabase db, $StudyItemTagsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudyItemTagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudyItemTagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudyItemTagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> study_item_id = const Value.absent(),
                Value<String> tag_id = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StudyItemTagsCompanion(
                study_item_id: study_item_id,
                tag_id: tag_id,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String study_item_id,
                required String tag_id,
                Value<int> rowid = const Value.absent(),
              }) => StudyItemTagsCompanion.insert(
                study_item_id: study_item_id,
                tag_id: tag_id,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$StudyItemTagsTable, StudyItemTagRecord>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $StudyItemTagsTable,
                    StudyItemTagRecord
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StudyItemTagsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StudyItemTagsTable,
      StudyItemTagRecord,
      $$StudyItemTagsTableFilterComposer,
      $$StudyItemTagsTableOrderingComposer,
      $$StudyItemTagsTableAnnotationComposer,
      $$StudyItemTagsTableCreateCompanionBuilder,
      $$StudyItemTagsTableUpdateCompanionBuilder,
      (
        StudyItemTagRecord,
        BaseReferences<_$AppDatabase, $StudyItemTagsTable, StudyItemTagRecord>,
      ),
      StudyItemTagRecord,
      PrefetchHooks Function()
    >;
typedef $$FsrsCardsTableCreateCompanionBuilder = FsrsCardsCompanion Function({
  required String study_item_id,
  required int due,
  required double stability,
  required double difficulty,
  required int elapsed_days,
  required int scheduled_days,
  required int reps,
  required int lapses,
  required int state,
  Value<int?> last_review,
  required int created_at,
  required int updated_at,
  Value<int> rowid,
});
typedef $$FsrsCardsTableUpdateCompanionBuilder = FsrsCardsCompanion Function({
  Value<String> study_item_id,
  Value<int> due,
  Value<double> stability,
  Value<double> difficulty,
  Value<int> elapsed_days,
  Value<int> scheduled_days,
  Value<int> reps,
  Value<int> lapses,
  Value<int> state,
  Value<int?> last_review,
  Value<int> created_at,
  Value<int> updated_at,
  Value<int> rowid,
});

class $$FsrsCardsTableFilterComposer
    extends Composer<_$AppDatabase, $FsrsCardsTable> {
  $$FsrsCardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get study_item_id => $composableBuilder(
    column: $table.study_item_id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get due => $composableBuilder(
    column: $table.due,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get stability => $composableBuilder(
    column: $table.stability,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get elapsed_days => $composableBuilder(
    column: $table.elapsed_days,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get scheduled_days => $composableBuilder(
    column: $table.scheduled_days,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lapses => $composableBuilder(
    column: $table.lapses,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get last_review => $composableBuilder(
    column: $table.last_review,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updated_at => $composableBuilder(
    column: $table.updated_at,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FsrsCardsTableOrderingComposer
    extends Composer<_$AppDatabase, $FsrsCardsTable> {
  $$FsrsCardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get study_item_id => $composableBuilder(
    column: $table.study_item_id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get due => $composableBuilder(
    column: $table.due,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get stability => $composableBuilder(
    column: $table.stability,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get elapsed_days => $composableBuilder(
    column: $table.elapsed_days,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get scheduled_days => $composableBuilder(
    column: $table.scheduled_days,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lapses => $composableBuilder(
    column: $table.lapses,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get last_review => $composableBuilder(
    column: $table.last_review,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updated_at => $composableBuilder(
    column: $table.updated_at,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FsrsCardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FsrsCardsTable> {
  $$FsrsCardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get study_item_id => $composableBuilder(
    column: $table.study_item_id,
    builder: (column) => column,
  );

  GeneratedColumn<int> get due =>
      $composableBuilder(column: $table.due, builder: (column) => column);

  GeneratedColumn<double> get stability =>
      $composableBuilder(column: $table.stability, builder: (column) => column);

  GeneratedColumn<double> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => column,
  );

  GeneratedColumn<int> get elapsed_days => $composableBuilder(
    column: $table.elapsed_days,
    builder: (column) => column,
  );

  GeneratedColumn<int> get scheduled_days => $composableBuilder(
    column: $table.scheduled_days,
    builder: (column) => column,
  );

  GeneratedColumn<int> get reps =>
      $composableBuilder(column: $table.reps, builder: (column) => column);

  GeneratedColumn<int> get lapses =>
      $composableBuilder(column: $table.lapses, builder: (column) => column);

  GeneratedColumn<int> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<int> get last_review => $composableBuilder(
    column: $table.last_review,
    builder: (column) => column,
  );

  GeneratedColumn<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => column,
  );

  GeneratedColumn<int> get updated_at => $composableBuilder(
    column: $table.updated_at,
    builder: (column) => column,
  );
}

class $$FsrsCardsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FsrsCardsTable,
          FsrsCardRecord,
          $$FsrsCardsTableFilterComposer,
          $$FsrsCardsTableOrderingComposer,
          $$FsrsCardsTableAnnotationComposer,
          $$FsrsCardsTableCreateCompanionBuilder,
          $$FsrsCardsTableUpdateCompanionBuilder,
          (
            FsrsCardRecord,
            BaseReferences<_$AppDatabase, $FsrsCardsTable, FsrsCardRecord>,
          ),
          FsrsCardRecord,
          PrefetchHooks Function()
        > {
  $$FsrsCardsTableTableManager(_$AppDatabase db, $FsrsCardsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FsrsCardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FsrsCardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FsrsCardsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> study_item_id = const Value.absent(),
                Value<int> due = const Value.absent(),
                Value<double> stability = const Value.absent(),
                Value<double> difficulty = const Value.absent(),
                Value<int> elapsed_days = const Value.absent(),
                Value<int> scheduled_days = const Value.absent(),
                Value<int> reps = const Value.absent(),
                Value<int> lapses = const Value.absent(),
                Value<int> state = const Value.absent(),
                Value<int?> last_review = const Value.absent(),
                Value<int> created_at = const Value.absent(),
                Value<int> updated_at = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FsrsCardsCompanion(
                study_item_id: study_item_id,
                due: due,
                stability: stability,
                difficulty: difficulty,
                elapsed_days: elapsed_days,
                scheduled_days: scheduled_days,
                reps: reps,
                lapses: lapses,
                state: state,
                last_review: last_review,
                created_at: created_at,
                updated_at: updated_at,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String study_item_id,
                required int due,
                required double stability,
                required double difficulty,
                required int elapsed_days,
                required int scheduled_days,
                required int reps,
                required int lapses,
                required int state,
                Value<int?> last_review = const Value.absent(),
                required int created_at,
                required int updated_at,
                Value<int> rowid = const Value.absent(),
              }) => FsrsCardsCompanion.insert(
                study_item_id: study_item_id,
                due: due,
                stability: stability,
                difficulty: difficulty,
                elapsed_days: elapsed_days,
                scheduled_days: scheduled_days,
                reps: reps,
                lapses: lapses,
                state: state,
                last_review: last_review,
                created_at: created_at,
                updated_at: updated_at,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$FsrsCardsTable, FsrsCardRecord>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $FsrsCardsTable,
                    FsrsCardRecord
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FsrsCardsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FsrsCardsTable,
      FsrsCardRecord,
      $$FsrsCardsTableFilterComposer,
      $$FsrsCardsTableOrderingComposer,
      $$FsrsCardsTableAnnotationComposer,
      $$FsrsCardsTableCreateCompanionBuilder,
      $$FsrsCardsTableUpdateCompanionBuilder,
      (
        FsrsCardRecord,
        BaseReferences<_$AppDatabase, $FsrsCardsTable, FsrsCardRecord>,
      ),
      FsrsCardRecord,
      PrefetchHooks Function()
    >;
typedef $$ReviewRecordsTableCreateCompanionBuilder =
    ReviewRecordsCompanion Function({
      required String id,
      required String study_item_id,
      required int review_time,
      required String rating,
      required int response_time,
      required int previous_due,
      required int next_due,
      required int scheduled_days,
      required int is_overdue,
      required int created_at,
      Value<int> rowid,
    });
typedef $$ReviewRecordsTableUpdateCompanionBuilder =
    ReviewRecordsCompanion Function({
      Value<String> id,
      Value<String> study_item_id,
      Value<int> review_time,
      Value<String> rating,
      Value<int> response_time,
      Value<int> previous_due,
      Value<int> next_due,
      Value<int> scheduled_days,
      Value<int> is_overdue,
      Value<int> created_at,
      Value<int> rowid,
    });

class $$ReviewRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $ReviewRecordsTable> {
  $$ReviewRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get study_item_id => $composableBuilder(
    column: $table.study_item_id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get review_time => $composableBuilder(
    column: $table.review_time,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get response_time => $composableBuilder(
    column: $table.response_time,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get previous_due => $composableBuilder(
    column: $table.previous_due,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get next_due => $composableBuilder(
    column: $table.next_due,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get scheduled_days => $composableBuilder(
    column: $table.scheduled_days,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get is_overdue => $composableBuilder(
    column: $table.is_overdue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ReviewRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReviewRecordsTable> {
  $$ReviewRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get study_item_id => $composableBuilder(
    column: $table.study_item_id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get review_time => $composableBuilder(
    column: $table.review_time,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get response_time => $composableBuilder(
    column: $table.response_time,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get previous_due => $composableBuilder(
    column: $table.previous_due,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get next_due => $composableBuilder(
    column: $table.next_due,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get scheduled_days => $composableBuilder(
    column: $table.scheduled_days,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get is_overdue => $composableBuilder(
    column: $table.is_overdue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReviewRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReviewRecordsTable> {
  $$ReviewRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get study_item_id => $composableBuilder(
    column: $table.study_item_id,
    builder: (column) => column,
  );

  GeneratedColumn<int> get review_time => $composableBuilder(
    column: $table.review_time,
    builder: (column) => column,
  );

  GeneratedColumn<String> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<int> get response_time => $composableBuilder(
    column: $table.response_time,
    builder: (column) => column,
  );

  GeneratedColumn<int> get previous_due => $composableBuilder(
    column: $table.previous_due,
    builder: (column) => column,
  );

  GeneratedColumn<int> get next_due =>
      $composableBuilder(column: $table.next_due, builder: (column) => column);

  GeneratedColumn<int> get scheduled_days => $composableBuilder(
    column: $table.scheduled_days,
    builder: (column) => column,
  );

  GeneratedColumn<int> get is_overdue => $composableBuilder(
    column: $table.is_overdue,
    builder: (column) => column,
  );

  GeneratedColumn<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => column,
  );
}

class $$ReviewRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReviewRecordsTable,
          ReviewRecord,
          $$ReviewRecordsTableFilterComposer,
          $$ReviewRecordsTableOrderingComposer,
          $$ReviewRecordsTableAnnotationComposer,
          $$ReviewRecordsTableCreateCompanionBuilder,
          $$ReviewRecordsTableUpdateCompanionBuilder,
          (
            ReviewRecord,
            BaseReferences<_$AppDatabase, $ReviewRecordsTable, ReviewRecord>,
          ),
          ReviewRecord,
          PrefetchHooks Function()
        > {
  $$ReviewRecordsTableTableManager(_$AppDatabase db, $ReviewRecordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReviewRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReviewRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReviewRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> study_item_id = const Value.absent(),
                Value<int> review_time = const Value.absent(),
                Value<String> rating = const Value.absent(),
                Value<int> response_time = const Value.absent(),
                Value<int> previous_due = const Value.absent(),
                Value<int> next_due = const Value.absent(),
                Value<int> scheduled_days = const Value.absent(),
                Value<int> is_overdue = const Value.absent(),
                Value<int> created_at = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReviewRecordsCompanion(
                id: id,
                study_item_id: study_item_id,
                review_time: review_time,
                rating: rating,
                response_time: response_time,
                previous_due: previous_due,
                next_due: next_due,
                scheduled_days: scheduled_days,
                is_overdue: is_overdue,
                created_at: created_at,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String study_item_id,
                required int review_time,
                required String rating,
                required int response_time,
                required int previous_due,
                required int next_due,
                required int scheduled_days,
                required int is_overdue,
                required int created_at,
                Value<int> rowid = const Value.absent(),
              }) => ReviewRecordsCompanion.insert(
                id: id,
                study_item_id: study_item_id,
                review_time: review_time,
                rating: rating,
                response_time: response_time,
                previous_due: previous_due,
                next_due: next_due,
                scheduled_days: scheduled_days,
                is_overdue: is_overdue,
                created_at: created_at,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ReviewRecordsTable, ReviewRecord>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $ReviewRecordsTable,
                    ReviewRecord
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReviewRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReviewRecordsTable,
      ReviewRecord,
      $$ReviewRecordsTableFilterComposer,
      $$ReviewRecordsTableOrderingComposer,
      $$ReviewRecordsTableAnnotationComposer,
      $$ReviewRecordsTableCreateCompanionBuilder,
      $$ReviewRecordsTableUpdateCompanionBuilder,
      (
        ReviewRecord,
        BaseReferences<_$AppDatabase, $ReviewRecordsTable, ReviewRecord>,
      ),
      ReviewRecord,
      PrefetchHooks Function()
    >;
typedef $$MistakeRecordsTableCreateCompanionBuilder =
    MistakeRecordsCompanion Function({
      required String id,
      required String study_item_id,
      required int first_marked_at,
      required int last_error_at,
      required int error_count,
      Value<String?> last_error_reason,
      required int created_at,
      required int updated_at,
      Value<int> rowid,
    });
typedef $$MistakeRecordsTableUpdateCompanionBuilder =
    MistakeRecordsCompanion Function({
      Value<String> id,
      Value<String> study_item_id,
      Value<int> first_marked_at,
      Value<int> last_error_at,
      Value<int> error_count,
      Value<String?> last_error_reason,
      Value<int> created_at,
      Value<int> updated_at,
      Value<int> rowid,
    });

class $$MistakeRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $MistakeRecordsTable> {
  $$MistakeRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get study_item_id => $composableBuilder(
    column: $table.study_item_id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get first_marked_at => $composableBuilder(
    column: $table.first_marked_at,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get last_error_at => $composableBuilder(
    column: $table.last_error_at,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get error_count => $composableBuilder(
    column: $table.error_count,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get last_error_reason => $composableBuilder(
    column: $table.last_error_reason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updated_at => $composableBuilder(
    column: $table.updated_at,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MistakeRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $MistakeRecordsTable> {
  $$MistakeRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get study_item_id => $composableBuilder(
    column: $table.study_item_id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get first_marked_at => $composableBuilder(
    column: $table.first_marked_at,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get last_error_at => $composableBuilder(
    column: $table.last_error_at,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get error_count => $composableBuilder(
    column: $table.error_count,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get last_error_reason => $composableBuilder(
    column: $table.last_error_reason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updated_at => $composableBuilder(
    column: $table.updated_at,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MistakeRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MistakeRecordsTable> {
  $$MistakeRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get study_item_id => $composableBuilder(
    column: $table.study_item_id,
    builder: (column) => column,
  );

  GeneratedColumn<int> get first_marked_at => $composableBuilder(
    column: $table.first_marked_at,
    builder: (column) => column,
  );

  GeneratedColumn<int> get last_error_at => $composableBuilder(
    column: $table.last_error_at,
    builder: (column) => column,
  );

  GeneratedColumn<int> get error_count => $composableBuilder(
    column: $table.error_count,
    builder: (column) => column,
  );

  GeneratedColumn<String> get last_error_reason => $composableBuilder(
    column: $table.last_error_reason,
    builder: (column) => column,
  );

  GeneratedColumn<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => column,
  );

  GeneratedColumn<int> get updated_at => $composableBuilder(
    column: $table.updated_at,
    builder: (column) => column,
  );
}

class $$MistakeRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MistakeRecordsTable,
          MistakeRecord,
          $$MistakeRecordsTableFilterComposer,
          $$MistakeRecordsTableOrderingComposer,
          $$MistakeRecordsTableAnnotationComposer,
          $$MistakeRecordsTableCreateCompanionBuilder,
          $$MistakeRecordsTableUpdateCompanionBuilder,
          (
            MistakeRecord,
            BaseReferences<_$AppDatabase, $MistakeRecordsTable, MistakeRecord>,
          ),
          MistakeRecord,
          PrefetchHooks Function()
        > {
  $$MistakeRecordsTableTableManager(
    _$AppDatabase db,
    $MistakeRecordsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MistakeRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MistakeRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MistakeRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> study_item_id = const Value.absent(),
                Value<int> first_marked_at = const Value.absent(),
                Value<int> last_error_at = const Value.absent(),
                Value<int> error_count = const Value.absent(),
                Value<String?> last_error_reason = const Value.absent(),
                Value<int> created_at = const Value.absent(),
                Value<int> updated_at = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MistakeRecordsCompanion(
                id: id,
                study_item_id: study_item_id,
                first_marked_at: first_marked_at,
                last_error_at: last_error_at,
                error_count: error_count,
                last_error_reason: last_error_reason,
                created_at: created_at,
                updated_at: updated_at,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String study_item_id,
                required int first_marked_at,
                required int last_error_at,
                required int error_count,
                Value<String?> last_error_reason = const Value.absent(),
                required int created_at,
                required int updated_at,
                Value<int> rowid = const Value.absent(),
              }) => MistakeRecordsCompanion.insert(
                id: id,
                study_item_id: study_item_id,
                first_marked_at: first_marked_at,
                last_error_at: last_error_at,
                error_count: error_count,
                last_error_reason: last_error_reason,
                created_at: created_at,
                updated_at: updated_at,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$MistakeRecordsTable, MistakeRecord>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $MistakeRecordsTable,
                    MistakeRecord
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MistakeRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MistakeRecordsTable,
      MistakeRecord,
      $$MistakeRecordsTableFilterComposer,
      $$MistakeRecordsTableOrderingComposer,
      $$MistakeRecordsTableAnnotationComposer,
      $$MistakeRecordsTableCreateCompanionBuilder,
      $$MistakeRecordsTableUpdateCompanionBuilder,
      (
        MistakeRecord,
        BaseReferences<_$AppDatabase, $MistakeRecordsTable, MistakeRecord>,
      ),
      MistakeRecord,
      PrefetchHooks Function()
    >;
typedef $$MistakeReasonsTableCreateCompanionBuilder =
    MistakeReasonsCompanion Function({
      required String id,
      required String name,
      required int sort_order,
      required int is_default,
      required int created_at,
      Value<int> rowid,
    });
typedef $$MistakeReasonsTableUpdateCompanionBuilder =
    MistakeReasonsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> sort_order,
      Value<int> is_default,
      Value<int> created_at,
      Value<int> rowid,
    });

class $$MistakeReasonsTableFilterComposer
    extends Composer<_$AppDatabase, $MistakeReasonsTable> {
  $$MistakeReasonsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sort_order => $composableBuilder(
    column: $table.sort_order,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get is_default => $composableBuilder(
    column: $table.is_default,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MistakeReasonsTableOrderingComposer
    extends Composer<_$AppDatabase, $MistakeReasonsTable> {
  $$MistakeReasonsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sort_order => $composableBuilder(
    column: $table.sort_order,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get is_default => $composableBuilder(
    column: $table.is_default,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MistakeReasonsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MistakeReasonsTable> {
  $$MistakeReasonsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get sort_order => $composableBuilder(
    column: $table.sort_order,
    builder: (column) => column,
  );

  GeneratedColumn<int> get is_default => $composableBuilder(
    column: $table.is_default,
    builder: (column) => column,
  );

  GeneratedColumn<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => column,
  );
}

class $$MistakeReasonsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MistakeReasonsTable,
          MistakeReason,
          $$MistakeReasonsTableFilterComposer,
          $$MistakeReasonsTableOrderingComposer,
          $$MistakeReasonsTableAnnotationComposer,
          $$MistakeReasonsTableCreateCompanionBuilder,
          $$MistakeReasonsTableUpdateCompanionBuilder,
          (
            MistakeReason,
            BaseReferences<_$AppDatabase, $MistakeReasonsTable, MistakeReason>,
          ),
          MistakeReason,
          PrefetchHooks Function()
        > {
  $$MistakeReasonsTableTableManager(
    _$AppDatabase db,
    $MistakeReasonsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MistakeReasonsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MistakeReasonsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MistakeReasonsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> sort_order = const Value.absent(),
                Value<int> is_default = const Value.absent(),
                Value<int> created_at = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MistakeReasonsCompanion(
                id: id,
                name: name,
                sort_order: sort_order,
                is_default: is_default,
                created_at: created_at,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required int sort_order,
                required int is_default,
                required int created_at,
                Value<int> rowid = const Value.absent(),
              }) => MistakeReasonsCompanion.insert(
                id: id,
                name: name,
                sort_order: sort_order,
                is_default: is_default,
                created_at: created_at,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$MistakeReasonsTable, MistakeReason>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $MistakeReasonsTable,
                    MistakeReason
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MistakeReasonsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MistakeReasonsTable,
      MistakeReason,
      $$MistakeReasonsTableFilterComposer,
      $$MistakeReasonsTableOrderingComposer,
      $$MistakeReasonsTableAnnotationComposer,
      $$MistakeReasonsTableCreateCompanionBuilder,
      $$MistakeReasonsTableUpdateCompanionBuilder,
      (
        MistakeReason,
        BaseReferences<_$AppDatabase, $MistakeReasonsTable, MistakeReason>,
      ),
      MistakeReason,
      PrefetchHooks Function()
    >;
typedef $$MistakeRecordReasonsTableCreateCompanionBuilder =
    MistakeRecordReasonsCompanion Function({
      required String mistake_record_id,
      required String reason_id,
      Value<int> rowid,
    });
typedef $$MistakeRecordReasonsTableUpdateCompanionBuilder =
    MistakeRecordReasonsCompanion Function({
      Value<String> mistake_record_id,
      Value<String> reason_id,
      Value<int> rowid,
    });

class $$MistakeRecordReasonsTableFilterComposer
    extends Composer<_$AppDatabase, $MistakeRecordReasonsTable> {
  $$MistakeRecordReasonsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get mistake_record_id => $composableBuilder(
    column: $table.mistake_record_id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reason_id => $composableBuilder(
    column: $table.reason_id,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MistakeRecordReasonsTableOrderingComposer
    extends Composer<_$AppDatabase, $MistakeRecordReasonsTable> {
  $$MistakeRecordReasonsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get mistake_record_id => $composableBuilder(
    column: $table.mistake_record_id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reason_id => $composableBuilder(
    column: $table.reason_id,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MistakeRecordReasonsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MistakeRecordReasonsTable> {
  $$MistakeRecordReasonsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get mistake_record_id => $composableBuilder(
    column: $table.mistake_record_id,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reason_id =>
      $composableBuilder(column: $table.reason_id, builder: (column) => column);
}

class $$MistakeRecordReasonsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MistakeRecordReasonsTable,
          MistakeRecordReason,
          $$MistakeRecordReasonsTableFilterComposer,
          $$MistakeRecordReasonsTableOrderingComposer,
          $$MistakeRecordReasonsTableAnnotationComposer,
          $$MistakeRecordReasonsTableCreateCompanionBuilder,
          $$MistakeRecordReasonsTableUpdateCompanionBuilder,
          (
            MistakeRecordReason,
            BaseReferences<
              _$AppDatabase,
              $MistakeRecordReasonsTable,
              MistakeRecordReason
            >,
          ),
          MistakeRecordReason,
          PrefetchHooks Function()
        > {
  $$MistakeRecordReasonsTableTableManager(
    _$AppDatabase db,
    $MistakeRecordReasonsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MistakeRecordReasonsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MistakeRecordReasonsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$MistakeRecordReasonsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> mistake_record_id = const Value.absent(),
                Value<String> reason_id = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MistakeRecordReasonsCompanion(
                mistake_record_id: mistake_record_id,
                reason_id: reason_id,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String mistake_record_id,
                required String reason_id,
                Value<int> rowid = const Value.absent(),
              }) => MistakeRecordReasonsCompanion.insert(
                mistake_record_id: mistake_record_id,
                reason_id: reason_id,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$MistakeRecordReasonsTable, MistakeRecordReason>(
                    table,
                  ),
                  BaseReferences<
                    _$AppDatabase,
                    $MistakeRecordReasonsTable,
                    MistakeRecordReason
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MistakeRecordReasonsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MistakeRecordReasonsTable,
      MistakeRecordReason,
      $$MistakeRecordReasonsTableFilterComposer,
      $$MistakeRecordReasonsTableOrderingComposer,
      $$MistakeRecordReasonsTableAnnotationComposer,
      $$MistakeRecordReasonsTableCreateCompanionBuilder,
      $$MistakeRecordReasonsTableUpdateCompanionBuilder,
      (
        MistakeRecordReason,
        BaseReferences<
          _$AppDatabase,
          $MistakeRecordReasonsTable,
          MistakeRecordReason
        >,
      ),
      MistakeRecordReason,
      PrefetchHooks Function()
    >;
typedef $$PracticePlansTableCreateCompanionBuilder =
    PracticePlansCompanion Function({
      required String id,
      required String name,
      required String filter_config,
      required int question_count,
      required String sort_type,
      required int created_at,
      required int updated_at,
      Value<int> rowid,
    });
typedef $$PracticePlansTableUpdateCompanionBuilder =
    PracticePlansCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> filter_config,
      Value<int> question_count,
      Value<String> sort_type,
      Value<int> created_at,
      Value<int> updated_at,
      Value<int> rowid,
    });

class $$PracticePlansTableFilterComposer
    extends Composer<_$AppDatabase, $PracticePlansTable> {
  $$PracticePlansTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filter_config => $composableBuilder(
    column: $table.filter_config,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get question_count => $composableBuilder(
    column: $table.question_count,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sort_type => $composableBuilder(
    column: $table.sort_type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updated_at => $composableBuilder(
    column: $table.updated_at,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PracticePlansTableOrderingComposer
    extends Composer<_$AppDatabase, $PracticePlansTable> {
  $$PracticePlansTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filter_config => $composableBuilder(
    column: $table.filter_config,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get question_count => $composableBuilder(
    column: $table.question_count,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sort_type => $composableBuilder(
    column: $table.sort_type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updated_at => $composableBuilder(
    column: $table.updated_at,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PracticePlansTableAnnotationComposer
    extends Composer<_$AppDatabase, $PracticePlansTable> {
  $$PracticePlansTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get filter_config => $composableBuilder(
    column: $table.filter_config,
    builder: (column) => column,
  );

  GeneratedColumn<int> get question_count => $composableBuilder(
    column: $table.question_count,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sort_type =>
      $composableBuilder(column: $table.sort_type, builder: (column) => column);

  GeneratedColumn<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => column,
  );

  GeneratedColumn<int> get updated_at => $composableBuilder(
    column: $table.updated_at,
    builder: (column) => column,
  );
}

class $$PracticePlansTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PracticePlansTable,
          PracticePlan,
          $$PracticePlansTableFilterComposer,
          $$PracticePlansTableOrderingComposer,
          $$PracticePlansTableAnnotationComposer,
          $$PracticePlansTableCreateCompanionBuilder,
          $$PracticePlansTableUpdateCompanionBuilder,
          (
            PracticePlan,
            BaseReferences<_$AppDatabase, $PracticePlansTable, PracticePlan>,
          ),
          PracticePlan,
          PrefetchHooks Function()
        > {
  $$PracticePlansTableTableManager(_$AppDatabase db, $PracticePlansTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PracticePlansTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PracticePlansTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PracticePlansTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> filter_config = const Value.absent(),
                Value<int> question_count = const Value.absent(),
                Value<String> sort_type = const Value.absent(),
                Value<int> created_at = const Value.absent(),
                Value<int> updated_at = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PracticePlansCompanion(
                id: id,
                name: name,
                filter_config: filter_config,
                question_count: question_count,
                sort_type: sort_type,
                created_at: created_at,
                updated_at: updated_at,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String filter_config,
                required int question_count,
                required String sort_type,
                required int created_at,
                required int updated_at,
                Value<int> rowid = const Value.absent(),
              }) => PracticePlansCompanion.insert(
                id: id,
                name: name,
                filter_config: filter_config,
                question_count: question_count,
                sort_type: sort_type,
                created_at: created_at,
                updated_at: updated_at,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PracticePlansTable, PracticePlan>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $PracticePlansTable,
                    PracticePlan
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PracticePlansTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PracticePlansTable,
      PracticePlan,
      $$PracticePlansTableFilterComposer,
      $$PracticePlansTableOrderingComposer,
      $$PracticePlansTableAnnotationComposer,
      $$PracticePlansTableCreateCompanionBuilder,
      $$PracticePlansTableUpdateCompanionBuilder,
      (
        PracticePlan,
        BaseReferences<_$AppDatabase, $PracticePlansTable, PracticePlan>,
      ),
      PracticePlan,
      PrefetchHooks Function()
    >;
typedef $$PracticeSessionsTableCreateCompanionBuilder =
    PracticeSessionsCompanion Function({
      required String id,
      required String plan_id,
      required int started_at,
      required int finished_at,
      required int total_count,
      required int correct_count,
      required int wrong_count,
      required int skipped_count,
      required int hesitated_count,
      required int total_time,
      required double average_time,
      required int count_as_review,
      required int created_at,
      Value<int> rowid,
    });
typedef $$PracticeSessionsTableUpdateCompanionBuilder =
    PracticeSessionsCompanion Function({
      Value<String> id,
      Value<String> plan_id,
      Value<int> started_at,
      Value<int> finished_at,
      Value<int> total_count,
      Value<int> correct_count,
      Value<int> wrong_count,
      Value<int> skipped_count,
      Value<int> hesitated_count,
      Value<int> total_time,
      Value<double> average_time,
      Value<int> count_as_review,
      Value<int> created_at,
      Value<int> rowid,
    });

class $$PracticeSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $PracticeSessionsTable> {
  $$PracticeSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get plan_id => $composableBuilder(
    column: $table.plan_id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get started_at => $composableBuilder(
    column: $table.started_at,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get finished_at => $composableBuilder(
    column: $table.finished_at,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get total_count => $composableBuilder(
    column: $table.total_count,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get correct_count => $composableBuilder(
    column: $table.correct_count,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get wrong_count => $composableBuilder(
    column: $table.wrong_count,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get skipped_count => $composableBuilder(
    column: $table.skipped_count,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hesitated_count => $composableBuilder(
    column: $table.hesitated_count,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get total_time => $composableBuilder(
    column: $table.total_time,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get average_time => $composableBuilder(
    column: $table.average_time,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get count_as_review => $composableBuilder(
    column: $table.count_as_review,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PracticeSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $PracticeSessionsTable> {
  $$PracticeSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get plan_id => $composableBuilder(
    column: $table.plan_id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get started_at => $composableBuilder(
    column: $table.started_at,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get finished_at => $composableBuilder(
    column: $table.finished_at,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get total_count => $composableBuilder(
    column: $table.total_count,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get correct_count => $composableBuilder(
    column: $table.correct_count,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get wrong_count => $composableBuilder(
    column: $table.wrong_count,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get skipped_count => $composableBuilder(
    column: $table.skipped_count,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hesitated_count => $composableBuilder(
    column: $table.hesitated_count,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get total_time => $composableBuilder(
    column: $table.total_time,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get average_time => $composableBuilder(
    column: $table.average_time,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get count_as_review => $composableBuilder(
    column: $table.count_as_review,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PracticeSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PracticeSessionsTable> {
  $$PracticeSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get plan_id =>
      $composableBuilder(column: $table.plan_id, builder: (column) => column);

  GeneratedColumn<int> get started_at => $composableBuilder(
    column: $table.started_at,
    builder: (column) => column,
  );

  GeneratedColumn<int> get finished_at => $composableBuilder(
    column: $table.finished_at,
    builder: (column) => column,
  );

  GeneratedColumn<int> get total_count => $composableBuilder(
    column: $table.total_count,
    builder: (column) => column,
  );

  GeneratedColumn<int> get correct_count => $composableBuilder(
    column: $table.correct_count,
    builder: (column) => column,
  );

  GeneratedColumn<int> get wrong_count => $composableBuilder(
    column: $table.wrong_count,
    builder: (column) => column,
  );

  GeneratedColumn<int> get skipped_count => $composableBuilder(
    column: $table.skipped_count,
    builder: (column) => column,
  );

  GeneratedColumn<int> get hesitated_count => $composableBuilder(
    column: $table.hesitated_count,
    builder: (column) => column,
  );

  GeneratedColumn<int> get total_time => $composableBuilder(
    column: $table.total_time,
    builder: (column) => column,
  );

  GeneratedColumn<double> get average_time => $composableBuilder(
    column: $table.average_time,
    builder: (column) => column,
  );

  GeneratedColumn<int> get count_as_review => $composableBuilder(
    column: $table.count_as_review,
    builder: (column) => column,
  );

  GeneratedColumn<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => column,
  );
}

class $$PracticeSessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PracticeSessionsTable,
          PracticeSession,
          $$PracticeSessionsTableFilterComposer,
          $$PracticeSessionsTableOrderingComposer,
          $$PracticeSessionsTableAnnotationComposer,
          $$PracticeSessionsTableCreateCompanionBuilder,
          $$PracticeSessionsTableUpdateCompanionBuilder,
          (
            PracticeSession,
            BaseReferences<
              _$AppDatabase,
              $PracticeSessionsTable,
              PracticeSession
            >,
          ),
          PracticeSession,
          PrefetchHooks Function()
        > {
  $$PracticeSessionsTableTableManager(
    _$AppDatabase db,
    $PracticeSessionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PracticeSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PracticeSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PracticeSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> plan_id = const Value.absent(),
                Value<int> started_at = const Value.absent(),
                Value<int> finished_at = const Value.absent(),
                Value<int> total_count = const Value.absent(),
                Value<int> correct_count = const Value.absent(),
                Value<int> wrong_count = const Value.absent(),
                Value<int> skipped_count = const Value.absent(),
                Value<int> hesitated_count = const Value.absent(),
                Value<int> total_time = const Value.absent(),
                Value<double> average_time = const Value.absent(),
                Value<int> count_as_review = const Value.absent(),
                Value<int> created_at = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PracticeSessionsCompanion(
                id: id,
                plan_id: plan_id,
                started_at: started_at,
                finished_at: finished_at,
                total_count: total_count,
                correct_count: correct_count,
                wrong_count: wrong_count,
                skipped_count: skipped_count,
                hesitated_count: hesitated_count,
                total_time: total_time,
                average_time: average_time,
                count_as_review: count_as_review,
                created_at: created_at,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String plan_id,
                required int started_at,
                required int finished_at,
                required int total_count,
                required int correct_count,
                required int wrong_count,
                required int skipped_count,
                required int hesitated_count,
                required int total_time,
                required double average_time,
                required int count_as_review,
                required int created_at,
                Value<int> rowid = const Value.absent(),
              }) => PracticeSessionsCompanion.insert(
                id: id,
                plan_id: plan_id,
                started_at: started_at,
                finished_at: finished_at,
                total_count: total_count,
                correct_count: correct_count,
                wrong_count: wrong_count,
                skipped_count: skipped_count,
                hesitated_count: hesitated_count,
                total_time: total_time,
                average_time: average_time,
                count_as_review: count_as_review,
                created_at: created_at,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PracticeSessionsTable, PracticeSession>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $PracticeSessionsTable,
                    PracticeSession
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PracticeSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PracticeSessionsTable,
      PracticeSession,
      $$PracticeSessionsTableFilterComposer,
      $$PracticeSessionsTableOrderingComposer,
      $$PracticeSessionsTableAnnotationComposer,
      $$PracticeSessionsTableCreateCompanionBuilder,
      $$PracticeSessionsTableUpdateCompanionBuilder,
      (
        PracticeSession,
        BaseReferences<_$AppDatabase, $PracticeSessionsTable, PracticeSession>,
      ),
      PracticeSession,
      PrefetchHooks Function()
    >;
typedef $$PracticeRecordsTableCreateCompanionBuilder =
    PracticeRecordsCompanion Function({
      required String id,
      required String session_id,
      required String study_item_id,
      required String result,
      required int response_time,
      required int created_at,
      Value<int> rowid,
    });
typedef $$PracticeRecordsTableUpdateCompanionBuilder =
    PracticeRecordsCompanion Function({
      Value<String> id,
      Value<String> session_id,
      Value<String> study_item_id,
      Value<String> result,
      Value<int> response_time,
      Value<int> created_at,
      Value<int> rowid,
    });

class $$PracticeRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $PracticeRecordsTable> {
  $$PracticeRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get session_id => $composableBuilder(
    column: $table.session_id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get study_item_id => $composableBuilder(
    column: $table.study_item_id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get result => $composableBuilder(
    column: $table.result,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get response_time => $composableBuilder(
    column: $table.response_time,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PracticeRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $PracticeRecordsTable> {
  $$PracticeRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get session_id => $composableBuilder(
    column: $table.session_id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get study_item_id => $composableBuilder(
    column: $table.study_item_id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get result => $composableBuilder(
    column: $table.result,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get response_time => $composableBuilder(
    column: $table.response_time,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PracticeRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PracticeRecordsTable> {
  $$PracticeRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get session_id => $composableBuilder(
    column: $table.session_id,
    builder: (column) => column,
  );

  GeneratedColumn<String> get study_item_id => $composableBuilder(
    column: $table.study_item_id,
    builder: (column) => column,
  );

  GeneratedColumn<String> get result =>
      $composableBuilder(column: $table.result, builder: (column) => column);

  GeneratedColumn<int> get response_time => $composableBuilder(
    column: $table.response_time,
    builder: (column) => column,
  );

  GeneratedColumn<int> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => column,
  );
}

class $$PracticeRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PracticeRecordsTable,
          PracticeRecord,
          $$PracticeRecordsTableFilterComposer,
          $$PracticeRecordsTableOrderingComposer,
          $$PracticeRecordsTableAnnotationComposer,
          $$PracticeRecordsTableCreateCompanionBuilder,
          $$PracticeRecordsTableUpdateCompanionBuilder,
          (
            PracticeRecord,
            BaseReferences<
              _$AppDatabase,
              $PracticeRecordsTable,
              PracticeRecord
            >,
          ),
          PracticeRecord,
          PrefetchHooks Function()
        > {
  $$PracticeRecordsTableTableManager(
    _$AppDatabase db,
    $PracticeRecordsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PracticeRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PracticeRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PracticeRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> session_id = const Value.absent(),
                Value<String> study_item_id = const Value.absent(),
                Value<String> result = const Value.absent(),
                Value<int> response_time = const Value.absent(),
                Value<int> created_at = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PracticeRecordsCompanion(
                id: id,
                session_id: session_id,
                study_item_id: study_item_id,
                result: result,
                response_time: response_time,
                created_at: created_at,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String session_id,
                required String study_item_id,
                required String result,
                required int response_time,
                required int created_at,
                Value<int> rowid = const Value.absent(),
              }) => PracticeRecordsCompanion.insert(
                id: id,
                session_id: session_id,
                study_item_id: study_item_id,
                result: result,
                response_time: response_time,
                created_at: created_at,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PracticeRecordsTable, PracticeRecord>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $PracticeRecordsTable,
                    PracticeRecord
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PracticeRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PracticeRecordsTable,
      PracticeRecord,
      $$PracticeRecordsTableFilterComposer,
      $$PracticeRecordsTableOrderingComposer,
      $$PracticeRecordsTableAnnotationComposer,
      $$PracticeRecordsTableCreateCompanionBuilder,
      $$PracticeRecordsTableUpdateCompanionBuilder,
      (
        PracticeRecord,
        BaseReferences<_$AppDatabase, $PracticeRecordsTable, PracticeRecord>,
      ),
      PracticeRecord,
      PrefetchHooks Function()
    >;
typedef $$AppSettingsTableCreateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<int> id,
      required int daily_review_limit,
      required int daily_new_limit,
      required String default_sort_type,
      required int image_quality,
      required int generate_thumbnail,
      required int show_next_review_time,
      required int count_practice_as_review,
      required int initial_red_days,
      required int initial_yellow_days,
      required int initial_green_days,
      required int backup_reminder_days,
      required String theme_mode,
      required int updated_at,
    });
typedef $$AppSettingsTableUpdateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<int> id,
      Value<int> daily_review_limit,
      Value<int> daily_new_limit,
      Value<String> default_sort_type,
      Value<int> image_quality,
      Value<int> generate_thumbnail,
      Value<int> show_next_review_time,
      Value<int> count_practice_as_review,
      Value<int> initial_red_days,
      Value<int> initial_yellow_days,
      Value<int> initial_green_days,
      Value<int> backup_reminder_days,
      Value<String> theme_mode,
      Value<int> updated_at,
    });

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get daily_review_limit => $composableBuilder(
    column: $table.daily_review_limit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get daily_new_limit => $composableBuilder(
    column: $table.daily_new_limit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get default_sort_type => $composableBuilder(
    column: $table.default_sort_type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get image_quality => $composableBuilder(
    column: $table.image_quality,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get generate_thumbnail => $composableBuilder(
    column: $table.generate_thumbnail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get show_next_review_time => $composableBuilder(
    column: $table.show_next_review_time,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get count_practice_as_review => $composableBuilder(
    column: $table.count_practice_as_review,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get initial_red_days => $composableBuilder(
    column: $table.initial_red_days,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get initial_yellow_days => $composableBuilder(
    column: $table.initial_yellow_days,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get initial_green_days => $composableBuilder(
    column: $table.initial_green_days,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get backup_reminder_days => $composableBuilder(
    column: $table.backup_reminder_days,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get theme_mode => $composableBuilder(
    column: $table.theme_mode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updated_at => $composableBuilder(
    column: $table.updated_at,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get daily_review_limit => $composableBuilder(
    column: $table.daily_review_limit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get daily_new_limit => $composableBuilder(
    column: $table.daily_new_limit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get default_sort_type => $composableBuilder(
    column: $table.default_sort_type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get image_quality => $composableBuilder(
    column: $table.image_quality,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get generate_thumbnail => $composableBuilder(
    column: $table.generate_thumbnail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get show_next_review_time => $composableBuilder(
    column: $table.show_next_review_time,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get count_practice_as_review => $composableBuilder(
    column: $table.count_practice_as_review,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get initial_red_days => $composableBuilder(
    column: $table.initial_red_days,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get initial_yellow_days => $composableBuilder(
    column: $table.initial_yellow_days,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get initial_green_days => $composableBuilder(
    column: $table.initial_green_days,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get backup_reminder_days => $composableBuilder(
    column: $table.backup_reminder_days,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get theme_mode => $composableBuilder(
    column: $table.theme_mode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updated_at => $composableBuilder(
    column: $table.updated_at,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get daily_review_limit => $composableBuilder(
    column: $table.daily_review_limit,
    builder: (column) => column,
  );

  GeneratedColumn<int> get daily_new_limit => $composableBuilder(
    column: $table.daily_new_limit,
    builder: (column) => column,
  );

  GeneratedColumn<String> get default_sort_type => $composableBuilder(
    column: $table.default_sort_type,
    builder: (column) => column,
  );

  GeneratedColumn<int> get image_quality => $composableBuilder(
    column: $table.image_quality,
    builder: (column) => column,
  );

  GeneratedColumn<int> get generate_thumbnail => $composableBuilder(
    column: $table.generate_thumbnail,
    builder: (column) => column,
  );

  GeneratedColumn<int> get show_next_review_time => $composableBuilder(
    column: $table.show_next_review_time,
    builder: (column) => column,
  );

  GeneratedColumn<int> get count_practice_as_review => $composableBuilder(
    column: $table.count_practice_as_review,
    builder: (column) => column,
  );

  GeneratedColumn<int> get initial_red_days => $composableBuilder(
    column: $table.initial_red_days,
    builder: (column) => column,
  );

  GeneratedColumn<int> get initial_yellow_days => $composableBuilder(
    column: $table.initial_yellow_days,
    builder: (column) => column,
  );

  GeneratedColumn<int> get initial_green_days => $composableBuilder(
    column: $table.initial_green_days,
    builder: (column) => column,
  );

  GeneratedColumn<int> get backup_reminder_days => $composableBuilder(
    column: $table.backup_reminder_days,
    builder: (column) => column,
  );

  GeneratedColumn<String> get theme_mode => $composableBuilder(
    column: $table.theme_mode,
    builder: (column) => column,
  );

  GeneratedColumn<int> get updated_at => $composableBuilder(
    column: $table.updated_at,
    builder: (column) => column,
  );
}

class $$AppSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppSettingsTable,
          AppSetting,
          $$AppSettingsTableFilterComposer,
          $$AppSettingsTableOrderingComposer,
          $$AppSettingsTableAnnotationComposer,
          $$AppSettingsTableCreateCompanionBuilder,
          $$AppSettingsTableUpdateCompanionBuilder,
          (
            AppSetting,
            BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
          ),
          AppSetting,
          PrefetchHooks Function()
        > {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> daily_review_limit = const Value.absent(),
                Value<int> daily_new_limit = const Value.absent(),
                Value<String> default_sort_type = const Value.absent(),
                Value<int> image_quality = const Value.absent(),
                Value<int> generate_thumbnail = const Value.absent(),
                Value<int> show_next_review_time = const Value.absent(),
                Value<int> count_practice_as_review = const Value.absent(),
                Value<int> initial_red_days = const Value.absent(),
                Value<int> initial_yellow_days = const Value.absent(),
                Value<int> initial_green_days = const Value.absent(),
                Value<int> backup_reminder_days = const Value.absent(),
                Value<String> theme_mode = const Value.absent(),
                Value<int> updated_at = const Value.absent(),
              }) => AppSettingsCompanion(
                id: id,
                daily_review_limit: daily_review_limit,
                daily_new_limit: daily_new_limit,
                default_sort_type: default_sort_type,
                image_quality: image_quality,
                generate_thumbnail: generate_thumbnail,
                show_next_review_time: show_next_review_time,
                count_practice_as_review: count_practice_as_review,
                initial_red_days: initial_red_days,
                initial_yellow_days: initial_yellow_days,
                initial_green_days: initial_green_days,
                backup_reminder_days: backup_reminder_days,
                theme_mode: theme_mode,
                updated_at: updated_at,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int daily_review_limit,
                required int daily_new_limit,
                required String default_sort_type,
                required int image_quality,
                required int generate_thumbnail,
                required int show_next_review_time,
                required int count_practice_as_review,
                required int initial_red_days,
                required int initial_yellow_days,
                required int initial_green_days,
                required int backup_reminder_days,
                required String theme_mode,
                required int updated_at,
              }) => AppSettingsCompanion.insert(
                id: id,
                daily_review_limit: daily_review_limit,
                daily_new_limit: daily_new_limit,
                default_sort_type: default_sort_type,
                image_quality: image_quality,
                generate_thumbnail: generate_thumbnail,
                show_next_review_time: show_next_review_time,
                count_practice_as_review: count_practice_as_review,
                initial_red_days: initial_red_days,
                initial_yellow_days: initial_yellow_days,
                initial_green_days: initial_green_days,
                backup_reminder_days: backup_reminder_days,
                theme_mode: theme_mode,
                updated_at: updated_at,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AppSettingsTable, AppSetting>(table),
                  BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppSettingsTable,
      AppSetting,
      $$AppSettingsTableFilterComposer,
      $$AppSettingsTableOrderingComposer,
      $$AppSettingsTableAnnotationComposer,
      $$AppSettingsTableCreateCompanionBuilder,
      $$AppSettingsTableUpdateCompanionBuilder,
      (
        AppSetting,
        BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
      ),
      AppSetting,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SubjectsTableTableManager get subjects =>
      $$SubjectsTableTableManager(_db, _db.subjects);
  $$StudyItemsTableTableManager get studyItems =>
      $$StudyItemsTableTableManager(_db, _db.studyItems);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$ImagesTableTableManager get images =>
      $$ImagesTableTableManager(_db, _db.images);
  $$TagsTableTableManager get tags => $$TagsTableTableManager(_db, _db.tags);
  $$StudyItemTagsTableTableManager get studyItemTags =>
      $$StudyItemTagsTableTableManager(_db, _db.studyItemTags);
  $$FsrsCardsTableTableManager get fsrsCards =>
      $$FsrsCardsTableTableManager(_db, _db.fsrsCards);
  $$ReviewRecordsTableTableManager get reviewRecords =>
      $$ReviewRecordsTableTableManager(_db, _db.reviewRecords);
  $$MistakeRecordsTableTableManager get mistakeRecords =>
      $$MistakeRecordsTableTableManager(_db, _db.mistakeRecords);
  $$MistakeReasonsTableTableManager get mistakeReasons =>
      $$MistakeReasonsTableTableManager(_db, _db.mistakeReasons);
  $$MistakeRecordReasonsTableTableManager get mistakeRecordReasons =>
      $$MistakeRecordReasonsTableTableManager(_db, _db.mistakeRecordReasons);
  $$PracticePlansTableTableManager get practicePlans =>
      $$PracticePlansTableTableManager(_db, _db.practicePlans);
  $$PracticeSessionsTableTableManager get practiceSessions =>
      $$PracticeSessionsTableTableManager(_db, _db.practiceSessions);
  $$PracticeRecordsTableTableManager get practiceRecords =>
      $$PracticeRecordsTableTableManager(_db, _db.practiceRecords);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
}
