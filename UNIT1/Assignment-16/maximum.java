class minimum{
  public static void main(String[] args){
    int[] arr = {15, 2, 34, 8, 19};

    int max = arr[0];
    for(int i=0; i<arr.length; i++){
      if(arr[i] >max){
        max=arr[i];
      }
    }
    System.out.println(max);
  }
}