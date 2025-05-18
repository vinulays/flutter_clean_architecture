import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/dependency_injection/service_locator.dart';
import 'package:flutter_clean_architecture/core/services/url_launcher_service.dart';
import 'package:flutter_clean_architecture/features/articles/domain/models/article_model.dart';
import 'package:flutter_clean_architecture/features/articles/domain/models/media_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logging/logging.dart';
import 'package:lucide_icons/lucide_icons.dart';

final _log = Logger('Article Card');

class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key, required this.media, required this.article});

  final List<MediaModel>? media;
  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (media!.isNotEmpty)
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              media![0].mediaMetadata![2].url!,
              fit: BoxFit.cover,
            ),
          ),
        if (media!.isNotEmpty) SizedBox(height: 10),
        Text(
          article.title!,
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10),
        Text(
          article.abstract!,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: 15),
        GestureDetector(
          onTap: () async {
            try {
              await sl<AbstractUrlLauncherService>().openUrl(article.url!);
            } catch (e) {
              _log.severe("Failed to open article", e);
            }
          },
          child: Row(
            children: [
              Text(
                "View on website",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 8),
              Icon(LucideIcons.arrowRightCircle),
            ],
          ),
        ),
      ],
    );
  }
}
