import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HistoryRecord extends FirestoreRecord {
  HistoryRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "restaurantName" field.
  String? _restaurantName;
  String get restaurantName => _restaurantName ?? '';
  bool hasRestaurantName() => _restaurantName != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "products" field.
  List<String>? _products;
  List<String> get products => _products ?? const [];
  bool hasProducts() => _products != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "productsCost" field.
  List<double>? _productsCost;
  List<double> get productsCost => _productsCost ?? const [];
  bool hasProductsCost() => _productsCost != null;

  // "user" field.
  String? _user;
  String get user => _user ?? '';
  bool hasUser() => _user != null;

  void _initializeFields() {
    _restaurantName = snapshotData['restaurantName'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _products = getDataList(snapshotData['products']);
    _amount = castToType<double>(snapshotData['amount']);
    _productsCost = getDataList(snapshotData['productsCost']);
    _user = snapshotData['user'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('history');

  static Stream<HistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HistoryRecord.fromSnapshot(s));

  static Future<HistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HistoryRecord.fromSnapshot(s));

  static HistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHistoryRecordData({
  String? restaurantName,
  DateTime? date,
  double? amount,
  String? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'restaurantName': restaurantName,
      'date': date,
      'amount': amount,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class HistoryRecordDocumentEquality implements Equality<HistoryRecord> {
  const HistoryRecordDocumentEquality();

  @override
  bool equals(HistoryRecord? e1, HistoryRecord? e2) {
    const listEquality = ListEquality();
    return e1?.restaurantName == e2?.restaurantName &&
        e1?.date == e2?.date &&
        listEquality.equals(e1?.products, e2?.products) &&
        e1?.amount == e2?.amount &&
        listEquality.equals(e1?.productsCost, e2?.productsCost) &&
        e1?.user == e2?.user;
  }

  @override
  int hash(HistoryRecord? e) => const ListEquality().hash([
        e?.restaurantName,
        e?.date,
        e?.products,
        e?.amount,
        e?.productsCost,
        e?.user
      ]);

  @override
  bool isValidKey(Object? o) => o is HistoryRecord;
}
