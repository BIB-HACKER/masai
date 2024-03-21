public class Problem10 {
    public static void main(String[] args) {
        int size = 5;
      
        for (int i = 1; i <= size; i++) {
            for (int j = i; j < size; j++) {
                System.out.print(" ");
            }
            for (int j = 1; j <= (2 * i - 1); j++) {
                if (i == size || j == 1 || j == (2 * i - 1)) {
                    System.out.print("*");
                } else {
                    System.out.print(" "); 
                }
            }
            System.out.println("\n"); 
        }
    }
}
