import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app/modules/budidaya/model/model_price_list.dart';
import 'package:app/modules/budidaya/model/model_upload_file.dart';
import 'package:app/modules/pond/model/model_pond.dart';

class BudidayaModel {
  final String id;
  final String pondID;
  final PondModel? pond;
  final String poolID;
  final PoolModel pool;
  final DateTime dateOfSeed;
  final String fishSpeciesID;
  final FishModel fishSpecies;
  final String? fishSpeciesName;
  final double? estTonase;
  final DateTime? estPanenDate;
  final int? estPrice;
  final int? sold;
  final int? stock;
  final String status;
  final List<PriceListModel>? priceList;
  BudidayaModel({
    required this.id,
    required this.pondID,
    this.pond,
    required this.poolID,
    required this.pool,
    required this.dateOfSeed,
    required this.fishSpeciesID,
    required this.fishSpecies,
    this.fishSpeciesName,
    this.estTonase,
    this.estPanenDate,
    this.estPrice,
    this.sold,
    this.stock,
    required this.status,
    this.priceList,
  });

  BudidayaModel copyWith({
    String? id,
    String? pondID,
    PondModel? pond,
    String? poolID,
    PoolModel? pool,
    DateTime? dateOfSeed,
    String? fishSpeciesID,
    FishModel? fishSpecies,
    String? fishSpeciesName,
    double? estTonase,
    DateTime? estPanenDate,
    int? estPrice,
    int? sold,
    int? stock,
    String? status,
    List<PriceListModel>? priceList,
  }) {
    return BudidayaModel(
      id: id ?? this.id,
      pondID: pondID ?? this.pondID,
      pond: pond ?? this.pond,
      poolID: poolID ?? this.poolID,
      pool: pool ?? this.pool,
      dateOfSeed: dateOfSeed ?? this.dateOfSeed,
      fishSpeciesID: fishSpeciesID ?? this.fishSpeciesID,
      fishSpecies: fishSpecies ?? this.fishSpecies,
      fishSpeciesName: fishSpeciesName ?? this.fishSpeciesName,
      estTonase: estTonase ?? this.estTonase,
      estPanenDate: estPanenDate ?? this.estPanenDate,
      estPrice: estPrice ?? this.estPrice,
      sold: sold ?? this.sold,
      stock: stock ?? this.stock,
      status: status ?? this.status,
      priceList: priceList ?? this.priceList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pondID': pondID,
      'pond': pond?.toMap(),
      'poolID': poolID,
      'pool': pool.toMap(),
      'dateOfSeed': dateOfSeed.toUtc().toIso8601String(),
      'fishSpeciesID': fishSpeciesID,
      'fishSpecies': fishSpecies.toMap(),
      'fishSpeciesName': fishSpeciesName,
      'estTonase': estTonase,
      'estPanenDate': estPanenDate?.toUtc().toIso8601String(),
      'estPrice': estPrice,
      'sold': sold,
      'stock': stock,
      'status': status,
      'priceList': priceList?.map((x) => x.toMap()).toList(),
    };
  }

