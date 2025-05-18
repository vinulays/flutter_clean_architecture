part of 'articles_bloc.dart';

sealed class ArticlesState extends Equatable {
  const ArticlesState();

  @override
  List<Object> get props => [];
}

final class ArticlesInitial extends ArticlesState {}

class ArticlesLoading extends ArticlesState {}

class ArticlesLoaded extends ArticlesState {
  final List<ArticleModel> articles;

  const ArticlesLoaded(this.articles);
}

class ArticlesError extends ArticlesState {
  final String message;

  const ArticlesError(this.message);
}
