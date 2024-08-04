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

class $TrackHabbitTableTable extends TrackHabbitTable
    with TableInfo<$TrackHabbitTableTable, TrackHabbitDataClass> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrackHabbitTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<String> startDate = GeneratedColumn<String>(
      'start_date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<String> endDate = GeneratedColumn<String>(
      'end_date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _daysCompletedMeta =
      const VerificationMeta('daysCompleted');
  @override
  late final GeneratedColumn<int> daysCompleted = GeneratedColumn<int>(
      'days_completed', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _habbitIdMeta =
      const VerificationMeta('habbitId');
  @override
  late final GeneratedColumn<int> habbitId = GeneratedColumn<int>(
      'habbit_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, startDate, endDate, daysCompleted, habbitId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'track_habbit_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<TrackHabbitDataClass> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    }
    if (data.containsKey('days_completed')) {
      context.handle(
          _daysCompletedMeta,
          daysCompleted.isAcceptableOrUnknown(
              data['days_completed']!, _daysCompletedMeta));
    }
    if (data.containsKey('habbit_id')) {
      context.handle(_habbitIdMeta,
          habbitId.isAcceptableOrUnknown(data['habbit_id']!, _habbitIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TrackHabbitDataClass map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrackHabbitDataClass(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}start_date']),
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}end_date']),
      daysCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}days_completed']),
      habbitId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}habbit_id']),
    );
  }

  @override
  $TrackHabbitTableTable createAlias(String alias) {
    return $TrackHabbitTableTable(attachedDatabase, alias);
  }
}

