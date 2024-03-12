public class Equal {
    public static void main(String[] args) {
        String nationality = "Inidan";
        int age = 23;
        if(nationality.equals("indian") && age>=18){
            System.out.println("Eligible for vote");
        }
        else if(nationality.equals("indian") ||  age>=18){
            System.out.println("Eligible for vote");
        }
        else{
            System.out.println("Not eligibnle for vote");
        }
    }
}
