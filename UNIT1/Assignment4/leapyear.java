import java.util.Scanner;

public class leapyear {
    public static void main(String[] args) {
        Scanner leap = new Scanner(System.in);

        System.out.print("Enter a year: ");
        int year = leap.nextInt();

        if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
            System.out.println("Leap Year");
        } else {
            System.out.println("Not a Leap Year");
        }
    }
}
