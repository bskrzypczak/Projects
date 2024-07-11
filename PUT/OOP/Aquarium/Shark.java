import java.util.ArrayList;
import java.util.Random;
import javax.swing.ImageIcon;
import javax.swing.SwingUtilities;
import java.time.LocalTime;

public class Shark extends Fish{

    int hunger_level;
    boolean isHunting;
    public Shark(){
        super("shark", new ImageIcon("shark_right.png"), new ImageIcon("shark_left.png"), new ImageIcon("shark_dead.png"), LocalTime.now(), null, 40, 440, 322, 0, 0, "Gray");
        this.hunger_level = 0;
        this.isHunting = false;
        this.dieTime = spawnTime.plusMinutes(2);
    }

    public void hunt(){
        this.speed = 5;
        isHunting = true;
    }

    @Override
    void move(MyLabel label, MyThread executingThread, ArrayList<MyLabel> animalLabels){
        while(label.isMoving){
            try {
                Thread.sleep(10);
                //System.out.println(executingThread.index + " waits " + label.index);
            } catch (Exception e) {
                // TODO: handle exception
            }
        }
        if(LocalTime.now().isAfter(dieTime)){
            die(label, executingThread, animalLabels);
        }
        Random r = new Random();
        int direction = r.nextInt(8);
        int movement = r.nextInt(100) + 50;
        label.isMoving = true;
        if(hunger_level > 5){
            int possibility = r.nextInt(10) + 1;
            if(possibility <= hunger_level){
                hunt();
            }
        }
        if(hunger_level < 10){
            hunger_level++;
        }
        else{
            hunger_level = 0;
            speed = 40;
            isHunting = false;
        }
        switch (direction) {
            case 0:             // N
                if(positionY > movement){
                    for(int i = 0; i < movement; i++){
                        positionY--;
                        SwingUtilities.invokeLater(() -> label.setLocation(positionX, positionY));
                        //System.out.println(label.index + " Pozostaly ruch: "  + (movement - i - 1) + " " + executingThread.index);
                        try {
                            Thread.sleep(label.animal.speed);
                        } catch (InterruptedException e){
                        }
                    }
                }
                break;

            case 1:             //NE
                if(positionX + movement + width < 1470 && positionY > movement){
                    for(int i = 0; i < movement; i++){
                        positionX++;
                        positionY--;
                        SwingUtilities.invokeLater(() -> label.setIcon(label.animal.rightImage));
                        SwingUtilities.invokeLater(() -> label.setLocation(positionX, positionY));
                        //System.out.println(label.index + " Pozostaly ruch: "  + (movement - i - 1) + " " + executingThread.index);
                        try {
                            Thread.sleep(label.animal.speed);
                        } catch (InterruptedException e){
                        }
                    }
                }
                break;

            case 2:             //E
                if(positionX + movement + width < 1470){
                    for(int i = 0; i < movement; i++){
                        positionX++;
                        SwingUtilities.invokeLater(() -> label.setIcon(label.animal.rightImage));
                        SwingUtilities.invokeLater(() -> label.setLocation(positionX, positionY));
                        //System.out.println(label.index + " Pozostaly ruch: "  + (movement - i - 1) + " " + executingThread.index);
                        try {
                            Thread.sleep(label.animal.speed);
                        } catch (InterruptedException e){
                        }
                    }
                }
                
                break;

            case 3:             //SE
                if(positionY + movement + height< 840 && positionX + movement + width < 1470){
                    for(int i = 0; i < movement; i++){
                        positionY++;
                        positionX++;
                        SwingUtilities.invokeLater(() -> label.setIcon(label.animal.rightImage));
                        SwingUtilities.invokeLater(() -> label.setLocation(positionX, positionY));
                        //System.out.println(label.index + " Pozostaly ruch: "  + (movement - i - 1) + " " +executingThread.index);      
                        try {
                            Thread.sleep(label.animal.speed);
                        } catch (InterruptedException e){
                        }
                    }
                }
                break;
            
            case 4:             //S
                if(positionY + movement + height < 840){
                    for(int i = 0; i < movement; i++){
                        positionY++;
                        SwingUtilities.invokeLater(() -> label.setLocation(positionX, positionY));
                        // System.out.println(label.index + " Pozostaly ruch: "  + (movement - i - 1) + " " + executingThread.index);
                        try {
                            Thread.sleep(label.animal.speed);
                        } catch (InterruptedException e){
                        }
                    }
                }
                break;

            case 5:             //SW
                if(positionX > movement && positionY + movement + height< 840){
                    for(int i = 0; i < movement; i++){
                        positionX--;
                        positionY++;
                        SwingUtilities.invokeLater(() -> label.setIcon(label.animal.leftImage));
                        SwingUtilities.invokeLater(() -> label.setLocation(positionX, positionY));
                        //System.out.println(label.index + " Pozostaly ruch: "  + (movement - i - 1) + " " + executingThread.index);
                        try {
                            Thread.sleep(label.animal.speed);
                        } catch (InterruptedException e){
                        }
                    }
                }
                break;

            case 6:             //W
                if(positionX > movement){
                    for(int i = 0; i < movement; i++){
                        positionX--;
                        SwingUtilities.invokeLater(() -> label.setIcon(label.animal.leftImage));
                        SwingUtilities.invokeLater(() -> label.setLocation(positionX, positionY));
                        // System.out.println(label.index + " Pozostaly ruch: "  + (movement - i - 1) + " " + executingThread.index);
                        try {
                            Thread.sleep(label.animal.speed);
                        } catch (InterruptedException e){
                        }
                    }
                }
                break;

            case 7:             //NW
                if(positionX > movement && positionY > movement){
                    for(int i = 0; i < movement; i++){
                        positionX--;
                        positionY--;
                        SwingUtilities.invokeLater(() -> label.setIcon(label.animal.leftImage));
                        SwingUtilities.invokeLater(() -> label.setLocation(positionX, positionY));
                        // System.out.println(label.index + " Pozostaly ruch: "  + (movement - i - 1) + " " + executingThread.index);
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
