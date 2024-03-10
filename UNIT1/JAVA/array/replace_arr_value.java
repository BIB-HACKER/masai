public class replace_arr_value {
    public static void main(String[] args) {
        String[] veg = new String[]{"banana", "onion", "tomato", "gajar", "mator"};

        int last_index=veg.length-1;
        for(int i=0; i<=last_index; i++){
            if(i==1){
                veg[1]="alu";
            }
        }
       
        for(int i=0; i<=last_index; i++){
            System.out.println(veg[i]);
        }
    }
}
