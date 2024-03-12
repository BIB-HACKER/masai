public class Rectangle {

    // Attributes
    public int length;
    public int breath;
    
    // Default cons
    static String name="bibhakar";
    Rectangle(){
        length=10;
        breath=5;
    }
    
    // parametrized cons
    Rectangle(int new_length, int new_breath){
        length=new_length; 
        breath=new_breath;
    }

    public double calculateArea(){
        double area = length * breath;
        return area;
    }
    
    // Methods
    public void displayinfo(){
        System.out.println("length :"+  length);
        System.out.println("beath :" + breath);
    }

    public static void main(String[] args) {
        Rectangle r1 = new Rectangle();
        r1.displayinfo();

        Rectangle r2 = new Rectangle(10, 30);
        r2.displayinfo();

        double area = r2.calculateArea();
        System.out.println("Area is "+area);
    }
}
