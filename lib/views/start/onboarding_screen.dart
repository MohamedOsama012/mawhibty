import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mawhibty/constants/colors.dart';
import 'package:mawhibty/controllers/cubit/onboarding_cubit.dart';
import 'package:mawhibty/controllers/states/onboarding_states.dart';
import 'package:mawhibty/views/auth/screens/login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  void _onDone(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  Widget _buildPageContent(Map<String, String> data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(data['image']!, height: 250),
        const SizedBox(height: 30),
        Text(
          data['title']!,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            data['desc']!,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return BlocProvider(
      create: (BuildContext context) {
        return OnboardingCubit();
      },
      child: BlocConsumer<OnboardingCubit, OnboardingStates>(
        listener: (BuildContext context, OnboardingStates state) {},
        builder: (BuildContext context, OnboardingStates state) {
          final cubit = OnboardingCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'موهبتي',
              ),
            ),
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Expanded(
                  child: ValueListenableBuilder<int>(
                    valueListenable: ValueNotifier<int>(0),
                    builder: (context, currentPage, _) {
                      return PageView.builder(
                        controller: controller,
                        itemCount: cubit.onboardingData.length,
                        onPageChanged: (index) {
                          ValueNotifier<int>(index).value = index;
                        },
                        itemBuilder: (_, index) =>
                            _buildPageContent(cubit.onboardingData[index]),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30.0, right: 30.0, bottom: 80.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        minimumSize: const Size(328, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: () {
                        if (cubit.currentPage ==
                            cubit.onboardingData.length - 1) {
                          _onDone(context);
                        } else {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Text(
                        cubit.currentPage == cubit.onboardingData.length - 1
                            ? 'Get Started'
                            : 'التالي',
                        style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          );
        },
      ),
    );
  }
}
