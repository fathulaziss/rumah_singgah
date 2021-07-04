import 'package:flutter/material.dart';
import 'package:rumah_singgah/shared/shared.dart';
import 'package:rumah_singgah/ui/pages/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          _splashImage(),
          _splashIntro(context),
        ],
      ),
    );
  }

  Widget _splashIntro(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage(AssetsImage.imageLogo))),
          ),
          SizedBox(height: 30),
          Text(
            'Find Rumah Singgah \nto Stay and Happy',
            style: blackTextStyle.copyWith(fontSize: 24),
          ),
          SizedBox(height: 10),
          Text(
            'Stop waste your time\nat place which is not hobitable',
            style: greyTextStyle.copyWith(fontSize: 16),
          ),
          SizedBox(height: 40),
          Container(
            width: 210,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(purpleColor),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  )),
              child: Text(
                "Explore Now",
                style: whiteTextStyle.copyWith(fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _splashImage() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Image.asset(AssetsImage.imageSplash));
  }
}
