import 'package:flutter/material.dart';
import 'package:herprotech/assets/style_constants.dart';
import 'package:herprotech/model/user_model.dart';
import 'package:herprotech/pages/add_member.dart';
import 'package:herprotech/pages/edit_profile.dart';
import 'package:herprotech/storage/store_values.dart';
import 'package:herprotech/widgets/sos_button.dart';
import 'package:herprotech/wrapper/responsive_container.dart';
import 'package:herprotech/wrapper/responsive_sizedBox.dart';
import 'package:herprotech/wrapper/responsive_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String username;
  @override
  void initState() {
    super.initState();
    _fetchUserName();
  }

  void _fetchUserName() async {
    UserModel user = await StoreService.getEmployeeData();
    setState(() {
      username = user.userName!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(2, 62, 138, 1),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                ResponsiveText(
                  'Welcome, $username',
                  style: StyleConstants.customStyle(
                      16, Colors.black, FontWeight.w500),
                ),
                ResponsiveSizedBox(
                  width: 8,
                  height: 0,
                ),
                CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Container(
          color: Color.fromRGBO(2, 62, 138, 1),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/profile.jpg'),
                    ),
                    ResponsiveSizedBox(width: 0, height: 8),
                    ResponsiveText(
                      'Welcome, username',
                      style: StyleConstants.customStyle(
                          16, Colors.black, FontWeight.w500),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.edit_note, color: Colors.white),
                title: ResponsiveText(
                  'View Profile',
                  style: StyleConstants.customStyle(
                    16,
                    Colors.white,
                    FontWeight.w400,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.people,
                  color: Colors.white,
                ),
                title: ResponsiveText(
                  'Add Members',
                  style: StyleConstants.customStyle(
                    16,
                    Colors.white,
                    FontWeight.w400,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddMemberPage()),
                  );
                },
              ),
              ResponsiveSizedBox(width: 0, height: 500),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: ResponsiveContainer(
                    width: 135,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 203, 69, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/');
                      },
                      icon: Icon(Icons.logout),
                      label: ResponsiveText('LogOut',
                          style: StyleConstants.formButtonTextStyle),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 203, 69, 1),
                        iconColor: Color.fromRGBO(53, 50, 43, 1),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: SosButtonWidget(),
      ),
    );
  }
}
