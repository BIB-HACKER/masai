// public class practice {
//     public static void main(String[] args) {
//         int N=4;
//         int i=0;
//         while(i<N){
//             int j=0;
//             while(j<N){
//                 if(j%2==0){
//                     System.out.print(j+" ");
//                     j++;
//                 }
//                 else{
//                     break;
//                 }
//                 j++;
//             }
//             i++;
//         }
//     }
// }


// public class practice {
//     public static void main(String[] args) {
//         int N=4;
//         int i=0;
//         while(i<N){
//             int j=0;
//             while(j<i){
//                 System.out.print(j+" ");
//                 j++;
//             }
//             i++;
//         }
//     }
// }

/////////////////////////////////

public class practice {
    public static void main(String[] args) {
       for(int i=0; i<=4; i++){
        for(int j=0; j<i; j++){
            System.out.print((i+j)+" ");
        }
       }
    }
}
