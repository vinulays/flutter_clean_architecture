import 'package:flutter_clean_architecture/core/util/constants/api_constants.dart';
import 'package:flutter_clean_architecture/features/articles/data/data_sources/abstract_article_api.dart';
import 'package:flutter_clean_architecture/features/articles/domain/models/article_model.dart';
import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

final _log = Logger('ArticleApiImpl');

class ArticleApiImpl implements AbstractArticleApi {
  final Dio dio;

  ArticleApiImpl(this.dio);

  @override
  Future<List<ArticleModel>> getArticles() async {
    final url = ApiConstants.apiUrl;
    final key = ApiConstants.apiKey;

    if (url.isEmpty || key.isEmpty) {
      throw Exception("Missing API_URL or API_KEY in .env");
    }

    try {
      final response = await dio.get(url, queryParameters: {'api-key': key});

      final results = response.data['results'] as List;
      return results.map((json) => ArticleModel.fromJson(json)).toList();
    } catch (e) {
      _log.severe('Error fetching articles', e);
      rethrow;
    }
  }
}
