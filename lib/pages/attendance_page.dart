import 'package:absensi_app/common/constant.dart';
import 'package:absensi_app/common/size_config.dart';
import 'package:flutter/material.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
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
                'Attendances',
                style: fontStyle1,
              ),
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.download),
                )
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 20.0),
              flexibleText('Your course'),
              const SizedBox(height: 10.0),
              cardCourse(),
              flexibleText('Date'),
              const SizedBox(height: 10.0),
              cardCourse(),
              const SizedBox(height: 20.0),
              flexibleText('Take your picture'),
              const SizedBox(height: 10.0),
              flexibleText('Take your location'),
            ]),
          ),
        ],
      ),
    );
  }

  Widget flexibleText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: fontStyle1.copyWith(fontSize: 20),
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
            // color: Colors.red,
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
          child: Text('Attendance ${i.toString()}', style: fontStyle1),
        ),
      );
    }
    return listItems;
  }
}
