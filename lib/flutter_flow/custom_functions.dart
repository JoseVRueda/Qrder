import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String joinWithCommas(List<String> ingredients) {
  // Usa el método join para unir los elementos con una coma
  return ingredients.join(', ');
}

double? totalAmount(List<ProductStruct> shoppingCart) {
  // Inicializa el total en 0.0
  double total = 0.0;

  // Recorre cada producto en el carrito de compras
  for (var product in shoppingCart) {
    // Suma el precio total (precio * cantidad) de cada producto
    total += (product.price * product.quantity);
  }

  return total;
}

int? totalQuantity(List<ProductStruct> shoppingCart) {
  // Inicializa el total en 0.0
  int total = 0;

  // Recorre cada producto en el carrito de compras
  for (var product in shoppingCart) {
    // Suma el precio total (precio * cantidad) de cada producto
    total += product.quantity;
  }

  return total;
}

bool isProductInCart(
  List<ProductStruct> shoppingCart,
  String name,
) {
  // Recorre cada producto en el carrito
  for (var product in shoppingCart) {
    // Verifica si el nombre coincide
    if (product.name == name) {
      return true; // El producto está en el carrito
    }
  }
  return false; // El producto no está en el carrito
}

bool isProductRemovable(
  List<ProductStruct> shoppingCart,
  String name,
) {
  // Recorre cada producto en el carrito
  for (var product in shoppingCart) {
    // Verifica si el nombre coincide y la cantidad es 1
    if (product.name == name && product.quantity == 1) {
      return true; // El producto es eliminable
    }
  }
  return false; // El producto no es eliminable o no se encontró
}

int getQuantityByName(
  List<ProductStruct> shoppingCart,
  String name,
) {
  // Recorre cada producto en el carrito
  for (var product in shoppingCart) {
    // Verifica si el nombre coincide
    if (product.name == name) {
      return product.quantity; // Devuelve la cantidad del producto encontrado
    }
  }

  return 0; // Si el producto no se encuentra, devuelve 0
}

int getIndexByName(
  List<ProductStruct> shoppingCart,
  String name,
) {
  // Recorre cada producto en el carrito con su índice
  for (int i = 0; i < shoppingCart.length; i++) {
    // Verifica si el nombre coincide
    if (shoppingCart[i].name == name) {
      return i; // Devuelve el índice del producto encontrado
    }
  }
  return 403;
}
