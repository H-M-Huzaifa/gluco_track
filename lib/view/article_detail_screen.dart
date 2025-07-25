import 'package:flutter/material.dart';
import 'package:gluco_track/resources/components/custom_appbar.dart';
import '../resources/components/size_config.dart';
import '../utils/constants/app_colors.dart';
import '../utils/constants/app_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ArticleDetailScreen extends StatelessWidget {
  final Map<String, String> article;

  const ArticleDetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    var pop = AppFonts.poppins;
    final sc = ScreenConfig(context);

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Back button container
                  InkWell(
                    onTap: () {
                      Navigator.pop(context); // Default back functionality
                    },
                    child: Container(
                      width: sc.width(40),
                      height: sc.height(40),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2980B9), // Back button color
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back, // Back icon
                        color: Colors.white,
                        size: sc.width(24),
                      ),
                    ),
                  ),

                  // Spacer for dynamic distribution
                  const Spacer(),

                  // Centered "Details" text
                  Text(
                    AppLocalizations.of(context)!.details,
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontFamily: pop,
                      fontSize: sc.text(16),
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Spacer for dynamic distribution
                  const Spacer(),

                  // Placeholder for alignment (same width as back button container)
                  SizedBox(
                    width: sc.width(40),
                  ),
                ],
              )

            ),

            // Article Image
            Image.asset(
              article["image"]!,
              width: double.infinity,
              height: sc.height(250),
              fit: BoxFit.cover,
            ),
            SizedBox(height: sc.height(16)),

            // Article Title
            Text(
              article["title"]!,
              style: TextStyle(
                fontSize: sc.text(24),
                fontFamily: pop,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: sc.height(16)),

            // Article Description
            Text(
              article["description"]!,
              style: TextStyle(
                fontSize: sc.text(14),
                fontFamily: pop,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: sc.height(16)),

            // Full article content placeholder
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  "Here goes the full article content about glucose, diabetes, and how to manage it effectively...",
                  style: TextStyle(fontSize: sc.text(14), fontFamily: pop),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
