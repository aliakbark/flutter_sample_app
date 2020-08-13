import 'package:flutter_sample_app/src/managers/object_factory.dart';
import 'package:flutter_sample_app/src/ui/screens/home/dashboard.dart';
import 'package:flutter_sample_app/src/utilities/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  PageController _pageController;

  final GlobalKey<ScaffoldState> _homeScaffoldKey =
      new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _homeScaffoldKey,
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            DashboardScreen(),
            PlaceHolderScreen(
              title: 'Home2',
            ),
            PlaceHolderScreen(
              title: 'Home3',
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        showSelectedLabels: true,
        selectedFontSize: 16.0,
        unselectedFontSize: 14.0,
        selectedLabelStyle: Theme.of(context).textTheme.subtitle1,
        unselectedLabelStyle: Theme.of(context).textTheme.bodyText2,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black45,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text('Dashboard'),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.work,
              ),
              title: Text(
                'Home2',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              title: Text(
                'Home3',
              )),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() => _currentIndex = index);
    _pageController.jumpToPage(index);
  }
}

class PlaceHolderScreen extends StatelessWidget {
  final String title;

  PlaceHolderScreen({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(this.title),
      ),
    );
  }
}
