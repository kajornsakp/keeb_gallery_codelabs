import 'package:flutter/material.dart';
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
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStaggeredList() {
    return SliverWaterfallFlow(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {},
          childCount: 0),
      gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
      ),
    );
  }
}
