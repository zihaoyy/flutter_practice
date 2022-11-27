import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 200.0,
            maxWidth: 200.0,
          ),
          child: Container(
            color: const Color.fromRGBO(3, 54, 255, 1.0),
          ),
        )
      ],
    );
  }
}

class AspectRatioDemo extends StatelessWidget {
  const AspectRatioDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(color: const Color.fromRGBO(3, 54, 255, 1.0)),
        )
      ],
    );
  }
}

class StackDemo extends StatelessWidget {
  const StackDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /* IconBadge(Icons.pool),
        IconBadge(Icons.beach_access, size: 64.0),
        IconBadge(Icons.airplanemode_active), */
        Stack(
          alignment: Alignment.topLeft,
          children: [
            SizedBox(
              width: 200.0,
              height: 300.0,
              child: Container(
                alignment: const Alignment(0.0, -0.9),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(3, 54, 255, 1.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 32.0),
            SizedBox(
              width: 100.0,
              height: 100.0,
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(3, 54, 255, 1.0),
                    // borderRadius: BorderRadius.circular(8.0),
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        Color.fromRGBO(7, 102, 255, 1.0),
                        Color.fromRGBO(3, 54, 255, 1.0),
                      ],
                    )),
                child:
                    const Icon(Icons.brightness_2, color: Colors.white, size: 32.0),
              ),
            ),
            const Positioned(
              right: 20.0,
              top: 20.0,
              child: Icon(Icons.ac_unit, color: Colors.white, size: 32.0),
            ),
          ],
        )
      ],
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;

  const IconBadge(this.icon, {super.key, this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size + 60,
      height: size + 60,
      color: const Color.fromRGBO(3, 54, 255, 1.0),
      child: Icon(icon, size: size, color: Colors.white),
    );
  }
}
