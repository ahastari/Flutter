import 'package:flutter/material.dart';

class CircleWithWaves extends StatelessWidget {
  final Key? key;
  final double size;

  CircleWithWaves({this.key, required this.size})
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
              clipper: HalfCircleClipper(),
              child: Container(
                width: size * 50,
                height: size * 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 20)],
                ),
                transform: Matrix4.translationValues(0.0, -size * 2.0, 0.0),
              ),
            ),
            // Círculo negro con ondas naranjas y texto
            Container(
              width: size * 2, // Tamaño del círculo negro
              height: size * 2,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 38, 37, 37),
                shape: BoxShape.circle,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    size: Size(size * 2, size * 2),
                    painter: CloudPainter(), // Agregar el pintor para las nubes
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 120),
                    child: Text(
                      "7235",
                      style: TextStyle(
                        letterSpacing: 0.2,
                        fontSize: 70,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 150),
                    padding: EdgeInsets.only(left: 210),
                    child: Text(
                      "steps",
                      style: TextStyle(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 136, 134, 134),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 200),
                    padding: EdgeInsets.only(right: 120),
                    child: Text(
                      "2.3",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 210),
                    padding: EdgeInsets.only(right: 70),
                    child: Text(
                      "km",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 200),
                    padding: EdgeInsets.only(left: 60),
                    child: Text(
                      "87",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 210),
                    padding: EdgeInsets.only(left: 110),
                    child: Text(
                      "ccal",
                      style: TextStyle(
                        fontSize: 12,
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

class HalfCircleClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, size.height / 2, size.width, size.height / 2);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}

class CloudPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(235, 225, 114, 23) // Color naranja
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 4,
          size.height * 0.8) // Comienza desde el centro izquierdo
      ..quadraticBezierTo(
        size.width / 2,
        size.height * 0.5,
        size.width * 0.75,
        size.height * 0.8,
      ) // Curva hacia el centro derecho
      ..quadraticBezierTo(
        size.width / 2,
        size.height * 0.4,
        size.width / 4,
        size.height * 0.8,
      ) // Curva hacia el centro izquierdo
      ..close(); // Cierra el camino

    canvas.drawPath(path, paint); // Dibuja el camino (nubes)
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: CircleWithWaves(size: 200),
    ),
  ));
}
