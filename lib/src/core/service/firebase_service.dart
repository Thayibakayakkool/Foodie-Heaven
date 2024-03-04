import 'package:foodie_heaven/src/core/constants/firebase_constant.dart';

class FirebaseService {
  static getCart(uid) {
    return cartCollection.where('added_by', isEqualTo: uid).snapshots();
  }

  static getUser(uid) {
    return userCollection.where('uid', isEqualTo: uid).snapshots();
  }

  static getRecommendedProduct() {
    final result = allCollection.where('isRecommended', isEqualTo: true).get();
    return result;
  }

  static getPopularProduct() {
    final result = allCollection.where('isPopular', isEqualTo: true).get();
    return result;
  }

  static getAllOrders() {
    return orderCollection
        .where('orderBy', isEqualTo: auth.currentUser!.uid)
        .snapshots();
  }

  static searchProduct(title) {
    return allCollection.get();
  }

  static removeFromCart(docId){
    cartCollection.doc(docId).delete();
  }
}
