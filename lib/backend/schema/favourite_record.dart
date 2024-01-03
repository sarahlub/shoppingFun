import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavouriteRecord extends FirestoreRecord {
  FavouriteRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _image = snapshotData['image'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('favourite');

  static Stream<FavouriteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FavouriteRecord.fromSnapshot(s));

  static Future<FavouriteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FavouriteRecord.fromSnapshot(s));

  static FavouriteRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FavouriteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FavouriteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FavouriteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FavouriteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FavouriteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFavouriteRecordData({
  String? name,
  double? price,
  String? image,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'price': price,
      'image': image,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class FavouriteRecordDocumentEquality implements Equality<FavouriteRecord> {
  const FavouriteRecordDocumentEquality();

  @override
  bool equals(FavouriteRecord? e1, FavouriteRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.price == e2?.price &&
        e1?.image == e2?.image &&
        e1?.description == e2?.description;
  }

  @override
  int hash(FavouriteRecord? e) =>
      const ListEquality().hash([e?.name, e?.price, e?.image, e?.description]);

  @override
  bool isValidKey(Object? o) => o is FavouriteRecord;
}
