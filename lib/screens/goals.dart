import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/circle.dart';

class Goals extends StatelessWidget {
  const Goals({super.key});

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
              alignment: Alignment(0.3, -7), // Alinear el círculo más arriba
              child: CircleWithWaves(
                size: 650,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2 -
                  100, // Alinear en la parte media vertical
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
                color: Color.fromARGB(235, 225, 114, 23), // Color del círculo
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
