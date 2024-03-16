import java.util.Scanner;

public class Basiccalculator {
    public static void main(String[] args) {
        Scanner obj = new Scanner(System.in);

        System.out.println("Enter first number: ");
        double num1 = obj.nextDouble();

        System.out.println("Enter second number: ");
        double num2 = obj.nextDouble();

        System.out.println("Enter the operator (+, -, *, /): ");
        char operator = obj.next().charAt(0);

        double result = 0;

        switch (operator) {
            case '+':
                result = num1 + num2;
                break;
            case '-':
                result = num1 - num2;
                break;
            case '*':
                result = num1 * num2;
                break;
            case '/':
                result = num1 / num2;               
                break;
           
        }

        System.out.println("Result: " + result);

        obj.close();
    }
}
