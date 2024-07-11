import javax.swing.ImageIcon;
import java.time.LocalTime;

public class Fish extends Animal{

    public String color;

    public Fish(String spiece, ImageIcon rightImage, ImageIcon leftImage, ImageIcon deadImage, LocalTime SpawnTime, LocalTime dieTime, int speed, int width, int height, int positionX, int positionY, String color){
        super(spiece, rightImage, leftImage, deadImage, SpawnTime, dieTime, speed, width, height, positionX, positionY);
        this.color = color;
    }
}
