import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app/common/model/model_address.dart';
import 'package:app/modules/budidaya/model/model_budidaya.dart';
import 'package:app/modules/budidaya/model/model_upload_file.dart';

class PondModel {
  final String id;
  final String name;
  final String userID;
  final UserPond? user;
  final String countryID;
  final CountryModel country;
  final String provinceID;
  final ProvinceModel province;
  final String cityID;
  final CityModel city;
  final String districtID;
  final DistrictModel district;
  final String detailAddress;
  final String noteAddress;
  final String type;
  final String url;
  final String status;
  final double? latitude;
  final double? longitude;
  final String? teamID;
  final String image;
  final List<PoolModel>? listPool;
  final List<FileModel>? berkas;
  PondModel({
    required this.id,
    required this.name,
    required this.userID,
    required this.user,
    required this.countryID,
    required this.country,
    required this.provinceID,
    required this.province,
    required this.cityID,
    required this.city,
    required this.districtID,
    required this.district,
    required this.detailAddress,
    required this.noteAddress,
    required this.type,
    required this.url,
    required this.status,
    this.latitude,
    this.longitude,
    required this.teamID,
    required this.image,
    this.listPool,
    this.berkas,
  });

  PondModel copyWith({
    String? id,
    String? name,
    String? userID,
    UserPond? user,
    String? countryID,
    CountryModel? country,
    String? provinceID,
    ProvinceModel? province,
    String? cityID,
    CityModel? city,
    String? districtID,
    DistrictModel? district,
    String? detailAddress,
    String? noteAddress,
    String? type,
    String? url,
    String? status,
    double? latitude,
    double? longitude,
    String? teamID,
    String? image,
    List<PoolModel>? listPool,
    List<FileModel>? berkas,
  }) {
    return PondModel(
      id: id ?? this.id,
      name: name ?? this.name,
      userID: userID ?? this.userID,
      user: user ?? this.user,
      countryID: countryID ?? this.countryID,
      country: country ?? this.country,
      provinceID: provinceID ?? this.provinceID,
      province: province ?? this.province,
      cityID: cityID ?? this.cityID,
      city: city ?? this.city,
      districtID: districtID ?? this.districtID,
      district: district ?? this.district,
      detailAddress: detailAddress ?? this.detailAddress,
      noteAddress: noteAddress ?? this.noteAddress,
      type: type ?? this.type,
      url: url ?? this.url,
      status: status ?? this.status,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      teamID: teamID ?? this.teamID,
      image: image ?? this.image,
      listPool: listPool ?? this.listPool,
      berkas: berkas ?? this.berkas,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'userID': userID,
      'user': user?.toMap(),
      'countryID': countryID,
      'country': country.toMap(),
      'provinceID': provinceID,
      'province': province.toMap(),
      'cityID': cityID,
      'city': city.toMap(),
      'districtID': districtID,
      'district': district.toMap(),
      'detailAddress': detailAddress,
      'noteAddress': noteAddress,
      'type': type,
      'url': url,
      'status': status,
      'latitude': latitude,
      'longitude': longitude,
      'teamID': teamID,
      'image': image,
      'listPool': listPool?.map((x) => x.toMap()).toList(),
      'berkas': berkas?.map((x) => x.toMap()).toList(),
    };
  }

  factory PondModel.fromMap(Map<String, dynamic> map) {
    return PondModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      userID: map['userID'] ?? '',
      user: map['user'] != null ? UserPond.fromMap(map['user']) : null,
      countryID: map['countryID'] ?? '',
      country: CountryModel.fromMap(map['country']),
      provinceID: map['provinceID'] ?? '',
      province: ProvinceModel.fromMap(map['province']),
      cityID: map['cityID'] ?? '',
      city: CityModel.fromMap(map['city']),
      districtID: map['districtID'] ?? '',
      district: DistrictModel.fromMap(map['district']),
      detailAddress: map['detailAddress'] ?? '',
      noteAddress: map['noteAddress'] ?? '',
      type: map['type'] ?? '',
      url: map['url'] ?? '',
      status: map['status'] ?? '',
      latitude: map['latitude']?.toDouble(),
      longitude: map['longitude']?.toDouble(),
      teamID: map['teamID'],
      image: map['image'] ?? '',
      listPool: map['listPool'] != null
          ? List<PoolModel>.from(
              map['listPool']?.map((x) => PoolModel.fromMap(x)))
          : null,
      berkas: map['berkas'] != null
          ? List<FileModel>.from(
              map['berkas']?.map((x) => FileModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PondModel.fromJson(String source) =>
      PondModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PondModel(id: $id, name: $name, userID: $userID, user: $user, countryID: $countryID, country: $country, provinceID: $provinceID, province: $province, cityID: $cityID, city: $city, districtID: $districtID, district: $district, detailAddress: $detailAddress, noteAddress: $noteAddress, type: $type, url: $url, status: $status, latitude: $latitude, longitude: $longitude, teamID: $teamID, image: $image, listPool: $listPool, berkas: $berkas)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PondModel &&
        other.id == id &&
        other.name == name &&
        other.userID == userID &&
        other.user == user &&
        other.countryID == countryID &&
        other.country == country &&
        other.provinceID == provinceID &&
        other.province == province &&
        other.cityID == cityID &&
        other.city == city &&
        other.districtID == districtID &&
        other.district == district &&
        other.detailAddress == detailAddress &&
        other.noteAddress == noteAddress &&
        other.type == type &&
        other.url == url &&
        other.status == status &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.teamID == teamID &&
        other.image == image &&
        listEquals(other.listPool, listPool) &&
        listEquals(other.berkas, berkas);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        userID.hashCode ^
        user.hashCode ^
        countryID.hashCode ^
        country.hashCode ^
        provinceID.hashCode ^
        province.hashCode ^
        cityID.hashCode ^
        city.hashCode ^
        districtID.hashCode ^
        district.hashCode ^
        detailAddress.hashCode ^
        noteAddress.hashCode ^
        type.hashCode ^
        url.hashCode ^
        status.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        teamID.hashCode ^
        image.hashCode ^
        listPool.hashCode ^
        berkas.hashCode;
  }
}

class UserPond {
  final String name;
  final String varificationCode;
  final DateTime expVerificationCode;
  UserPond({
    required this.name,
    required this.varificationCode,
    required this.expVerificationCode,
  });

  UserPond copyWith({
    String? name,
    String? varificationCode,
    DateTime? expVerificationCode,
  }) {
    return UserPond(
      name: name ?? this.name,
      varificationCode: varificationCode ?? this.varificationCode,
      expVerificationCode: expVerificationCode ?? this.expVerificationCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'varificationCode': varificationCode,
      'expVerificationCode': expVerificationCode.millisecondsSinceEpoch,
    };
  }

  factory UserPond.fromMap(Map<String, dynamic> map) {
    return UserPond(
      name: map['name'] ?? '',
      varificationCode: map['varificationCode'] ?? '',
      expVerificationCode: DateTime.parse(map['expVerificationCode']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserPond.fromJson(String source) =>
      UserPond.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserPond(name: $name, varificationCode: $varificationCode, expVerificationCode: $expVerificationCode)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserPond &&
        other.name == name &&
        other.varificationCode == varificationCode &&
        other.expVerificationCode == expVerificationCode;
  }

  @override
  int get hashCode =>
      name.hashCode ^ varificationCode.hashCode ^ expVerificationCode.hashCode;
}
