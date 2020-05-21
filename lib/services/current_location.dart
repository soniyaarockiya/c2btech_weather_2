import 'package:geolocator/geolocator.dart';

//This gets the users current location using GEOLOCATOR package
class CurrentLocation {
  Position position;

  Future<Position> getLocation() async {
    try {
      position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    } catch (e) {
      print(e);
    }
    return position;
  }
}
