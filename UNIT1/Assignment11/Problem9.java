public class Problem9 {
    public static void main(String[] args) {
        int size = 5;
      
        for (int i = 1; i <= size; i++) {
            for (int j = 1; j <= size; j++) { 
                if (j == 1 || i == size || i == j) {
                    System.out.print("*");
                } else {
                    System.out.print(" "); 
                }
            }
            System.out.println("\n"); 
        }
    }
}
