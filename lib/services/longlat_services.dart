import 'package:cloud_firestore/cloud_firestore.dart';

class LongLangService {
  Future<void> create(String uid, String longIni, String latIni, String longEnd,
      String latEnd) async {
    try {
      await FirebaseFirestore.instance.collection('longlat_mandado').add({
        "uid": uid,
        "long_ini": longIni,
        "lat_ini": latIni,
        "long_end": longEnd,
        "lat_end": latEnd,
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
