class problem3{

  public static int Area(int length, int breadth){
    return length*breadth;
  }
  public static int Perimeter(int length, int breadth){
    return (length+breadth)*2;
  }

  public static void main(String[] args){
    System.out.println(Area(2,3));
    System.out.println(Perimeter(2,3));
  }
}