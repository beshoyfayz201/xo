import 'package:flutter/material.dart';

import '../logic/player.dart';

class ResultBoard extends StatelessWidget {
  String player;
  String Activeplayer;
  ResultBoard({Key? key, required this.player, required this.Activeplayer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            player,
            style: TextStyle(
                color: Color.fromARGB(255, 10, 250, 226),
                fontFamily: "ru",
                decorationThickness: 0.1,
                fontSize: 150,
                shadows: [
                  Shadow(
                      color: Activeplayer == player
                          ? Colors.cyan.shade50
                          : Colors.cyan.shade900,
                      blurRadius: 50)
                ]),
          ),
        ),
      ],
    );
  }
}
