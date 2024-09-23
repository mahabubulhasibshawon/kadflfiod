import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/core/configs/assets/app_images.dart';

import '../../../common/widgets/appbar/app_bar.dart';
import '../../../core/configs/assets/app_vectors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_homeTopCard()],
        ),
      ),
    );
  }
}

Widget _homeTopCard() {
  return SizedBox(
    height: 140,
    child: Stack(
      children: [
        Align(alignment: Alignment.bottomCenter, child: SvgPicture.asset(AppVectors.homeTopCard)),
        Align(alignment: Alignment.bottomRight, child: Padding(
          padding: const EdgeInsets.only(right: 60.0),
          child: Image.asset(AppImages.homeArtist),
        ))
      ],
    ),
  );
}

Widget _tabs() {
  return TabBar(tabs: [
    Text('News'),
    Text('Vedios'),
    Text('Artists'),
    Text('Podcasts'),
  ],);
}
