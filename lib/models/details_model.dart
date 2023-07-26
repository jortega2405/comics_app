import 'dart:convert';

DetailComicModel detailComicModelFromMap(String str) => DetailComicModel.fromMap(json.decode(str));

String detailComicModelToMap(DetailComicModel data) => json.encode(data.toMap());

class DetailComicModel {
  String? error;
  int? limit;
  int? offset;
  int? numberOfPageResults;
  int? numberOfTotalResults;
  int? statusCode;
  Results? results;
  String? version;

  DetailComicModel({
    this.error,
    this.limit,
    this.offset,
    this.numberOfPageResults,
    this.numberOfTotalResults,
    this.statusCode,
    this.results,
    this.version,
  });

  factory DetailComicModel.fromJson(String source) => DetailComicModel.fromMap(json.decode(source));

  factory DetailComicModel.fromMap(Map<String, dynamic> json) => DetailComicModel(
        error: json["error"],
        limit: json["limit"],
        offset: json["offset"],
        numberOfPageResults: json["number_of_page_results"],
        numberOfTotalResults: json["number_of_total_results"],
        statusCode: json["status_code"],
        results: json["results"] == null ? null : Results.fromMap(json["results"]),
        version: json["version"],
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "error": error,
        "limit": limit,
        "offset": offset,
        "number_of_page_results": numberOfPageResults,
        "number_of_total_results": numberOfTotalResults,
        "status_code": statusCode,
        "results": results?.toMap(),
        "version": version,
      };

}

class Results {
  dynamic aliases;
  String? apiDetailUrl;
  List<AssociatedImage>? associatedImages;
  List<Character>? characterCredits;
  List<dynamic>? characterDiedIn;
  List<Volume>? conceptCredits;
  DateTime? coverDate;
  DateTime? dateAdded;
  DateTime? dateLastUpdated;
  dynamic deck;
  String? description;
  dynamic firstAppearanceCharacters;
  dynamic firstAppearanceConcepts;
  dynamic firstAppearanceLocations;
  dynamic firstAppearanceObjects;
  dynamic firstAppearanceStoryarcs;
  dynamic firstAppearanceTeams;
  bool? hasStaffReview;
  int? id;
  Image? image;
  String? issueNumber;
  List<Volume>? locationCredits;
  String? name;
  List<dynamic>? objectCredits;
  List<Volume>? personCredits;
  String? siteDetailUrl;
  dynamic storeDate;
  List<dynamic>? storyArcCredits;
  List<dynamic>? teamCredits;
  List<dynamic>? teamDisbandedIn;
  Volume? volume;

  Results({
    this.aliases,
    this.apiDetailUrl,
    this.associatedImages,
    this.characterCredits,
    this.characterDiedIn,
    this.conceptCredits,
    this.coverDate,
    this.dateAdded,
    this.dateLastUpdated,
    this.deck,
    this.description,
    this.firstAppearanceCharacters,
    this.firstAppearanceConcepts,
    this.firstAppearanceLocations,
    this.firstAppearanceObjects,
    this.firstAppearanceStoryarcs,
    this.firstAppearanceTeams,
    this.hasStaffReview,
    this.id,
    this.image,
    this.issueNumber,
    this.locationCredits,
    this.name,
    this.objectCredits,
    this.personCredits,
    this.siteDetailUrl,
    this.storeDate,
    this.storyArcCredits,
    this.teamCredits,
    this.teamDisbandedIn,
    this.volume,
  });

