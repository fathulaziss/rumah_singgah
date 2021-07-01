import 'package:flutter/material.dart';
import 'package:rumah_singgah/shared/shared.dart';

class FacilitiesItem extends StatelessWidget {
  final String? facilitiesName;
  final String? icon;
  final int? total;

  const FacilitiesItem({
    this.facilitiesName,
    this.icon,
    this.total,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(icon ?? '', width: 32),
        SizedBox(height: 8),
        Text.rich(
          TextSpan(
              text: '${total ?? 0}',
              style: purpleTextStyle.copyWith(fontSize: 14),
              children: [
                TextSpan(
                    text: ' ${facilitiesName ?? ''}',
                    style: greyTextStyle.copyWith(fontSize: 14)),
              ]),
        )
      ],
    );
  }
}
