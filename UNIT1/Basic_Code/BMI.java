// Implement a Body Mass Index (BMI) calculator in Java. The program should take height (in meters) and weight (in kilograms), then calculate and print the BMI using the formula:
// BMI = weight (kg) / (height (m))^2

import java.util.Scanner;

public class BMI {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Enter your weight in kilograms: ");
        double weight = scanner.nextDouble();

        System.out.println("Enter your height in meters: ");
        double height = scanner.nextDouble();

        // Calculate BMI
        double bmi = weight / (height * height);

        System.out.println("Your BMI is: " + bmi);

        scanner.close();
    }
}
