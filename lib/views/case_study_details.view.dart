import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CaseStudyView extends StatefulWidget {
  final String img;
  final String title;
  final String dateTime;
  final String category;
  final String body;

  const CaseStudyView({
    super.key,
    required this.img,
    required this.title,
    required this.dateTime,
    required this.category,
    required this.body,
  });

  @override
  State<CaseStudyView> createState() => _CaseStudyViewState();
}

class _CaseStudyViewState extends State<CaseStudyView> {
  final List<Widget> bodyWidgets = [];

  @override
  void initState() {
    super.initState();

    bodyWidgets.addAll(parseMarkdown(widget.body));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      widget.img,
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
                  Positioned(
                    right: 24,
                    top: 24,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: SvgPicture.network(
                          "https://adityamotale.github.io/think_school_release/public/icons/close_32.svg",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 32, 20, 12),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontFamily: "Dm Serif Display",
                    fontSize: 32,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.dateTime,
                      style: const TextStyle(
                        fontFamily: "Space Grotesk",
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      "—",
                      style: TextStyle(
                        fontFamily: "Space Grotesk",
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      widget.category,
                      style: const TextStyle(
                        fontFamily: "Space Grotesk",
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ...bodyWidgets,
              const SizedBox(height: 44),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
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
              ),
              const SizedBox(height: 44),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> parseMarkdown(String data) {
    List<Widget> widgets = [];
    List<String> lines = data.split('\n');
    for (String line in lines) {
      if (line.startsWith('>')) {
        widgets.add(
          Container(
            padding: const EdgeInsets.only(left: 12, top: 12, bottom: 12),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(color: Color(0xFF0C0C0C), width: 2),
              ),
            ),
            child: Text(
              line.substring(1).trim(),
              style: const TextStyle(
                fontSize: 16,
                fontFamily: "Space Grotesk",
              ),
            ),
          ),
        );
      } else if (line.startsWith('![Image')) {
        final regex = RegExp(r'!\[.*\]\((.*)\)');
        final match = regex.firstMatch(line);
        if (match != null) {
          widgets.add(
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Image.network(
                match.group(1)!,
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
          );
        }
      } else if (line.trim().isNotEmpty) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            child: Text(
              line.trim(),
              style: const TextStyle(
                fontSize: 12,
                fontFamily: "Space Grotesk",
              ),
            ),
          ),
        );
      }
    }
    return widgets;
  }
}
