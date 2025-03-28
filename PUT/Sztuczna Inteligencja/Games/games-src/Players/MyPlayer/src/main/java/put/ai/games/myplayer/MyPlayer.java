package put.ai.games.myplayer;

import java.util.List;
import java.util.Random;
import BoardGame.src.main.java.put.ai.games.game.Board;
import BoardGame.src.main.java.put.ai.games.game.Move;
import BoardGame.src.main.java.put.ai.games.game.Player;

public class MyPlayer extends Player {

    private Random random = new Random(0xdeadbeef);


    @Override
    public String getName() {
        return "Bartosz Skrzypczak 155832";
    }


    @Override
    public Move nextMove(Board b) {
        List<Move> moves = b.getMovesFor(getColor());
        return moves.get(random.nextInt(moves.size()));
    }
}
