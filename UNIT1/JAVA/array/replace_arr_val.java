public class replace_arr_val {
    public static void main(String[] args) {
        int[] arr = new int[]{1,3,5,7,9,23,56,778};
        
        int last_index=arr.length-1;
        for(int i=0; i<=last_index; i++){
            if(arr[i]<=3){
                arr[i]+=6;
            }
        }
        for(int i=0; i<=last_index; i++){
            System.out.println(arr[i]);
        }
    }
}