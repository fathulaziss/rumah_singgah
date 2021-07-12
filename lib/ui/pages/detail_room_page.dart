import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rumah_singgah/shared/shared.dart';
import 'package:rumah_singgah/ui/widgets/facilities_item.dart';
import 'package:rumah_singgah/ui/widgets/rating_item.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailRoomPage extends StatefulWidget {
  final String? name;
  final int? price;
  final String? imageUrl;
  final int? rating;
  final String? address;
  final String? phone;
  final String? mapUrl;
  final List? photos;
  final int? numberOfKitchen;
  final int? numberOfBedrooms;
  final int? numberOfCupboards;

  const DetailRoomPage({
    this.name,
    this.price,
    this.imageUrl,
    this.rating,
    this.address,
    this.phone,
    this.mapUrl,
    this.photos,
    this.numberOfKitchen,
    this.numberOfBedrooms,
    this.numberOfCupboards,
    Key? key,
  }) : super(key: key);

  @override
  _DetailRoomPageState createState() => _DetailRoomPageState();
}

class _DetailRoomPageState extends State<DetailRoomPage> {
  bool isFavorite = false;

  launchURL(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw (url);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.white,
    ));
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          _buildHeader(context),
          _buildContent(context),
          _buildAppBar(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          widget.imageUrl ?? '',
          width: double.infinity,
          height: 400,
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 45),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(AssetsButton.buttonBack, width: 40)),
          InkWell(
              onTap: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              child: (isFavorite == true)
                  ? Image.asset(AssetsButton.buttonWishlistActive, width: 40)
                  : Image.asset(AssetsButton.buttonWishlist, width: 40)),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.only(top: 320),
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
          margin: EdgeInsets.only(top: 10),
          width: 80,
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
                    widget.name ?? '',
                    style: blackTextStyle.copyWith(fontSize: 22),
                  ),
                  SizedBox(height: 2),
                  Text.rich(
                    TextSpan(
                        text: '\$${widget.price}',
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
                children: [1, 2, 3, 4, 5].map((index) {
                  return Container(
                    margin: EdgeInsets.only(left: 2),
                    child: RatingItem(
                      index: index,
                      rating: widget.rating,
                    ),
                  );
                }).toList(),
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
                total: widget.numberOfKitchen,
              ),
              FacilitiesItem(
                facilitiesName: 'bedroom',
                icon: AssetsIcon.iconBedroom,
                total: widget.numberOfBedrooms,
              ),
              FacilitiesItem(
                facilitiesName: 'cupboard',
                icon: AssetsIcon.iconCupboard,
                total: widget.numberOfCupboards,
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
            children: widget.photos!.map((item) {
              return Container(
                margin: EdgeInsets.only(left: 24),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    item,
                    width: 110,
                    height: 88,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
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
                widget.address ?? '',
                style: greyTextStyle.copyWith(fontSize: 14),
              ),
              InkWell(
                  onTap: () {
                    launchURL('${widget.mapUrl}');
                  },
                  child: Image.asset(AssetsButton.buttonMap, width: 40))
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
              launchURL('https://wa.me/${widget.phone}');
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
