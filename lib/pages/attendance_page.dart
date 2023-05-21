import 'package:absensi_app/common/constant.dart';
import 'package:flutter/material.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220.0,
            toolbarHeight: 100.0,
            floating: true,
            pinned: true,
            snap: true,
            elevation: 0,
            // backgroundColor: kWhite,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'Attendance',
                style: fontStyle1,
              ),
              background: Image.network(
                'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate.fixed(_buildList(20))),
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