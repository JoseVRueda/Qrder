import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _shoppingCart = prefs
              .getStringList('ff_shoppingCart')
              ?.map((x) {
                try {
                  return ProductStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _shoppingCart;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<ProductStruct> _shoppingCart = [];
  List<ProductStruct> get shoppingCart => _shoppingCart;
  set shoppingCart(List<ProductStruct> value) {
    _shoppingCart = value;
    prefs.setStringList(
        'ff_shoppingCart', value.map((x) => x.serialize()).toList());
  }

  void addToShoppingCart(ProductStruct value) {
    shoppingCart.add(value);
    prefs.setStringList(
        'ff_shoppingCart', _shoppingCart.map((x) => x.serialize()).toList());
  }

  void removeFromShoppingCart(ProductStruct value) {
    shoppingCart.remove(value);
    prefs.setStringList(
        'ff_shoppingCart', _shoppingCart.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromShoppingCart(int index) {
    shoppingCart.removeAt(index);
    prefs.setStringList(
        'ff_shoppingCart', _shoppingCart.map((x) => x.serialize()).toList());
  }

  void updateShoppingCartAtIndex(
    int index,
    ProductStruct Function(ProductStruct) updateFn,
  ) {
    shoppingCart[index] = updateFn(_shoppingCart[index]);
    prefs.setStringList(
        'ff_shoppingCart', _shoppingCart.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInShoppingCart(int index, ProductStruct value) {
    shoppingCart.insert(index, value);
    prefs.setStringList(
        'ff_shoppingCart', _shoppingCart.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
