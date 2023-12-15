import 'package:charge_mod_task/model/location_model.dart';
import 'package:charge_mod_task/services/location_details_services.dart';
import 'package:flutter/material.dart';

class LocationDetailsProvider with ChangeNotifier {
  List<LocationModel> locationDetails = [];

  getLocation(context) async {
    await LocationDetailsService().getLocationDetails(context);
    notifyListeners();
  }
}
