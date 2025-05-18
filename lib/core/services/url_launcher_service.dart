import 'package:url_launcher/url_launcher.dart';

abstract class AbstractUrlLauncherService {
  Future<void> openUrl(String url);
}

class UrlLauncherServiceImpl implements AbstractUrlLauncherService {
  @override
  Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $uri');
    }
  }
}
