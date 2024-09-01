import 'package:flutter/material.dart';
import 'package:jatitrans_app/Core/Utils/ImagesConstant.dart';
import 'package:jatitrans_app/Core/Utils/Parameters.dart';
import 'package:jatitrans_app/Core/Utils/VColor.dart';

class Sidebar extends StatelessWidget {
  const Sidebar(
      {super.key,
      this.username,
      this.screenKey,
      required this.onLogoutPress,
      required this.onHistoryPress,
      required this.onHomePress});

  final String? username;
  final String? screenKey;
  final VoidCallback onLogoutPress;
  final VoidCallback onHistoryPress;
  final VoidCallback onHomePress;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 180),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.home,
                    color: VColor.primaryColors,
                  ),
                  title: Text(
                    'Home',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: screenKey == ScreenKey.homePage.name
                            ? Colors.grey
                            : Colors.black),
                  ),
                  onTap: onHomePress,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.history,
                    color: VColor.secondaryColors,
                  ),
                  title: Text(
                    'History',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: screenKey == ScreenKey.historyPage.name
                            ? Colors.grey
                            : Colors.black),
                  ),
                  onTap: onHistoryPress,
                ),
              ],
            ),
          ),
          UserAccountsDrawerHeader(
            accountName: const Text(
              'Welcome...',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            // USER EMAIL
            accountEmail: Text(
              username ?? "-",
              style: const TextStyle(
                fontSize: 13,
                color: Colors.white,
              ),
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImagesConstant.publicTransportBackground),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.account_circle, color: Colors.black),
                label: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.black),
                ),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    VColor.primaryColors,
                  ),
                ),
                // onPressed: () async {
                //   // loginData!.setBool('login', false);
                //   // loginData!.remove('userName');

                //   // Navigator.of(context).pushReplacementNamed('/signin');
                // },
                onPressed: onLogoutPress,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
