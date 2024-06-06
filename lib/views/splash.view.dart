import 'dart:math';

import 'package:flutter/material.dart';
import 'package:think_school/views/home.view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeView(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: min(MediaQuery.of(context).size.width * 0.6, 200),
              height: min(MediaQuery.of(context).size.width * 0.6, 200),
              child: Image.network(
                "https://adityamotale.github.io/think_school_release/public/images/logo.png",
                loadingBuilder: (_, child, progress) {
                  if (progress != null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return child;
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