  factory Results.fromMap(Map<String, dynamic> json) => Results(
        aliases: json["aliases"],
        apiDetailUrl: json["api_detail_url"],
        associatedImages: json["associated_images"] == null
            ? null
            : List<AssociatedImage>.from(json["associated_images"].map((x) => AssociatedImage.fromMap(x))),
        characterCredits: json["character_credits"] == null
            ? null
            : List<Character>.from(json["character_credits"].map((x) => Character.fromMap(x))),
        characterDiedIn: json["character_died_in"] == null ? null : List<dynamic>.from(json["character_died_in"].map((x) => x)),
        conceptCredits: json["concept_credits"] == null
            ? null
            : List<Volume>.from(json["concept_credits"].map((x) => Volume.fromMap(x))),
        coverDate: json["cover_date"] == null ? null : DateTime.parse(json["cover_date"]),
        dateAdded: json["date_added"] == null ? null : DateTime.parse(json["date_added"]),
        dateLastUpdated:
            json["date_last_updated"] == null ? null : DateTime.parse(json["date_last_updated"]),
        deck: json["deck"],
        description: json["description"],
        firstAppearanceCharacters: json["first_appearance_characters"],
        firstAppearanceConcepts: json["first_appearance_concepts"],
        firstAppearanceLocations: json["first_appearance_locations"],
        firstAppearanceObjects: json["first_appearance_objects"],
        firstAppearanceStoryarcs: json["first_appearance_storyarcs"],
        firstAppearanceTeams: json["first_appearance_teams"],
        hasStaffReview: json["has_staff_review"],
        id: json["id"],
        image: json["image"] == null ? null : Image.fromMap(json["image"]),
        issueNumber: json["issue_number"],
        locationCredits: json["location_credits"] == null
            ? null
            : List<Volume>.from(json["location_credits"].map((x) => Volume.fromMap(x))),
        name: json["name"],
        objectCredits: json["object_credits"] == null ? null : List<dynamic>.from(json["object_credits"].map((x) => x)),
        personCredits: json["person_credits"] == null
            ? null
            : List<Volume>.from(json["person_credits"].map((x) => Volume.fromMap(x))),
        siteDetailUrl: json["site_detail_url"],
        storeDate: json["store_date"],
        storyArcCredits: json["story_arc_credits"] == null ? null : List<dynamic>.from(json["story_arc_credits"].map((x) => x)),
        teamCredits: json["team_credits"] == null ? null : List<dynamic>.from(json["team_credits"].map((x) => x)),
        teamDisbandedIn: json["team_disbanded_in"] == null ? null : List<dynamic>.from(json["team_disbanded_in"].map((x) => x)),
        volume: json["volume"] == null ? null : Volume.fromMap(json["volume"]),
      );

  Map<String, dynamic> toMap() => {
        "aliases": aliases,
        "api_detail_url": apiDetailUrl,
        "associated_images": associatedImages == null
            ? null
            : List<dynamic>.from(associatedImages!.map((x) => x.toMap())),
        "character_credits": characterCredits == null
            ? null
            : List<dynamic>.from(characterCredits!.map((x) => x.toMap())),
        "character_died_in": characterDiedIn == null ? null : List<dynamic>.from(characterDiedIn!.map((x) => x)),
        "concept_credits": conceptCredits == null
            ? null
            : List<dynamic>.from(conceptCredits!.map((x) => x.toMap())),
        "cover_date": coverDate == null ? null : coverDate!.toIso8601String(),
        "date_added": dateAdded == null ? null : dateAdded!.toIso8601String(),
        "date_last_updated": dateLastUpdated == null ? null : dateLastUpdated!.toIso8601String(),
        "deck": deck,
        "description": description,
        "first_appearance_characters": firstAppearanceCharacters,
        "first_appearance_concepts": firstAppearanceConcepts,
        "first_appearance_locations": firstAppearanceLocations,
        "first_appearance_objects": firstAppearanceObjects,
        "first_appearance_storyarcs": firstAppearanceStoryarcs,
        "first_appearance_teams": firstAppearanceTeams,
        "has_staff_review": hasStaffReview,
        "id": id,
        "image": image == null ? null : image!.toMap(),
        "issue_number": issueNumber,
        "location_credits": locationCredits == null
            ? null
            : List<dynamic>.from(locationCredits!.map((x) => x.toMap())),
        "name": name,
        "object_credits": objectCredits == null ? null : List<dynamic>.from(objectCredits!.map((x) => x)),
        "person_credits": personCredits == null
            ? null
            : List<dynamic>.from(personCredits!.map((x) => x.toMap())),
        "site_detail_url": siteDetailUrl,
        "store_date": storeDate,
        "story_arc_credits": storyArcCredits == null ? null : List<dynamic>.from(storyArcCredits!.map((x) => x)),
        "team_credits": teamCredits == null ? null : List<dynamic>.from(teamCredits!.map((x) => x)),
        "team_disbanded_in": teamDisbandedIn == null ? null : List<dynamic>.from(teamDisbandedIn!.map((x) => x)),
        "volume": volume == null ? null : volume!.toMap(),
      };
}

