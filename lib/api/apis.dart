import 'dart:convert';

import 'package:http/http.dart' as http;

import 'get_from_tmdb/get_from_tmdb.dart';

const apiKey = "87309a12040f408732469acac8d1b01f";
const imageId = 'https://image.tmdb.org/t/p/original';
const tmdbLink = "https://api.themoviedb.org/3";
const accessToken =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4NzMwOWExMjA0MGY0MDg3MzI0NjlhY2FjOGQxYjAxZiIsInN1YiI6IjYyNzM3ZDgzYzU2ZDJkNTc5MmM5MDdmOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.pKZ-HlqSi8gr3AjDERPTUjxwL4u3vw5g4tCwPL1mZSw';
const popularImages = "$tmdbLink/movie/popular?api_key=$apiKey";
const trendingToday = "$tmdbLink/movie/latest?api_key=$apiKey";
const top10 = "$tmdbLink/movie/top_rated?api_key=$apiKey";
const nowPlaying = "$tmdbLink/movie/now_playing?api_key=$apiKey";
const upcoming = "$tmdbLink/movie/upcoming?api_key=$apiKey";

Future<List<dynamic>> getMovies(String uri) async {
  final response = await http.get(Uri.parse(uri));

  if (response.statusCode == 200) {
    final decodedJson = jsonDecode(response.body);

    List<dynamic> list = decodedJson['results']
        .map((item) => GetFromTmdb.fromJson(item))
        .toList();

    return list;
  } else {
    throw 'Couldn\t get list';
  }
}
