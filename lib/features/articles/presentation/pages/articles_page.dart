import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/dependency_injection/service_locator.dart';
import 'package:flutter_clean_architecture/core/themes/icons/app_icons.dart';
import 'package:flutter_clean_architecture/features/articles/presentation/bloc/articles_bloc.dart';
import 'package:flutter_clean_architecture/features/articles/presentation/widgets/article_card.dart';
import 'package:flutter_svg/svg.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ArticlesBloc>()..add(LoadArticles()),
      child: Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 60),
              SvgPicture.asset(AppIcons.nytLogo),
              SizedBox(height: 30),
              Expanded(
                child: BlocBuilder<ArticlesBloc, ArticlesState>(
                  builder: (context, state) {
                    if (state is ArticlesLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ArticlesLoaded) {
                      return ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        itemCount: state.articles.length,
                        separatorBuilder: (content, index) {
                          return Divider(height: 40);
                        },
                        itemBuilder: (context, index) {
                          final article = state.articles[index];
                          final media = article.media;
                          return ArticleCard(media: media, article: article);
                        },
                      );
                    } else if (state is ArticlesError) {
                      return Center(child: Text(state.message));
                    }

                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
