import 'dart:developer';

import 'package:charge_mod_task/controller/location_details_priovider.dart';
import 'package:charge_mod_task/core/local_user_data.dart';
import 'package:charge_mod_task/model/location_model.dart';
import 'package:charge_mod_task/services/user_details_services.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

class LocationDetailsService {
  getLocationDetails(context) async {
    try {
      final provider =
          Provider.of<LocationDetailsProvider>(context, listen: false);
      Map<String, String?> userData = await UserPreferences.getUserData();
      log(userData[UserPreferences.keyAccessToken].toString());
      log('10');
      Response response = await Dio().get(
        'https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/64941897fdb322dbf94ad2b8/6494141957d29409895704d2/1.0.0/8.5465282/76.9151412/all-locations?limit=10&page=1',
        options: Options(
          headers: {
            "Authorization":
                "Bearer ${userData[UserPreferences.keyAccessToken].toString()}"
          },
        ),
      );
      final locations = LocationModel.fromJson(response.data);
      provider.locationDetails.add(locations);
      log(response.toString());
      if (response.statusCode == 401) {
        UserDetailsServices().refreshToken();
        getLocationDetails(context);
      }
      log(response.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
