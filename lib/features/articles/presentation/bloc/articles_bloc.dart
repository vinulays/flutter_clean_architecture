import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/features/articles/domain/models/article_model.dart';
import 'package:flutter_clean_architecture/features/articles/domain/usecases/get_articles_usecase.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  final GetArticlesUsecase getArticlesUsecase;

  ArticlesBloc(this.getArticlesUsecase) : super(ArticlesInitial()) {
    on<LoadArticles>((event, emit) async {
      emit(ArticlesLoading());
      try {
        final articles = await getArticlesUsecase.execute();
        emit(ArticlesLoaded(articles));
      } catch (e) {
        emit(ArticlesError("Failed to load articles: ${e.toString()}"));
      }
    });
  }
}
