import java.util.Scanner;

public class Discount {
  public static void main(String[] args) {
    Scanner buy = new Scanner(System.in);

    System.out.print("Enter the total purchase amount: ");
    double purchaseAmount = buy.nextDouble();

    if (purchaseAmount > 1000) {
      System.out.println("Congratulations! You got a 10% discount.");
    } else if (purchaseAmount >= 500 && purchaseAmount <= 1000) {
      System.out.println("Congratulations! You got a 5% discount.");
    } else {
      System.out.println("No discount is applied.");
    }
  }
}
