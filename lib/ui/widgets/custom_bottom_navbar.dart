import 'package:flutter/material.dart';
import 'package:rumah_singgah/shared/shared.dart';
import 'package:rumah_singgah/ui/widgets/bottom_navbar_item.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int? selectedIndex;
  final Function(int index)? onTap;

  const CustomBottomNavbar({
    this.selectedIndex,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            InkWell(
              onTap: () {
                if (onTap != null) {
                  onTap!(0);
                }
              },
              child: BottomNavbarItem(
                imageUrl: (selectedIndex == 0)
                    ? AssetsIcon.iconHome
                    : AssetsIcon.iconHomeInactive,
                isActive: (selectedIndex == 0) ? true : false,
              ),
            ),
            InkWell(
              onTap: () {
                if (onTap != null) {
                  onTap!(1);
                }
              },
              child: BottomNavbarItem(
                imageUrl: (selectedIndex == 1)
                    ? AssetsIcon.iconMessage
                    : AssetsIcon.iconMessageInactive,
                isActive: (selectedIndex == 1) ? true : false,
              ),
            ),
            InkWell(
              onTap: () {
                if (onTap != null) {
                  onTap!(2);
                }
              },
              child: BottomNavbarItem(
                imageUrl: (selectedIndex == 2)
                    ? AssetsIcon.iconCard
                    : AssetsIcon.iconCardInactive,
                isActive: (selectedIndex == 2) ? true : false,
              ),
            ),
            InkWell(
              onTap: () {
                if (onTap != null) {
                  onTap!(3);
                }
              },
              child: BottomNavbarItem(
                imageUrl: (selectedIndex == 3)
                    ? AssetsIcon.iconFavorite
                    : AssetsIcon.iconFavoriteInactive,
                isActive: (selectedIndex == 3) ? true : false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