class AssociatedImage {
  String? iconUrl;
  String? mediumUrl;
  String? screenUrl;
  String? screenLargeUrl;
  String? smallUrl;
  String? superUrl;
  String? thumbUrl;
  String? tinyUrl;
  String? originalUrl;
  String? imageTags;

  AssociatedImage({
    this.iconUrl,
    this.mediumUrl,
    this.screenUrl,
    this.screenLargeUrl,
    this.smallUrl,
    this.superUrl,
    this.thumbUrl,
    this.tinyUrl,
    this.originalUrl,
    this.imageTags,
  });

  factory AssociatedImage.fromMap(Map<String, dynamic> json) => AssociatedImage(
        iconUrl: json["icon_url"],
        mediumUrl: json["medium_url"],
        screenUrl: json["screen_url"],
        screenLargeUrl: json["screen_large_url"],
        smallUrl: json["small_url"],
        superUrl: json["super_url"],
        thumbUrl: json["thumb_url"],
        tinyUrl: json["tiny_url"],
        originalUrl: json["original_url"],
        imageTags: json["image_tags"],
      );

  Map<String, dynamic> toMap() => {
        "icon_url": iconUrl,
        "medium_url": mediumUrl,
        "screen_url": screenUrl,
        "screen_large_url": screenLargeUrl,
        "small_url": smallUrl,
        "super_url": superUrl,
        "thumb_url": thumbUrl,
        "tiny_url": tinyUrl,
        "original_url": originalUrl,
        "image_tags": imageTags,
      };
}

class Character {
  int? id;
  String? name;
  String? apiDetailUrl;
  String? siteDetailUrl;

  Character({
    this.id,
    this.name,
    this.apiDetailUrl,
    this.siteDetailUrl,
  });

  factory Character.fromMap(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"],
        apiDetailUrl: json["api_detail_url"],
        siteDetailUrl: json["site_detail_url"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "api_detail_url": apiDetailUrl,
        "site_detail_url": siteDetailUrl,
      };
}

class Volume {
  int? id;
  String? name;
  String? apiDetailUrl;
  String? siteDetailUrl;

  Volume({
    this.id,
    this.name,
    this.apiDetailUrl,
    this.siteDetailUrl,
  });

  factory Volume.fromMap(Map<String, dynamic> json) => Volume(
        id: json["id"],
        name: json["name"],
        apiDetailUrl: json["api_detail_url"],
        siteDetailUrl: json["site_detail_url"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "api_detail_url": apiDetailUrl,
        "site_detail_url": siteDetailUrl,
      };
}

class Image {
  String? iconUrl;
  String? mediumUrl;
  String? screenUrl;
  String? screenLargeUrl;
  String? smallUrl;
  String? superUrl;
  String? thumbUrl;
  String? tinyUrl;
  String? originalUrl;
  String? imageTags;

  Image({
    this.iconUrl,
    this.mediumUrl,
    this.screenUrl,
    this.screenLargeUrl,
    this.smallUrl,
    this.superUrl,
    this.thumbUrl,
    this.tinyUrl,
    this.originalUrl,
    this.imageTags,
  });

  factory Image.fromMap(Map<String, dynamic> json) => Image(
        iconUrl: json["icon_url"],
        mediumUrl: json["medium_url"],
        screenUrl: json["screen_url"],
        screenLargeUrl: json["screen_large_url"],
        smallUrl: json["small_url"],
        superUrl: json["super_url"],
        thumbUrl: json["thumb_url"],
        tinyUrl: json["tiny_url"],
        originalUrl: json["original_url"],
        imageTags: json["image_tags"],
      );

  Map<String, dynamic> toMap() => {
        "icon_url": iconUrl,
        "medium_url": mediumUrl,
        "screen_url": screenUrl,
        "screen_large_url": screenLargeUrl,
        "small_url": smallUrl,
        "super_url": superUrl,
        "thumb_url": thumbUrl,
        "tiny_url": tinyUrl,
        "original_url": originalUrl,
        "image_tags": imageTags,
      };
}
