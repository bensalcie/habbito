// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $HabbitsTableTable extends HabbitsTable
    with TableInfo<$HabbitsTableTable, HabbitsDataClass> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabbitsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _slugMeta = const VerificationMeta('slug');
  @override
  late final GeneratedColumn<String> slug = GeneratedColumn<String>(
      'slug', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _localimageMeta =
      const VerificationMeta('localimage');
  @override
  late final GeneratedColumn<String> localimage = GeneratedColumn<String>(
      'localimage', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _shouldimproveMeta =
      const VerificationMeta('shouldimprove');
  @override
  late final GeneratedColumn<bool> shouldimprove = GeneratedColumn<bool>(
      'shouldimprove', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("shouldimprove" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, description, slug, localimage, shouldimprove];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habbits_table';
  @override
  VerificationContext validateIntegrity(Insertable<HabbitsDataClass> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('slug')) {
      context.handle(
          _slugMeta, slug.isAcceptableOrUnknown(data['slug']!, _slugMeta));
    }
    if (data.containsKey('localimage')) {
      context.handle(
          _localimageMeta,
          localimage.isAcceptableOrUnknown(
              data['localimage']!, _localimageMeta));
    }
    if (data.containsKey('shouldimprove')) {
      context.handle(
          _shouldimproveMeta,
          shouldimprove.isAcceptableOrUnknown(
              data['shouldimprove']!, _shouldimproveMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HabbitsDataClass map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabbitsDataClass(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      slug: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}slug']),
      localimage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}localimage']),
      shouldimprove: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}shouldimprove']),
    );
  }

  @override
  $HabbitsTableTable createAlias(String alias) {
    return $HabbitsTableTable(attachedDatabase, alias);
  }
}

class HabbitsDataClass extends DataClass
    implements Insertable<HabbitsDataClass> {
  /// Id of favorited show.
  final int id;
  final String? title;
  final String? description;
  final String? slug;
  final String? localimage;
  final bool? shouldimprove;
  const HabbitsDataClass(
      {required this.id,
      this.title,
      this.description,
      this.slug,
      this.localimage,
      this.shouldimprove});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || slug != null) {
      map['slug'] = Variable<String>(slug);
    }
    if (!nullToAbsent || localimage != null) {
      map['localimage'] = Variable<String>(localimage);
    }
    if (!nullToAbsent || shouldimprove != null) {
      map['shouldimprove'] = Variable<bool>(shouldimprove);
    }
    return map;
  }

  HabbitsTableCompanion toCompanion(bool nullToAbsent) {
    return HabbitsTableCompanion(
      id: Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      slug: slug == null && nullToAbsent ? const Value.absent() : Value(slug),
      localimage: localimage == null && nullToAbsent
          ? const Value.absent()
          : Value(localimage),
      shouldimprove: shouldimprove == null && nullToAbsent
          ? const Value.absent()
          : Value(shouldimprove),
    );
  }

  factory HabbitsDataClass.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabbitsDataClass(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String?>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      slug: serializer.fromJson<String?>(json['slug']),
      localimage: serializer.fromJson<String?>(json['localimage']),
      shouldimprove: serializer.fromJson<bool?>(json['shouldimprove']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String?>(title),
      'description': serializer.toJson<String?>(description),
      'slug': serializer.toJson<String?>(slug),
      'localimage': serializer.toJson<String?>(localimage),
      'shouldimprove': serializer.toJson<bool?>(shouldimprove),
    };
  }

  HabbitsDataClass copyWith(
          {int? id,
          Value<String?> title = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<String?> slug = const Value.absent(),
          Value<String?> localimage = const Value.absent(),
          Value<bool?> shouldimprove = const Value.absent()}) =>
      HabbitsDataClass(
        id: id ?? this.id,
        title: title.present ? title.value : this.title,
        description: description.present ? description.value : this.description,
        slug: slug.present ? slug.value : this.slug,
        localimage: localimage.present ? localimage.value : this.localimage,
        shouldimprove:
            shouldimprove.present ? shouldimprove.value : this.shouldimprove,
      );
  HabbitsDataClass copyWithCompanion(HabbitsTableCompanion data) {
    return HabbitsDataClass(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      slug: data.slug.present ? data.slug.value : this.slug,
      localimage:
          data.localimage.present ? data.localimage.value : this.localimage,
      shouldimprove: data.shouldimprove.present
          ? data.shouldimprove.value
          : this.shouldimprove,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HabbitsDataClass(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('slug: $slug, ')
          ..write('localimage: $localimage, ')
          ..write('shouldimprove: $shouldimprove')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, description, slug, localimage, shouldimprove);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabbitsDataClass &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.slug == this.slug &&
          other.localimage == this.localimage &&
          other.shouldimprove == this.shouldimprove);
}

