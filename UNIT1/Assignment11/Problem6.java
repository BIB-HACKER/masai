public class Problem6 {
    public static void main(String[] args) {
        int size = 6;
      
        for (int i = 1; i <= size; i++) {
            for (int j = 1; j <= size - i; j++) {
                System.out.print(" ");
            }
            for (int j = 1; j <= 2 * i - 1; j++) {
                System.out.print("*");
            }
            System.out.println("\n");
        }
    }
}
