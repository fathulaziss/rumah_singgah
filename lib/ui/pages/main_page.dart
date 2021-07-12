import 'package:flutter/material.dart';
import 'package:rumah_singgah/ui/pages/favorite_page.dart';
import 'package:rumah_singgah/ui/pages/home_page.dart';
import 'package:rumah_singgah/ui/pages/message_page.dart';
import 'package:rumah_singgah/ui/pages/promo_page.dart';
import 'package:rumah_singgah/ui/widgets/custom_bottom_navbar.dart';

class MainPage extends StatefulWidget {
  final int? initialPage;

  const MainPage({
    required this.initialPage,
    Key? key,
  }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController? pageController;
  int? selectedPage;

  @override
  void initState() {
    selectedPage = widget.initialPage;
    pageController = PageController(initialPage: selectedPage ?? 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (pageIndex) {
              setState(() {
                selectedPage = pageIndex;
              });
            },
            scrollDirection: Axis.horizontal,
            physics: ScrollPhysics(),
            children: [
              HomePage(),
              MessagePage(),
              PromoPage(),
              FavoritePage(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavbar(
              selectedIndex: selectedPage,
              onTap: (pageIndex) {
                setState(() {
                  selectedPage = pageIndex;
                });
                pageController!.jumpToPage(selectedPage ?? 0);
              },
            ),
          ),
        ],
      ),
    );
  }
}
