import 'dart:convert';
import '4-util.dart';

Future<double> calculateTotal() async {
  try {
    final userData = await fetchUserData();
    final user = jsonDecode(userData);
    final String id = user['id'];

    final ordersJson = await fetchUserOrders(id);
    final orders = jsonDecode(ordersJson);

    double total = 0.0;

    if (orders is List) {
      for (var product in orders) {
        final priceJson = await fetchProductPrice(product);
        final priceDecoded = jsonDecode(priceJson);
        if (priceDecoded is num) {
          total += priceDecoded.toDouble();
        }
      }
    }

    return total;
  } catch (e) {
    return -1;
  }
}
