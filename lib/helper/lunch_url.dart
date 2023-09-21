import 'package:url_launcher/url_launcher.dart';

void lunchUrl({required String videoUrl}) async {
  final url = videoUrl;
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}
