import java.util.ArrayList;

public class MyThread extends Thread{
    public volatile boolean isInterrupted = false;
    public MyLabel label;
    public int index;
    public ArrayList<MyLabel> animalsList;

    public MyThread(MyLabel label, int i, ArrayList<MyLabel> animalLabels) {
        this.label = label;
        this.index = i;
        this.animalsList = animalLabels;
    }

    @Override
    public void run(){
        while(!isInterrupted){
            label.animal.move(label, this, animalsList);
        }
    }
}
