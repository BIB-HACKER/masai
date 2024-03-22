class Problem1{
public static double Distance(double x1,  double x2, double y1,double y2){
  return (Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2));
  
}

public static void main(String[] args){
  double x1 = 2, x2 = 3, y1=5, y2=7;
  double Distance = Distance(x1, x2, y1,y2);
  System.out.println(Distance);
}
}