public class count {
    public static void main(String[] args) {
        int rem=0;
        int sum=0;
        int num=123;

        while(num!=0){
            rem=num%10;
            sum+=rem;
            num=num/10;
        }
        System.out.println(sum);

    }
    
}