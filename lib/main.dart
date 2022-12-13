import 'dart:io';

import 'package:demo/demo/form_demo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import './demo/listview_demo.dart';
import './demo/bottom_navigation_bar_demo.dart';
import './demo/basic_demo.dart';
import './demo/layout_demo.dart';
// import './demo/view_demo.dart';
import './demo/sliver_demo.dart';
import './demo/navigator_demo.dart';
// import './demo/form_demo.dart';
import './demo/material_components.dart';

void main() {
  if (Platform.isAndroid) {
    // 设置android状态栏为透明的沉浸，在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //状态栏的颜色根据需要更改
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: NavigatorDemo(),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/about': (context) => const NavigatePage(title: 'About'),
        '/form': (context) => const FormDemo(),
        '/mdc': (context) => const MaterialComponents(),
      },
      theme: ThemeData(
          // brightness: Brightness.dark,
          // primarySwatch: Colors.yellow,
          highlightColor: const Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Colors.white70),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('“摸鱼kik”想给您发送通知'),
        content: const Text('“通知”可能包括提醒、声音和图标标记。这些可在“设置”中配置。'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: false,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('不允许'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: false,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('允许'),
          ),
        ],
      ),
    );
  }

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('标题'),
        message: const Text('消息内容'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            /// This parameter indicates the action would be a default
            /// defualt behavior, turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('默认'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('启用'),
          ),
          CupertinoActionSheetAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as delete or exit and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('取消'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            // leading: IconButton(
            //   icon: Icon(Icons.menu),
            //   tooltip: 'Navigation',
            //   onPressed: () => debugPrint('Navigation button is pressed.'),
            // ),
            centerTitle: true,
            title: const Text('Test Title'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.search),
                tooltip: 'Search',
                onPressed: () => _showAlertDialog(context),
              )
            ],
            // systemOverlayStyle:
            //     SystemUiOverlayStyle(statusBarColor: Colors.transparent),
            // SystemUiOverlayStyle.dark,
            elevation: 0.0,
            bottom: const TabBar(
                unselectedLabelColor: Colors.black38,
                indicatorColor: Colors.black54,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 1.0,
                tabs: <Widget>[
                  Tab(icon: Icon(Icons.local_florist)),
                  Tab(icon: Icon(Icons.change_history)),
                  Tab(icon: Icon(Icons.directions_bike)),
                  Tab(icon: Icon(Icons.view_quilt)),
                ]),
          ),
          body: const TabBarView(
            children: [
              // Icon(Icons.local_florist, size: 128.0, color: Colors.black12),
              ListViewDemo(),
              // Icon(Icons.change_history, size: 128.0, color: Colors.black12),
              BasicDemo(),
              // Icon(Icons.directions_bike, size: 128.0, color: Colors.black12),
              LayoutDemo(),
              // ViewDemo(),
              SliverDemo(),
            ],
          ),
          drawer: Drawer(
              child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: const Text('Zihao',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                accountEmail: const Text('somebody@domain.com',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://avatars2.githubusercontent.com/u/29659965?s=460&v=4'),
                ),
                decoration: BoxDecoration(
                    color: Colors.yellow[400],
                    image: DecorationImage(
                        image: const NetworkImage(
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
                title: const Text(
                  'Messages',
                  textAlign: TextAlign.right,
                ),
                trailing: const Icon(Icons.message,
                    color: Colors.black12, size: 22.0),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: const Text(
                  'Favorite',
                  textAlign: TextAlign.right,
                ),
                trailing: const Icon(Icons.favorite,
                    color: Colors.black12, size: 22.0),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: const Text(
                  'Settings',
                  textAlign: TextAlign.right,
                ),
                trailing: const Icon(Icons.settings,
                    color: Colors.black12, size: 22.0),
                onTap: () => _showActionSheet(context),
              ),
            ],
          )),
          bottomNavigationBar: const BottomNavigationBarDemo(),
        ));
  }
}
