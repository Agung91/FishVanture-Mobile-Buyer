import 'dart:convert';

class Paginations {
  int? limit;
  int? page;
  String? keyword;
  String? direction;
  String? sort;
  Paginations({
    this.limit,
    this.page,
    this.keyword,
    this.direction,
    this.sort,
  });

  Paginations copyWith({
    int? limit,
    int? page,
    String? keyword,
    String? direction,
    String? sort,
  }) {
    return Paginations(
      limit: limit ?? this.limit,
      page: page ?? this.page,
      keyword: keyword ?? this.keyword,
      direction: direction ?? this.direction,
      sort: sort ?? this.sort,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'limit': limit,
      'page': page,
      'keyword': keyword,
      'direction': direction,
      'sort': sort,
    };
  }

  factory Paginations.fromMap(Map<String, dynamic> map) {
    return Paginations(
      limit: map['limit']?.toInt(),
      page: map['page']?.toInt(),
      keyword: map['keyword'],
      direction: map['direction'],
      sort: map['sort'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Paginations.fromJson(String source) =>
      Paginations.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Pagination(limit: $limit, page: $page, keyword: $keyword, direction: $direction, sort: $sort)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Paginations &&
        other.limit == limit &&
        other.page == page &&
        other.keyword == keyword &&
        other.direction == direction &&
        other.sort == sort;
  }

  @override
  int get hashCode {
    return limit.hashCode ^
        page.hashCode ^
        keyword.hashCode ^
        direction.hashCode ^
        sort.hashCode;
  }
}
