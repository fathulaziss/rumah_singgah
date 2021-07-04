import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:rumah_singgah/providers/room_provider.dart';
import 'package:rumah_singgah/shared/shared.dart';
import 'package:rumah_singgah/ui/widgets/bottom_navbar_item.dart';
import 'package:rumah_singgah/ui/widgets/city_card.dart';
import 'package:rumah_singgah/ui/widgets/room_card.dart';
import 'package:rumah_singgah/ui/widgets/tips_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          ListView(
            children: [
              _buildHeader(context),
              _buildPopularCities(context),
              _buildRecomendedRoom(context),
              _buildTipsAndGuidance(context),
            ],
          ),
          _buildBottomNavbar(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: defaultMargin),
          Text(
            "Explore Now",
            style: blackTextStyle.copyWith(fontSize: 24),
          ),
          SizedBox(height: 2),
          Text(
            "Let's find Rumah Singgah",
            style: greyTextStyle.copyWith(fontSize: 16),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildPopularCities(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: defaultMargin),
          child: Text(
            "Popular Cities",
            style: regulerTextStyle.copyWith(fontSize: 16),
          ),
        ),
        SizedBox(height: 16),
        Container(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: defaultMargin),
              CityCard(
                id: 1,
                name: 'Jakarta',
                imageUrl: AssetsImage.imageCity1,
                isPopular: false,
              ),
              SizedBox(width: 20),
              CityCard(
                id: 2,
                name: 'Bandung',
                imageUrl: AssetsImage.imageCity2,
                isPopular: true,
              ),
              SizedBox(width: 20),
              CityCard(
                id: 3,
                name: 'Surabaya',
                imageUrl: AssetsImage.imageCity3,
                isPopular: false,
              ),
              SizedBox(width: defaultMargin),
            ],
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }

  Widget _buildRecomendedRoom(BuildContext context) {
    var roomProvider = Provider.of<RoomProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recommended Room',
            style: blackTextStyle.copyWith(fontSize: 16),
          ),
          SizedBox(height: 16),
          FutureBuilder(
            future: roomProvider.getRecommendedRoom(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Room>? data = snapshot.data as List<Room>?;
                int index = 0;
                return Column(
                  children: data!.map((e) {
                    index++;
                    return Padding(
                      padding: EdgeInsets.only(top: index == 1 ? 0 : 30),
                      child: RoomCard(
                        id: e.id,
                        city: e.city,
                        country: e.country,
                        imageUrl: e.imageUrl,
                        name: e.name,
                        price: e.price,
                        rating: e.rating,
                      ),
                    );
                  }).toList(),
                );
              }
              return Center(
                child: SpinKitFadingCircle(
                  size: 45,
                  color: purpleColor,
                ),
              );
            },
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildTipsAndGuidance(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tips & Guidance',
              style: regulerTextStyle.copyWith(fontSize: 16)),
          SizedBox(height: 16),
          TipsCards(
            name: 'City Guidelines',
            date: 'updated 20 Apr',
            imageUrl: AssetsImage.imageTips1,
          ),
          SizedBox(height: 20),
          TipsCards(
            name: 'Jakarta Fairship',
            date: 'updated 11 Dec',
            imageUrl: AssetsImage.imageTips2,
          ),
          SizedBox(height: 100)
        ],
      ),
    );
  }

  Widget _buildBottomNavbar(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Container(
          height: 65,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          decoration: BoxDecoration(
            color: Color(0xFFF6F7F8),
            borderRadius: BorderRadius.circular(23),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavbarItem(
                imageUrl: AssetsIcon.iconHome,
                isActive: true,
              ),
              BottomNavbarItem(
                imageUrl: AssetsIcon.iconMessageInactive,
                isActive: false,
              ),
              BottomNavbarItem(
                imageUrl: AssetsIcon.iconCardInactive,
                isActive: false,
              ),
              BottomNavbarItem(
                imageUrl: AssetsIcon.iconFavoriteInactive,
                isActive: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
