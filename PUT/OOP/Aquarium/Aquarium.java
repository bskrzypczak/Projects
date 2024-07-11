import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.time.LocalTime;
import java.awt.Color;
import java.util.ArrayList;
import java.util.Random;

public class Aquarium{
    public static ArrayList<MyThread> animal_threads = new ArrayList<>();         //list of threads, one for each animal
    public static ArrayList<JComponent> thingsToDisplay = new ArrayList<>();    //list of things that are always displayed (bg, seagrass etc.)
    public static ArrayList<MyLabel> animalLabels = new ArrayList<>();          //list of currently living animals to display
    public static JFrame frame = new JFrame();                                  //JFrame
    public static int currentAnimalIndex = 0;
    public static int currentThreadIndex = 0;
    public static boolean addFishClicked = false;
    public static boolean removeFishClicked = false;
    public static LocalTime startTime;

    public static MyLabel create_YellowFish(){      //method to create a YellowFish and its label
        YellowFish yellow_fish = new YellowFish();
        yellow_fish.profilic = true;
        MyLabel yellowFish_label = new MyLabel(yellow_fish, currentAnimalIndex++);
        Random randomx = new Random();
        Random randomy = new Random();
        int randomNumberx = randomx.nextInt(1470 - yellow_fish.width);
        int randomNumbery = randomy.nextInt(840 - yellow_fish.height);
        yellow_fish.positionX = randomNumberx;
        yellow_fish.positionY = randomNumbery;
        yellowFish_label.setIcon(yellow_fish.rightImage);
        yellowFish_label.setBounds(yellow_fish.positionX, yellow_fish.positionY, yellow_fish.width, yellow_fish.height);
        yellowFish_label.setName("zolta ryba");
        return yellowFish_label;
    }

    public static MyLabel create_RedFish(){         //method to create a RedFish and its label
        RedFish red_fish = new RedFish();
        red_fish.profilic = true;
        MyLabel redFish_label = new MyLabel(red_fish, currentAnimalIndex++);
        Random randomx = new Random();
        Random randomy = new Random();
        int randomNumberx = randomx.nextInt(1470 - red_fish.width);
        int randomNumbery = randomy.nextInt(840 - red_fish.height);
        red_fish.positionX = randomNumberx;
        red_fish.positionY = randomNumbery;
        redFish_label.setIcon(red_fish.rightImage);
        redFish_label.setBounds(red_fish.positionX, red_fish.positionY, red_fish.width, red_fish.height);
        redFish_label.setName("czerwona ryba");
        return redFish_label;
    }

    public static MyLabel create_Shark(){           //method to create a Shark and its label
        Shark shark = new Shark();
        shark.profilic = true;
        MyLabel shark_label = new MyLabel(shark, currentAnimalIndex++);
        Random randomx = new Random();
        Random randomy = new Random();
        int randomNumberx = randomx.nextInt(1470 - shark.width);
        int randomNumbery = randomy.nextInt(840 - shark.height);
        shark.positionX = randomNumberx;
        shark.positionY = randomNumbery;
        shark_label.setIcon(shark.rightImage);
        shark_label.setBounds(shark.positionX, shark.positionY, shark.width, shark.height);
        shark_label.setName("rekin");
        return shark_label;
    }

    public static MyLabel create_Crab(){        //method to create a Crab and its label
        Crab crab = new Crab();
        crab.profilic = false;
        MyLabel crab_label = new MyLabel(crab, currentAnimalIndex++);
        Random randomx = new Random();
        Random randomy = new Random();
        int randomNumberx = randomx.nextInt(1470 - crab.width);
        int randomNumbery = randomy.nextInt(50);
        crab.positionX = randomNumberx;
        crab.positionY = 840 - randomNumbery - 100;
        crab_label.setIcon(crab.rightImage);
        crab_label.setBounds(crab.positionX, crab.positionY, crab.width, crab.height);
        crab_label.setName("crab");
        return crab_label;
    }

    public static MyLabel create_Mussel(){      //method to create a Mussel and its label
        Mussel mussel = new Mussel();
        mussel.profilic = false;
        MyLabel mussel_label = new MyLabel(mussel, currentAnimalIndex++);
        Random randomx = new Random();
        Random randomy = new Random();
        int randomNumberx = randomx.nextInt(1470 - mussel.width);
        int randomNumbery = randomy.nextInt(100);
        mussel.positionX = randomNumberx;
        mussel.positionY = 820 - randomNumbery - mussel.height;
        mussel_label.setIcon(mussel.rightImage);
        mussel_label.setBounds(mussel.positionX, mussel.positionY, mussel.width, mussel.height);
        mussel_label.setName("malz");        
        return mussel_label;
    }
        
