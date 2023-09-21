import 'package:flutter/material.dart';
import 'package:netflix_app/constants/constants.dart';
import 'package:netflix_app/widgets/custom_button.dart';

import 'package:url_launcher/url_launcher.dart';

class VideoPlayerScreen extends StatelessWidget {
  final String videoUrl;

  const VideoPlayerScreen({
    Key? key,
    required this.videoUrl,
  }) : super(key: key);

  void launchURL() async {
    final url = videoUrl; // Replace with your desired URL
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomButton(
          text: 'play',
          color: kMainColor,
          onTap: launchURL,
        ),
      ),
    );
  }
}
