import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/circle3.dart';

class Friends extends StatelessWidget {
  const Friends({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromARGB(255, 205, 203, 203),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(0.3, -5), // Alinear el círculo más arriba
              child: CircleWithWaves3(
                size: 600,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 1.8 -
                  3, // Alinear en la parte media vertical
              left: 10,
              child: Row(
                children: <Widget>[
                  buildCardWithCircleIcon("Tarjeta 1"),
                  SizedBox(width: 2), // Espacio entre las tarjetas
                  buildCardWithCircleIcon("Tarjeta 2"),
                  buildCardWithCircleIcon("Tarjeta 3"),
                  // Agregar más tarjetas según sea necesario
                ],
              ),
            ),
            // Nuevo "target" en la parte inferior
            Positioned(
              bottom: 0, // Alinear en la parte inferior
              left: 30,
              child: Container(
                width: 350, // Ajusta el ancho según tus necesidades
                height: 150, // Ajusta la altura según tus necesidades
                color: Color.fromARGB(255, 239, 236,
                    234), // Cambia el color según tus necesidades
                child: Center(
                  child: Text("Target"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCardWithCircleIcon(String cardText) {
    return Card(
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 7, // Ajusta la posición vertical del icono
            left: 7, // Ajusta la posición horizontal del icono
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(235, 8, 145, 235), // Color del círculo
              ),
              child: Icon(
                Icons.circle, // Cambia el icono según tus necesidades
                color: Colors.white, // Color del icono
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(40),
            child: Text(cardText),
          ),
        ],
      ),
    );
  }
}
