import 'package:flutter/material.dart';

class CircleWithWaves2 extends StatelessWidget {
  final Key? key;
  final double size;

  CircleWithWaves2({this.key, required this.size})
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
                  color: const Color.fromARGB(255, 53, 39, 39),
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 20)],
                ),
                transform: Matrix4.translationValues(1.1, -size * -7,
                    5), // Ajusta el desplazamiento hacia arriba
              ),
            ),
            // Círculo negro con ondas naranjas

            Container(
              width: size * 2, // Tamaño del círculo negro
              height: size * 2,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 38, 37, 37),
                shape: BoxShape.circle,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    size: Size(size * 2, size * 2),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 100),
                    padding: EdgeInsets.only(right: 210),
                    child: Text(
                      "West Long",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 178, 176, 176),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 130),
                    padding: EdgeInsets.only(right: 210),
                    child: Text(
                      " Branch",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 178, 176, 176),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 200),
                    child: Text(
                      "12.2",
                      style: TextStyle(
                        fontSize: 80,
                        color: Colors.white,
                        fontWeight: FontWeight.bold, // Añade el estilo negrita
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 240),
                    padding: EdgeInsets.only(left: 220),
                    child: Text(
                      "km",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
