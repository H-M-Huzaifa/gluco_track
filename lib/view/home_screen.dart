import 'dart:math';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gluco_track/resources/components/size_config.dart';
import 'package:gluco_track/utils/constants/app_colors.dart';
import 'package:gluco_track/utils/constants/app_fonts.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../resources/components/graph.dart';
import '../resources/components/info_containers.dart';
import '../view_model/hba1c_calculate_vm.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final GlobalKey _infoIconKey = GlobalKey();
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;
  bool _isDialogVisible = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, 0), // Position of the icon when it's hidden
      end: Offset(0, -0.4), // Position of the dialog in the center
    ).animate(_animationController);
  }

  // Helper function to get month abbreviation
  String _getMonthAbbreviation(int month) {
    const months = [
      "Jan", "Feb", "Mar", "Apr", "May", "Jun",
      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];
    return months[month - 1]; // Subtract 1 because List is 0-based
  }

  // Method to get day greetings based on current time
  String _getDayGreeting() {
    final hour = DateTime.now().hour;
    final day = DateTime.now().weekday;
    final random = Random();

    var morningMessages = [
      AppLocalizations.of(context)!.riseAndShine,
      AppLocalizations.of(context)!.goodMorningSeizeDay,
    AppLocalizations.of(context)!.topOfTheMorning,
    ];

    var afternoonMessages = [
    AppLocalizations.of(context)!.goodAfternoonKeepGoing,
    AppLocalizations.of(context)!.helloHowsYourDay,
    AppLocalizations.of(context)!.afternoonVibes,
    ];

    var eveningMessages = [
    AppLocalizations.of(context)!.goodEveningRelax,
    AppLocalizations.of(context)!.eveningProductiveDay,
    AppLocalizations.of(context)!.starsAndCharm,
    ];

    if (day == DateTime.saturday || day == DateTime.sunday) {
      return AppLocalizations.of(context)!.happyWeekend;
    }

    if (hour < 12) {
      return morningMessages[random.nextInt(morningMessages.length)];
    } else if (hour < 17) {
      return afternoonMessages[random.nextInt(afternoonMessages.length)];
    } else {
      return eveningMessages[random.nextInt(eveningMessages.length)];
    }
  }

  @override
  Widget build(BuildContext context) {
    WeeklyTrendsGraph graph = WeeklyTrendsGraph();
    var glucoseEntries = Provider.of<Hba1cCalculateVm>(context).glucoseEntries;
    final sc = ScreenConfig(context);
    var pop = AppFonts.poppins;

    return Scaffold(
      body: Center(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [
                0.0,
                0.5,
                1.0,
              ],
              colors: [AppColors.primaryColor, Color(0xffC6E8FF), Colors.white],
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: sc.height(80),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: sc.width(45),
                          height: sc.height(45),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2980B9),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                DateTime.now().day.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: sc.text(20),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                _getMonthAbbreviation(DateTime.now().month),
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: sc.text(12),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: sc.width(250),
                          height: sc.height(40),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2980B9),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              _getDayGreeting(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: sc.text(15),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),


            InkWell(
              onTap: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0), // Rounded corners
                      ),
                      child: Container(
                        padding: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: const Color(0xFFF5F9FF), // Soft background color
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Icon at the top
                            Icon(
                              Icons.favorite,
                              color: const Color(0xFF2980B9), // Empathetic color
                              size: 40,
                            ),
                            SizedBox(height: 10),

                            // Title
                            Text(
                                AppLocalizations.of(context)!.takeChargeOfYourHealth,
                              style: TextStyle(
                                fontSize: sc.text(18),
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF2C3E50), // Friendly dark color
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10),

                            // Message
                            Text(
                                AppLocalizations.of(context)!.checkYourHbA1cInstructions,
                              style: TextStyle(
                                fontSize: sc.text(14),
                                color: const Color(0xFF34495E), // Calm dark color
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 20),

                            // Button
                            ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF2980B9), // Button color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                child: Text(
                                    AppLocalizations.of(context)!.gotIt,
                                  style: TextStyle(
                                    fontSize: sc.text(16),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                height: sc.height(40),
                width: sc.width(40),
                decoration: BoxDecoration(
                  color: const Color(0xFF2980B9), // Button color
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.info, // Information icon
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),

            ],
                    ),
                  ),
                  //Update time
                  Consumer<Hba1cCalculateVm>(
                    builder: (context, value, child) {
                      // Check if the list has any entries.
                      if (value.glucoseEntries.isNotEmpty) {
                        // Get the last entry's timestamp.
                        final lastTimestamp = value.glucoseEntries.last.timestamp;
                        // Format the timestamp to a readable format.
                        final formattedDate = DateFormat('yyyy-MM-dd – HH:mm').format(lastTimestamp);

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            AppLocalizations.of(context)!.lastEntryOn +"$formattedDate", // Display formatted timestamp
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: sc.text(15),
                              fontFamily: pop,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        );
                      } else {
                        // Display a message if there are no entries yet.
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            AppLocalizations.of(context)!.noEntriesYet,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: sc.text(15),
                              fontFamily: pop,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        );
                      }
                    },
                  ),



                  // HbA1c Circular Indicator
                  Consumer(
                    builder: (context, value, child) {
                      return Container(
                        width: double.infinity,
                        height: sc.height(250),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: -2,
                              blurRadius: 4,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Left Side Text
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: sc.text(8)),
                                child: Text(
                                    AppLocalizations.of(context)!.trenddays,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: sc.text(12),
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: pop,
                                  ),
                                ),
                              ),
                            ),

                            // Center Circular Percent Indicator
                            Expanded(
                              flex: 3,
                              child: Center(
                                child: Consumer<Hba1cCalculateVm>(
                                  builder: (context, vm, child) {
                                    if (vm.isLoading) {
                                      // Show a progress indicator while loading data
                                      return CircularProgressIndicator();
                                    }

                                    // Check if there is enough data to calculate HbA1c
                                    double hba1c = 0.0;
                                    double percent = 0.0;
                                    Color progressColor = Colors.grey;
                                    String message = "";
                                    Color messageColor = Colors.black;

                                    if (vm.isReadyToCalculate) {
                                      hba1c = vm.calculateHbA1c();
                                      percent = (hba1c >= 3.0 && hba1c <= 10.0)
                                          ? (hba1c - 3.0) / (10.0 - 3.0) // Normalize percent
                                          : 0.0;

                                      progressColor = (hba1c < 5.7)
                                          ? Colors.amberAccent.shade400
                                          : (hba1c >= 5.8 && hba1c <= 6.3)
                                          ? Colors.green
                                          : Colors.red;

                                      // Set message based on HbA1c value
                                      if (hba1c < 5.7) {
                                        message = "Low";
                                        messageColor = Colors.orange;
                                      } else if (hba1c >= 5.8 && hba1c <= 6.3) {
                                        message = "Normal";
                                        messageColor = Colors.green;
                                      } else {
                                        message = "High";
                                        messageColor = Colors.red;
                                      }
                                    }

                                    return Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        // The circular indicator will always be visible
                                        CircularPercentIndicator(
                                          radius: sc.width(90),
                                          lineWidth: sc.width(15),
                                          percent: percent.clamp(0.0, 1.0),
                                          progressColor: progressColor,
                                          backgroundColor: progressColor.withOpacity(0.2),
                                          circularStrokeCap: CircularStrokeCap.round,
                                        ),
                                        // Center content that displays HbA1c and other info
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            if (vm.isReadyToCalculate) ...[
                                              // Show HbA1c value when data is sufficient
                                              Text(
                                                "HbA1c",
                                                style: TextStyle(
                                                  fontSize: sc.text(20),
                                                  fontFamily: pop,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.primaryColor,
                                                ),
                                              ),
                                              Text(
                                                "${hba1c.toStringAsFixed(1)}%",
                                                style: TextStyle(
                                                  fontFamily: pop,
                                                  fontSize: sc.text(25),
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              // Message about HbA1c value (Low, Normal, High)
                                              Padding(
                                                padding: const EdgeInsets.only(top: 8.0),
                                                child: Text(
                                                  message,
                                                  style: TextStyle(
                                                    fontSize: sc.text(16),
                                                    fontWeight: FontWeight.bold,
                                                    color: messageColor,
                                                  ),
                                                ),
                                              ),
                                            ] else ...[
                                              // Show message when not enough data
                                              Text(textAlign: TextAlign.center,
                                                AppLocalizations.of(context)!.notEnoughDataToCalculateHbA1c,
                                                style: TextStyle(
                                                  fontSize: sc.text(12),
                                                  fontFamily: pop,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                "${vm.remainingEntries}"+ AppLocalizations.of(context)!.remainingEntries,
                                                style: TextStyle(
                                                  fontSize: sc.text(14),
                                                  fontFamily: pop,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),

                            // Right Side RichText
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: sc.text(15)),
                                child: RichText(
                                  textAlign: TextAlign.left,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: AppLocalizations.of(context)!.low,
                                        style: TextStyle(
                                          color: Colors.orange.withOpacity(0.7),
                                          fontSize: sc.text(10),
                                          fontFamily: pop,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      TextSpan(
                                        text: AppLocalizations.of(context)!.normal,
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: sc.text(10),
                                          fontFamily: pop,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      TextSpan(
                                        text: AppLocalizations.of(context)!.high,
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: sc.text(10),
                                          fontFamily: pop,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),



                  // Glucose and Insulin Containers
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Glucose Container
                          Consumer<Hba1cCalculateVm>(
                            builder: (context, provider, child) {
                              return InfoContainer(
                                backgroundColor: Colors.red[50]!,
                                icon: Icons.water_drop_outlined,
                                iconColor: Colors.red,
                                title: AppLocalizations.of(context)!.glucose,
                                value: provider.glucoseEntries.isNotEmpty
                                    ? provider.glucoseEntries.last.value.toString()
                                    : "0", // Show last glucose value
                                unit: "mg/dl", // or "mmol/L" based on user preference
                              );
                            },
                          ),
                          // Insulin Container
                          Consumer<Hba1cCalculateVm>(
                            builder: (context, provider, child) {
                              return InfoContainer(
                                backgroundColor: Colors.green[50]!,
                                icon: Icons.bloodtype_outlined,
                                iconColor: Colors.green,
                                title: AppLocalizations.of(context)!.insulin,
                                value: provider.glucoseEntries.isNotEmpty
                                    ? provider.glucoseEntries.last.insulinValue.toString()
                                    : "0", // Show last insulin value
                                unit: "U", // U for insulin units
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),


                  // Graph
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      height: sc.height(250), // Set a fixed height for the graph container
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: -2,
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              AppLocalizations.of(context)!.weeklyGlucoseTrends,
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: sc.text(18),
                                fontFamily: pop,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // Wrap the graph in a scrollable widget
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical, // Enable vertical scrolling
                              child: Container(
                                height: graph.calculateGraphHeight(sc,glucoseEntries), // Dynamic height
                                child: graph,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),


                  //Carousal Slider
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: -2,
                                blurRadius:4 ,
                                offset: Offset(0, 4)
                            ),
                          ]
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                                AppLocalizations.of(context)!.healthInsights,
                              style: TextStyle(
                                fontSize: sc.text(18),
                                fontWeight: FontWeight.bold,
                                fontFamily: pop,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: CarouselSlider(
                              items: [
                                // Slide 1
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[50],
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Maintain a balanced diet to control glucose levels.",
                                      style: TextStyle(
                                        fontFamily: pop,
                                        fontSize: sc.text(14),
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.primaryColor,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                // Slide 2
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.green[50],
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Regular exercise helps improve insulin sensitivity.",
                                      style: TextStyle(
                                        fontFamily: pop,
                                        fontSize: sc.text(14),
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.primaryColor,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                // Slide 3
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.orange[50],
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Check your glucose levels regularly to stay on track.",
                                      style: TextStyle(
                                        fontFamily: pop,
                                        fontSize: sc.text(14),
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.primaryColor,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                              options: CarouselOptions(
                                height: sc.height(150),
                                autoPlay: true,
                                enlargeCenterPage: true,
                                viewportFraction: 0.8,
                                aspectRatio: 16 / 9,
                                initialPage: 0,
                                autoPlayInterval: Duration(seconds: 3),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
