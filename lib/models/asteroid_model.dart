import 'package:json_annotation/json_annotation.dart';

part 'asteroid_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Asteroid {
  final String id;
  final String name;
  final String nasaJplUrl;
  final int absoluteMagnitudeH;
  final bool isPotentiallyHazardousAsteroid;
  final bool isSentryObject;
  final Links links;
  final EstimatedDiameter estimatedDiameter;
  final List<CloseApproachData> closeApproachData;

  Asteroid(
    this.id,
    this.name,
    this.nasaJplUrl,
    this.absoluteMagnitudeH,
    this.isPotentiallyHazardousAsteroid,
    this.isSentryObject,
    this.links,
    this.estimatedDiameter,
    this.closeApproachData,
  );

  factory Asteroid.fromJson(Map<String, dynamic> json) =>
      _$AsteroidFromJson(json);

  Map<String, dynamic> toJson() => _$AsteroidToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Links {
  final String self;

  Links(this.self);

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class EstimatedDiameter {
  final Meters meters;

  EstimatedDiameter(this.meters);

  factory EstimatedDiameter.fromJson(Map<String, dynamic> json) =>
      _$EstimatedDiameterFromJson(json);

  Map<String, dynamic> toJson() => _$EstimatedDiameterToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Meters {
  final double estimatedDiameterMin;
  final double estimatedDiameterMax;

  Meters(this.estimatedDiameterMin, this.estimatedDiameterMax);

  factory Meters.fromJson(Map<String, dynamic> json) => _$MetersFromJson(json);

  Map<String, dynamic> toJson() => _$MetersToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CloseApproachData {
  final String closeApproachDate;
  final String epochDateCloseApproach;
  final RelativeVelocity relativeVelocity;
  final MissDistance missDistance;
  final String orbitingBody;

  CloseApproachData(
    this.closeApproachDate,
    this.epochDateCloseApproach,
    this.relativeVelocity,
    this.missDistance,
    this.orbitingBody,
  );

  factory CloseApproachData.fromJson(Map<String, dynamic> json) =>
      _$CloseApproachDataFromJson(json);

  Map<String, dynamic> toJson() => _$CloseApproachDataToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class RelativeVelocity {
  final String kilometersPerSecond;
  final String kilometersPerHour;
  final String milesPerHour;

  RelativeVelocity(
    this.kilometersPerSecond,
    this.kilometersPerHour,
    this.milesPerHour,
  );

  factory RelativeVelocity.fromJson(Map<String, dynamic> json) =>
      _$RelativeVelocityFromJson(json);

  Map<String, dynamic> toJson() => _$RelativeVelocityToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class MissDistance {
  final String astronomical;
  final String lunar;
  final String kilometers;
  final String miles;

  MissDistance(
    this.astronomical,
    this.lunar,
    this.kilometers,
    this.miles,
  );

  factory MissDistance.fromJson(Map<String, dynamic> json) =>
      _$MissDistanceFromJson(json);

  Map<String, dynamic> toJson() => _$MissDistanceToJson(this);
}
