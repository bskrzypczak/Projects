import java.time.LocalTime;
import java.util.Random;
import java.util.ArrayList;
import javax.swing.ImageIcon;
import javax.swing.SwingUtilities;

public class Mussel extends Animal{

    public Mussel(){
        super("mussel", new ImageIcon("mussel.png"), new ImageIcon("mussel.png"), new ImageIcon("mussel_dead.png"), LocalTime.now(), null, 5000, 50, 38, 0, 0);
        this.dieTime = spawnTime.plusMinutes(5);
    }

    @Override
    public void move(MyLabel label, MyThread executingThread, ArrayList<MyLabel> animalLabels){
            while(label.isMoving){
            try {
                Thread.sleep(10);
            } catch (Exception e) {
            }
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
