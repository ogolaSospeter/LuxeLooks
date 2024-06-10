import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luxelooks/Login.dart';
import 'package:luxelooks/MainPage.dart';
import 'package:luxelooks/Screens/Profile.dart';
import 'package:luxelooks/models/Settings.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerHeader(
            padding: const EdgeInsets.only(),
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    height: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.cyan,
                    ),
                    child: Image.network(
                        "https://img.freepik.com/free-vector/bag-with-cosmetics-realistic-composition-with-isolated-image-open-vanity-case-with-brushes-lipstick-illustration_1284-57081.jpg?t=st=1718015935~exp=1718019535~hmac=dbc3691e1e5d11212c5498b6af2e5f0a6eed907d7f548c0ee860027dfddb8320&w=740")),
                const Text(
                  " LuxeLooks Cosmetics",
                  style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w400),
                ),
                const Text(
                  " Your One Stop Cosmetics Shop.",
                  style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w400),
                ),
              ],
            )),
        const UserInfo(),
        ListBody(
          children: [
            const ListTile(
              title: Text(
                "",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.start,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const ProfileScreen();
                }));
              },
              selectedTileColor: Colors.green,
              leading: const Icon((Icons.people_outline)),
              title: const Text(
                "Profiles",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.5),
              ),
              subtitle: const Text(
                "View or Edit your Profile Information",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.w100, fontSize: 9.0),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const SettingsPage();
                }));
              },
              selectedTileColor: Colors.green,
              leading: const Icon((Icons.settings)),
              title: const Text(
                "Settings",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.5),
              ),
              subtitle: const Text(
                "Change the  settings",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.w100, fontSize: 9.0),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const LoginPage();
                }));
              },
              selectedTileColor: Colors.green,
              leading: const Icon((Icons.exit_to_app_sharp)),
              title: const Text(
                "Log Out",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.5),
              ),
              subtitle: const Text(
                "Log Out of the Application",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.w100, fontSize: 9.0),
              ),
            ),
            ListTile(
              onTap: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
              selectedTileColor: Colors.green,
              leading: const Icon(Icons.exit_to_app_sharp),
              title: const Text(
                "Exit",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 11.5),
              ),
              subtitle: const Text(
                "Exit Application",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.w100, fontSize: 9.0),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListBody(
      children: <Widget>[
        const ListTile(
          title: Text(
            "User Information",
            textDirection: TextDirection.ltr,
            style: TextStyle(fontSize: 15),
            textAlign: TextAlign.start,
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return const MyHomePage();
            }));
          },
          selectedTileColor: Colors.green,
          leading: const Icon((Icons.people_outline)),
          title: const Text(
            "Service Providers",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.5),
          ),
          subtitle: const Text(
            "Select to view the list of service providers closest to you.",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.w100, fontSize: 9.0),
          ),
        ),
      ],
    );
  }
}
