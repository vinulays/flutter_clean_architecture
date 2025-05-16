import 'package:flutter_clean_architecture/features/articles/data/data_sources/abstract_article_api.dart';
import 'package:flutter_clean_architecture/features/articles/domain/models/article_model.dart';
import 'package:flutter_clean_architecture/features/articles/domain/repositories/abstract_article_repository.dart';
import 'package:logging/logging.dart';

final _log = Logger("ArticleRepositoryImpl");

class ArticleRepositoryImpl implements AbstractArticlesRepository {
  final AbstractArticleApi articlesApi;

  ArticleRepositoryImpl(this.articlesApi);

  @override
  Future<List<ArticleModel>> getNyTimesArticles() async {
    try {
      return await articlesApi.getArticles();
    } catch (e) {
      _log.severe("Error fetching articles", e);
      rethrow;
    }
  }
}
