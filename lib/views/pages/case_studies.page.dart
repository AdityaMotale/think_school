import 'package:flutter/material.dart';
import 'package:think_school/data/case_studies.data.dart';
import 'package:think_school/views/case_study_details.view.dart';

class CaseStudiesPage extends StatelessWidget {
  const CaseStudiesPage({super.key});

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
                  width: calculateTextWidth("Explore Case Studies"),
                  height: 6,
                  decoration: const BoxDecoration(
                    color: Color(0xFF79F5C5),
                  ),
                ),
                Text(
                  "Explore Case Studies —",
                  style: headingTextStyle,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: kCaseStudies.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CaseStudyView(
                            img: kCaseStudies[index]["img"]!,
                            title: kCaseStudies[index]["title"]!,
                            dateTime: kCaseStudies[index]["dateTime"]!,
                            category: kCaseStudies[index]["category"]!,
                            body: kCaseStudies[index]["body"]!,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                kCaseStudies[index]["img"]!,
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
                          const SizedBox(height: 12),
                          Text(
                            kCaseStudies[index]["title"]!,
                            style: const TextStyle(
                              fontFamily: "Space Grotesk",
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                kCaseStudies[index]["dateTime"]!,
                                style: const TextStyle(
                                  fontFamily: "Space Grotesk",
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                "—",
                                style: TextStyle(
                                  fontFamily: "Space Grotesk",
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                kCaseStudies[index]["category"]!,
                                style: const TextStyle(
                                  fontFamily: "Space Grotesk",
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
