import 'package:flutter/material.dart';
import 'package:gluco_track/resources/components/size_config.dart';

import '../utils/constants/app_colors.dart';
import '../utils/constants/app_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ContactSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sc = ScreenConfig(context);
    var pop = AppFonts.poppins;

    return Scaffold(
      backgroundColor: AppColors.bgColor,


      body: Padding(
        padding: EdgeInsets.all(sc.width(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    AppLocalizations.of(context)!.contactSupport,
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
            // Title Section
            Text(
              AppLocalizations.of(context)!.wereHereToHelp,
              style: TextStyle(
                fontSize: sc.text(16),
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: sc.height(10)),
            Text(
              AppLocalizations.of(context)!.contactUsForAssistance,
              style: TextStyle(
                fontSize: sc.text(14),
                color: Colors.black54,
              ),
            ),
            SizedBox(height: sc.height(20)),

            // Contact Options
            ContactOption(
              icon: Icons.email,
              title: AppLocalizations.of(context)!.emailUs,
              description: AppLocalizations.of(context)!.sendUsAnEmail,
              onTap: () {
                // Handle email support
              },
              sc: sc,
            ),
            ContactOption(
              icon: Icons.phone,
              title: AppLocalizations.of(context)!.callUs,
              description: AppLocalizations.of(context)!.speakToSupportTeam,
              onTap: () {
                // Handle phone support
              },
              sc: sc,
            ),

            SizedBox(height: sc.height(30)),

            // Footer
            Center(
              child: Text(
                AppLocalizations.of(context)!.respondWithin24Hours,
                style: TextStyle(
                  fontSize: sc.text(12),
                  color: Colors.black38,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;
  final ScreenConfig sc;

  ContactOption({
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
    required this.sc,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.only(bottom: sc.height(12)),
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.all(sc.width(12)),
          child: Row(
            children: [
              // Icon
              Container(
                width: sc.width(40),
                height: sc.height(40),
                decoration: BoxDecoration(
                  color: const Color(0xFF2980B9),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: sc.width(20),
                ),
              ),

              SizedBox(width: sc.width(12)),

              // Title and Description
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: sc.text(14),
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: sc.height(4)),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: sc.text(12),
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
