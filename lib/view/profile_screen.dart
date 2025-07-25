import 'package:flutter/material.dart';
import 'package:gluco_track/resources/components/custom_appbar.dart';
import 'package:gluco_track/utils/Routes/routes_names.dart';

import '../resources/components/size_config.dart';
import '../utils/constants/app_colors.dart';
import '../utils/constants/app_fonts.dart';
import '../utils/constants/assets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String selectedTab = "PROFILE"; // Default selected tab

  Map<String, String> userInfo = {
    "Name": "John Doe",
    "Email": "john.doe@example.com",
    "Phone Number": "+1234567890",
    "Address": "123 Main Street",
    "Password": "********",
  };

  Map<String, dynamic> onboardingAnswers = {
    "What is your age?": "18-30",
    "Do you have type 1 or type 2 diabetes?": "Type 1",
    "What is your average fasting blood glucose level?": "120 mg/dL",
    "What was your most recent HbA1c level?": "5.5%",
    "How many units of insulin do you typically take daily?": {
      "Type": "Both",
      "Units": "20"
    },
  };

  void showEditDialog(String question, dynamic value) {
    showDialog(
      context: context,
      builder: (context) {
        if (question == "What is your age?") {
          return _buildSelectionDialog(
            question,
            ["Below 18", "18-30", "31-40", "41-50", "51 years and above"],
          );
        } else if (question == "Do you have type 1 or type 2 diabetes?") {
          return _buildSelectionDialog(
            question,
            ["Type 1", "Type 2", "I'm not sure"],
          );
        } else if (question == "How many units of insulin do you typically take daily?") {
          return _buildInsulinDialog();
        } else {
          TextEditingController controller = TextEditingController(text: value);
          return AlertDialog(
            title: Text("Edit $question"),
            content: TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter new value",
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    onboardingAnswers[question] = controller.text;
                  });
                  Navigator.pop(context);
                },
                child: const Text("Save"),
              ),
            ],
          );
        }
      },
    );
  }

  AlertDialog _buildSelectionDialog(String question, List<String> options) {
    return AlertDialog(
      title: Text("Edit $question"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: options.map((option) {
          return RadioListTile(
            title: Text(option),
            value: option,
            groupValue: onboardingAnswers[question],
            onChanged: (value) {
              setState(() {
                onboardingAnswers[question] = value;
              });
              Navigator.pop(context);
            },
          );
        }).toList(),
      ),
    );
  }

  AlertDialog _buildInsulinDialog() {
    TextEditingController unitsController = TextEditingController(
        text: onboardingAnswers["How many units of insulin do you typically take daily?"]["Units"]);
    String insulinType = onboardingAnswers["How many units of insulin do you typically take daily?"]["Type"];

    return AlertDialog(
      title: const Text("Edit Insulin Details"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonFormField<String>(
            value: insulinType,
            items: ["Rapid-acting", "Long-acting", "Both"].map((type) {
              return DropdownMenuItem(value: type, child: Text(type));
            }).toList(),
            onChanged: (value) {
              setState(() {
                insulinType = value ?? insulinType;
              });
            },
            decoration: const InputDecoration(
              labelText: "Insulin Type",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: unitsController,
            decoration: const InputDecoration(
              labelText: "Units",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              onboardingAnswers["How many units of insulin do you typically take daily?"] = {
                "Type": insulinType,
                "Units": unitsController.text,
              };
            });
            Navigator.pop(context);
          },
          child: const Text("Save"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var cabin = AppFonts.cabin;
    var pop = AppFonts.poppins;
    final sc = ScreenConfig(context);


    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CustomAppBar(title: "Profile", rightIcon: Icons.settings,onPressed: (){
              Navigator.pushNamed(context, RoutesNames.settings);

            },),
          ),
          const SizedBox(height: 20),
          const CircleAvatar(
            backgroundImage: AssetImage(Assets.avatar),
            maxRadius: 70,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Abdullah Khan",
              style: TextStyle(
                  fontFamily: pop, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),

          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.primaryColor),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildTabButton("PROFILE"),
                        const SizedBox(width: 16),
                        _buildTabButton("THERAPY"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                      child: ListView(
                        children: (selectedTab == "PROFILE"
                            ? userInfo.entries
                            : onboardingAnswers.entries)
                            .map((entry) {
                          return GestureDetector(
                            onTap: () => showEditDialog(entry.key, entry.value),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 16),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 16),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.primaryColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    entry.key,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    entry.value.toString(),
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String tabName) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = tabName;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: selectedTab == tabName
              ? AppColors.primaryColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          tabName,
          style: TextStyle(
            color: selectedTab == tabName
                ? Colors.white
                : AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
