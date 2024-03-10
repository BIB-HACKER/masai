public class Vegetable {
    public static void main(String[] args) {
        String[] veg = new String[]{"banana", "onion", "tomato", "gajar", "mator"};
        System.out.println(veg[0]);
        System.out.println(veg[1]);
        System.out.println(veg[2]);
        System.out.println(veg[3]);
        System.out.println(veg[4]);
        System.out.println();

        int last_index=veg.length-1;
        for(int i=0; i<=last_index; i++){
            System.out.println(veg[i]);
        }
    }
}
