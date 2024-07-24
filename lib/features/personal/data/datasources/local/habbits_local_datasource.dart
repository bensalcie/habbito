import 'package:drift/drift.dart';
import 'package:habbito/core/common/constants/app_strings.dart';
import 'package:habbito/core/common/database/cart/habbits_dao.dart';
import 'package:habbito/core/common/database/common/app_database.dart';
import 'package:habbito/features/personal/data/models/habbit_model.dart';
import 'package:injectable/injectable.dart';

abstract class HabbitLocalDataSource {
  /// Call api to Get Home Views
  ///
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<HabbitModel>> getHabbitItems();
  Future<int> addHabbitItem({required HabbitModel params});

  Future<void> updateHabbitItem({required HabbitModel params});

  Future<bool> deleteHabbitItem({required HabbitModel params});
  Future<void> deleteHabbitItems();
}

@LazySingleton(as: HabbitLocalDataSource)
class HabbitLocalDataSourceImpl implements HabbitLocalDataSource {
  final HabbitsDao _habbitDao;
  HabbitLocalDataSourceImpl(this._habbitDao);

  @override
  Future<int> addHabbitItem({required HabbitModel params}) async {
    try {
      return await _habbitDao.addHabbitItem(HabbitsTableCompanion(
        description: Value(params.description),
        title: Value(params.title),
        localimage: Value(params.localimage ?? 'assets/images/rain.jpg'),
        slug: Value(params.slug ?? na),
        shouldimprove: Value(params.shouldimprove),
      ));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteHabbitItem({required HabbitModel params}) async {
    final results = await _habbitDao.deleteHabbitsItem(params.id!);
    return results != null;
  }

  @override
  Future<void> deleteHabbitItems() async {
    final results = await _habbitDao.deleteAllHabbitItems();

    return results;
  }

  @override
  Future<List<HabbitModel>> getHabbitItems() async {
    try {
      final results = await _habbitDao.getHabbitItems();

      return results;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future updateHabbitItem({required HabbitModel params}) async {
    try {
      return await _habbitDao.updateHabbitItem(HabbitsTableCompanion(
        description: Value(params.description),
        title: Value(params.title),
        localimage: Value(params.localimage ?? 'assets/images/rain.jpg'),
        slug: Value(params.slug ?? na),
        id: Value(params.id!),
        shouldimprove: Value(params.shouldimprove),
      ));
    } catch (e) {
      rethrow;
    }
  }
}
