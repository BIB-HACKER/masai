public class BinarytoDecimal {

    public static void convertbinary(int a){
        int pow=0;
        int deci=0;
        int b=a;
        while(b>0){
            int lastnum=b%10;
            deci+=lastnum*((int)Math.pow(2,pow)); // Formula Binary to Decimail
            pow++;
            b=b/10;
        }
        System.out.println("Decimal of "+a+" is "+deci);
    }
    public static void main(String[] args) {
        convertbinary(101);
    }
}
