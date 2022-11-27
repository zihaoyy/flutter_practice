import 'package:flutter/material.dart';
import './post_show.dart';
import '../model/post.dart';

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({super.key});

  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
        color: Colors.white,
        margin: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    posts[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  posts[index].title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  posts[index].author,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(height: 16.0),
              ],
            ),
            Positioned.fill(
                child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.white.withOpacity(.3),
                highlightColor: Colors.white.withOpacity(.1),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => PostShow(post: posts[index])),
                  );
                },
              ),
            ))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: _listItemBuilder,
    );
  }
}
