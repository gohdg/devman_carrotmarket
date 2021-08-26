import 'package:carrotmarket_clone/page/home.dart';
import 'package:carrotmarket_clone/page/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int? _currentIndex;

  BottomNavigationBarItem _bottomNavigationBarItem(
      String iconName, String label) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SvgPicture.asset(
          'assets/svg/${iconName}_off.svg',
          width: 20,
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SvgPicture.asset(
          'assets/svg/${iconName}_on.svg',
          width: 20,
        ),
      ),
      label: label,
    );
  }

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  Widget _bodyWidget() {
    print(_currentIndex);

    switch (_currentIndex) {
      case 0: // Home page
        return Home();
      case 1: // Note page
        return Container();
      case 2: // Location page
        return Container();
      case 3: // Chat page;
        return Container();
      case 4: // User page
        return User();
      default:
        return Container();
    }
  }

  Widget _bottomNavigationBarWidget() {
    return BottomNavigationBar(
        currentIndex: _currentIndex ?? 0,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          _bottomNavigationBarItem('home', '홈'),
          _bottomNavigationBarItem('notes', '동네생활'),
          _bottomNavigationBarItem('location', '내 근처'),
          _bottomNavigationBarItem('chat', '채팅'),
          _bottomNavigationBarItem('user', '나의 당근'),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}
