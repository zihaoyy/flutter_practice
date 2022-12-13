import 'package:flutter/material.dart';

class PopupMenuButtonDemo extends StatefulWidget {
  const PopupMenuButtonDemo({super.key});

  @override
  _PopupMenuButtonDemoState createState() => _PopupMenuButtonDemoState();
}

class _PopupMenuButtonDemoState extends State<PopupMenuButtonDemo> {
  String _currentMenuItem = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PopupMenuButton'),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_currentMenuItem),
            PopupMenuButton(
              onSelected: (value) {
                debugPrint(value);
                setState(() {
                  _currentMenuItem = value;
                });
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem(value: 'Home', child: Text('Home')),
                const PopupMenuItem(value: 'Discover', child: Text('Discover')),
                const PopupMenuItem(
                    value: 'Community', child: Text('Community')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
