import 'package:flutter/material.dart';
import 'package:herprotech/assets/style_constants.dart';
import 'package:herprotech/widgets/sos_button.dart';
import 'package:herprotech/wrapper/responsive_sizedBox.dart';
import 'package:herprotech/wrapper/responsive_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(2, 62, 138, 1),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                ResponsiveText(
                  'Welcome, username',
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
      body: Center(
        child : SosButtonWidget(),
      )
    );
  }
}
