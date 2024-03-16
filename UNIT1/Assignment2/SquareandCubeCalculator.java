import java.util.Scanner;

public class SquareandCubeCalculator {
    public static void main(String[] args) {
        Scanner valu = new Scanner(System.in);

        System.out.println("Enter an integer: ");
        int number = valu.nextInt();

        int square = number * number;
        int cube = number * number * number;

        System.out.println("Square of " + number + " is: " + square);
        System.out.println("Cube of " + number + " is: " + cube);

        valu.close();
    }
}
