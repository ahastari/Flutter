import 'package:flutter/material.dart';

class CircleWithWaves3 extends StatelessWidget {
  final Key? key;
  final double size;

  CircleWithWaves3({this.key, required this.size})
      : assert(size != null && size > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            // Círculo blanco de fondo
            ClipRect(
              child: Container(
                width: size * 50,
                height: size * 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 20)],
                ),
                transform: Matrix4.translationValues(0.0, -size * 2.0,
                    0.0), // Ajusta el desplazamiento hacia arriba
              ),
            ),
            // Círculo negro con ondas naranjas
            ClipRect(
              child: Center(
                child: Container(
                  width: size * 2, // Tamaño del círculo negro
                  height: size * 2,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 38, 37, 37),
                    shape: BoxShape.circle,
                  ),
                  child: CustomPaint(
                    size: Size(size * 2, size * 2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
