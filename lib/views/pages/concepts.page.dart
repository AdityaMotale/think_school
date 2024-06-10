import 'package:flutter/material.dart';
import 'package:think_school/views/concept_details.view.dart';

import '../../data/concepts.data.dart';

class ConceptsPage extends StatelessWidget {
  const ConceptsPage({super.key});

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

  ///
  /// Convert HEX to Octal color object
  ///
  Color hexToColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Featured Case Study
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
                Text(
                  "Explore Concepts —",
                  style: headingTextStyle,
                ),
              ],
            ),
            const SizedBox(height: 32),
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
                            maxLines:
                                MediaQuery.of(context).size.width < 400 ? 1 : 2,
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
    );
  }
}
