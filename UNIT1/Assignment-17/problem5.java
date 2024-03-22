class problem5 {

  int fac=1;
  public int calculateFactorial(int n){
    for(int i=1; i<=n; i++){
      fac*=i;
    }
    return fac;
  }

  public static void main(String[] args){
    problem5 p5 = new problem5();
    int val=p5.calculateFactorial(5);
    System.out.println(val);
    
  }
  

}