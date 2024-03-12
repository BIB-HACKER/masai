// import java.util.*;

// byte(1)>short(2)>char(2)<boolean(1)<int(4)<long(8)<float(4)<double(8) 



public class TypeCast {

       public static void main(String[] args) {
           char char1 = 'A';
           char char2 = 'a';
           int b = 65;
           char bc = (char) b; // type cast
           int x = char1;
           int y = char2;

           System.out.println("ASCII value of '" + char1 + "' is " + x);
           System.out.println("ASCII value of '" + char2 + "' is " + y);
           System.out.println("ASCII value of '" + b + "' is " + bc);
       }
   }