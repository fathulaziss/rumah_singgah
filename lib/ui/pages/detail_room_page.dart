import 'package:flutter/material.dart';
import 'package:rumah_singgah/shared/shared.dart';

class DetailRoomPage extends StatelessWidget {
  const DetailRoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            _buildHeader(context),
            _buildContent(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AssetsImage.imageBannerDetail1,
          width: double.infinity,
          height: 350,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultMargin, vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(AssetsButton.buttonBack, width: 40)),
              Image.asset(AssetsButton.buttonWishlist, width: 40),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 328),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            color: whiteColor,
          ),
          child: Column(
            children: [
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kuretakeso Hott',
                          style: blackTextStyle.copyWith(fontSize: 22),
                        ),
                        SizedBox(height: 2),
                        Text.rich(
                          TextSpan(
                              text: '\$52',
                              style: purpleTextStyle.copyWith(fontSize: 16),
                              children: [
                                TextSpan(
                                    text: ' / month',
                                    style:
                                        greyTextStyle.copyWith(fontSize: 16)),
                              ]),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(AssetsIcon.iconStar, width: 20),
                        SizedBox(width: 2),
                        Image.asset(AssetsIcon.iconStar, width: 20),
                        SizedBox(width: 2),
                        Image.asset(AssetsIcon.iconStar, width: 20),
                        SizedBox(width: 2),
                        Image.asset(AssetsIcon.iconStar, width: 20),
                        SizedBox(width: 2),
                        Image.asset(AssetsIcon.iconStar,
                            width: 20, color: greyColor),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
