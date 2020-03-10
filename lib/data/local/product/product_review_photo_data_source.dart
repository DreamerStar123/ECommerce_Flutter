import 'package:openflutterecommerce/data/local/data_source.dart';
import 'package:openflutterecommerce/domain/entities/product/product_review_photo_entity.dart';

class ProductReviewPhotoDataSource extends DataSource {
  @override
  Future<List<ProductReviewPhotoEntity>> all() async {
    checkDatabaseConnection();

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return ProductReviewPhotoEntity(
        id: maps[i]['id'],
        image: maps[i]['image'],
        reviewId: maps[i]['reviewId'],
      );
    });
  }

  @override
  Future<ProductReviewPhotoEntity> get(int id) async {
    checkDatabaseConnection();

    final List<Map<String, dynamic>> maps =
        await db.query(tableName, where: '$primaryKey = ?', whereArgs: [id]);

    return ProductReviewPhotoEntity(
      id: maps[0]['id'],
      image: maps[0]['image'],
      reviewId: maps[0]['reviewId'],
    );
  }

  @override
  String get tableName => 'ProductReviewPhoto';

  @override
  String get primaryKey => 'id';
}
