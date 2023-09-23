import 'dart:convert';

class PromosModel {
  final String id;
  final String name;
  final String description;
  final String startDate;
  final String endDate;
  final String link;
  PromosModel({
    required this.id,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.link,
  });

  PromosModel copyWith({
    String? id,
    String? name,
    String? description,
    String? startDate,
    String? endDate,
    String? link,
  }) {
    return PromosModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      link: link ?? this.link,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'startDate': startDate,
      'endDate': endDate,
      'link': link,
    };
  }

  factory PromosModel.fromMap(Map<String, dynamic> map) {
    return PromosModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      startDate: map['startDate'] ?? '',
      endDate: map['endDate'] ?? '',
      link: map['link'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PromosModel.fromJson(String source) =>
      PromosModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PromosModel(id: $id, name: $name, description: $description, startDate: $startDate, endDate: $endDate, link: $link)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PromosModel &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.link == link;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        link.hashCode;
  }
}
