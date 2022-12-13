import 'package:flutter/material.dart';
import './popup_menu_button_demo.dart';

class MaterialComponents extends StatelessWidget {
  const MaterialComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaterialComponents'),
        elevation: 0.0,
      ),
      body: ListView(
        children: const [
          ListItem(title: 'PopupMenuButton', page: PopupMenuButtonDemo()),
          ListItem(title: 'Button', page: ButtonDemo()),
          ListItem(
              title: 'FloatingActionButton', page: FloatingActionButtonDemo()),
        ],
      ),
    );
  }
}

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget FlatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => {},
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.grey),
          ),
          child: const Text('Button', style: TextStyle(color: Colors.blue)),
        ),
        TextButton.icon(
          icon: const Icon(Icons.add),
          onPressed: () => {},
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.grey),
          ),
          label: const Text('Button', style: TextStyle(color: Colors.blue)),
        ),
      ],
    );

    final Widget FixedWidthButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 130,
            child: OutlinedButton(
              onPressed: () => {},
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
                side: MaterialStateProperty.all(
                  const BorderSide(color: Colors.grey),
                ),
              ),
              child: const Text('Button'),
            ))
      ],
    );

    final Widget ExpandedButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: OutlinedButton(
          onPressed: () => {},
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.black),
            side: MaterialStateProperty.all(
              const BorderSide(color: Colors.grey),
            ),
          ),
          child: const Text('Button'),
        )),
        const SizedBox(width: 16),
        Expanded(
            flex: 2,
            child: OutlinedButton(
              onPressed: () => {},
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
                side: MaterialStateProperty.all(
                  const BorderSide(color: Colors.grey),
                ),
              ),
              child: const Text('Button'),
            ))
      ],
    );

    final Widget ButtonBarDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonBar(
          children: [
            OutlinedButton(
              onPressed: () => {},
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
                side: MaterialStateProperty.all(
                  const BorderSide(color: Colors.grey),
                ),
              ),
              child: const Text('Button'),
            ),
            OutlinedButton(
              onPressed: () => {},
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
                side: MaterialStateProperty.all(
                  const BorderSide(color: Colors.grey),
                ),
              ),
              child: const Text('Button'),
            ),
          ],
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('ButtonDemo'),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButtonDemo,
            FixedWidthButton,
            ExpandedButton,
            ButtonBarDemo,
          ],
        ),
      ),
    );
  }
}

class _WidgetDemo extends StatelessWidget {
  const _WidgetDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('_WidgetDemo'),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [],
            ),
          ],
        ),
      ),
    );
  }
}

class FloatingActionButtonDemo extends StatelessWidget {
  const FloatingActionButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget floatingActionButton = FloatingActionButton(
      onPressed: () {},
      elevation: 0,
      backgroundColor: Colors.black87,
      foregroundColor: Colors.white,
      child: const Icon(Icons.add),
      /* shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))), */
    );


    return Scaffold(
      appBar: AppBar(
        title: const Text('FloatingActionButtonDemo'),
        elevation: 0,
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 80,
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  const ListItem({
    super.key,
    required this.title,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => page));
        });
  }
}
