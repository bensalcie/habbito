import 'package:drift/drift.dart';

/// [HabbitScheduleTable] has HabbitSchedule user has Added to Quit/ Improve.
@DataClassName('HabbitScheduleDataClass')
class HabbitScheduleTable extends Table {
  /// Id of favorited show.
  IntColumn get id => integer().autoIncrement()();
  TextColumn get expectedCompletiondDate => text().nullable()();
  TextColumn get userComment => text().nullable()();
  BoolColumn get isCompleted => boolean().nullable()();
}
