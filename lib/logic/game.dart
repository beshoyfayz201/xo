import 'dart:math';

import 'package:xo_mod/logic/player.dart';

extension ContainsAll on List {
  containsAll(int w, int x, [z]) {
    if (z == null) if (contains(x) & contains(w)) return true;
    if (contains(x) & contains(w) & contains(z))
      return true;
    else
      return false;
  }
}

class game {
  static String winner = " ";

  play(index, player, bool auto) {
    if (player == "X") {
      Player.xIndex.add(index);
    } else {
      Player.oIndex.add(index);
    }
    checkWinner();
  }

  checkWinner() {
    if (Player.xIndex.containsAll(0, 1, 2) ||
        Player.xIndex.containsAll(3, 4, 5) ||
        Player.xIndex.containsAll(2, 4, 6) ||
        Player.xIndex.containsAll(0, 3, 6) ||
        Player.xIndex.containsAll(1, 4, 7) ||
        Player.xIndex.containsAll(0, 4, 8) ||
        Player.xIndex.containsAll(2, 5, 8) ||
        Player.xIndex.containsAll(6, 7, 8)) winner = "x";

    //
    if (Player.oIndex.containsAll(3, 4, 5) ||
        Player.oIndex.containsAll(0, 1, 2) ||
        Player.oIndex.containsAll(6, 7, 8) ||
        Player.oIndex.containsAll(0, 4, 8) ||
        Player.oIndex.containsAll(2, 4, 6) ||
        Player.oIndex.containsAll(0, 3, 6) ||
        Player.oIndex.containsAll(1, 4, 7) ||
        Player.oIndex.containsAll(2, 5, 8)) winner = "o";
  }

  autoPlaye(String p) {
    List embtySet = [];
    for (int i = 0; i < 9; i++) {
      if (!Player.xIndex.contains(i) && !Player.oIndex.contains(i))
        embtySet.add(i);
    }
    if (Player.oIndex.containsAll(0, 1) & embtySet.contains(2))
      play(2, p, false);
    else if (Player.oIndex.containsAll(3, 4) & embtySet.contains(5))
      play(5, p, false);
    else if (Player.oIndex.containsAll(6, 7) & embtySet.contains(8))
      play(8, p, false);
    else if (Player.oIndex.containsAll(0, 2) & embtySet.contains(1))
      play(1, p, false);
    else if (Player.oIndex.containsAll(1, 2) & embtySet.contains(0))
      play(0, p, false);
    else if (Player.oIndex.containsAll(0, 3) & embtySet.contains(6))
      play(6, p, false);
    else if (Player.oIndex.containsAll(1, 4) & embtySet.contains(7))
      play(7, p, false);
    else if (Player.oIndex.containsAll(2, 5) & embtySet.contains(8))
      play(8, p, false);
    else if (Player.oIndex.containsAll(2, 8) & embtySet.contains(5))
      play(5, p, false);
    else if (Player.oIndex.containsAll(8, 5) & embtySet.contains(2))
      play(2, p, false);
    else if (Player.oIndex.containsAll(7, 1) & embtySet.contains(4))
      play(4, p, false);
    else if (Player.oIndex.containsAll(0, 6) & embtySet.contains(3))
      play(3, p, false);
    else if (Player.oIndex.containsAll(6, 3) & embtySet.contains(0))
      play(0, p, false);
    else if (Player.oIndex.containsAll(0, 4) & embtySet.contains(8))
      play(8, p, false);
    else if (Player.oIndex.containsAll(2, 5) & embtySet.contains(6))
      play(6, p, false);
    else {
      int i = Random().nextInt(embtySet.length);
      play(embtySet[i], p, false);
    }
  }
}
