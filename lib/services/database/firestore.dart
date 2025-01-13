import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/cart_item.dart';
import '../../models/food.dart';

class FirestoreService {
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');

  Future<void> saveCartItemsToFirestore(List<CartItem> cartItems) async {
    await orders.add({
      'date': DateTime.now(),
    });
  }
}