    public static MyLabel create_Turtle(){      //method to create a Turtle and its label
        Turtle turtle = new Turtle();
        turtle.profilic = true;
        MyLabel turtle_label = new MyLabel(turtle, currentAnimalIndex++);
        Random randomx = new Random();
        Random randomy = new Random();
        int randomNumberx = randomx.nextInt(1470 - turtle.width);
        int randomNumbery = randomy.nextInt(840 - turtle.height);
        turtle.positionX = randomNumberx;
        turtle.positionY = randomNumbery;
        turtle_label.setIcon(turtle.rightImage);
        turtle_label.setBounds(turtle.positionX, turtle.positionY, turtle.width, turtle.height);  
        turtle_label.setName("zolw");
        return turtle_label;
    }

    public static MyLabel create_Seahorse(){      //method to create a Seahorse and its label
        Seahorse seahorse = new Seahorse();
        seahorse.profilic = true;
        MyLabel seahorse_label = new MyLabel(seahorse, currentAnimalIndex++);
        Random randomx = new Random();
        Random randomy = new Random();
        int randomNumberx = randomx.nextInt(1470 - seahorse.width);
        int randomNumbery = randomy.nextInt(840 - seahorse.height);
        seahorse.positionX = randomNumberx;
        seahorse.positionY = randomNumbery;
        seahorse_label.setIcon(seahorse.rightImage);
        seahorse_label.setBounds(seahorse.positionX, seahorse.positionY, seahorse.width, seahorse.height);  
        seahorse_label.setName("zolw");
        return seahorse_label;
    }

    public static void swim(){      //method starting animal Threads
        MyThread animalThread = new MyThread(animalLabels.get(0), currentThreadIndex++, animalLabels);
        animal_threads.add(animalThread);
        animalThread.start();
        try {
            Thread.sleep(1);
        } catch (Exception e) {
            System.out.println("aquarium swim() error: " + e.getMessage());
        }
    }

