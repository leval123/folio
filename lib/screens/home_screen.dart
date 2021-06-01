import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:folio/utilities/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openURL(String url) async {
  final launchable = await canLaunch(url);
  if (launchable) {
    await launch(url);
  }
}

class HomeScreen extends StatelessWidget {
  Widget _renderHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(width: double.infinity),
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/rick.png"),
            radius: 100.0,
          ),
          const SizedBox(height: 24.0),
          Container(
            constraints: const BoxConstraints(maxWidth: 700.0),
            child: Column(
              children: const [
                Text(
                  "hello i'm Lefrancois",
                  style: kGreetingStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.0),
                Text(
                  "something about me i guess",
                  style: kHeadingStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderLinks() {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 22.0,
      children: [
        IconButton(
          onPressed: () => openURL("https://www.linkedin.com"),
          icon: const FaIcon(
            FontAwesomeIcons.linkedin,
            color: kBlueColor,
          ),
        ),
        IconButton(
          onPressed: () => openURL("https://www.github.com"),
          icon: const FaIcon(
            FontAwesomeIcons.github,
            color: kBlueColor,
          ),
        ),
      ],
    );
  }

  Widget _renderBadges() {
    const technologies = [
      "flutter",
      "dart",
      "java",
      "c",
      "cpp",
      "css",
      "javascript",
      "python",
      "html",
      "mysql"
    ];
    return Container(
      constraints: BoxConstraints(maxWidth: 700.0),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: technologies
            .map(
              (tech) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/badges/$tech.png",
                        width: 48,
                      ),
                      Text(tech),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _renderProjectCard({
    required String imageUrl,
    required String title,
    required String description,
    String? visitLink,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: const BorderSide(
          color: kDarkGray,
        ),
      ),
      elevation: 2,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                height: 200,
                width: 350,
              ),
              Text(
                title,
                style: kProjectCardTitleStyle,
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                description,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              if (visitLink != null)
                Padding(
                  padding: const EdgeInsets.only(
                    right: 16.0,
                    bottom: 8.0,
                    top: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          final launchable = await canLaunch(visitLink);
                          if (launchable) {
                            await launch(visitLink);
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(kBlueColor),
                        ),
                        child: const Text(
                          'VIST',
                        ),
                      )
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderProjects() {
    return Container(
        color: kLightGray,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 52.0),
        child: Column(
          children: [
            const Text(
              "Projects",
              style: kSectionTitleStyle,
            ),
            const SizedBox(
              height: 32.0,
            ),
            Wrap(
              alignment: WrapAlignment.spaceEvenly,
              runSpacing: 16,
              spacing: 16,
              children: [
                _renderProjectCard(
                  imageUrl: "assets/projects/pokedex.png",
                  title: 'Pokedex',
                  description: 'Pokemon explorer built with Flutter',
                  visitLink: "https://pokedexweb.surge.sh",
                ),
                _renderProjectCard(
                  imageUrl: "assets/projects/cryptospace.png",
                  title: 'CryptoSpace',
                  description: 'Cryptocurrency Tracker',
                  visitLink: "https://cryptospace.surge.sh",
                ),
                _renderProjectCard(
                  imageUrl: "assets/projects/notable.png",
                  title: 'Notable',
                  description: 'Note-taking made simple',
                ),
                _renderProjectCard(
                  imageUrl: "assets/projects/chatly.png",
                  title: 'Chatly',
                  description: 'Real-time chat',
                  visitLink: "https://chatly.surge.sh/",
                ),
              ],
            ),
          ],
        ));
  }

  Widget _renderFooter() {
    return Container(
      color: kBlackColor,
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Flexible(
            child: Text(
              "made by Lefrancois Valenski",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lefrancois Valenski',
          style: TextStyle(
            color: kDarkGray,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _renderHeader(),
              const SizedBox(
                height: 24.0,
              ),
              _renderLinks(),
              const SizedBox(
                height: 32.0,
              ),
              _renderBadges(),
              const SizedBox(
                height: 56,
              ),
              _renderProjects(),
              _renderFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
