import 'package:flutter_clean_architecture/features/articles/domain/models/article_model.dart';
import 'package:flutter_clean_architecture/features/articles/domain/repositories/abstract_article_repository.dart';

class GetArticlesUsecase {
  final AbstractArticlesRepository repository;

  GetArticlesUsecase(this.repository);

  Future<List<ArticleModel>> execute() {
    return repository.getNyTimesArticles();
  }
}