    public static void main(String[] args) throws InterruptedException{

            startTime = LocalTime.now();
            frame.setSize(1470, 840);
            frame.setTitle("Aquarium project");
            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            frame.setResizable(false);
            frame.setLayout(null);

            JLabel bground = new JLabel(new ImageIcon("tlo.jpeg"));         //background creation 
            bground.setBounds(0, 0, 1470, 840);

            JLabel seagrass = new JLabel(new ImageIcon("seagrass.png"));
            seagrass.setBounds(1370, 540, 100, 300);

            JLabel seagrass1 = new JLabel(new ImageIcon("seagrass1.png"));
            seagrass1.setBounds(1240, 420, 127, 420);

            JLabel seagrass2 = new JLabel(new ImageIcon("seagrass1.png"));
            seagrass2.setBounds(30, 420, 127, 420);

            JLabel rurkowiec = new JLabel(new ImageIcon("rurkowiec.png"));
            rurkowiec.setBounds(1110, 665, 98, 150);

            JLabel wtf = new JLabel(new ImageIcon("wtf.png"));
            wtf.setBounds(150, 715, 102, 100);

            JPanel menu = new JPanel();
            menu.setLayout(null);
            menu.setBackground(Color.cyan);
            menu.setBounds(20, 70, 140, 200);
            menu.setVisible(false);

            JButton addFishButton = new JButton("Add Fish");        //addFish button
            addFishButton.setBounds(20, 10, 140, 60);
            addFishButton.addActionListener(e -> {
                if(addFishClicked){
                    menu.setVisible(false);
                    addFishClicked = false;
                }
                else{
                    menu.setVisible(true);
                    addFishClicked = true;
                }
            });

            JButton addRandomFishButton = new JButton("Add Random Fish");       //add random fish button
            addRandomFishButton.setForeground(Color.BLUE);
            addRandomFishButton.setBounds(1150, 10, 140, 60);
            addRandomFishButton.setName("add_random_fish");
            addRandomFishButton.addActionListener(new ButtonClickListener(addRandomFishButton.getName()));

            JPanel removeMenu = new JPanel();
            removeMenu.setLayout(null);
            removeMenu.setBackground(Color.cyan);
            removeMenu.setBounds(180, 70, 140, 200);
            removeMenu.setVisible(false);

            JButton removeFishButton = new JButton("Remove Fish");          //remove fish button
            removeFishButton.setBounds(180, 10, 140, 60);
            removeFishButton.setName("remove_fish");
            removeFishButton.addActionListener(e -> {
                if(removeFishClicked){
                    removeMenu.setVisible(false);
                    removeFishClicked = false;
                }
                else{
                    removeMenu.setVisible(true);
                    removeFishClicked = true;
                }
            });

            JButton removeAllFishButton = new JButton("Remove All Fish");       //remove all fish button
            removeAllFishButton.setForeground(Color.RED);
            removeAllFishButton.setBounds(1310, 10, 140, 60);
            removeAllFishButton.setName("remove_all_fish");
            removeAllFishButton.addActionListener(new ButtonClickListener(removeAllFishButton.getName()));

            thingsToDisplay.add(removeMenu);                    //adding all components to list of thing to display
            thingsToDisplay.add(menu);
            thingsToDisplay.add(wtf);
            thingsToDisplay.add(rurkowiec);
            thingsToDisplay.add(removeFishButton);
            thingsToDisplay.add(removeAllFishButton);
            thingsToDisplay.add(addFishButton);
            thingsToDisplay.add(addRandomFishButton);
            thingsToDisplay.add(seagrass2);
            thingsToDisplay.add(seagrass1);
            thingsToDisplay.add(seagrass);
            thingsToDisplay.add(bground);

            JButton addYellowFishButton = new JButton();                    //add spiecific fish buttons
            addYellowFishButton.setBounds(0, 0, 70, 50);
            addYellowFishButton.setName("add_yellow_fish");
            addYellowFishButton.setIcon(new ImageIcon("yellow_fish_icon.png"));
            addYellowFishButton.addActionListener(new ButtonClickListener(addYellowFishButton.getName()));

            JButton addRedFishButton = new JButton();
            addRedFishButton.setBounds(70, 0, 70, 50);
            addRedFishButton.setName("add_red_fish");
            addRedFishButton.setIcon(new ImageIcon("red_fish_icon.png"));
            addRedFishButton.addActionListener(new ButtonClickListener(addRedFishButton.getName()));

            JButton addSharkButton = new JButton();
            addSharkButton.setBounds(0, 50, 70, 50);
            addSharkButton.setName("add_shark");
            addSharkButton.setIcon(new ImageIcon("shark_icon.png"));
            addSharkButton.addActionListener(new ButtonClickListener(addSharkButton.getName()));

            JButton addTurtleButton = new JButton();
            addTurtleButton.setBounds(70, 50, 70, 50);
            addTurtleButton.setName("add_turtle");
            addTurtleButton.setIcon(new ImageIcon("turtle_icon.png"));
            addTurtleButton.addActionListener(new ButtonClickListener(addTurtleButton.getName()));

            JButton addCrabButton = new JButton();
            addCrabButton.setBounds(0, 100, 70, 50);
            addCrabButton.setName("add_crab");
            addCrabButton.setIcon(new ImageIcon("crab_icon.png"));
            addCrabButton.addActionListener(new ButtonClickListener(addCrabButton.getName()));

            JButton addMusselButton = new JButton();
            addMusselButton.setBounds(70, 100, 70, 50);
            addMusselButton.setName("add_mussel");
            addMusselButton.setIcon(new ImageIcon("mussel.png"));
            addMusselButton.addActionListener(new ButtonClickListener(addMusselButton.getName()));

            JButton addSeahorseButton = new JButton();
            addSeahorseButton.setBounds(0, 150, 70, 50);
            addSeahorseButton.setName("add_seahorse");
            addSeahorseButton.setIcon(new ImageIcon("seahorse_icon.png"));
            addSeahorseButton.addActionListener(new ButtonClickListener(addSeahorseButton.getName()));
            
            menu.add(addYellowFishButton);
            menu.add(addRedFishButton);
            menu.add(addSharkButton);
            menu.add(addTurtleButton);
            menu.add(addCrabButton);
            menu.add(addMusselButton);
            menu.add(addSeahorseButton);

            JButton removeYellowFishButton = new JButton();                 //remove specific fish button
            removeYellowFishButton.setBounds(0, 0, 70, 50);
            removeYellowFishButton.setName("remove_yellow_fish");
            removeYellowFishButton.setIcon(new ImageIcon("yellow_fish_icon.png"));
            removeYellowFishButton.addActionListener(new ButtonClickListener(removeYellowFishButton.getName()));

            JButton removeRedFishButton = new JButton();
            removeRedFishButton.setBounds(70, 0, 70, 50);
            removeRedFishButton.setName("remove_red_fish");
            removeRedFishButton.setIcon(new ImageIcon("red_fish_icon.png"));
            removeRedFishButton.addActionListener(new ButtonClickListener(removeRedFishButton.getName()));

            JButton removeSharkButton = new JButton();
            removeSharkButton.setBounds(0, 50, 70, 50);
            removeSharkButton.setName("remove_shark");
            removeSharkButton.setIcon(new ImageIcon("shark_icon.png"));
            removeSharkButton.addActionListener(new ButtonClickListener(removeSharkButton.getName()));

            JButton removeTurtleButton = new JButton();
            removeTurtleButton.setBounds(70, 50, 70, 50);
            removeTurtleButton.setName("remove_turtle");
            removeTurtleButton.setIcon(new ImageIcon("turtle_icon.png"));
            removeTurtleButton.addActionListener(new ButtonClickListener(removeTurtleButton.getName()));

            JButton removeCrabButton = new JButton();
            removeCrabButton.setBounds(0, 100, 70, 50);
            removeCrabButton.setName("remove_crab");
            removeCrabButton.setIcon(new ImageIcon("crab_icon.png"));
            removeCrabButton.addActionListener(new ButtonClickListener(removeCrabButton.getName()));

            JButton removeMusselButton = new JButton();
            removeMusselButton.setBounds(70, 100, 70, 50);
            removeMusselButton.setName("remove_mussel");
            removeMusselButton.setIcon(new ImageIcon("mussel.png"));
            removeMusselButton.addActionListener(new ButtonClickListener(removeMusselButton.getName()));

            JButton removeSeahorseButton = new JButton();
            removeSeahorseButton.setBounds(0, 150, 70, 50);
            removeSeahorseButton.setName("remove_seahorse");
            removeSeahorseButton.setIcon(new ImageIcon("seahorse_icon.png"));
            removeSeahorseButton.addActionListener(new ButtonClickListener(removeSeahorseButton.getName()));

            removeMenu.add(removeYellowFishButton);
            removeMenu.add(removeRedFishButton);
            removeMenu.add(removeSharkButton);
            removeMenu.add(removeTurtleButton);
            removeMenu.add(removeCrabButton);
            removeMenu.add(removeMusselButton);
            removeMenu.add(removeSeahorseButton);

            for(JComponent comp : thingsToDisplay){     //displaying everything
                frame.add(comp);
            }
            frame.setVisible(true);

    }

