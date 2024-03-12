public class Main {
    public static void main(String[] args) {
        String name = "Bibhakar paul";
        int age = 23;

        System.out.println(name + " " + age+" ");
        System.out.print("Name variable type: " + name.getClass().getSimpleName()+" ");
        System.out.println("and "+((Object) age).getClass().getSimpleName());
    }
}

// public class Main {
//     public static void main(String[] args) {
//         String name = "ChatGPT";
//         int age = 5;

//         System.out.println(name + " " + age);
//         System.out.println("Name variable type: " + getVariableType(name));
//         System.out.println("Age variable type: " + getVariableType(age));
//     }

//     public static String getVariableType(Object variable) {
//         if (variable instanceof String) {
//             return "String";
//         } else if (variable instanceof Integer) {
//             return "Integer";
//         } else if (variable instanceof Double) {
//             return "Double";
//         } // Add more checks for other types if needed
//         else {
//             return "Unknown";
//         }
//     }
// }