  factory BudidayaModel.fromMap(Map<String, dynamic> map) {
    return BudidayaModel(
      id: map['id'] ?? '',
      pondID: map['pondID'] ?? '',
      pond: map['pond'] != null ? PondModel.fromMap(map['pond']) : null,
      poolID: map['poolID'] ?? '',
      pool: PoolModel.fromMap(map['pool']),
      dateOfSeed: DateTime.parse(map['dateOfSeed']).toLocal(),
      fishSpeciesID: map['fishSpeciesID'] ?? '',
      fishSpecies: FishModel.fromMap(map['fishSpecies']),
      fishSpeciesName: map['fishSpeciesName'],
      estTonase: map['estTonase']?.toDouble(),
      estPanenDate: map['estPanenDate'] != null
          ? DateTime.parse(map['estPanenDate']).toLocal()
          : null,
      estPrice: map['estPrice']?.toInt(),
      sold: map['sold']?.toInt(),
      stock: map['stock']?.toInt(),
      status: map['status'] ?? '',
      priceList: map['priceList'] != null
          ? List<PriceListModel>.from(
              map['priceList']?.map((x) => PriceListModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BudidayaModel.fromJson(String source) =>
      BudidayaModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BudidayaModel(id: $id, pondID: $pondID, pond: $pond, poolID: $poolID, pool: $pool, dateOfSeed: $dateOfSeed, fishSpeciesID: $fishSpeciesID, fishSpecies: $fishSpecies, fishSpeciesName: $fishSpeciesName, estTonase: $estTonase, estPanenDate: $estPanenDate, estPrice: $estPrice, sold: $sold, stock: $stock, status: $status, priceList: $priceList)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BudidayaModel &&
        other.id == id &&
        other.pondID == pondID &&
        other.pond == pond &&
        other.poolID == poolID &&
        other.pool == pool &&
        other.dateOfSeed == dateOfSeed &&
        other.fishSpeciesID == fishSpeciesID &&
        other.fishSpecies == fishSpecies &&
        other.fishSpeciesName == fishSpeciesName &&
        other.estTonase == estTonase &&
        other.estPanenDate == estPanenDate &&
        other.estPrice == estPrice &&
        other.sold == sold &&
        other.stock == stock &&
        other.status == status &&
        listEquals(other.priceList, priceList);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        pondID.hashCode ^
        pond.hashCode ^
        poolID.hashCode ^
        pool.hashCode ^
        dateOfSeed.hashCode ^
        fishSpeciesID.hashCode ^
        fishSpecies.hashCode ^
        fishSpeciesName.hashCode ^
        estTonase.hashCode ^
        estPanenDate.hashCode ^
        estPrice.hashCode ^
        sold.hashCode ^
        stock.hashCode ^
        status.hashCode ^
        priceList.hashCode;
  }
}

class PoolModel {
  final String? id;
  final String name;
  final double long;
  final double wide;
  final String image;
  final String? pondID;
  final PondModel? pond;
  PoolModel({
    this.id,
    required this.name,
    required this.long,
    required this.wide,
    required this.image,
    this.pondID,
    this.pond,
  });

  PoolModel copyWith({
    String? id,
    String? name,
    double? long,
    double? wide,
    String? image,
    String? pondID,
    PondModel? pond,
  }) {
    return PoolModel(
      id: id ?? this.id,
      name: name ?? this.name,
      long: long ?? this.long,
      wide: wide ?? this.wide,
      image: image ?? this.image,
      pondID: pondID ?? this.pondID,
      pond: pond ?? this.pond,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'long': long,
      'wide': wide,
      'image': image,
      'pondID': pondID,
      'pond': pond?.toMap(),
    };
  }

  factory PoolModel.fromMap(Map<String, dynamic> map) {
    return PoolModel(
      id: map['id'],
      name: map['name'] ?? '',
      long: map['long']?.toDouble() ?? 0.0,
      wide: map['wide']?.toDouble() ?? 0.0,
      image: map['image'] ?? '',
      pondID: map['pondID'],
      pond: map['pond'] != null ? PondModel.fromMap(map['pond']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PoolModel.fromJson(String source) =>
      PoolModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PoolModel(id: $id, name: $name, long: $long, wide: $wide, image: $image, pondID: $pondID, pond: $pond)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PoolModel &&
        other.id == id &&
        other.name == name &&
        other.long == long &&
        other.wide == wide &&
        other.image == image &&
        other.pondID == pondID &&
        other.pond == pond;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        long.hashCode ^
        wide.hashCode ^
        image.hashCode ^
        pondID.hashCode ^
        pond.hashCode;
  }
}

class FishModel {
  final String id;
  final String name;
  final String asal;
  final List<BudidayaModel>? budidaya;
  FishModel({
    required this.id,
    required this.name,
    required this.asal,
    this.budidaya,
  });

  FishModel copyWith({
    String? id,
    String? name,
    String? asal,
    List<BudidayaModel>? budidaya,
  }) {
    return FishModel(
      id: id ?? this.id,
      name: name ?? this.name,
      asal: asal ?? this.asal,
      budidaya: budidaya ?? this.budidaya,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'asal': asal,
      'budidaya': budidaya?.map((x) => x.toMap()).toList(),
    };
  }

  factory FishModel.fromMap(Map<String, dynamic> map) {
    return FishModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      asal: map['asal'] ?? '',
      budidaya: map['budidaya'] != null
          ? List<BudidayaModel>.from(
              map['budidaya']?.map((x) => BudidayaModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FishModel.fromJson(String source) =>
      FishModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FishModel(id: $id, name: $name, asal: $asal, budidaya: $budidaya)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FishModel &&
        other.id == id &&
        other.name == name &&
        other.asal == asal &&
        listEquals(other.budidaya, budidaya);
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ asal.hashCode ^ budidaya.hashCode;
  }
}
