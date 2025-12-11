import '4-util.dart';
import 'dart:convert';

Future<double> calculateTotal() async {
  try {
    // 1. Récupérer les données utilisateur
    final userData = await fetchUserData();
    final user = jsonDecode(userData);
    final userId = user['id'];

    // 2. Récupérer les commandes de l'utilisateur
    final ordersData = await fetchUserOrders(userId);
    final orders = jsonDecode(ordersData);

    double total = 0;

    // 3. Parcourir chaque produit de la commande
    for (var product in orders) {
      final priceData = await fetchProductPrice(product);
      final price = jsonDecode(priceData);

      // Additionner le prix
      total += price;
    }

    return total;
  } catch (e) {
    return -1;
  }
}
