class problem8{

      public static int findGCD(int num1, int num2) {
          if (num2 == 0) {
              return num1;
          }
          return findGCD(num2, num1 % num2);
      }

      public static void main(String[] args) {
          int num1 = 36;
          int num2 = 48;

          int gcdResult = findGCD(num1, num2);
          System.out.println("gcdResult= " + gcdResult); 
      }
}