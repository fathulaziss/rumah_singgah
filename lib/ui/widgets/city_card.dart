import 'package:flutter/material.dart';
import 'package:rumah_singgah/shared/shared.dart';

class CityCard extends StatelessWidget {
  final int? id;
  final String? name;
  final String? imageUrl;
  final bool isPopular;

  const CityCard({
    Key? key,
    this.id,
    this.name,
    this.imageUrl,
    this.isPopular = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 150,
        width: 120,
        color: semiGreyColor,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  imageUrl ?? '',
                  width: 120,
                  height: 102,
                  fit: BoxFit.cover,
                ),
                isPopular == true
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 50,
                          height: 30,
                          padding: EdgeInsets.only(right: 10, bottom: 2),
                          alignment: Alignment.centerRight,
                          decoration: BoxDecoration(
                              color: purpleColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30))),
                          child: Image.asset(
                            AssetsIcon.iconStar,
                            width: 22,
                            height: 22,
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            SizedBox(height: 11),
            Text(name ?? '', style: blackTextStyle.copyWith(fontSize: 16))
          ],
        ),
      ),
    );
  }
}
