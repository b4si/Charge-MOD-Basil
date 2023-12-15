// ignore_for_file: use_build_context_synchronously

import 'package:charge_mod_task/controller/location_details_priovider.dart';
import 'package:charge_mod_task/controller/register_user_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<LocationDetailsProvider>(context, listen: false)
          .getLocation(context);
      await Provider.of<RegisterUserProvider>(context, listen: false)
          .getUserDetails(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: size.height,
              width: size.width,
              child: Image.asset(
                'asset\\Light.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.78),
              child: SizedBox(
                height: 60,
                child: Consumer<LocationDetailsProvider>(
                  builder: (context, value, child) => ListView.builder(
                      itemCount: value.locationDetails.isNotEmpty
                          ? value.locationDetails[0].data.result.length
                          : 0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        if (value.locationDetails.isNotEmpty) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Card(
                              elevation: 5,
                              child: Container(
                                width: size.width * 0.8,
                                height: size.height * 0.09,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            value.locationDetails[0].data
                                                .result[index].name,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: size.width * 0.7,
                                            child: Text(
                                              "${value.locationDetails[0].data.result[index].street1}, ${value.locationDetails[0].data.result[index].street2}, ${value.locationDetails[0].data.result[index].city}, ${value.locationDetails[0].data.result[index].state}, ${value.locationDetails[0].data.result[index].country}",
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
