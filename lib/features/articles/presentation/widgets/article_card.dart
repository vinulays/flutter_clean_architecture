import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/articles/domain/models/article_model.dart';
import 'package:flutter_clean_architecture/features/articles/domain/models/media_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

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
        Row(
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
      ],
    );
  }
}
