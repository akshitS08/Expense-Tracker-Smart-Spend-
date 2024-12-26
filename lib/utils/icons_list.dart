import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppIcons {
  final List<Map<String, dynamic>> homeExpenseCategories = [
    {
      "name": "Gas Filling",
      "icons": FontAwesomeIcons.gasPump,
    },
    {
      "name": "Grocery",
      "icons": FontAwesomeIcons.shoppingCart,
    },
    {
      "name": "Milk",
      "icons": FontAwesomeIcons.mugHot,
    },
    {
      "name": "Internet",
      "icons": FontAwesomeIcons.wifi,
    },
    {
      "name": "Electricity",
      "icons": FontAwesomeIcons.bolt,
    },
    {
      "name": "Water",
      "icons": FontAwesomeIcons.water,
    },
    {
      "name": "Rent",
      "icons": FontAwesomeIcons.home,
    },
    {
      "name": "Phone Bill",
      "icons": FontAwesomeIcons.phone,
    },
    {
      "name": "Dining Out",
      "icons": FontAwesomeIcons.utensils,
    },
    {
      "name": "Entertainment",
      "icons": FontAwesomeIcons.film,
    },
    {
      "name": "Health Care",
      "icons": FontAwesomeIcons.medkit,
    },
    {
      "name": "Transportation",
      "icons": FontAwesomeIcons.bus,
    },
    {
      "name": "Clothing",
      "icons": FontAwesomeIcons.tshirt,
    },
    {
      "name": "Insurance",
      "icons": FontAwesomeIcons.shieldAlt,
    },
    {
      "name": "Education",
      "icons": FontAwesomeIcons.graduationCap,
    },
    {
      "name": "Others",
      "icons": FontAwesomeIcons.cartPlus,
    },
  ];

  IconData getExpenseCategoryIcons(String categoryName) {
    final category = homeExpenseCategories.firstWhere(
          (category) => category['name'] == categoryName,
      orElse: () => {"icons": FontAwesomeIcons.shoppingCart}, // Fallback icon
    );
    return category['icons'] as IconData; // Cast as IconData
  }
}
