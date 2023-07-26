import 'dart:convert';

import 'package:comics_app/models/details_model.dart';

class Comic {
   int? id;
   String? imageUrl;
   String? dateAdded;
   String? name;
   String? issueNumber;
   double?  popularity;
   String? heroId;
   String? apiDetailUrl;
   DetailComicModel? detail; 

  Comic({
     this.id,
     this.imageUrl,
     this.dateAdded,
     this.name,
     this.issueNumber,
     this.popularity,
     this.heroId,
     this.apiDetailUrl,
     this.detail, 
  });

  String get fullPosterImg {
    if (imageUrl!.isNotEmpty) {
      return imageUrl!;
    }
    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  factory Comic.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as int;
    final image = json['image'] as Map<String, dynamic>? ?? {};
    final imageUrl = image['original_url'] as String? ?? '';
    final dateAdded = json['date_added'] as String? ?? '';
    final name = json['name'] as String? ?? '';
    final issueNumber = json['issue_number'] as String? ?? '';
    final popularity = json['popularity'] as double? ?? 0.0;
    final apiDetailUrl = json['api_detail_url'] as String? ?? '';
    final detail = json['detail'] != null ? DetailComicModel.fromJson(json['detail']) : null; 

    return Comic(
      id: id,
      imageUrl: imageUrl,
      dateAdded: dateAdded,
      name: name,
      issueNumber: issueNumber,
      popularity: popularity,
      apiDetailUrl: apiDetailUrl,
      detail: detail,
    );
  }

  Comic copyWith({
    int? id,
    String? imageUrl,
    String? dateAdded,
    String? name,
    String? issueNumber,
    double? popularity,
    String? heroId,
    String? apiDetailUrl,
    DetailComicModel? detail,
  }) {
    return Comic(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      dateAdded: dateAdded ?? this.dateAdded,
      name: name ?? this.name,
      issueNumber: issueNumber ?? this.issueNumber,
      popularity: popularity ?? this.popularity,
      heroId: heroId ?? this.heroId,
      apiDetailUrl: apiDetailUrl ?? this.apiDetailUrl,
      detail: detail ?? this.detail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'imageUrl': imageUrl,
      'dateAdded': dateAdded,
      'name': name,
      'issueNumber': issueNumber,
      'popularity': popularity,
      'heroId': heroId,
      'apiDetailUrl': apiDetailUrl,
      'detail': detail?.toMap(), // Convierte el campo adicional de DetailComicModel a Map
    };
  }

  factory Comic.fromMap(Map<String, dynamic> map) {
    return Comic(
      id: map['id'] as int,
      imageUrl: map['imageUrl'] as String,
      dateAdded: map['dateAdded'] as String,
      name: map['name'] as String,
      issueNumber: map['issueNumber'] as String,
      popularity: map['popularity'] as double,
      heroId: map['heroId'] != null ? map['heroId'] as String : null,
      apiDetailUrl: map['api_detail_url'] as String,
      detail: map['detail'] != null ? DetailComicModel.fromMap(map['detail']) : null, // Convierte el campo adicional de DetailComicModel desde Map
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Comic(id: $id, imageUrl: $imageUrl, dateAdded: $dateAdded, name: $name, issueNumber: $issueNumber, popularity: $popularity, heroId: $heroId, apiDetailUrl: $apiDetailUrl, detail: $detail)';
  }

  @override
  bool operator ==(covariant Comic other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.imageUrl == imageUrl &&
        other.dateAdded == dateAdded &&
        other.name == name &&
        other.issueNumber == issueNumber &&
        other.popularity == popularity &&
        other.heroId == heroId &&
        other.apiDetailUrl == apiDetailUrl &&
        other.detail == detail;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        imageUrl.hashCode ^
        dateAdded.hashCode ^
        name.hashCode ^
        issueNumber.hashCode ^
        popularity.hashCode ^
        heroId.hashCode ^
        apiDetailUrl.hashCode ^
        detail.hashCode;
  }
}

