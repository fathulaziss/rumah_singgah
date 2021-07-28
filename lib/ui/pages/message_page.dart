import 'package:flutter/material.dart';
import 'package:rumah_singgah/shared/assets.dart';
import 'package:rumah_singgah/shared/shared.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 42),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AssetsImage.imageComingSoon, width: 250),
          SizedBox(height: 30),
          Text('Sorry, this feature is still under development',
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
