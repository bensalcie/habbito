import 'package:drift/drift.dart';

/// [HabbitsTable] has Habbits user has Added to Quit/ Improve.
@DataClassName('HabbitsDataClass')
class HabbitsTable extends Table {
  /// Id of favorited show.
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get slug => text().nullable()();
  TextColumn get localimage => text().nullable()();
  BoolColumn get shouldimprove => boolean().nullable()();
}
