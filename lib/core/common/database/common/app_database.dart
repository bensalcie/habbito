import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart' show NativeDatabase;
import 'package:habbito/core/common/database/habbits/habbit_schedule_dao.dart';
import 'package:habbito/core/common/database/habbits/habbit_schedule_table.dart';
import 'package:habbito/core/common/database/habbits/habbits_dao.dart';
import 'package:habbito/core/common/database/habbits/habbits_table.dart';
import 'package:habbito/core/common/database/habbits/track_habbit_dao.dart';
import 'package:habbito/core/common/database/habbits/track_habbit_table.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

/// App local database based on [drift]. The database is created lazily and runs
/// in a background isolate. Example:
/// ```dart
/// QueryExecutor _openConnection() {
///   return LazyDatabase(() async {
///     final dbFolder = await getApplicationDocumentsDirectory();
///     final file = File(p.join(dbFolder.path, 'db.sqlite'));
///
///     return NativeDatabase.createInBackground(file, logStatements: false);
///   });
/// }
/// ```
/// [CartTable] are created in the
/// database once the database is created. The database is created in a background isolate
/// and not the main isolate of the dart app to improve performance.
/// * https://drift.simonbinder.eu/docs/advanced-features/isolates/
///
/// [CartDao] are added make [CRUD]
/// operation to the db easier to manage. Check out:
/// * https://drift.simonbinder.eu/docs/advanced-features/daos/ .
@DriftDatabase(
  tables: [HabbitsTable, TrackHabbitTable, HabbitScheduleTable],
  daos: [HabbitsDao, TrackHabbitDao, HabbitScheduleDao],
)
@singleton
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // WILL BE HANDLED LATER
      },
      beforeOpen: (details) async {
        // WILL BE HANDLED LATER
      },
    );
  }
}

QueryExecutor _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file, logStatements: true);
  });
}
