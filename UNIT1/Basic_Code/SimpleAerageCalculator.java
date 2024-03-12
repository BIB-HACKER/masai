import java.util.Scanner;

public class SimpleAerageCalculator {
    public static void main(String[] args) {
        Scanner val = new Scanner(System.in);

        System.out.println("Enter three numbers: ");
        int num1 = val.nextInt();
        int num2 = val.nextInt();
        int num3 = val.nextInt();

        int average = (num1 + num2 + num3) / 3;

        System.out.println("The average of " + num1 + ", " + num2 + ", and " + num3 + " is: " + average);

        val.close();
    }
}