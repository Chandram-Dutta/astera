import 'dart:convert';

import 'package:astera/api_key.dart';
import 'package:astera/constants.dart';
import 'package:astera/models/asteroid_model.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_asteroid_list.g.dart';

@riverpod
Future<List<Asteroid>> getAsteroidList(
  GetAsteroidListRef ref,
  DateTime start,
  DateTime end,
) async {
  final String startDate = "${start.year}-${start.month}-${start.day}";
  final String endDate = "${end.year}-${end.month}-${end.day}";
  final response = await http.get(
    Uri.parse(
      '$neoFeedLink?start_date=$startDate&end_date=$endDate&api_key=$apiKey',
    ),
  );

  if (response.statusCode == 200) {
    List<Asteroid> asteroids = [];
    final result =
        await jsonDecode(response.body)['near_earth_objects'][startDate];
    for (var asteroid in result) {
      asteroids.add(
        Asteroid.fromJson(asteroid),
      );
    }
    return asteroids;
  } else {
    throw Exception('Failed to load data');
  }
}
