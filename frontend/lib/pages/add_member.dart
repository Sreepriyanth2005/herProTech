import 'package:flutter/material.dart';
import 'package:herprotech/assets/style_constants.dart';
import 'package:herprotech/wrapper/responsive_sizedBox.dart';
import 'package:herprotech/wrapper/responsive_text.dart';

class AddMemberPage extends StatelessWidget {
  const AddMemberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(2, 62, 138, 1),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
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
        child: ResponsiveText(
          'This is Add Member Page',
          style: StyleConstants.customStyle(
            16,
            Colors.white,
            FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