class HabbitsTableCompanion extends UpdateCompanion<HabbitsDataClass> {
  final Value<int> id;
  final Value<String?> title;
  final Value<String?> description;
  final Value<String?> slug;
  final Value<String?> localimage;
  final Value<bool?> shouldimprove;
  const HabbitsTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.slug = const Value.absent(),
    this.localimage = const Value.absent(),
    this.shouldimprove = const Value.absent(),
  });
  HabbitsTableCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.slug = const Value.absent(),
    this.localimage = const Value.absent(),
    this.shouldimprove = const Value.absent(),
  });
  static Insertable<HabbitsDataClass> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? slug,
    Expression<String>? localimage,
    Expression<bool>? shouldimprove,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (slug != null) 'slug': slug,
      if (localimage != null) 'localimage': localimage,
      if (shouldimprove != null) 'shouldimprove': shouldimprove,
    });
  }

  HabbitsTableCompanion copyWith(
      {Value<int>? id,
      Value<String?>? title,
      Value<String?>? description,
      Value<String?>? slug,
      Value<String?>? localimage,
      Value<bool?>? shouldimprove}) {
    return HabbitsTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      slug: slug ?? this.slug,
      localimage: localimage ?? this.localimage,
      shouldimprove: shouldimprove ?? this.shouldimprove,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (slug.present) {
      map['slug'] = Variable<String>(slug.value);
    }
    if (localimage.present) {
      map['localimage'] = Variable<String>(localimage.value);
    }
    if (shouldimprove.present) {
      map['shouldimprove'] = Variable<bool>(shouldimprove.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabbitsTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('slug: $slug, ')
          ..write('localimage: $localimage, ')
          ..write('shouldimprove: $shouldimprove')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $HabbitsTableTable habbitsTable = $HabbitsTableTable(this);
  late final HabbitsDao habbitsDao = HabbitsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [habbitsTable];
}

typedef $$HabbitsTableTableCreateCompanionBuilder = HabbitsTableCompanion
    Function({
  Value<int> id,
  Value<String?> title,
  Value<String?> description,
  Value<String?> slug,
  Value<String?> localimage,
  Value<bool?> shouldimprove,
});
typedef $$HabbitsTableTableUpdateCompanionBuilder = HabbitsTableCompanion
    Function({
  Value<int> id,
  Value<String?> title,
  Value<String?> description,
  Value<String?> slug,
  Value<String?> localimage,
  Value<bool?> shouldimprove,
});

class $$HabbitsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HabbitsTableTable,
    HabbitsDataClass,
    $$HabbitsTableTableFilterComposer,
    $$HabbitsTableTableOrderingComposer,
    $$HabbitsTableTableCreateCompanionBuilder,
    $$HabbitsTableTableUpdateCompanionBuilder> {
  $$HabbitsTableTableTableManager(_$AppDatabase db, $HabbitsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$HabbitsTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$HabbitsTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> slug = const Value.absent(),
            Value<String?> localimage = const Value.absent(),
            Value<bool?> shouldimprove = const Value.absent(),
          }) =>
              HabbitsTableCompanion(
            id: id,
            title: title,
            description: description,
            slug: slug,
            localimage: localimage,
            shouldimprove: shouldimprove,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> slug = const Value.absent(),
            Value<String?> localimage = const Value.absent(),
            Value<bool?> shouldimprove = const Value.absent(),
          }) =>
              HabbitsTableCompanion.insert(
            id: id,
            title: title,
            description: description,
            slug: slug,
            localimage: localimage,
            shouldimprove: shouldimprove,
          ),
        ));
}

class $$HabbitsTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $HabbitsTableTable> {
  $$HabbitsTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get slug => $state.composableBuilder(
      column: $state.table.slug,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get localimage => $state.composableBuilder(
      column: $state.table.localimage,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get shouldimprove => $state.composableBuilder(
      column: $state.table.shouldimprove,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$HabbitsTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $HabbitsTableTable> {
  $$HabbitsTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get slug => $state.composableBuilder(
      column: $state.table.slug,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get localimage => $state.composableBuilder(
      column: $state.table.localimage,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get shouldimprove => $state.composableBuilder(
      column: $state.table.shouldimprove,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$HabbitsTableTableTableManager get habbitsTable =>
      $$HabbitsTableTableTableManager(_db, _db.habbitsTable);
}
