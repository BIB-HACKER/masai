public class Main {
    public static void main(String[] args) {
        String name = "Bibhakar paul";
        int age = 23;

        System.out.println(name + " " + age+" ");
        System.out.print("Name variable type: " + name.getClass().getSimpleName()+" ");
        System.out.println("and "+((Object) age).getClass().getSimpleName());
    }
}

