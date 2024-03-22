class minimum{
  public static void main(String[] args){
    int[] arr = {15, 2, 34, 8, 19};

    int min = arr[0];
    for(int i=0; i<arr.length; i++){
      if(arr[i] <min){
        min=arr[i];
      }
    }
    System.out.println(min);
  }
}