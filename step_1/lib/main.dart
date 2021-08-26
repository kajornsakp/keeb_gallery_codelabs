import 'package:flutter/material.dart';
import 'package:keeb_gallery/models.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GalleryItemModel> models = [];

  @override
  void initState() {
    models = fetchGalleryItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDBAC9A),
      drawer: Drawer(
        child: Container(),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: CustomScrollView(
            physics: ClampingScrollPhysics(),
            slivers: [
              SliverAppBar(
                  elevation: 0,
                  backgroundColor: Color(0xffDBAC9A),
                  leading: Builder(
                    builder: (context) => IconButton(
                      icon: Image.asset(
                        'assets/icon/menu.png',
                        height: 18,
                      ),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  )),
              buildProfileSection(),
              // _buildStaggeredList()
            ],
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter buildProfileSection() {
    return SliverToBoxAdapter(
      child: Container(
        color: Color(0xffDBAC9A),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              margin: EdgeInsets.only(top: 60),
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 60,
              backgroundImage: NetworkImage(getProfileImage()),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStaggeredList() {
    return SliverWaterfallFlow(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.all(8),
          child: Image.network(
            models[index].url,
          ),
        );
      }, childCount: models.length),
      gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
      ),
    );
  }
}
