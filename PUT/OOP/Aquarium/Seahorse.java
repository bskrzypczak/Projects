import java.time.LocalTime;

import javax.swing.ImageIcon;

public class Seahorse extends Animal{

    public Seahorse(){
        super("seahorse", new ImageIcon("seahorse_right.png"), new ImageIcon("seahorse_left.png"), new ImageIcon("seahorse_dead.png"), LocalTime.now(), null, 50, 135, 135, 0, 0);
        this.dieTime = spawnTime.plusMinutes(1);
    }
}
