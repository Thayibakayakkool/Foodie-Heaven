import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodie_heaven/src/features/domain/usecases/auth_usecases.dart';
import 'package:foodie_heaven/src/features/domain/usecases/cart_usecases.dart';
import 'package:foodie_heaven/src/features/domain/usecases/categories_usecases.dart';
import 'package:foodie_heaven/src/features/domain/usecases/order_usecases.dart';
import 'package:foodie_heaven/src/features/domain/usecases/wishlist_usecases.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth auth = FirebaseAuth.instance;

FirebaseFirestore fireStore = FirebaseFirestore.instance;

User? currentUser = auth.currentUser;

//useCases
AuthUseCases authUseCases = AuthUseCases();
GoogleSignIn googleSignIn = GoogleSignIn();
CategoriesUseCases categoriesUseCases = CategoriesUseCases();
CartUseCases cartUseCases = CartUseCases();
WishlistUseCases wishlistUseCases = WishlistUseCases();
OrderUseCases orderUseCases = OrderUseCases();

final categoriesCollection =
    fireStore.collection('categories').doc('26QvRYCqwuP5Rn8XKaFp');


final userCollection = fireStore.collection("users");
final cartCollection = fireStore.collection('cart');
final orderCollection = fireStore.collection('orders');
final wishlistCollection = fireStore.collection('wishlist');

//category
final burgerCollection = categoriesCollection.collection('Burger');
final comboCollection = categoriesCollection.collection('Combo');
final coolDrinksCollection = categoriesCollection.collection('Cool Drinks');
final friesCollection = categoriesCollection.collection('Fries');
final pizzaCollection = categoriesCollection.collection('Pizza');
final sandwichCollection = categoriesCollection.collection('Sandwich');
final wrapCollection = categoriesCollection.collection('Wrap');
final allCollection = categoriesCollection.collection('All');

