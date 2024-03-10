//INSERTION
public class mid_val_add_arr {
    public static void main(String[] args) {
        int[] arr = new int[]{1,3,5,7,9,0,0};

        int pos=1;
        int val=4444;
//manual
        // arr[5]=arr[4];
        // arr[4]=arr[3];
        // arr[3]=arr[2];
        // arr[2]=arr[1];

        // arr[1]=val;
//genaric
        for(int i=5; i>=pos+1; i--){
            arr[i]=arr[i-1];
        }
        arr[1]=val;
 
        for(int i=0; i<=arr.length-1; i++){
            System.out.println(arr[i]);
        }
    }
}
