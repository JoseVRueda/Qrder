import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RestaurantsRecord extends FirestoreRecord {
  RestaurantsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "distanceInMinutes" field.
  int? _distanceInMinutes;
  int get distanceInMinutes => _distanceInMinutes ?? 0;
  bool hasDistanceInMinutes() => _distanceInMinutes != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "photoUrl" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "restaurantId" field.
  String? _restaurantId;
  String get restaurantId => _restaurantId ?? '';
  bool hasRestaurantId() => _restaurantId != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _distanceInMinutes = castToType<int>(snapshotData['distanceInMinutes']);
    _rating = castToType<double>(snapshotData['rating']);
    _photoUrl = snapshotData['photoUrl'] as String?;
    _restaurantId = snapshotData['restaurantId'] as String?;
    _address = snapshotData['address'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('restaurants');

  static Stream<RestaurantsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RestaurantsRecord.fromSnapshot(s));

  static Future<RestaurantsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RestaurantsRecord.fromSnapshot(s));

  static RestaurantsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RestaurantsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RestaurantsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RestaurantsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RestaurantsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RestaurantsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRestaurantsRecordData({
  String? name,
  int? distanceInMinutes,
  double? rating,
  String? photoUrl,
  String? restaurantId,
  String? address,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'distanceInMinutes': distanceInMinutes,
      'rating': rating,
      'photoUrl': photoUrl,
      'restaurantId': restaurantId,
      'address': address,
    }.withoutNulls,
  );

  return firestoreData;
}

class RestaurantsRecordDocumentEquality implements Equality<RestaurantsRecord> {
  const RestaurantsRecordDocumentEquality();

  @override
  bool equals(RestaurantsRecord? e1, RestaurantsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.distanceInMinutes == e2?.distanceInMinutes &&
        e1?.rating == e2?.rating &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.restaurantId == e2?.restaurantId &&
        e1?.address == e2?.address;
  }

  @override
  int hash(RestaurantsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.distanceInMinutes,
        e?.rating,
        e?.photoUrl,
        e?.restaurantId,
        e?.address
      ]);

  @override
  bool isValidKey(Object? o) => o is RestaurantsRecord;
}
