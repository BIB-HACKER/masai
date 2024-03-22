class problem7{

  public static String reverseSentence(String str){
    String[] arr = str.split(" ");
    String rev="";
    for(int i=0; i<=arr.length-1; i++){
      for(int j=arr[i].length()-1; j>=0; j--){
        rev+=arr[i].charAt(j);
      }
      rev+=" ";
      
    }
    return rev;
  }

  public static void main(String[] args){
    String str = "Hello World";
    String val = reverseSentence(str);
    System.out.println(val);
  }
  
}