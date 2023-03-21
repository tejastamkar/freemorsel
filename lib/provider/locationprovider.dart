import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<bool> handleLocationPermission({required BuildContext context}) async {
  // bool serviceEnabled;
  // LocationPermission permission;

  await Geolocator.isLocationServiceEnabled().then((value) {
    if (!value) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
  });
  await Geolocator.checkPermission().then((value) async {
    if (value == LocationPermission.denied) {
      await Geolocator.requestPermission().then((permission) {
        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Location permissions are denied')));
        }
        return false;
      });
    }
  }).then((value) {
    if (value == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
  });
  return true;
}

Future getLoction({required BuildContext context}) async {
  String? currentAddress;
  Position? currentPosition;

  Future getCurrentPosition() async {
    final hasPermission = await handleLocationPermission(context: context);
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentPosition = position;
    }).catchError((e) {
      debugPrint(e);
    });
  }

  await getCurrentPosition();

  Future getAddressFromLatLng() async {
    await placemarkFromCoordinates(
            currentPosition!.latitude, currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      currentAddress =
          '${place.street}, ${place.subLocality},${place.subAdministrativeArea}';
    }).catchError((e) {
      debugPrint(e);
    });
  }

  await getAddressFromLatLng();

  return currentAddress.toString();
}
