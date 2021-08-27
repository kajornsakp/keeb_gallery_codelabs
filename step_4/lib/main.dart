import 'package:flutter/material.dart';
import 'package:keeb_gallery/GalleryImage.dart';
import 'package:keeb_gallery/ModeButton.dart';
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
  List<GalleryItemModel> savedItems = [];
  DisplayMode displayMode = DisplayMode.gallery;

  @override
  void initState() {
    models = fetchGalleryItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      drawer: Drawer(
        child: Container(),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            buildProfileSection(),
            buildDescriptionSection(),
            SliverVisibility(
              maintainAnimation: true,
              maintainSize: true,
              maintainState: true,
              visible: displayMode == DisplayMode.gallery,
              sliver: _buildStaggeredList(),
            ),
            SliverVisibility(
              maintainAnimation: true,
              maintainSize: true,
              maintainState: true,
              visible: displayMode == DisplayMode.saved,
              sliver: _buildSavedItemList(),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
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
      ),
      elevation: 0,
      backgroundColor: Color(0xffDBAC9A),
      iconTheme: IconThemeData(color: Colors.black),
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
              child: Image.network(getProfileImage()),
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter buildDescriptionSection() {
    return SliverToBoxAdapter(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Text(
              "Kajornsak",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Image.asset(
              'assets/icon/setting.png',
              height: 16,
            ),
            SizedBox(
              height: 12,
            ),
            Text("Hi, Everyone. I'm a keebs lover"),
            Text("let's find something yours!"),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ModeButton(
                  title: "Gallery",
                  isSelected: displayMode == DisplayMode.gallery,
                  onPressed: _selectGalleryMode,
                ),
                ModeButton(
                  title: "Saved",
                  isSelected: displayMode == DisplayMode.saved,
                  onPressed: _selectSavedMode,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _selectGalleryMode() {
    setState(() {
      displayMode = DisplayMode.gallery;
    });
  }

  void _selectSavedMode() {
    setState(() {
      displayMode = DisplayMode.saved;
    });
  }

  Widget _buildStaggeredList() {
    return SliverPadding(
      padding: EdgeInsets.all(16),
      sliver: SliverWaterfallFlow(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          var model = models[index];
          return GalleryImage(model: model);
        }, childCount: models.length),
        gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
        ),
      ),
    );
  }

  Widget _buildSavedItemList() {
    return SliverPadding(
      padding: EdgeInsets.all(16),
      sliver: SliverWaterfallFlow(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          var model = savedItems[index];
          return GalleryImage(model: model);
        }, childCount: savedItems.length),
        gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
        ),
      ),
    );
  }
}
