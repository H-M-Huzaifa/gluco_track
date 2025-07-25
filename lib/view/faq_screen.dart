import 'package:flutter/material.dart';
import 'package:gluco_track/resources/components/size_config.dart';

import '../utils/constants/app_colors.dart';
import '../utils/constants/app_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class FAQScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pop = AppFonts.poppins;
    final sc = ScreenConfig(context); // Initialize SizeConfig

    final List<Map<String, String>> faqList = [
      {
        "question": AppLocalizations.of(context)!.faqWhatIsGlucoTrack,
        "answer":
        AppLocalizations.of(context)!.faqWhatIsGlucoTrackAnswer
      },
      {
        "question": AppLocalizations.of(context)!.faqHowToAddReadings,
        "answer":
        AppLocalizations.of(context)!.faqHowToAddReadingsAnswer
      },
      {
        "question": AppLocalizations.of(context)!.faqWhatIsHbA1c,
        "answer":
        AppLocalizations.of(context)!.faqWhatIsHbA1cAnswer
      },
      {
        "question": AppLocalizations.of(context)!.faqOfflineUse,
        "answer":
        AppLocalizations.of(context)!.faqOfflineUseAnswer
      },
      {
        "question": AppLocalizations.of(context)!.faqHbA1cAccuracy,
        "answer":
        AppLocalizations.of(context)!.faqHbA1cAccuracyAnswer
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
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
                    AppLocalizations.of(context)!.fAQ,
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
              ),
        
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(sc.width(16)),
                child: ListView.builder(
                  itemCount: faqList.length,
                  itemBuilder: (context, index) {
                    return FAQTile(
                      question: faqList[index]['question']!,
                      answer: faqList[index]['answer']!,
                      sc: sc,
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

class FAQTile extends StatefulWidget {
  final String question;
  final String answer;
  final ScreenConfig sc;

  FAQTile({
    required this.question,
    required this.answer,
    required this.sc,
  });

  @override
  _FAQTileState createState() => _FAQTileState();
}

class _FAQTileState extends State<FAQTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: widget.sc.height(8)),
      child: ExpansionTile(
        title: Text(
          widget.question,
          style: TextStyle(
            fontSize: widget.sc.text(16),
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(widget.sc.width(12)),
            child: Text(
              widget.answer,
              style: TextStyle(
                fontSize: widget.sc.text(14),
                color: Colors.black54,
              ),
            ),
          ),
        ],
        trailing: Icon(
          _isExpanded
              ? Icons.keyboard_arrow_up
              : Icons.keyboard_arrow_down,
          size: widget.sc.width(24),
        ),
        onExpansionChanged: (bool expanded) {
          setState(() {
            _isExpanded = expanded;
          });
        },
      ),
    );
  }
}
