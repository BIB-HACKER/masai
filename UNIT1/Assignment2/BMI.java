import java.util.Scanner;

public class BMI {
    public static void main(String[] args) {
        Scanner l = new Scanner(System.in);

        System.out.println("Enter your weight in kilograms: ");
        float weight = l.nextFloat();

        System.out.println("Enter your height in meters: ");
        float height = l.nextFloat();

        // Calculate BMI
        float bmi = weight / (height * height);

        System.out.println("Your BMI is: " + bmi);

        l.close();
    }
}

