import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nirvana/src/provider/themeProvider.dart';
import 'package:nirvana/src/res/colors.dart';
import 'package:nirvana/src/views/homePage.dart';
import 'package:nirvana/src/views/musicPlayer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/musicCoverWidget.dart';
import '../res/assetsImages.dart';

class SongListScreen extends StatefulWidget {
  const SongListScreen({super.key});

  @override
  State<SongListScreen> createState() => _SongListScreenState();
}

class _SongListScreenState extends State<SongListScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late bool _darkMode;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    _darkMode = themeProvider.getDarkMode;
    return Scaffold(
      backgroundColor: lightPrimaryColor,
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: _darkMode ? darkPrimaryColor : lightPrimaryColor,
        title: Text(
          'Meditate',
          style: GoogleFonts.lato(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: lightTextColor,
            decoration: TextDecoration.none,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
              size: 25.sp, color: _darkMode ? darkTextColor : lightTextColor),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
                (route) => false);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 30.h,
            width: double.infinity,
            color: _darkMode ? darkPrimaryColor : lightPrimaryColor,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: TabBar(
                physics: const NeverScrollableScrollPhysics(),
                labelPadding:
                    EdgeInsets.only(left: 10.w, right: 10.w, bottom: 0),
                padding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: EdgeInsets.zero,
                isScrollable: true,
                controller: _tabController,
                indicatorColor: const Color(0xffBB86FC),
                labelColor: const Color(0xffBB86FC),
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    child: SizedBox(
                      width: 50.w,
                      child: const Text(
                        'Explore',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          //color: Color(0xffBB86FC),
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: SizedBox(
                      width: 50.w,
                      child: const Text(
                        'Recent',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          //color: Colors.grey,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                tab1(),
                Center(child: Text('hello')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget tab1() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Music').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            itemCount: snapshot.data!.docs.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MusicScreen('Calm your mind',
                            snapshot.data!.docs[index]['song']))),
                child: MusicCoverWidget(
                  image: NetworkImage(
                    snapshot.data!.docs[index]['image'],
                  ),
                  text: 'Calm your mind',
                  height: 160.h,
                  width: 160.h,
                ),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
      //
    );
  }

  Widget tab2() {
    return Container(
      color: Colors.blue,
    );
  }
}