    private static class ButtonClickListener implements ActionListener {        //buttons work
        private String buttonName;

        public ButtonClickListener(String buttonName){
            this.buttonName = buttonName;
        }

        @Override
        public void actionPerformed(ActionEvent e) {                    //adding fish
            if(buttonName == "add_red_fish"){
                MyLabel rf = create_RedFish();
                animalLabels.add(0, rf);
                display();
            }

            if(buttonName == "add_yellow_fish"){
                MyLabel yf = create_YellowFish();
                animalLabels.add(0, yf);
                display();
            }

            if(buttonName == "add_shark"){
                MyLabel shark = create_Shark();
                animalLabels.add(0, shark);
                display();
            }

            if(buttonName == "add_turtle"){
                MyLabel turtle = create_Turtle();
                animalLabels.add(0, turtle);
                display();
            }

            if(buttonName == "add_crab"){
                MyLabel crab = create_Crab();
                animalLabels.add(0, crab);
                display();
            }

            if(buttonName == "add_mussel"){
                MyLabel mussel = create_Mussel();
                animalLabels.add(0, mussel);
                display();
            }

            if(buttonName == "add_seahorse"){
                MyLabel seahorse = create_Seahorse();
                animalLabels.add(0, seahorse);
                display();
            }

            if(buttonName == "remove_yellow_fish"){             //removing fish
                boolean animalFound = false;
                if(animalLabels.size() == 0){
                    System.out.println("No animal can be removed as there isn't one");
                }
                for(MyLabel label : animalLabels){
                    if(label.animal instanceof YellowFish){
                        animal_threads.get(label.index).isInterrupted = true;
                        animalLabels.remove(label);
                        label.setVisible(false);
                        animalFound = true;
                        break;
                    }
                }
                if(!animalFound){
                    System.out.println("Theres no yellow fish to remove");
                }
            }
            
            if(buttonName == "remove_red_fish"){
                boolean animalFound = false;
                if(animalLabels.size() == 0){
                    System.out.println("No animal can be removed as there isn't one");
                }
                for(MyLabel label : animalLabels){
                    if(label.animal instanceof RedFish){
                        animal_threads.get(label.index).isInterrupted = true;
                        animalLabels.remove(label);
                        label.setVisible(false);
                        animalFound = true;
                        break;
                    }
                }
                if(!animalFound){
                    System.out.println("Theres no red fish to remove");
                }
            }

            if(buttonName == "remove_shark"){
                boolean animalFound = false;
                if(animalLabels.size() == 0){
                    System.out.println("No animal can be removed as there isn't one");
                }
                for(MyLabel label : animalLabels){
                    if(label.animal instanceof Shark){
                        animal_threads.get(label.index).isInterrupted = true;
                        animalLabels.remove(label);
                        label.setVisible(false);
                        animalFound = true;
                        break;
                    }
                }
                if(!animalFound){
                    System.out.println("Theres no shark to remove");
                }
            }

            if(buttonName == "remove_turtle"){
                boolean animalFound = false;
                if(animalLabels.size() == 0){
                    System.out.println("No animal can be removed as there isn't one");
                }
                for(MyLabel label : animalLabels){
                    if(label.animal instanceof Turtle){
                        animal_threads.get(label.index).isInterrupted = true;
                        animalLabels.remove(label);
                        label.setVisible(false);
                        animalFound = true;
                        break;
                    }
                }
                if(!animalFound){
                    System.out.println("Theres no turtle to remove");
                }
                
            }

            if(buttonName == "remove_crab"){
                boolean animalFound = false;
                if(animalLabels.size() == 0){
                    System.out.println("No animal can be removed as there isn't one");
                }
                for(MyLabel label : animalLabels){
                    if(label.animal instanceof Crab){
                        animal_threads.get(label.index).isInterrupted = true;
                        animalLabels.remove(label);
                        label.setVisible(false);
                        animalFound = true;
                        break;
                    }
                }
                if(!animalFound){
                    System.out.println("Theres no crab to remove");
                }
                
            }

            if(buttonName == "remove_mussel"){
                boolean animalFound = false;
                if(animalLabels.size() == 0){
                    System.out.println("No animal can be removed as there isn't one");
                }
                for(MyLabel label : animalLabels){
                    if(label.animal instanceof Mussel){
                        animal_threads.get(label.index).isInterrupted = true;
                        animalLabels.remove(label);
                        label.setVisible(false);
                        animalFound = true;
                        break;
                    }
                }
                if(!animalFound){
                    System.out.println("Theres no mussel to remove");
                }
            }

            if(buttonName == "remove_seahorse"){
                boolean animalFound = false;
                if(animalLabels.size() == 0){
                    System.out.println("No animal can be removed as there isn't one");
                }
                for(MyLabel label : animalLabels){
                    if(label.animal instanceof Seahorse){
                        animal_threads.get(label.index).isInterrupted = true;
                        animalLabels.remove(label);
                        label.setVisible(false);
                        animalFound = true;
                        break;
                    }
                }
                if(!animalFound){
                    System.out.println("Theres no seahorse to remove");
                }
            }

            if(buttonName == "remove_all_fish"){                //removing all fish
                if(animalLabels.size() == 0){
                    System.out.println("No animal can be removed as there isn't one");
                }
                for(MyLabel label : animalLabels){
                    animal_threads.get(label.index).isInterrupted = true;
                    label.setVisible(false);
                }
                animalLabels.clear();
            }

            if(buttonName == "add_random_fish"){            //adding random fish
                Random r = new Random();
                int number = r.nextInt(10);
                for(int i = 0; i < number; i++){
                    int animal = r.nextInt(7);
                    switch (animal) {
                        case 0:
                            MyLabel yf = create_YellowFish();
                            animalLabels.add(0, yf);
                            display();
                            break;
                        
                        case 1:
                            MyLabel rf = create_RedFish();
                            animalLabels.add(0, rf);
                            display();
                            break;
                        
                        case 2:
                            MyLabel shark = create_Shark();
                            animalLabels.add(0, shark);
                            display();
                            break;
                        
                        case 3:
                            MyLabel crab = create_Crab();
                            animalLabels.add(0, crab);
                            display();
                            break;

                        case 4:
                            MyLabel turtle = create_Turtle();
                            animalLabels.add(0, turtle);
                            display();
                            break;
                        
                        case 5:
                            MyLabel mussel = create_Mussel();
                            animalLabels.add(0, mussel);
                            display();
                            break;
                        
                        case 6:
                            MyLabel seahorse = create_Seahorse();
                            animalLabels.add(0, seahorse);
                            display();
                            break;
                        
                        default:
                            break;
                    }
                }
            }
        }

        public void display(){                      //displaying all previous components and new one
            frame.getContentPane().removeAll();
            frame.revalidate();
            frame.repaint();
            for(MyLabel label : animalLabels){
                frame.add(label);
            }
            for(JComponent comp : thingsToDisplay){
                frame.add(comp);
            }
            swim();
        }   
    }
}
