import 'package:astera/constants.dart';
import 'package:astera/models/asteroid_model.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_asteroid_list.g.dart';

@riverpod
Future<List<Asteroid>> getAsteroidList(GetAsteroidListRef ref, String startDate, String endDate) async {
  final response = await http.get(Uri.parse(
      '$neoFeedLink?start_date=$startDate&end_date=$endDate&api_key=$apiKey'));

  return;
}