class TrackHabbitDataClass extends DataClass
    implements Insertable<TrackHabbitDataClass> {
  /// Id of favorited show.
  final int id;
  final String? startDate;
  final String? endDate;
  final int? daysCompleted;
  final int? habbitId;
  const TrackHabbitDataClass(
      {required this.id,
      this.startDate,
      this.endDate,
      this.daysCompleted,
      this.habbitId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<String>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<String>(endDate);
    }
    if (!nullToAbsent || daysCompleted != null) {
      map['days_completed'] = Variable<int>(daysCompleted);
    }
    if (!nullToAbsent || habbitId != null) {
      map['habbit_id'] = Variable<int>(habbitId);
    }
    return map;
  }

  TrackHabbitTableCompanion toCompanion(bool nullToAbsent) {
    return TrackHabbitTableCompanion(
      id: Value(id),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      daysCompleted: daysCompleted == null && nullToAbsent
          ? const Value.absent()
          : Value(daysCompleted),
      habbitId: habbitId == null && nullToAbsent
          ? const Value.absent()
          : Value(habbitId),
    );
  }

  factory TrackHabbitDataClass.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrackHabbitDataClass(
      id: serializer.fromJson<int>(json['id']),
      startDate: serializer.fromJson<String?>(json['startDate']),
      endDate: serializer.fromJson<String?>(json['endDate']),
      daysCompleted: serializer.fromJson<int?>(json['daysCompleted']),
      habbitId: serializer.fromJson<int?>(json['habbitId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'startDate': serializer.toJson<String?>(startDate),
      'endDate': serializer.toJson<String?>(endDate),
      'daysCompleted': serializer.toJson<int?>(daysCompleted),
      'habbitId': serializer.toJson<int?>(habbitId),
    };
  }

  TrackHabbitDataClass copyWith(
          {int? id,
          Value<String?> startDate = const Value.absent(),
          Value<String?> endDate = const Value.absent(),
          Value<int?> daysCompleted = const Value.absent(),
          Value<int?> habbitId = const Value.absent()}) =>
      TrackHabbitDataClass(
        id: id ?? this.id,
        startDate: startDate.present ? startDate.value : this.startDate,
        endDate: endDate.present ? endDate.value : this.endDate,
        daysCompleted:
            daysCompleted.present ? daysCompleted.value : this.daysCompleted,
        habbitId: habbitId.present ? habbitId.value : this.habbitId,
      );
  TrackHabbitDataClass copyWithCompanion(TrackHabbitTableCompanion data) {
    return TrackHabbitDataClass(
      id: data.id.present ? data.id.value : this.id,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      daysCompleted: data.daysCompleted.present
          ? data.daysCompleted.value
          : this.daysCompleted,
      habbitId: data.habbitId.present ? data.habbitId.value : this.habbitId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TrackHabbitDataClass(')
          ..write('id: $id, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('daysCompleted: $daysCompleted, ')
          ..write('habbitId: $habbitId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, startDate, endDate, daysCompleted, habbitId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrackHabbitDataClass &&
          other.id == this.id &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.daysCompleted == this.daysCompleted &&
          other.habbitId == this.habbitId);
}

class TrackHabbitTableCompanion extends UpdateCompanion<TrackHabbitDataClass> {
  final Value<int> id;
  final Value<String?> startDate;
  final Value<String?> endDate;
  final Value<int?> daysCompleted;
  final Value<int?> habbitId;
  const TrackHabbitTableCompanion({
    this.id = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.daysCompleted = const Value.absent(),
    this.habbitId = const Value.absent(),
  });
  TrackHabbitTableCompanion.insert({
    this.id = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.daysCompleted = const Value.absent(),
    this.habbitId = const Value.absent(),
  });
  static Insertable<TrackHabbitDataClass> custom({
    Expression<int>? id,
    Expression<String>? startDate,
    Expression<String>? endDate,
    Expression<int>? daysCompleted,
    Expression<int>? habbitId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (daysCompleted != null) 'days_completed': daysCompleted,
      if (habbitId != null) 'habbit_id': habbitId,
    });
  }

  TrackHabbitTableCompanion copyWith(
      {Value<int>? id,
      Value<String?>? startDate,
      Value<String?>? endDate,
      Value<int?>? daysCompleted,
      Value<int?>? habbitId}) {
    return TrackHabbitTableCompanion(
      id: id ?? this.id,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      daysCompleted: daysCompleted ?? this.daysCompleted,
      habbitId: habbitId ?? this.habbitId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<String>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<String>(endDate.value);
    }
    if (daysCompleted.present) {
      map['days_completed'] = Variable<int>(daysCompleted.value);
    }
    if (habbitId.present) {
      map['habbit_id'] = Variable<int>(habbitId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrackHabbitTableCompanion(')
          ..write('id: $id, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('daysCompleted: $daysCompleted, ')
          ..write('habbitId: $habbitId')
          ..write(')'))
        .toString();
  }
}

class $HabbitScheduleTableTable extends HabbitScheduleTable
    with TableInfo<$HabbitScheduleTableTable, HabbitScheduleDataClass> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabbitScheduleTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _expectedCompletiondDateMeta =
      const VerificationMeta('expectedCompletiondDate');
  @override
  late final GeneratedColumn<String> expectedCompletiondDate =
      GeneratedColumn<String>('expected_completiond_date', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _userCommentMeta =
      const VerificationMeta('userComment');
  @override
  late final GeneratedColumn<String> userComment = GeneratedColumn<String>(
      'user_comment', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
      'is_completed', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_completed" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, expectedCompletiondDate, userComment, isCompleted];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habbit_schedule_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<HabbitScheduleDataClass> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('expected_completiond_date')) {
      context.handle(
          _expectedCompletiondDateMeta,
          expectedCompletiondDate.isAcceptableOrUnknown(
              data['expected_completiond_date']!,
              _expectedCompletiondDateMeta));
    }
    if (data.containsKey('user_comment')) {
      context.handle(
          _userCommentMeta,
          userComment.isAcceptableOrUnknown(
              data['user_comment']!, _userCommentMeta));
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed']!, _isCompletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HabbitScheduleDataClass map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabbitScheduleDataClass(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      expectedCompletiondDate: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}expected_completiond_date']),
      userComment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_comment']),
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_completed']),
    );
  }

  @override
  $HabbitScheduleTableTable createAlias(String alias) {
    return $HabbitScheduleTableTable(attachedDatabase, alias);
  }
}

class HabbitScheduleDataClass extends DataClass
    implements Insertable<HabbitScheduleDataClass> {
  /// Id of favorited show.
  final int id;
  final String? expectedCompletiondDate;
  final String? userComment;
  final bool? isCompleted;
  const HabbitScheduleDataClass(
      {required this.id,
      this.expectedCompletiondDate,
      this.userComment,
      this.isCompleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || expectedCompletiondDate != null) {
      map['expected_completiond_date'] =
          Variable<String>(expectedCompletiondDate);
    }
    if (!nullToAbsent || userComment != null) {
      map['user_comment'] = Variable<String>(userComment);
    }
    if (!nullToAbsent || isCompleted != null) {
      map['is_completed'] = Variable<bool>(isCompleted);
    }
    return map;
  }

  HabbitScheduleTableCompanion toCompanion(bool nullToAbsent) {
    return HabbitScheduleTableCompanion(
      id: Value(id),
      expectedCompletiondDate: expectedCompletiondDate == null && nullToAbsent
          ? const Value.absent()
          : Value(expectedCompletiondDate),
      userComment: userComment == null && nullToAbsent
          ? const Value.absent()
          : Value(userComment),
      isCompleted: isCompleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isCompleted),
    );
  }

  factory HabbitScheduleDataClass.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabbitScheduleDataClass(
      id: serializer.fromJson<int>(json['id']),
      expectedCompletiondDate:
          serializer.fromJson<String?>(json['expectedCompletiondDate']),
      userComment: serializer.fromJson<String?>(json['userComment']),
      isCompleted: serializer.fromJson<bool?>(json['isCompleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'expectedCompletiondDate':
          serializer.toJson<String?>(expectedCompletiondDate),
      'userComment': serializer.toJson<String?>(userComment),
      'isCompleted': serializer.toJson<bool?>(isCompleted),
    };
  }

  HabbitScheduleDataClass copyWith(
          {int? id,
          Value<String?> expectedCompletiondDate = const Value.absent(),
          Value<String?> userComment = const Value.absent(),
          Value<bool?> isCompleted = const Value.absent()}) =>
      HabbitScheduleDataClass(
        id: id ?? this.id,
        expectedCompletiondDate: expectedCompletiondDate.present
            ? expectedCompletiondDate.value
            : this.expectedCompletiondDate,
        userComment: userComment.present ? userComment.value : this.userComment,
        isCompleted: isCompleted.present ? isCompleted.value : this.isCompleted,
      );
  HabbitScheduleDataClass copyWithCompanion(HabbitScheduleTableCompanion data) {
    return HabbitScheduleDataClass(
      id: data.id.present ? data.id.value : this.id,
      expectedCompletiondDate: data.expectedCompletiondDate.present
          ? data.expectedCompletiondDate.value
          : this.expectedCompletiondDate,
      userComment:
          data.userComment.present ? data.userComment.value : this.userComment,
      isCompleted:
          data.isCompleted.present ? data.isCompleted.value : this.isCompleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HabbitScheduleDataClass(')
          ..write('id: $id, ')
          ..write('expectedCompletiondDate: $expectedCompletiondDate, ')
          ..write('userComment: $userComment, ')
          ..write('isCompleted: $isCompleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, expectedCompletiondDate, userComment, isCompleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabbitScheduleDataClass &&
          other.id == this.id &&
          other.expectedCompletiondDate == this.expectedCompletiondDate &&
          other.userComment == this.userComment &&
          other.isCompleted == this.isCompleted);
}

class HabbitScheduleTableCompanion
    extends UpdateCompanion<HabbitScheduleDataClass> {
  final Value<int> id;
  final Value<String?> expectedCompletiondDate;
  final Value<String?> userComment;
  final Value<bool?> isCompleted;
  const HabbitScheduleTableCompanion({
    this.id = const Value.absent(),
    this.expectedCompletiondDate = const Value.absent(),
    this.userComment = const Value.absent(),
    this.isCompleted = const Value.absent(),
  });
  HabbitScheduleTableCompanion.insert({
    this.id = const Value.absent(),
    this.expectedCompletiondDate = const Value.absent(),
    this.userComment = const Value.absent(),
    this.isCompleted = const Value.absent(),
  });
  static Insertable<HabbitScheduleDataClass> custom({
    Expression<int>? id,
    Expression<String>? expectedCompletiondDate,
    Expression<String>? userComment,
    Expression<bool>? isCompleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (expectedCompletiondDate != null)
        'expected_completiond_date': expectedCompletiondDate,
      if (userComment != null) 'user_comment': userComment,
      if (isCompleted != null) 'is_completed': isCompleted,
    });
  }

  HabbitScheduleTableCompanion copyWith(
      {Value<int>? id,
      Value<String?>? expectedCompletiondDate,
      Value<String?>? userComment,
      Value<bool?>? isCompleted}) {
    return HabbitScheduleTableCompanion(
      id: id ?? this.id,
      expectedCompletiondDate:
          expectedCompletiondDate ?? this.expectedCompletiondDate,
      userComment: userComment ?? this.userComment,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (expectedCompletiondDate.present) {
      map['expected_completiond_date'] =
          Variable<String>(expectedCompletiondDate.value);
    }
    if (userComment.present) {
      map['user_comment'] = Variable<String>(userComment.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabbitScheduleTableCompanion(')
          ..write('id: $id, ')
          ..write('expectedCompletiondDate: $expectedCompletiondDate, ')
          ..write('userComment: $userComment, ')
          ..write('isCompleted: $isCompleted')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $HabbitsTableTable habbitsTable = $HabbitsTableTable(this);
  late final $TrackHabbitTableTable trackHabbitTable =
      $TrackHabbitTableTable(this);
  late final $HabbitScheduleTableTable habbitScheduleTable =
      $HabbitScheduleTableTable(this);
  late final HabbitsDao habbitsDao = HabbitsDao(this as AppDatabase);
  late final TrackHabbitDao trackHabbitDao =
      TrackHabbitDao(this as AppDatabase);
  late final HabbitScheduleDao habbitScheduleDao =
      HabbitScheduleDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [habbitsTable, trackHabbitTable, habbitScheduleTable];
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

typedef $$TrackHabbitTableTableCreateCompanionBuilder
    = TrackHabbitTableCompanion Function({
  Value<int> id,
  Value<String?> startDate,
  Value<String?> endDate,
  Value<int?> daysCompleted,
  Value<int?> habbitId,
});
typedef $$TrackHabbitTableTableUpdateCompanionBuilder
    = TrackHabbitTableCompanion Function({
  Value<int> id,
  Value<String?> startDate,
  Value<String?> endDate,
  Value<int?> daysCompleted,
  Value<int?> habbitId,
});

class $$TrackHabbitTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TrackHabbitTableTable,
    TrackHabbitDataClass,
    $$TrackHabbitTableTableFilterComposer,
    $$TrackHabbitTableTableOrderingComposer,
    $$TrackHabbitTableTableCreateCompanionBuilder,
    $$TrackHabbitTableTableUpdateCompanionBuilder> {
  $$TrackHabbitTableTableTableManager(
      _$AppDatabase db, $TrackHabbitTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TrackHabbitTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TrackHabbitTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> startDate = const Value.absent(),
            Value<String?> endDate = const Value.absent(),
            Value<int?> daysCompleted = const Value.absent(),
            Value<int?> habbitId = const Value.absent(),
          }) =>
              TrackHabbitTableCompanion(
            id: id,
            startDate: startDate,
            endDate: endDate,
            daysCompleted: daysCompleted,
            habbitId: habbitId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> startDate = const Value.absent(),
            Value<String?> endDate = const Value.absent(),
            Value<int?> daysCompleted = const Value.absent(),
            Value<int?> habbitId = const Value.absent(),
          }) =>
              TrackHabbitTableCompanion.insert(
            id: id,
            startDate: startDate,
            endDate: endDate,
            daysCompleted: daysCompleted,
            habbitId: habbitId,
          ),
        ));
}

class $$TrackHabbitTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TrackHabbitTableTable> {
  $$TrackHabbitTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get startDate => $state.composableBuilder(
      column: $state.table.startDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get endDate => $state.composableBuilder(
      column: $state.table.endDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get daysCompleted => $state.composableBuilder(
      column: $state.table.daysCompleted,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get habbitId => $state.composableBuilder(
      column: $state.table.habbitId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TrackHabbitTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TrackHabbitTableTable> {
  $$TrackHabbitTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get startDate => $state.composableBuilder(
      column: $state.table.startDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get endDate => $state.composableBuilder(
      column: $state.table.endDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get daysCompleted => $state.composableBuilder(
      column: $state.table.daysCompleted,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get habbitId => $state.composableBuilder(
      column: $state.table.habbitId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$HabbitScheduleTableTableCreateCompanionBuilder
    = HabbitScheduleTableCompanion Function({
  Value<int> id,
  Value<String?> expectedCompletiondDate,
  Value<String?> userComment,
  Value<bool?> isCompleted,
});
typedef $$HabbitScheduleTableTableUpdateCompanionBuilder
    = HabbitScheduleTableCompanion Function({
  Value<int> id,
  Value<String?> expectedCompletiondDate,
  Value<String?> userComment,
  Value<bool?> isCompleted,
});

class $$HabbitScheduleTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HabbitScheduleTableTable,
    HabbitScheduleDataClass,
    $$HabbitScheduleTableTableFilterComposer,
    $$HabbitScheduleTableTableOrderingComposer,
    $$HabbitScheduleTableTableCreateCompanionBuilder,
    $$HabbitScheduleTableTableUpdateCompanionBuilder> {
  $$HabbitScheduleTableTableTableManager(
      _$AppDatabase db, $HabbitScheduleTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$HabbitScheduleTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$HabbitScheduleTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> expectedCompletiondDate = const Value.absent(),
            Value<String?> userComment = const Value.absent(),
            Value<bool?> isCompleted = const Value.absent(),
          }) =>
              HabbitScheduleTableCompanion(
            id: id,
            expectedCompletiondDate: expectedCompletiondDate,
            userComment: userComment,
            isCompleted: isCompleted,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> expectedCompletiondDate = const Value.absent(),
            Value<String?> userComment = const Value.absent(),
            Value<bool?> isCompleted = const Value.absent(),
          }) =>
              HabbitScheduleTableCompanion.insert(
            id: id,
            expectedCompletiondDate: expectedCompletiondDate,
            userComment: userComment,
            isCompleted: isCompleted,
          ),
        ));
}

class $$HabbitScheduleTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $HabbitScheduleTableTable> {
  $$HabbitScheduleTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get expectedCompletiondDate => $state.composableBuilder(
      column: $state.table.expectedCompletiondDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get userComment => $state.composableBuilder(
      column: $state.table.userComment,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isCompleted => $state.composableBuilder(
      column: $state.table.isCompleted,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$HabbitScheduleTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $HabbitScheduleTableTable> {
  $$HabbitScheduleTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get expectedCompletiondDate =>
      $state.composableBuilder(
          column: $state.table.expectedCompletiondDate,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get userComment => $state.composableBuilder(
      column: $state.table.userComment,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isCompleted => $state.composableBuilder(
      column: $state.table.isCompleted,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$HabbitsTableTableTableManager get habbitsTable =>
      $$HabbitsTableTableTableManager(_db, _db.habbitsTable);
  $$TrackHabbitTableTableTableManager get trackHabbitTable =>
      $$TrackHabbitTableTableTableManager(_db, _db.trackHabbitTable);
  $$HabbitScheduleTableTableTableManager get habbitScheduleTable =>
      $$HabbitScheduleTableTableTableManager(_db, _db.habbitScheduleTable);
}
