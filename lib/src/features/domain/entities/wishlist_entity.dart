import 'package:equatable/equatable.dart';

class WishlistEntity extends Equatable {
  final String image;
  final String name;
  final int price;
  final String id;
  final int time;
  final String calories;
  final double rating;
  final String desc;

  const WishlistEntity({
    required this.image,
    required this.name,
    required this.price,
    required this.id,
    required this.time,
    required this.calories,
    required this.rating,
    required this.desc,
  });

  Map<String, Object?> toDocument() {
    return {
      'image': image,
      'name': name,
      'price': price,
      'id': id,
      'time': time,
      'calories': calories,
      'rating': rating,
      'desc': desc,
    };
  }

  static WishlistEntity fromDocument(Map<String, dynamic> doc) {
    return WishlistEntity(
      image: doc['image'],
      name: doc['name'],
      price: doc['price'],
      id: doc['id'],
      time: doc['time'],
      calories: doc['calories'],
      rating: doc['rating'],
      desc: doc['desc'],
    );
  }

  @override
  List<Object?> get props => [
        image,
        name,
        price,
        id,
        time,
        rating,
        calories,
        desc,
      ];
}
