import java.time.LocalTime;

import javax.swing.ImageIcon;

public class RedFish extends Fish{

    public RedFish(){
        super("red fish", new ImageIcon("red_fish_right.png"), new ImageIcon("red_fish_left.png"), new ImageIcon("red_fish_dead.png"),  LocalTime.now(), null, 20, 150, 146, 0, 0, "Red");
        this.dieTime = spawnTime.plusMinutes(2);
    }
}
