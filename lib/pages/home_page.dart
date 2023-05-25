import 'package:absensi_app/common/constant.dart';
import 'package:absensi_app/common/size_config.dart';
import 'package:absensi_app/pages/setting_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(child: Container(color: kWhite)),
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  headerPage(),
                  const SizedBox(height: 20),
                  carouselSlider(),
                  indicatorCarousel(),
                  const SizedBox(height: 20),
                  informationText(),
                  const SizedBox(height: 20),
                  cardInformation(),
                  cardInformation(),
                  cardInformation(),
                  cardInformation(),
                  cardInformation(),
                  cardInformation(),
                  cardInformation(),
                  cardInformation(),
                  cardInformation(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget headerPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'FAJRI',
            style: fontStyle1.copyWith(fontSize: 18),
          ),
          Material(
            color: kBlack.withOpacity(0.1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingPage()),
              ),
              child: const SizedBox(
                width: 45,
                height: 45,
                child: Icon(Icons.settings),
              ),
            ),
          ),
        ],
      ),
    );
  }

  final List<Widget> imageSliders = imgList
      .map(
        (item) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: [Image.network(item, fit: BoxFit.cover)],
            ),
          ),
        ),
      )
      .toList();

  Widget carouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 2.0,
        scrollDirection: Axis.horizontal,
        autoPlay: true,
        onPageChanged: (index, reason) {
          setState(() => _current = index);
        },
      ),
      items: imageSliders,
    );
  }

  Widget indicatorCarousel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imgList.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => _controller.jumpToPage(entry.key),
          child: Container(
            width: _current == entry.key ? 20.0 : 8.0,
            height: 4.0,
            margin: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 4.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(72),
              color: (Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black)
                  .withOpacity(_current == entry.key ? 0.9 : 0.4),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget informationText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Informasi',
              style: fontStyle1.copyWith(fontSize: 25),
            ),
          ),
          Container(
            width: 60,
            height: 4,
            decoration: BoxDecoration(
              color: kBlack,
              borderRadius: BorderRadius.circular(10),
            ),
          )
        ],
      ),
    );
  }

  Widget cardInformation() {
    return Container(
      margin: const EdgeInsets.only(right: 30.0, left: 30.0, bottom: 15.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      width: SizeConfig.safeBlockHorizontal! * 100.0,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        boxShadow: [
          BoxShadow(
            color: kBlack.withOpacity(0.1),
            offset: const Offset(5.0, 5.0),
            blurRadius: 4.0,
          ),
        ],
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            size: SizeConfig.safeBlockHorizontal! * 10.0,
          ),
          SizedBox(width: SizeConfig.safeBlockHorizontal! * 3.0),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal! * 65.0,
            // color: Colors.red,
            child: RichText(
              text: TextSpan(
                text:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nec faucibus libero. Donec dapibus in arcu nec fermentum. Sed id est arcu.',
                style: fontStyle1.copyWith(color: kBlack),
                // children: [
                //   TextSpan(
                //     text: ' Sign up Sign up Sign up',
                //     style: blackFontStyle1.copyWith(color: kGreen),
                //   ),
                // ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
