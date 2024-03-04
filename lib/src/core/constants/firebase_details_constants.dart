import 'package:foodie_heaven/src/core/constants/firebase_constant.dart';

int subTotal = 0;

subTotalCalculate(data) {
  subTotal = 0;
  for (var i = 0; i < data.length; i++) {
    subTotal = subTotal + int.parse(data[i]['total'].toString());
  }
}

dynamic itemSnapshot;
var items = [];

getProductDetails() {
  items.clear();
  for (var i = 0; i < itemSnapshot.length; i++) {
    items.add({
      'image': itemSnapshot[i]['image'],
      'price': itemSnapshot[i]['price'],
      'total': itemSnapshot[i]['total'],
      'quantity': itemSnapshot[i]['quantity'],
      'name': itemSnapshot[i]['name'],
    });
  }
}

clearCart() {
  for (var i = 0; i < itemSnapshot.length; i++) {
    fireStore.collection('cart').doc(itemSnapshot[i].id).delete();
  }
}
