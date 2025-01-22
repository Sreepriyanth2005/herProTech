import 'package:flutter/material.dart';
import 'package:herprotech/assets/style_constants.dart';
import 'package:herprotech/wrapper/responsive_container.dart';
import 'package:herprotech/wrapper/responsive_text.dart';
import 'package:http/http.dart' as http;

class SosButtonWidget extends StatefulWidget {
  const SosButtonWidget({super.key});

  @override
  State<SosButtonWidget> createState() => _SosButtonWidgetState();
}

class _SosButtonWidgetState extends State<SosButtonWidget> {
  Future callWebServer() async {
    final String url = "https://ful-sos-2.onrender.com";
    try {
      await http.get(Uri.parse(url));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('SOS Alert Sent!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (error) {
      print('Error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send SOS Alert!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: GestureDetector(
        onTap: () async {
          print('SOS Button Pressed');
          await callWebServer();
        },
        child: Center(
          child: ResponsiveText(
            'SOS',
            style: StyleConstants.customStyle(
              50,
              const Color.fromRGBO(4, 6, 49, 1),
              FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
