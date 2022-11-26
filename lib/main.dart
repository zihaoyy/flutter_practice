import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './demo/listview_demo.dart';
import './demo/bottom_navigation_bar_demo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white70,
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            // leading: IconButton(
            //   icon: Icon(Icons.menu),
            //   tooltip: 'Navigation',
            //   onPressed: () => debugPrint('Navigation button is pressed.'),
            // ),
            centerTitle: true,
            title: Text('测试'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                tooltip: 'Search',
                onPressed: () => debugPrint('Search button is pressed.'),
              )
            ],
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: Colors.transparent),
            // SystemUiOverlayStyle.dark,
            elevation: 0.0,
            bottom: TabBar(
                unselectedLabelColor: Colors.black38,
                indicatorColor: Colors.black54,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 1.0,
                tabs: <Widget>[
                  Tab(icon: Icon(Icons.local_florist)),
                  Tab(icon: Icon(Icons.change_history)),
                  Tab(icon: Icon(Icons.directions_bike)),
                ]),
          ),
          body: TabBarView(
            children: [
              ListViewDemo(),
              Icon(Icons.change_history, size: 128.0, color: Colors.black12),
              Icon(Icons.directions_bike, size: 128.0, color: Colors.black12),
            ],
          ),
          drawer: Drawer(
              child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('Zihao',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                accountEmail: Text('somebody@domain.com',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://avatars2.githubusercontent.com/u/29659965?s=460&v=4'),
                ),
                decoration: BoxDecoration(
                    color: Colors.yellow[400],
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://pic.netbian.com/uploads/allimg/200616/111937-1592277577d445.jpg'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.yellow[400]!.withOpacity(0.6),
                            BlendMode.hardLight))),
              ),
              /* DrawerHeader(
                  child: Text('header'.toUpperCase()),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                  ),
                ), */
              ListTile(
                title: Text(
                  'Messages',
                  textAlign: TextAlign.right,
                ),
                trailing:
                    Icon(Icons.message, color: Colors.black12, size: 22.0),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: Text(
                  'Favorite',
                  textAlign: TextAlign.right,
                ),
                trailing:
                    Icon(Icons.favorite, color: Colors.black12, size: 22.0),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: Text(
                  'Settings',
                  textAlign: TextAlign.right,
                ),
                trailing:
                    Icon(Icons.settings, color: Colors.black12, size: 22.0),
                onTap: () => Navigator.pop(context),
              ),
            ],
          )),
          bottomNavigationBar: BottomNavigationBarDemo(),
        ));
  }
}
