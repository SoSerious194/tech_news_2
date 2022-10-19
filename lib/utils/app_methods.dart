import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';

class AppMethods {
  static bool isSignedIn() => FirebaseAuth.instance.currentUser?.uid != null;

  static Future<void> openUrl(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  static String getUid() => FirebaseAuth.instance.currentUser!.uid;
}
