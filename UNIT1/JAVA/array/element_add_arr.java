public class element_add_arr {
    public static void main(String[] args) {
        int[] arr = new int[]{1,3,5,7,9};

        // add 10 more element
        int[] new_arr = new int[10];
        // new_arr[0]=arr[0];
        // new_arr[1]=arr[1];
        // new_arr[2]=arr[2];
        // new_arr[3]=arr[3];

        // moving teh element from older to new array
        for(int i=0; i<=arr.length-1; i++){
            new_arr[i]=arr[i];
        }

        new_arr[5]=20;
        new_arr[6]=120;

        for(int i=0; i<=new_arr.length-1; i++){
            System.out.println(new_arr[i]);
        }
    }
}
