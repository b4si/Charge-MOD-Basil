import 'package:charge_mod_task/controller/log_out_proivder.dart';
import 'package:charge_mod_task/controller/register_user_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Hello',
              style: TextStyle(fontSize: 15),
            ),
            Consumer<RegisterUserProvider>(
                builder: (context, value, child) => Text(
                      value.userName,
                    ))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                elevation: 5,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.light_mode_outlined),
                        title: Text('My Payments'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.electric_bike_rounded),
                        title: Text('My Electric vehicles'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.favorite_border),
                        title: Text('My Favourite Stations'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.swipe_up_alt_sharp),
                        title: Text('Alpha Membership'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    color: const Color(0xFFE6740C)),
                width: size.width,
                height: size.height * 0.06,
                child: const Center(
                  child: Text('Buy Machines From chargeMOD',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w400)),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                elevation: 5,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.devices_other_sharp),
                        title: Text('My Devices'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.shopping_bag_outlined),
                        title: Text('My Orders'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                elevation: 5,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.help_center_outlined),
                        title: Text('Help'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.chat_outlined),
                        title: Text('Raise Complaint'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.info_outlined),
                        title: Text('About Us'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.document_scanner_outlined),
                        title: Text('Privacy policy'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Consumer<LogOutProvider>(
                builder: (context, value, child) => InkWell(
                  onTap: () {
                    value.logOut(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        color: const Color(0xFFE6740C)),
                    width: size.width,
                    height: size.height * 0.06,
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.power_settings_new_sharp,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Logout',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Image.asset('asset\\Group 33721.png'),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'V 1.0.0 (001)',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Copyright © 2022 BPM Power Pvt Ltd.',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            Text(
              'All rights reserved.',
              style: TextStyle(color: Colors.grey.shade600),
            )
          ],
        ),
      ),
    );
  }
}
