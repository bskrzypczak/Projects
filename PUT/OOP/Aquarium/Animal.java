import javax.swing.ImageIcon;
import javax.swing.JComponent;
import javax.swing.SwingUtilities;
import java.util.ArrayList;
import java.util.Random;
import java.time.LocalTime;
import java.lang.Math;


public class Animal {

    public String spiece;               //all needed fields
    public ImageIcon rightImage;
    public ImageIcon leftImage;
    public ImageIcon deadImage;
    public LocalTime spawnTime;
    public LocalTime dieTime;
    public int speed;
    public int width;
    public int height;
    public int positionX;
    public int positionY;
    public boolean profilic;

    //constructor
    public Animal(String spiece, ImageIcon rightImage, ImageIcon leftImage, ImageIcon deadImage, LocalTime spawnTime, LocalTime dieTime, int speed, int width, int height, int positionX, int positionY){

        this.spiece = spiece;
        this.rightImage = rightImage;
        this.leftImage = leftImage;
        this.deadImage = deadImage;
        this.spawnTime = spawnTime;
        this.dieTime = dieTime;
        this.speed = speed;
        this.height = height;
        this.width = width;
        this.positionX = positionX;
        this.positionY = positionY;
    }

    void move(MyLabel label, MyThread executingThread, ArrayList <MyLabel> animalLabels){
        while(label.isMoving){      //not to interrupt move that has not ended yet
            try {
                Thread.sleep(10);
            } catch (Exception e) {
                System.out.println("Error in move function: " + e.getMessage());
            }
        }
        if(LocalTime.now().isAfter(dieTime)){   //checking if it is time to die
            die(label, executingThread, animalLabels);
        }
        Random r = new Random();
        int direction = r.nextInt(8);
        int movement = r.nextInt(100) + 50;
        label.isMoving = true;
        switch (direction) {        //choosing one of 8 possible directions of movement
            case 0:             // N
                if(positionY > movement){
                    for(int i = 0; i < movement; i++){
                        positionY--;
                        //checking if this animal is able to reproduce
                        for(MyLabel otherLabel : animalLabels){
                            if(otherLabel.animal.spiece == label.animal.spiece && otherLabel.index != label.index && otherLabel.animal.profilic && label.animal.profilic){
                                if(Math.abs(positionX - otherLabel.animal.positionX) < 10 && Math.abs(positionY - otherLabel.animal.positionY) < 10){
                                    reproduce(label, otherLabel);
                                    break;
                                }
                            }
                        }
                        //changing posistion of animal
                        SwingUtilities.invokeLater(() -> label.setLocation(positionX, positionY));
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
                        for(MyLabel otherLabel : animalLabels){
                            if(otherLabel.animal.spiece == label.animal.spiece && otherLabel.index != label.index && otherLabel.animal.profilic && label.animal.profilic){
                                if(Math.abs(positionX - otherLabel.animal.positionX) < 10 && Math.abs(positionY - otherLabel.animal.positionY) < 10){
                                    reproduce(label, otherLabel);
                                    break;
                                }
                            }
                        }
                        SwingUtilities.invokeLater(() -> label.setIcon(label.animal.rightImage));
                        SwingUtilities.invokeLater(() -> label.setLocation(positionX, positionY));
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
                        for(MyLabel otherLabel : animalLabels){
                            if(otherLabel.animal.spiece == label.animal.spiece && otherLabel.index != label.index && otherLabel.animal.profilic && label.animal.profilic){
                                if(Math.abs(positionX - otherLabel.animal.positionX) < 10 && Math.abs(positionY - otherLabel.animal.positionY) < 10){
                                    reproduce(label, otherLabel);
                                    break;
                                }
                            }
                        }
                        SwingUtilities.invokeLater(() -> label.setIcon(label.animal.rightImage));
                        SwingUtilities.invokeLater(() -> label.setLocation(positionX, positionY));
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
                        for(MyLabel otherLabel : animalLabels){
                            if(otherLabel.animal.spiece == label.animal.spiece && otherLabel.index != label.index && otherLabel.animal.profilic && label.animal.profilic){
                                if(Math.abs(positionX - otherLabel.animal.positionX) < 10 && Math.abs(positionY - otherLabel.animal.positionY) < 10){
                                    reproduce(label, otherLabel);
                                    break;
                                }
                            }
                        }
                        SwingUtilities.invokeLater(() -> label.setIcon(label.animal.rightImage));
                        SwingUtilities.invokeLater(() -> label.setLocation(positionX, positionY));
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
                        for(MyLabel otherLabel : animalLabels){
                            if(otherLabel.animal.spiece == label.animal.spiece && otherLabel.index != label.index && otherLabel.animal.profilic && label.animal.profilic){
                                if(Math.abs(positionX - otherLabel.animal.positionX) < 10 && Math.abs(positionY - otherLabel.animal.positionY) < 10){
                                    reproduce(label, otherLabel);
                                    break;
                                }
                            }
                        }
                        SwingUtilities.invokeLater(() -> label.setLocation(positionX, positionY));
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
                        for(MyLabel otherLabel : animalLabels){
                            if(otherLabel.animal.spiece == label.animal.spiece && otherLabel.index != label.index && otherLabel.animal.profilic && label.animal.profilic){
                                if(Math.abs(positionX - otherLabel.animal.positionX) < 10 && Math.abs(positionY - otherLabel.animal.positionY) < 10){
                                    reproduce(label, otherLabel);
                                    break;
                                }
                            }
                        }
                        SwingUtilities.invokeLater(() -> label.setIcon(label.animal.leftImage));
                        SwingUtilities.invokeLater(() -> label.setLocation(positionX, positionY));
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
                        for(MyLabel otherLabel : animalLabels){
                            if(otherLabel.animal.spiece == label.animal.spiece && otherLabel.index != label.index && otherLabel.animal.profilic && label.animal.profilic){
                                if(Math.abs(positionX - otherLabel.animal.positionX) < 10 && Math.abs(positionY - otherLabel.animal.positionY) < 10){
                                    reproduce(label, otherLabel);
                                    break;
                                }
                            }
                        }
                        SwingUtilities.invokeLater(() -> label.setIcon(label.animal.leftImage));
                        SwingUtilities.invokeLater(() -> label.setLocation(positionX, positionY));
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
                        for(MyLabel otherLabel : animalLabels){
                            if(otherLabel.animal.spiece == label.animal.spiece && otherLabel.index != label.index && otherLabel.animal.profilic && label.animal.profilic){
                                if(Math.abs(positionX - otherLabel.animal.positionX) < 10 && Math.abs(positionY - otherLabel.animal.positionY) < 10){
                                    reproduce(label, otherLabel);
                                    break;
                                }
                            }
                        }
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

    public void die(MyLabel label, MyThread executingThread, ArrayList<MyLabel> animalLabels){
        //setting dead image
        label.setIcon(deadImage);
        while(positionY + height> 0){
            positionY--;
            SwingUtilities.invokeLater(() -> label.setLocation(positionX, positionY));
            try {
                Thread.sleep(50);
            } catch (InterruptedException e){
            }
        }
        //removing fish and killing its thread
        executingThread.isInterrupted = true;
        animalLabels.remove(label);
        label.setVisible(false);
    }

    public void reproduce(MyLabel mother, MyLabel father){
        mother.animal.profilic = false;
        father.animal.profilic = false;
        switch (father.animal.spiece) {
            case "turtle":
                MyLabel label = Aquarium.create_Turtle();
                Aquarium.animalLabels.add(0, label);
                Aquarium.frame.getContentPane().removeAll();
                Aquarium.frame.revalidate();
                Aquarium.frame.repaint();
                for(MyLabel lab : Aquarium.animalLabels){
                    Aquarium.frame.add(lab);
                }
                for(JComponent comp : Aquarium.thingsToDisplay){
                    Aquarium.frame.add(comp);
                }
                Aquarium.swim();
                break;
            
            case "shark":
                MyLabel labelshark = Aquarium.create_Shark();
                Aquarium.animalLabels.add(0, labelshark);
                Aquarium.frame.getContentPane().removeAll();
                Aquarium.frame.revalidate();
                Aquarium.frame.repaint();
                for(MyLabel lab : Aquarium.animalLabels){
                    Aquarium.frame.add(lab);
                }
                for(JComponent comp : Aquarium.thingsToDisplay){
                    Aquarium.frame.add(comp);
                }
                Aquarium.swim();
                break;

            case "yellow fish":
                MyLabel labelYf = Aquarium.create_YellowFish();
                Aquarium.animalLabels.add(0, labelYf);
                Aquarium.frame.getContentPane().removeAll();
                Aquarium.frame.revalidate();
                Aquarium.frame.repaint();
                for(MyLabel lab : Aquarium.animalLabels){
                    Aquarium.frame.add(lab);
                }
                for(JComponent comp : Aquarium.thingsToDisplay){
                    Aquarium.frame.add(comp);
                }
                Aquarium.swim();
                break;

            case "red fish":
                MyLabel labelRf = Aquarium.create_RedFish();
                Aquarium.animalLabels.add(0, labelRf);
                Aquarium.frame.getContentPane().removeAll();
                Aquarium.frame.revalidate();
                Aquarium.frame.repaint();
                for(MyLabel lab : Aquarium.animalLabels){
                    Aquarium.frame.add(lab);
                }
                for(JComponent comp : Aquarium.thingsToDisplay){
                    Aquarium.frame.add(comp);
                }
                Aquarium.swim();
                break;
            
            case "seahorse":
                MyLabel labelS = Aquarium.create_Seahorse();
                Aquarium.animalLabels.add(0, labelS);
                Aquarium.frame.getContentPane().removeAll();
                Aquarium.frame.revalidate();
                Aquarium.frame.repaint();
                for(MyLabel lab : Aquarium.animalLabels){
                    Aquarium.frame.add(lab);
                }
                for(JComponent comp : Aquarium.thingsToDisplay){
                    Aquarium.frame.add(comp);
                }
                Aquarium.swim();
                break;
            default:
                break;
        }
    }
}
