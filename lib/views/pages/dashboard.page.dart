import 'package:flutter/material.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Featured Case Study
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.53,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFF79F5C5),
                    ),
                  ),
                  const Text(
                    "Featured Case Study —",
                    style: TextStyle(
                      fontFamily: "Space Grotesk",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  "https://adityamotale.github.io/think_school_release/public/images/c_01.png",
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
              const SizedBox(height: 32),

              // Today For You
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.36,
                    height: 8,
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
                height: MediaQuery.of(context).size.height * 0.36,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: kShortVideos.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.3,
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
              const SizedBox(height: 16),

              // Concepts
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: 8,
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
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: [
                  for (int i = 0; i < kConcepts.length; i++)
                    Container(
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
                          ),
                        ],
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

const List<Map<String, String>> kShortVideos = [
  {
    "img":
        "https://adityamotale.github.io/think_school_release/public/images/s_02.png",
    "video":
        "https://adityamotale.github.io/think_school_release/public/videos/s_01.mp4",
    "title": "3 Things that helped OYO grow! Ft. Rites Agarawal",
    "dateTime": "May 05, 2024",
    "category": "Business",
    "likes": "1k",
    "shares": "800",
    "saved": "250",
  },
  {
    "img":
        "https://adityamotale.github.io/think_school_release/public/images/s_01.png",
    "video":
        "https://adityamotale.github.io/think_school_release/public/videos/s_02.mp4",
    "title": "What do you think about this argument?",
    "dateTime": "April 25, 2024",
    "category": "Politics",
    "likes": "1k",
    "shares": "1.2k",
    "saved": "900",
  },
  {
    "img":
        "https://adityamotale.github.io/think_school_release/public/images/s_03.png",
    "video":
        "https://adityamotale.github.io/think_school_release/public/videos/s_03.mp4",
    "title": "Kerala’s Economic Disaster!",
    "dateTime": "April 20, 2024",
    "category": "Politics",
    "likes": "5k",
    "shares": "750",
    "saved": "2K",
  }
];

const List<Map<String, String>> kConcepts = [
  {
    "icon": "🧠",
    "title": "Dunning–Kruger effect",
    "color": "FCEFC7",
    "desc": "Overestimating ability; lacking self-awareness",
    "body": "",
  },
  {
    "icon": "✨",
    "title": "Assembly bonus effect",
    "color": "C9F6E6",
    "desc": "Enhance performance in group settings",
    "body": "",
  },
  {
    "icon": "🌟",
    "title": "Lake Wobegon effect",
    "color": "E9E1FD",
    "desc": "Everyone believes they're above average",
    "body": "",
  },
  {
    "icon": "🛞",
    "title": "The wagon-wheel effect",
    "color": "E5F3FD",
    "desc": "Illusion of wheels spinning backwards",
    "body": "",
  },
];
