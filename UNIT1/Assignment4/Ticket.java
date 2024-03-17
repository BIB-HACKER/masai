import java.util.Scanner;

public class Ticket {
    public static void main(String[] args) 
  {
        Scanner n = new Scanner(System.in);

        System.out.print("Enter your age: ");
        int age = n.nextInt();

        double ticketPrice = 0;

        if (age < 5) {
            ticketPrice = 0;
        } 
        else if (age >= 5 && age <= 12) {
            ticketPrice = 100 * 0.5;
        } 
        else if (age >= 13 && age <= 60) {
            ticketPrice = 100;
        } 
        else {
            ticketPrice = 100 * 0.75; 
        }

        System.out.println("Your ticket price is: $" + ticketPrice);
    }
}
