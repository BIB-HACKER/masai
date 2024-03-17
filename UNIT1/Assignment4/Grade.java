import java.util.Scanner;

public class Grade {
    public static void main(String[] args) 
  {
        Scanner n = new Scanner(System.in);

        System.out.print("Enter your score: ");
        int score = n.nextInt();

        String grade;

        if (score >= 90 && score <= 100) {
            grade = "A";
        } else if (score >= 80 && score <= 89) {
            grade = "B";
        } else if (score >= 70 && score <= 79){
            grade = "C";
        } else if (score >= 60 && score <= 69){
            grade = "D";
        } else if(score < 60) {
            grade = "F";
        } else {
            grade = "Invalid score";
        }

        System.out.println("Your grade is: " + grade);
    }
}
