import 'dart:math';

import 'package:flutter/material.dart';
import '../../data/case_studies.data.dart';
import '../case_study_details.view.dart';

import '../../data/concepts.data.dart';
import '../../data/shorts.data.dart';
import '../concept_details.view.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  ///
  /// Convert HEX to Octal color object
  ///
  Color hexToColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  final headingTextStyle = const TextStyle(
    fontFamily: "Space Grotesk",
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  ///
  /// Function to calculate the length of the text
  ///
  double calculateTextWidth(String text) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: headingTextStyle),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(minWidth: 0, maxWidth: double.infinity);

    return textPainter.size.width;
  }

  double calculateAspectRatio(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Assuming each item takes some padding and the grid spacing
    double desiredItemWidth = (screenWidth / 2) - 60;

    double desiredItemHeight = desiredItemWidth;

    double aspectRatio = desiredItemWidth / desiredItemHeight;

    return aspectRatio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Featured Case Study
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    width: calculateTextWidth("Featured Case Study"),
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Color(0xFF79F5C5),
                    ),
                  ),
                  Text(
                    "Featured Case Study —",
                    style: headingTextStyle,
                  ),
                ],
              ),

              const SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CaseStudyView(
                        img: kCaseStudies[0]["img"]!,
                        title: kCaseStudies[0]["title"]!,
                        dateTime: kCaseStudies[0]["dateTime"]!,
                        category: kCaseStudies[0]["category"]!,
                        body: kCaseStudies[0]["body"]!,
                      ),
                    ),
                  );
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      "https://adityamotale.github.io/think_school_release/public/images/c_01.png",
                      fit: BoxFit.cover,
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
                ),
              ),
              const SizedBox(height: 32),

              // Today For You
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    width: calculateTextWidth("Today For You"),
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Color(0xFFB9BBFE),
                    ),
                  ),
                  const Text(
                    "Today For You —",
                    style: TextStyle(
                      fontFamily: "Space Grotesk",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                "Explore various concepts with short form videos",
                style: TextStyle(
                  fontFamily: "Space Grotesk",
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 24),

              // Shorts
              SizedBox(
                height: min(MediaQuery.of(context).size.height * 0.4, 280),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: kShortVideos.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      width: min(MediaQuery.of(context).size.width * 0.3, 128),
                      margin: const EdgeInsets.only(right: 16),
                      child: Column(
                        children: [
                          SizedBox(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                kShortVideos[index]["img"]!,
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
                          ),
                          const SizedBox(height: 12),
                          Text(
                            kShortVideos[index]["title"]!,
                            style: const TextStyle(
                              fontFamily: "Space Grotesk",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 2,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),

              // Concepts
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    width: calculateTextWidth("Explore Concepts"),
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF7E277),
                    ),
                  ),
                  const Text(
                    "Explore Concepts —",
                    style: TextStyle(
                      fontFamily: "Space Grotesk",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: calculateAspectRatio(context),
                children: [
                  for (int i = 0; i < kConcepts.length; i++)
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ConceptView(
                              bgColor: hexToColor(kConcepts[i]["color"]!),
                              title: kConcepts[i]["title"]!,
                              icon: kConcepts[i]["icon"]!,
                              body: kConcepts[i]["body"]!,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(11.5),
                        decoration: BoxDecoration(
                          color: hexToColor(kConcepts[i]["color"]!),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Text(
                                kConcepts[i]['icon']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              kConcepts[i]["title"]!,
                              style: const TextStyle(
                                fontFamily: "Dm Serif Display",
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              kConcepts[i]["desc"]!,
                              style: const TextStyle(
                                fontFamily: "Space Grotesk",
                                fontSize: 12,
                              ),
                              maxLines: MediaQuery.of(context).size.width < 400
                                  ? 1
                                  : 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
