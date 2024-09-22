import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helpers/isdark.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/vectors/app_vector.dart';
import '../../../../core/widgets/appbar.dart';
import 'widgets/playlist.dart';
import 'widgets/song_card.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        hideBack: true,
        title: SvgPicture.asset(
          AppVector.logo,
          height: 50,
          width: 50,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_homeTopCard(), _tabs(),SizedBox(
            height: 260,
            child: TabBarView(controller: _tabController,children: [
             const SongCard(),
              Container(),
              Container(),
              Container(),
            ],),
          ),
          SizedBox(height: 40,),
          Playlist(),
          ],
        ),
      ),
    );
  }

  Widget _homeTopCard() {
    return Center(
      child: SizedBox(
        height: 140,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(AppVector.homeTopCard),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 70,
                ),
                child: Image.asset(AppVector.top_artist),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
        controller: _tabController,
        isScrollable: true,
        dividerHeight: 0,
        indicatorColor: AppColors.primary,
        labelColor: context.isDarkMode ? Colors.white : Colors.black,
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        tabs: [
          Text("News",style: TextStyle(fontWeight: FontWeight.w500,
          fontSize: 16,
          ),),
          Text("Videos",style: TextStyle(fontWeight: FontWeight.w500,
          fontSize: 16,
          ),),
          Text("Artists",style: TextStyle(fontWeight: FontWeight.w500,
          fontSize: 16,
          ),),
          Text("Products",style: TextStyle(fontWeight: FontWeight.w500,
          fontSize: 16,
          ),),
        ]);
  }
}
