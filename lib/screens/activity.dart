import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/circle2.dart';

class Activity extends StatelessWidget {
  const Activity({Key? key}) : super(key: key);

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
              child: CircleWithWaves2(
                size: 600,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 180),
                    child: Text(
                      "Choose type of activity",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  // Agrega los textos aquí
                  SizedBox(
                    height: 20,
                  ),
                  IconList(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: PlayButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class IconList extends StatefulWidget {
  @override
  _IconListState createState() => _IconListState();
}

class _IconListState extends State<IconList> {
  // Lista para mantener el estado de selección de los íconos.
  List<bool> isIconSelectedList = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: 40), // Ajusta el valor para subir o bajar los cuadros
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconItem(Icons.run_circle_outlined, isIconSelectedList[0],
              () => selectIcon(0)),
          IconItem(Icons.follow_the_signs_outlined, isIconSelectedList[1],
              () => selectIcon(1)),
          IconItem(
              Icons.motorcycle, isIconSelectedList[2], () => selectIcon(2)),
          IconItem(Icons.accessibility_new_rounded, isIconSelectedList[3],
              () => selectIcon(3)),
        ],
      ),
    );
  }

  // Función para cambiar el estado de selección del ícono y deseleccionar los demás.
  void selectIcon(int index) {
    for (int i = 0; i < isIconSelectedList.length; i++) {
      if (i == index) {
        isIconSelectedList[i] = true;
      } else {
        isIconSelectedList[i] = false;
      }
    }
    setState(() {});
  }
}

class IconItem extends StatelessWidget {
  final IconData iconData;
  final bool isIconSelected;
  final Function onTap;

  IconItem(this.iconData, this.isIconSelected, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 90,
        height: 170, // Aumentamos la altura para acomodar el texto
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isIconSelected
              ? const Color.fromARGB(235, 225, 114, 23)
              : Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 45,
              color: isIconSelected
                  ? Colors.white
                  : const Color.fromARGB(255, 221, 212, 212),
            ),
            Text(
              getIconText(iconData), // Obtén el texto del icono
              style: TextStyle(
                fontSize: 12,
                color: isIconSelected
                    ? Colors.white
                    : Color.fromARGB(255, 161, 155, 155),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Función para obtener el texto del icono
  String getIconText(IconData icon) {
    if (icon == Icons.run_circle_outlined) {
      return "Outdoor running";
    } else if (icon == Icons.follow_the_signs_outlined) {
      return "Treadmill";
    } else if (icon == Icons.motorcycle) {
      return "Outdoor cycling";
    } else if (icon == Icons.accessibility_new_rounded) {
      return "Walking";
    } else {
      return "Unknown";
    }
  }
}

class PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      margin: EdgeInsets.only(bottom: 120),
      decoration: BoxDecoration(
        color: Colors.orange[800],
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          Icons.play_arrow,
          size: 80,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget biuld(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      margin: EdgeInsets.only(bottom: 150),
    );
  }
}
