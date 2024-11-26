// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<String>> getUniqueCategories(String restaurantId) async {
  // Consulta a la colección 'product' filtrando por 'restaurantId'
  final querySnapshot = await FirebaseFirestore.instance
      .collection('product')
      .where('restaurantId', isEqualTo: restaurantId)
      .get();

  // Extrae todas las categorías de los documentos con el 'restaurantId' especificado
  List<String> allCategories = querySnapshot.docs.map((doc) {
    return doc['category'] as String;
  }).toList();

  // Filtra los valores únicos usando un conjunto (Set)
  List<String> uniqueCategories = allCategories.toSet().toList();

  return uniqueCategories;
}
