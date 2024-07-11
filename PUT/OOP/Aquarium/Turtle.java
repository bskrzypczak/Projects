import java.time.LocalTime;

import javax.swing.ImageIcon;

public class Turtle extends Animal{
    
    public Turtle(){
        super("turtle", new ImageIcon("turtle_right.png"), new ImageIcon("turtle_left.png"), new ImageIcon("turtle_dead.png"), LocalTime.now(), null, 10, 250, 148, 0, 0);
        this.dieTime = spawnTime.plusMinutes(5);
    }
}
