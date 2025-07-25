import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; // Import the carousel_slider package
import 'package:gluco_track/resources/components/custom_appbar.dart';

import '../resources/components/size_config.dart';
import '../utils/constants/app_colors.dart';
import '../utils/constants/app_fonts.dart';
import '../utils/constants/assets.dart';
import 'article_detail_screen.dart'; // Import the new Article Detail screen
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  List<Map<String, String>> articles = [
    {
      "title": "Understanding Diabetes and Its Types",
      "description": "Learn about the different types of diabetes, symptoms, and management tips.",
      "image": Assets.cover, // Use appropriate image paths
    },
    {
      "title": "How Glucose Affects the Body",
      "description": "Understanding the role of glucose in your health and how to manage levels.",
      "image": Assets.cover,
    },
    {
      "title": "Managing Blood Sugar for a Healthy Life",
      "description": "Essential tips for managing blood sugar levels effectively.",
      "image": Assets.cover,
    },
    {
      "title": "The Importance of Regular Monitoring",
      "description": "Why it's crucial to regularly monitor glucose levels and how to do it.",
      "image": Assets.cover,
    },
    {
      "title": "Insulin Therapy Explained",
      "description": "A deep dive into insulin therapy for managing diabetes.",
      "image": Assets.cover,
    },
    {
      "title": "Diet Tips for Diabetics",
      "description": "Learn which foods are best for controlling blood sugar.",
      "image": Assets.cover,
    },
    {
      "title": "The Science Behind HbA1c",
      "description": "What is HbA1c and how does it impact your health?",
      "image": Assets.cover,
    },
    {
      "title": "Exercise and Blood Sugar Control",
      "description": "How physical activity helps in managing glucose levels.",
      "image": Assets.cover,
    },
    {
      "title": "The Role of Technology in Diabetes Management",
      "description": "Exploring how gadgets and apps assist with diabetes control.",
      "image": Assets.cover,
    },
    {
      "title": "Preventing Diabetic Complications",
      "description": "Steps to take to avoid complications related to diabetes.",
      "image": Assets.cover,
    },
  ];

  @override
  Widget build(BuildContext context) {
    var cabin = AppFonts.cabin;
    var pop = AppFonts.poppins;
    final sc = ScreenConfig(context);

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Appbar
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child:  // Centered "Details" text
              Text(
                AppLocalizations.of(context)!.articles,
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontFamily: pop,
                  fontSize: sc.text(16),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Article Image Carousel Slider
            Container(
              width: sc.width(400),
              height: sc.height(250),
              child: CarouselSlider.builder(
                itemCount: articles.length,
                itemBuilder: (context, index, realIndex) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      articles[index]["image"]!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  );
                },
                options: CarouselOptions(
                  height: sc.height(250),
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  scrollPhysics: BouncingScrollPhysics(),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: -2,
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
            ),

            // Article List
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(color: AppColors.primaryColor,),
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: Image.asset(articles[index]["image"]!, width: sc.width(100),),
                          title: Text(
                            articles[index]["title"]!,
                            style: TextStyle(fontSize: sc.text(14), fontFamily: pop, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            articles[index]["description"]!,
                            style: TextStyle(fontSize: sc.text(12), fontFamily: pop),
                          ),
                          onTap: () {
                            // Navigate to the article detail screen on tap
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ArticleDetailScreen(article: articles[index]),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
