import java.time.LocalTime;

import javax.swing.ImageIcon;

public class YellowFish extends Fish{

    public YellowFish(){
        super("yellow fish", new ImageIcon("yellow_fish_right.png"), new ImageIcon("yellow_fish_left.png"), new ImageIcon("yellow_fish_dead.png"), LocalTime.now(), null, 20, 200, 170, 0, 0, "Yellow");
        this.dieTime = spawnTime.plusMinutes(1);
    }
