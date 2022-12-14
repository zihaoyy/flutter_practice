import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  const BasicDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey[100],
      decoration: BoxDecoration(
          image: DecorationImage(
              image: const NetworkImage(
                  'https://pic.netbian.com/uploads/allimg/171219/191722-1513682242b52a.jpg'),
              alignment: Alignment.topCenter,
              repeat: ImageRepeat.noRepeat,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.indigoAccent[400]!.withOpacity(0.6),
                  BlendMode.hardLight))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.all(8.0),
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(3, 54, 255, 1.0),
                border: Border.all(
                  color: Colors.white70,
                  width: 3.0,
                  style: BorderStyle.solid,
                ),
                // borderRadius: BorderRadius.circular(16.0),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0.0, 16.0),
                    color: Color.fromRGBO(16, 20, 188, 1.0),
                    blurRadius: 25.0,
                    spreadRadius: -9.0,
                  )
                ],
                shape: BoxShape.circle,
                /* gradient: RadialGradient(
                  colors: [
                    Color.fromRGBO(7, 102, 255, 1.0),
                    Color.fromRGBO(3, 28, 128, 1.0),
                  ],
                )), */
                gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(7, 102, 255, 1.0),
                    Color.fromRGBO(3, 28, 128, 1.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
            child: const Icon(Icons.pool, size: 32.0, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class RichTextDemo extends StatelessWidget {
  const RichTextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        text: 'test',
        style: TextStyle(
          color: Colors.deepPurpleAccent,
          fontSize: 34.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w100,
        ),
        children: [
          TextSpan(
              text: '.com',
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.grey,
              ))
        ],
      ),
    );
  }
}

class TextDemo extends StatelessWidget {
  final TextStyle _textStyle = const TextStyle(
    fontSize: 16.0,
  );

  final String _author = '??????';
  final String _title = '?????????';

  const TextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      ' ??? $_title ??? ?????? $_author??? ??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????',
      textAlign: TextAlign.left,
      style: _textStyle,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
