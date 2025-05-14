import 'package:flutter_clean_architecture/features/articles/domain/models/article_model.dart';

abstract class AbstractArticleApi {
  Future<List<ArticleModel>> getArticles();
}
