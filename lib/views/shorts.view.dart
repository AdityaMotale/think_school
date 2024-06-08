import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';
import '../data/shorts.data.dart';

class ShortsView extends StatefulWidget {
  ///
  /// Index of the short from [kShortVideos] to be used as its ID
  ///
  final int shortIndex;

  const ShortsView({
    super.key,
    required this.shortIndex,
  });

  @override
  State<ShortsView> createState() => _ShortsViewState();
}

class _ShortsViewState extends State<ShortsView> {
  Map<String, String> shortData = kShortVideos.first;
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();

    if (widget.shortIndex != 0) {
      shortData = kShortVideos[widget.shortIndex];
    }

    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(shortData["video"]!),
    )
      ..initialize()
      ..play();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF0C0C0C),
        body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: kShortVideos.length,
          onPageChanged: (value) {
            shortData = kShortVideos[value];

            videoPlayerController = VideoPlayerController.networkUrl(
              Uri.parse(shortData["video"]!),
            )
              ..initialize()
              ..play();

            setState(() {});
          },
          itemBuilder: (context, index) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: MediaQuery.of(context).size.width /
                        MediaQuery.of(context).size.height,
                    child: VideoPlayer(videoPlayerController),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Icons

                        // Likes
                        Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.network(
                                "https://adityamotale.github.io/think_school_release/public/icons/like_48.svg",
                              ),
                            ),
                            Text(
                              shortData["likes"]!,
                              style: const TextStyle(
                                fontFamily: "Space Grotesk",
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        // Shares
                        Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.network(
                                "https://adityamotale.github.io/think_school_release/public/icons/share_48.svg",
                              ),
                            ),
                            Text(
                              shortData["shares"]!,
                              style: const TextStyle(
                                fontFamily: "Space Grotesk",
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        // Likes
                        Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.network(
                                "https://adityamotale.github.io/think_school_release/public/icons/save_48.svg",
                              ),
                            ),
                            Text(
                              shortData["saved"]!,
                              style: const TextStyle(
                                fontFamily: "Space Grotesk",
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 32),

                        // Short Details

                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                shortData["title"]!,
                                style: const TextStyle(
                                  fontFamily: "Space Grotesk",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              shortData["dateTime"]!,
                              style: const TextStyle(
                                fontFamily: "Space Grotesk",
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "—",
                              style: TextStyle(
                                fontFamily: "Space Grotesk",
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              shortData["category"]!,
                              style: const TextStyle(
                                fontFamily: "Space Grotesk",
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
