import 'dart:convert';

class OrderCancelInput {
  final String id;
  OrderCancelInput({
    required this.id,
  });

  OrderCancelInput copyWith({
    String? id,
  }) {
    return OrderCancelInput(
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  factory OrderCancelInput.fromMap(Map<String, dynamic> map) {
    return OrderCancelInput(
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderCancelInput.fromJson(String source) =>
      OrderCancelInput.fromMap(json.decode(source));

  @override
  String toString() => 'OrderCancelInput(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderCancelInput && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
