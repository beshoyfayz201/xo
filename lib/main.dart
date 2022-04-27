import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xo_mod/logic/game.dart';
import 'package:xo_mod/logic/player.dart';
import 'package:xo_mod/widgets/resultboard.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blue,
      ),
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool gameOver = false;
  int turn = 0;
  String activePlayer = "X";
  bool gameMode = false;
  @override
  Widget build(BuildContext context) {
    if (game.winner == "x") {
      Player.xScore++;
      game.winner = " ";
      gameOver = true;
    } else if (game.winner == "o") {
      Player.oScore++;
      game.winner = " ";
      gameOver = true;
    }
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/x.jpg"), fit: BoxFit.cover)),
        child: SafeArea(
          child: Column(
            children: [
              SwitchListTile.adaptive(
                  title: Text("single player mode "),
                  value: gameMode,
                  onChanged: (v) {
                    setState(() {
                      gameMode = v;
                    });
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ResultBoard(
                    player: "X",
                    Activeplayer: activePlayer,
                  ),
                  Text(
                      Player.xScore.toString() +
                          " : " +
                          Player.oScore.toString(),
                      style: TextStyle(
                          color: Color.fromARGB(255, 10, 250, 226),
                          fontFamily: "ru",
                          fontSize: 80,
                          shadows: [
                            Shadow(color: Colors.cyan.shade50, blurRadius: 2)
                          ])),
                  ResultBoard(
                    player: "O",
                    Activeplayer: activePlayer,
                  )
                ],
              ),
              (gameOver ||
                      game.winner != " " ||
                      Player.oIndex.length + Player.xIndex.length == 9)
                  ? Center(
                      child: ResultBoard(
                          player:
                              " (${activePlayer = activePlayer == "X" ? "O" : "X"}_$activePlayer)\n  won",
                          Activeplayer: activePlayer),
                    )
                  : Expanded(
                      child: GridView.count(
                        crossAxisCount: 3,
                        children: List.generate(
                            9,
                            (index) => GestureDetector(
                                  onTap: gameOver
                                      ? null
                                      : () async {
                                          print(game.winner);
                                          if (!Player.oIndex.contains(index) &&
                                              !Player.xIndex.contains(index)) {
                                            print("$index------");
                                            setState(() {
                                              game().play(index, activePlayer,
                                                  gameMode);

                                              activePlayer = activePlayer == "X"
                                                  ? "O"
                                                  : "X";
                                              if (gameMode &&
                                                  !(Player.oIndex.length +
                                                          Player.xIndex.length >
                                                      8)) {
                                                game().autoPlaye(activePlayer);
                                                activePlayer =
                                                    activePlayer == "X"
                                                        ? "O"
                                                        : "X";
                                              }
                                            });
                                          }
                                        },
                                  child: Card(
                                    color: Colors.white24,
                                    child: Center(
                                      child: Text(
                                        setMark(index),
                                        style: TextStyle(
                                            color: Player.xIndex.contains(index)
                                                ? Colors.blueAccent.shade700
                                                : Colors.deepOrange,
                                            fontSize: 45,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )),
                      ),
                    ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: Colors.white10),
                icon: Icon(Icons.replay),
                onPressed: () {
                  setState(() {
                    gameOver = false;
                    turn = 0;
                    activePlayer = "X";
                    game.winner = " ";
                    Player.oIndex = [];
                    Player.xIndex = [];

                    gameMode = false;
                  });
                },
                label: Text("Reppeat the game"),
              )
            ],
          ),
        ),
      ),
    );
  }

  String setMark(int index) {
    if (Player.xIndex.contains(index))
      return "X";
    else if (Player.oIndex.contains(index))
      return "O";
    else
      return " ";
  }
}
