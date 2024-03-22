class problem6{
  
  public static double calculateAverage(int[] arr){
    int sum=0;
    for(int i=0; i<arr.length; i++){
      sum+=arr[i];
    }
    return (double) sum/arr.length;
  }

  public static void main(String[] args){
   
    int[] arr = {10, 15, 20, 25};
    double val =calculateAverage(arr);
    System.out.println(val);
  }


}