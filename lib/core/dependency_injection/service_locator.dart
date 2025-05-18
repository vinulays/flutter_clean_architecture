import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/core/services/url_launcher_service.dart';
import 'package:flutter_clean_architecture/features/articles/data/data_sources/abstract_article_api.dart';
import 'package:flutter_clean_architecture/features/articles/data/data_sources/article_api_impl.dart';
import 'package:flutter_clean_architecture/features/articles/data/repositories/article_repository_impl.dart';
import 'package:flutter_clean_architecture/features/articles/domain/repositories/abstract_article_repository.dart';
import 'package:flutter_clean_architecture/features/articles/domain/usecases/get_articles_usecase.dart';
import 'package:flutter_clean_architecture/features/articles/presentation/bloc/articles_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  await dotenv.load();

  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<AbstractArticleApi>(() => ArticleApiImpl(sl<Dio>()));
  sl.registerLazySingleton<AbstractArticlesRepository>(
    () => ArticleRepositoryImpl(sl()),
  );

  sl.registerLazySingleton(() => GetArticlesUsecase(sl()));

  sl.registerFactory(() => ArticlesBloc(sl<GetArticlesUsecase>()));
  sl.registerLazySingleton<AbstractUrlLauncherService>(
    () => UrlLauncherServiceImpl(),
  );
}
