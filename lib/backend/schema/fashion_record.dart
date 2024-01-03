import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FashionRecord extends FirestoreRecord {
  FashionRecord._(
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

  // "size" field.
  String? _size;
  String get size => _size ?? '';
  bool hasSize() => _size != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _image = snapshotData['image'] as String?;
    _description = snapshotData['description'] as String?;
    _size = snapshotData['size'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('fashion');

  static Stream<FashionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FashionRecord.fromSnapshot(s));

  static Future<FashionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FashionRecord.fromSnapshot(s));

  static FashionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FashionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FashionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FashionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FashionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FashionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFashionRecordData({
  String? name,
  double? price,
  String? image,
  String? description,
  String? size,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'price': price,
      'image': image,
      'description': description,
      'size': size,
    }.withoutNulls,
  );

  return firestoreData;
}

class FashionRecordDocumentEquality implements Equality<FashionRecord> {
  const FashionRecordDocumentEquality();

  @override
  bool equals(FashionRecord? e1, FashionRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.price == e2?.price &&
        e1?.image == e2?.image &&
        e1?.description == e2?.description &&
        e1?.size == e2?.size;
  }

  @override
  int hash(FashionRecord? e) => const ListEquality()
      .hash([e?.name, e?.price, e?.image, e?.description, e?.size]);

  @override
  bool isValidKey(Object? o) => o is FashionRecord;
}
