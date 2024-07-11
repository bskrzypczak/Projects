import javax.swing.*;

public class MyLabel extends JLabel{

    public Animal animal;
    public int index;
    public boolean isMoving;

    public MyLabel(Animal animal, int i){
        this.animal = animal;
        this.index = i;
        this.isMoving = false;
    }
}
