import java.time.LocalTime;
import java.util.Random;
import javax.swing.SwingUtilities;
import java.util.ArrayList;
import javax.swing.ImageIcon;

public class Crab extends Animal{

    String color;
    public Crab(){
        super("crab", new ImageIcon("crab.png"), new ImageIcon("crab.png"), new ImageIcon("crab_dead.png"), LocalTime.now(), null, 50, 100, 75, 0, 0);
        this.color = "Red";
        this.dieTime = spawnTime.plusMinutes(2);
    }

    @Override
    public void move(MyLabel label, MyThread executingThread, ArrayList<MyLabel> animalLabels){
            while(label.isMoving){
            try {
                Thread.sleep(10);
            } catch (Exception e) {
            }
        }
        if(LocalTime.now().isAfter(dieTime)){
            die(label, executingThread, animalLabels);
        }
        Random r = new Random();
        int direction = r.nextInt(2);
        int movement = r.nextInt(100) + 50;
        switch (direction) {
            case 0: //left
                if(positionY > movement){
                    for(int i = 0; i < movement; i++){
                        positionX--;
                        SwingUtilities.invokeLater(() -> label.setLocation(positionX, positionY));
                        try {
                            Thread.sleep(label.animal.speed);
                        } catch (InterruptedException e){
                        }
                    }
                }
                break;
            case 1: //right
                if(positionY > movement){
                    for(int i = 0; i < movement; i++){
                        positionX++;
                        SwingUtilities.invokeLater(() -> label.setLocation(positionX, positionY));
                        try {
                            Thread.sleep(label.animal.speed);
                        } catch (InterruptedException e){
                        }
                    }
                }
                break;
            default:
                break;
        }
        label.isMoving = false;
    }
}
