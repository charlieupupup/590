import 'package:meta/meta.dart';

class SurveyNotification {
  final int id;
  final String title;
  final String body;
  final String payload;

  SurveyNotification({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.payload,
  });
}
