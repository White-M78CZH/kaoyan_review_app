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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SubjectsTable subjects = $SubjectsTable(this);
  late final $StudyItemsTable studyItems = $StudyItemsTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $ImagesTable images = $ImagesTable(this);
  late final $TagsTable tags = $TagsTable(this);
  late final $StudyItemTagsTable studyItemTags = $StudyItemTagsTable(this);
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
}
