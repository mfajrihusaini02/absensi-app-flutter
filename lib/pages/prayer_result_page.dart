import 'package:absensi_app/common/constant.dart';
import 'package:absensi_app/common/size_config.dart';
import 'package:flutter/material.dart';

class PrayerResultPage extends StatelessWidget {
  const PrayerResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Result Prayer',
          style: fontStyle1,
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tangal Hari ini',
                  style: fontStyle1,
                ),
                const SizedBox(height: 20),
                container(),
                container(),
                container(),
                container(),
                container(),
                container(),
                container(),
                container(),
                container(),
                container(),
                container(),
                container(),
                container(),
                container(),
                container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget container() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: SizeConfig.safeBlockHorizontal! * 100,
      height: 100,
      color: Colors.red,
    );
  }
}
