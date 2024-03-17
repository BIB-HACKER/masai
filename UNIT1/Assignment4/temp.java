import java.util.Scanner;

public class temp {
    public static void main(String[] args) 
  {
        Scanner tem = new Scanner(System.in);

        System.out.print("Enter the temperature in Celsius: ");
        double temperature = tem.nextDouble();

        if (temperature > 30) {
            System.out.println("Hot");
        } 
        else if (temperature >= 20 && temperature <= 30) {
            System.out.println("Moderate");
        } 
        else {
            System.out.println("Cold");
        }
    }
}
