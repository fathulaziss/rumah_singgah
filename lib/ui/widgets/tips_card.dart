import 'package:flutter/material.dart';
import 'package:rumah_singgah/shared/shared.dart';

class TipsCards extends StatelessWidget {
  final String? name;
  final String? date;
  final String? imageUrl;
  const TipsCards({
    Key? key,
    this.name,
    this.date,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          imageUrl ?? '',
          width: 80,
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name ?? '', style: blackTextStyle.copyWith(fontSize: 18)),
            SizedBox(height: 4),
            Text(date ?? '', style: greyTextStyle.copyWith(fontSize: 14))
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.chevron_right,
            color: greyColor,
          ),
        )
      ],
    );
  }
}
