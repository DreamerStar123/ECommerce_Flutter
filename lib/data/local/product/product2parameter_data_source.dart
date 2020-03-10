import 'package:openflutterecommerce/data/local/data_source.dart';
import 'package:openflutterecommerce/domain/entities/product/product2parameter_entity.dart';

class Product2ParameterDataSource extends DataSource {
  @override
  Future<List<Product2ParameterEntity>> all() async {
    checkDatabaseConnection();

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return Product2ParameterEntity(
        id: maps[i]['id'],
        productParameterId: maps[i]['productParameterId'],
        productId: maps[i]['productId'],
      );
    });
  }

  @override
  Future<Product2ParameterEntity> get(int id) async {
    checkDatabaseConnection();

    final List<Map<String, dynamic>> maps =
        await db.query(tableName, where: '$primaryKey = ?', whereArgs: [id]);

    return Product2ParameterEntity(
      id: maps[0]['id'],
      productParameterId: maps[0]['productParameterId'],
      productId: maps[0]['productId'],
    );
  }

  @override
  String get tableName => 'Product2Parameter';

  @override
  String get primaryKey => 'id';
}
