import 'package:geolocator/geolocator.dart';

class Location {
  double latitide;
  double longitude;
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitide = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
