import 'package:absensi_app/common/constant.dart';
import 'package:absensi_app/common/size_config.dart';
import 'package:absensi_app/pages/prayer_result_page.dart';
import 'package:flutter/material.dart';

class PrayerPage extends StatefulWidget {
  const PrayerPage({super.key});

  @override
  State<PrayerPage> createState() => _PrayerPageState();
}

class _PrayerPageState extends State<PrayerPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150.0,
            toolbarHeight: 100.0,
            floating: true,
            pinned: true,
            snap: true,
            elevation: 0,
            flexibleSpace: AppBar(
              title: Text(
                'Prayer',
                style: fontStyle1,
              ),
              elevation: 0,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 20.0),
              flexibleText(padding: 30, margin: 0, text: 'Date'),
              const SizedBox(height: 10.0),
              cardCourse(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PrayerResultPage(),
                            ),
                          );
                        },
                        highlightColor: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                          child: flexibleText(text: 'Next', color: kWhite),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget flexibleText({double padding = 0, double margin = 0, String? text, Color? color}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding),
      margin: EdgeInsets.symmetric(horizontal: margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              text!,
              style: fontStyle1.copyWith(fontSize: 20, color: color),
            ),
          ),
        ],
      ),
    );
  }

  Widget cardCourse() {
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
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nec faucibus libero. Donec dapibus in arcu nec fermentum. Sed id est arcu.',
              style: fontStyle1.copyWith(color: kBlack),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildList(int count) {
    List<Widget> listItems = [];

    for (int i = 1; i <= count; i++) {
      listItems.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: Text('Prayer ${i.toString()}', style: fontStyle1),
        ),
      );
    }
    return listItems;
  }
}
