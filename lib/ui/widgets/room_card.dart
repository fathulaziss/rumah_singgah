import 'package:flutter/material.dart';
import 'package:rumah_singgah/shared/shared.dart';
import 'package:rumah_singgah/ui/pages/detail_room_page.dart';

class RoomCard extends StatelessWidget {
  final int? id;
  final String? name;
  final String? imageUrl;
  final int? price;
  final String? city;
  final String? country;
  final int? rating;
  final String? address;
  final String? phone;
  final String? mapUrl;
  final List? photos;
  final int? numberOfKitchen;
  final int? numberOfBedrooms;
  final int? numberOfCupboards;

  const RoomCard({
    Key? key,
    this.id,
    this.name,
    this.imageUrl,
    this.price,
    this.city,
    this.country,
    this.rating,
    this.address,
    this.phone,
    this.mapUrl,
    this.photos,
    this.numberOfKitchen,
    this.numberOfBedrooms,
    this.numberOfCupboards,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailRoomPage(
                    name: name,
                    imageUrl: imageUrl,
                    price: price,
                    numberOfBedrooms: numberOfBedrooms,
                    numberOfKitchen: numberOfKitchen,
                    numberOfCupboards: numberOfCupboards,
                    rating: rating,
                    address: address,
                    mapUrl: mapUrl,
                    phone: phone,
                    photos: photos,
                  )),
        );
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              width: 130,
              height: 110,
              child: Stack(
                children: [
                  Image.network(
                    imageUrl ?? '',
                    width: 130,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 70,
                      height: 30,
                      padding: EdgeInsets.only(bottom: 2),
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                          color: purpleColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetsIcon.iconStar,
                            width: 22,
                            height: 22,
                          ),
                          SizedBox(width: 3),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              '$rating/5',
                              style: whiteTextStyle.copyWith(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name ?? '', style: blackTextStyle.copyWith(fontSize: 18)),
              SizedBox(height: 2),
              Text.rich(
                TextSpan(
                  text: '\$$price',
                  style: purpleTextStyle.copyWith(fontSize: 16),
                  children: [
                    TextSpan(
                      text: ' / month',
                      style: greyTextStyle.copyWith(fontSize: 16),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                '$city, $country',
                style: greyTextStyle.copyWith(fontSize: 14),
              )
            ],
          )
        ],
      ),
    );
  }
}
