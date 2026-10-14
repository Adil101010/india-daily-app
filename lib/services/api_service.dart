import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/news_model.dart';

class ApiService {
  static const String baseUrl = 'https://indiadailylivenews.com/api';

  // Latest News
  static Future<List<NewsModel>> getLatestNews({int limit = 10}) async {
    final uri = Uri.parse('$baseUrl/public/news/latest?limit=$limit');

    final response = await http.get(
      uri,
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load latest news: ${response.statusCode}');
    }

    final List<dynamic> data = jsonDecode(response.body);

    return data
        .map((json) => NewsModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  // Trending News
  static Future<List<NewsModel>> getTrendingNews({int limit = 10}) async {
    final uri = Uri.parse('$baseUrl/public/news/trending?limit=$limit');

    final response = await http.get(
      uri,
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load trending news: ${response.statusCode}');
    }

    final List<dynamic> data = jsonDecode(response.body);

    return data
        .map((json) => NewsModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  // Featured News
  static Future<List<NewsModel>> getFeaturedNews() async {
    final uri = Uri.parse('$baseUrl/public/news/featured');

    final response = await http.get(
      uri,
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load featured news: ${response.statusCode}');
    }

    final dynamic data = jsonDecode(response.body);

    if (data is List) {
      return data
          .map((json) => NewsModel.fromJson(json as Map<String, dynamic>))
          .toList();
    }

    if (data is Map<String, dynamic>) {
      return [NewsModel.fromJson(data)];
    }

    return [];
  }

  // Single News Article
  static Future<NewsModel> getNewsBySlug(String slug) async {
    final uri = Uri.parse('$baseUrl/public/news/$slug');

    final response = await http.get(
      uri,
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load article: ${response.statusCode}');
    }

    final Map<String, dynamic> data = jsonDecode(response.body);

    return NewsModel.fromJson(data);
  }
}
