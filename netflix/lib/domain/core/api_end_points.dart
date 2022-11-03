import 'package:netflix/core/string.dart';
import 'package:netflix/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "$KbaseUrl/trending/all/day?api_key=$apikey";
  static const search = "$KbaseUrl/search/movie?api_key=$apikey";
}
