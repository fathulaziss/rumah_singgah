import 'package:flutter/material.dart';
import 'package:rumah_singgah/shared/shared.dart';

class BottomNavbarItem extends StatelessWidget {
  final String? imageUrl;
  final bool? isActive;

  const BottomNavbarItem({
    this.imageUrl,
    this.isActive,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          imageUrl ?? '',
          width: 26,
        ),
        Spacer(),
        isActive == true
            ? Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                  color: purpleColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(1000)),
                ),
              )
            : Container(),
      ],
    );
  }
}
