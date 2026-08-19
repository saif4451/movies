// screens/authntication/register.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/screens/authntication/_buildTextField.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  int selectedIndex = 0;
  int selectedFlag = 0;

  final List<String> avatars = [
    AppAssets.gamer1,
    AppAssets.gamer3,
    AppAssets.gamer2,
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: AppColors.blackColor,

      appBar: AppBar(
        backgroundColor: AppColors.blackColor,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor,
            size: 28,
          ),
        ),

        title: const Text(
          "Register",
          style: TextStyle(color: AppColors.primaryColor),
        ),

        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),

          child: Column(
            children: [
              const SizedBox(height: 9),

              // Avatars
              SizedBox(
                width: double.infinity,
                height: 120,

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,

                  physics: const NeverScrollableScrollPhysics(),

                  itemCount: avatars.length,

                  itemBuilder: (context, index) {
                    final isSelected = selectedIndex == index;

                    return SizedBox(
                      width: screenWidth / 3,

                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },

                        child: Center(
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),

                            curve: Curves.easeInOut,

                            width: isSelected ? 120 : 94,
                            height: isSelected ? 120 : 94,

                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),

                            child: ClipOval(
                              child: Image.asset(
                                avatars[index],
                                fit: BoxFit.cover,

                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Avatar",
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(height: 12),

              // Name
              CustomTextField(hintText: "Name", imagePath: AppAssets.nameIcon),

              const SizedBox(height: 24),

              // Email
              CustomTextField(
                hintText: "Email",
                imagePath: AppAssets.emailIcon,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 24),

              // Password
              CustomTextField(
                hintText: "Password",
                imagePath: AppAssets.passwordIcon,
                obscureText: true,
              ),

              const SizedBox(height: 24),

              // Confirm Password
              CustomTextField(
                hintText: "Confirm Password",
                imagePath: AppAssets.passwordIcon,
                obscureText: true,
              ),

              const SizedBox(height: 24),

              // Phone
              CustomTextField(
                hintText: "Phone Number",
                imagePath: AppAssets.phoneIcon,
                keyboardType: TextInputType.phone,
              ),

              const SizedBox(height: 30),

              // Create Account
              SizedBox(
                width: double.infinity,
                height: screenWidth * (55 / 375),

                child: ElevatedButton(
                  onPressed: () {
                    // Create Account action
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,

                    foregroundColor: AppColors.blackColor,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),

                    elevation: 0,
                  ),

                  child: const Text(
                    "Create Account",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const Text(
                    "Already Have Account ? ",
                    style: TextStyle(color: AppColors.whiteColor, fontSize: 14),
                  ),

                  GestureDetector(
                    onTap: () {
                      // Navigate to Login
                    },

                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 42,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: AppColors.blackColor,
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),

                    child: Row(
                      children: [
                        // USA
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedFlag = 0;
                            });
                          },
                          child: Container(
                            width: 34,
                            height: 34,
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: selectedFlag == 0
                                    ? AppColors.primaryColor
                                    : Colors.transparent,
                                width: 3,
                              ),
                            ),
                            child: ClipOval(
                              child: SvgPicture.asset(
                                AppAssets.usaFlag,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 8),

                        // Egypt
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedFlag = 1;
                            });
                          },
                          child: Container(
                            width: 34,
                            height: 34,
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: selectedFlag == 1
                                    ? AppColors.primaryColor
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: ClipOval(
                              child: SvgPicture.asset(
                                AppAssets.egyptFlag,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ), // Flags
            ],
          ),
        ),
      ),
    );
  }
}
