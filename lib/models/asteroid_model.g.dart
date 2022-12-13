// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asteroid_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Asteroid _$AsteroidFromJson(Map<String, dynamic> json) => Asteroid(
      json['id'] as String,
      json['name'] as String,
      json['nasa_jpl_url'] as String,
      json['absolute_magnitude_h'] as int,
      json['is_potentially_hazardous_asteroid'] as bool,
      json['is_sentry_object'] as bool,
      Links.fromJson(json['links'] as Map<String, dynamic>),
      EstimatedDiameter.fromJson(
          json['estimated_diameter'] as Map<String, dynamic>),
      (json['close_approach_data'] as List<dynamic>)
          .map((e) => CloseApproachData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AsteroidToJson(Asteroid instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nasa_jpl_url': instance.nasaJplUrl,
      'absolute_magnitude_h': instance.absoluteMagnitudeH,
      'is_potentially_hazardous_asteroid':
          instance.isPotentiallyHazardousAsteroid,
      'is_sentry_object': instance.isSentryObject,
      'links': instance.links,
      'estimated_diameter': instance.estimatedDiameter,
      'close_approach_data': instance.closeApproachData,
    };

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      json['self'] as String,
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'self': instance.self,
    };

EstimatedDiameter _$EstimatedDiameterFromJson(Map<String, dynamic> json) =>
    EstimatedDiameter(
      Meters.fromJson(json['meters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EstimatedDiameterToJson(EstimatedDiameter instance) =>
    <String, dynamic>{
      'meters': instance.meters,
    };

Meters _$MetersFromJson(Map<String, dynamic> json) => Meters(
      (json['estimated_diameter_min'] as num).toDouble(),
      (json['estimated_diameter_max'] as num).toDouble(),
    );

Map<String, dynamic> _$MetersToJson(Meters instance) => <String, dynamic>{
      'estimated_diameter_min': instance.estimatedDiameterMin,
      'estimated_diameter_max': instance.estimatedDiameterMax,
    };

CloseApproachData _$CloseApproachDataFromJson(Map<String, dynamic> json) =>
    CloseApproachData(
      json['close_approach_date'] as String,
      json['epoch_date_close_approach'] as String,
      RelativeVelocity.fromJson(
          json['relative_velocity'] as Map<String, dynamic>),
      MissDistance.fromJson(json['miss_distance'] as Map<String, dynamic>),
      json['orbiting_body'] as String,
    );

Map<String, dynamic> _$CloseApproachDataToJson(CloseApproachData instance) =>
    <String, dynamic>{
      'close_approach_date': instance.closeApproachDate,
      'epoch_date_close_approach': instance.epochDateCloseApproach,
      'relative_velocity': instance.relativeVelocity,
      'miss_distance': instance.missDistance,
      'orbiting_body': instance.orbitingBody,
    };

RelativeVelocity _$RelativeVelocityFromJson(Map<String, dynamic> json) =>
    RelativeVelocity(
      json['kilometers_per_second'] as String,
      json['kilometers_per_hour'] as String,
      json['miles_per_hour'] as String,
    );

Map<String, dynamic> _$RelativeVelocityToJson(RelativeVelocity instance) =>
    <String, dynamic>{
      'kilometers_per_second': instance.kilometersPerSecond,
      'kilometers_per_hour': instance.kilometersPerHour,
      'miles_per_hour': instance.milesPerHour,
    };

MissDistance _$MissDistanceFromJson(Map<String, dynamic> json) => MissDistance(
      json['astronomical'] as String,
      json['lunar'] as String,
      json['kilometers'] as String,
      json['miles'] as String,
    );

Map<String, dynamic> _$MissDistanceToJson(MissDistance instance) =>
    <String, dynamic>{
      'astronomical': instance.astronomical,
      'lunar': instance.lunar,
      'kilometers': instance.kilometers,
      'miles': instance.miles,
    };
