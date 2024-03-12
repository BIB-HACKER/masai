public class DecimaltoBinary {
    public static void DeciToBin(int a){
        int p=a;
        int pow=0;
        int deci=0;
        while(a>0){
            int rem=a%2;
            deci+=rem*(Math.pow(10,pow));
            pow++;
            a=a/2;
        }
        System.out.println("Decimal no. "+p+" convert to binary no. "+deci);
    }
    public static void main(String[] args) {
        DeciToBin(15);
    }
}
