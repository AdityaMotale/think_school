import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConceptView extends StatelessWidget {
  final Color bgColor;
  final String title;
  final String icon;
  final String body;

  const ConceptView({
    super.key,
    required this.bgColor,
    required this.title,
    required this.icon,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Text(
                        icon,
                        style: const TextStyle(
                          fontSize: 32,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.network(
                          "https://adityamotale.github.io/think_school_release/public/icons/close_32.svg",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: "Dm Serif Display",
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  body,
                  style: const TextStyle(
                    fontFamily: "Space Grotesk",
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 44),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: SvgPicture.network(
                        "https://adityamotale.github.io/think_school_release/public/icons/save_32.svg",
                      ),
                    ),
                    const SizedBox(width: 24),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: SvgPicture.network(
                        "https://adityamotale.github.io/think_school_release/public/icons/share_32.svg",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 44),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
