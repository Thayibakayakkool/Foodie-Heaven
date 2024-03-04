import 'package:equatable/equatable.dart';

class CategoriesEntity extends Equatable {
  final String image;
  final int price;
  final String name;
  final int time;
  final String calories;
  final double rating;
  final String desc;
  final String id;
  final bool isRecommended;
  final bool isPopular;

  const CategoriesEntity(
      {required this.image,
      required this.price,
      required this.name,
      required this.time,
      required this.calories,
      required this.rating,
      required this.desc,
      required this.id,
      required this.isRecommended,
      required this.isPopular});

  Map<String, Object?> toDocument() {
    return {
      'image': image,
      'name': name,
      'price': price,
      'time': time,
      'calories': calories,
      'rating': rating,
      'desc': desc,
      'id': id,
      'isRecommended': isRecommended,
      'isPopular': isPopular
    };
  }

  static CategoriesEntity fromDocument(Map<String, dynamic> doc) {
    return CategoriesEntity(
      image: doc['image'],
      name: doc['name'],
      price: doc['price'],
      time: doc['time'],
      calories: doc['calories'],
      rating: doc['rating'],
      desc: doc['desc'],
      id: doc['id'],
      isPopular: doc['isPopular'],
      isRecommended: doc['isRecommended'],
    );
  }

  @override
  List<Object?> get props => [
        image,
        name,
        price,
        time,
        calories,
        rating,
        desc,
        id,
        isRecommended,
        isPopular
      ];
}
