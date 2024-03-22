class problem4 {

public static void listMultiples(int n, int limit) {
  for (int i= 1; i <= limit; i++) {
    System.out.print(n * i + "," + " ");
  }
}

public static void main(String[] args) {


  listMultiples(3,5);

}
}