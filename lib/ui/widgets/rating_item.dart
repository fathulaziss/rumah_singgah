import 'package:flutter/material.dart';
import 'package:rumah_singgah/shared/shared.dart';

class RatingItem extends StatelessWidget {
  final int? index;
  final int? rating;

  const RatingItem({
    Key? key,
    this.index,
    this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      (index ?? 0) <= (rating ?? 0)
          ? AssetsIcon.iconStar
          : AssetsIcon.iconStarGrey,
      width: 20,
    );
  }
}
