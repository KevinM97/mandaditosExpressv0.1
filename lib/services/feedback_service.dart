import 'package:cloud_firestore/cloud_firestore.dart';

class FeedBackService {
  Future<void> create(String feedback) async {
    try {
      await FirebaseFirestore.instance.collection('feedback').add({
        'feedback': feedback,
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
