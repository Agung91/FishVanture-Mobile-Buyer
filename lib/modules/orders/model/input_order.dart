import 'dart:convert';

class OrderInput {
  final String budidayaID;
  final int qty;
  final DateTime bookingDate;
  OrderInput({
    required this.budidayaID,
    required this.qty,
    required this.bookingDate,
  });

  OrderInput copyWith({
    String? budidayaID,
    int? qty,
    DateTime? bookingDate,
  }) {
    return OrderInput(
      budidayaID: budidayaID ?? this.budidayaID,
      qty: qty ?? this.qty,
      bookingDate: bookingDate ?? this.bookingDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'budidayaID': budidayaID,
      'qty': qty,
      'bookingDate': bookingDate.toUtc().toIso8601String(),
    };
  }

  factory OrderInput.fromMap(Map<String, dynamic> map) {
    return OrderInput(
      budidayaID: map['budidayaID'] ?? '',
      qty: map['qty']?.toInt() ?? 0,
      bookingDate: DateTime.parse(map['bookingDate']).toLocal(),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderInput.fromJson(String source) =>
      OrderInput.fromMap(json.decode(source));

  @override
  String toString() =>
      'OrderInput(budidayaID: $budidayaID, qty: $qty, bookingDate: $bookingDate)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderInput &&
        other.budidayaID == budidayaID &&
        other.qty == qty &&
        other.bookingDate == bookingDate;
  }

  @override
  int get hashCode => budidayaID.hashCode ^ qty.hashCode ^ bookingDate.hashCode;
}
