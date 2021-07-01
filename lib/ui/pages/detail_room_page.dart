import 'package:flutter/material.dart';
import 'package:rumah_singgah/shared/shared.dart';
import 'package:rumah_singgah/ui/pages/home_page.dart';
import 'package:rumah_singgah/ui/widgets/facilities_item.dart';

class DetailRoomPage extends StatelessWidget {
  const DetailRoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            _buildHeader(context),
            _buildContent(context),
            _buildAppBar(context),
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
      ],
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(AssetsButton.buttonBack, width: 40)),
          Image.asset(AssetsButton.buttonWishlist, width: 40),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.only(top: 328),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            color: whiteColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(context),
              _buildDescription(context),
              _buildDetailPhotos(context),
              _buildLocation(context),
              _buildButton(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, left: 100, right: 100),
          width: double.infinity,
          height: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xFFDEDEDE),
          ),
        ),
        SizedBox(height: 20),
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
                              style: greyTextStyle.copyWith(fontSize: 16)),
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
                  Image.asset(AssetsIcon.iconStar, width: 20, color: greyColor),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: defaultMargin),
          child: Text('Main Facilities',
              style: regulerTextStyle.copyWith(fontSize: 16)),
        ),
        SizedBox(height: 12),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FacilitiesItem(
                facilitiesName: 'kitchen',
                icon: AssetsIcon.iconKitchen,
                total: 2,
              ),
              FacilitiesItem(
                facilitiesName: 'bedroom',
                icon: AssetsIcon.iconBedroom,
                total: 3,
              ),
              FacilitiesItem(
                facilitiesName: 'cupboard',
                icon: AssetsIcon.iconCupboard,
                total: 3,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildDetailPhotos(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.only(left: defaultMargin),
          child: Text('Photos', style: regulerTextStyle.copyWith(fontSize: 16)),
        ),
        SizedBox(height: 12),
        Container(
          height: 88,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: defaultMargin),
              Image.asset(
                AssetsImage.imageDetailRoom1,
                width: 110,
                height: 88,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 18),
              Image.asset(
                AssetsImage.imageDetailRoom1,
                width: 110,
                height: 88,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 18),
              Image.asset(
                AssetsImage.imageDetailRoom1,
                width: 110,
                height: 88,
                fit: BoxFit.cover,
              ),
              SizedBox(width: defaultMargin),
            ],
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }

  Widget _buildLocation(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: defaultMargin),
          child:
              Text('Location', style: regulerTextStyle.copyWith(fontSize: 16)),
        ),
        SizedBox(height: 6),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Jln. Jendral Sudirman No.24\nJakarta',
                style: greyTextStyle.copyWith(fontSize: 14),
              ),
              Image.asset(AssetsButton.buttonMap, width: 40)
            ],
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(purpleColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                )),
            child: Text(
              "Book Now",
              style: whiteTextStyle.copyWith(fontSize: 18),
            ),
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
