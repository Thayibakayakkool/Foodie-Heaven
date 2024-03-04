import 'package:foodie_heaven/src/features/domain/entities/categories_entity.dart';

class CategoriesModel extends CategoriesEntity {
  const CategoriesModel({
    required super.image,
    required super.price,
    required super.name,
    required super.time,
    required super.calories,
    required super.rating,
    required super.desc,
    required super.id,
    required super.isRecommended,
    required super.isPopular,
  });

  CategoriesEntity toEntity() {
    return CategoriesEntity(
      image: image,
      price: price,
      name: name,
      time: time,
      calories: calories,
      rating: rating,
      desc: desc,
      id: id,
      isRecommended: isRecommended,
      isPopular: isPopular,
    );
  }
}
