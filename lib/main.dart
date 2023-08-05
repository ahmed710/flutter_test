import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Futura',
        primarySwatch: Colors.teal,
      ),
      home: DefaultTabController(
        length: 2,
        child: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final TextEditingController _searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Center(
        child: TabBarView(
          children: [
            _tabBarViewItem(Icons.menu),
            _tabBarViewItem(Icons.notifications),
          ],
        ),
      ),
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(200),
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: _boxDecoration(),
        child: SafeArea(
          child: Column(
            children: [
              _topBar(),
              const SizedBox(height: 15),
              _tabBar(),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(25),
      ),
      color: Color(0xFF00082B),
    );
  }

  Widget _topBar() {
    return Row(
      children: [
        const Expanded(
          child:
          Text(
            'Bonjour, Nom Prénom',
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
         Padding(
           padding: const EdgeInsets.only(right: 8.0),
           child: SvgPicture.asset(
            'assets/icons/logo_aibs.svg',
            width:20 ,
            height: 20,
        ),
         ),
      ],
    );
  }


  Widget _tabBar() {
    return TabBar(
      labelPadding: const EdgeInsets.all(0),
      labelColor: Colors.white,
      indicatorColor: Colors.white,
      unselectedLabelColor: Colors.white,
      tabs: const [
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.menu),
        ),
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.notifications),
        ),

      ],
    );
  }

  Widget _tabBarViewItem(IconData icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 220,
        ),
      ],
    );
  }
}