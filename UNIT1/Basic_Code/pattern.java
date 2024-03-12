// 1
// *
// 12
// **
// 123
// ***
// 1234
// ****
// 12345
// *****
// 123456
// ******
// 1234567
// *******
// 12345678
// ********
// 123456789
// *********

// public class pattern {
//     public static void main(String[] args) {
        
//         for(int i=1; i<=9;i++){

//             String str="";
//             for(int j=1; j<=i; j++){
//                 str+=j;
//             }
//             System.out.println(str);

//             str="";
//             for(int k=1; k<=i; k++){
//                 str+="*";
//             }
//             System.out.println(str);
//         }
//     }
// }


/////////////////////////////////////////////////////////////////////

// public class pattern {
//     public static void main(String[] args) {
        
//         for(int i=1; i<=9;i++){

//             for(int j=1; j<=i; j++){
//                 System.out.print(j);
//                 System.out.print("*");
//             }
//             System.out.println();
            

//         }
//     }
// }

////////////////////////////////////////

//    *
//   ***
//  *****
// *******


// public class pattern {
//     public static void main(String[] args) {
//         int N=4;

//         for(int i=1; i<=N; i++){

//             String str="";
//             for(int k=N-i; k>=0; k--){
//                 str+=" ";
                
//             }
//             // System.out.println(" ");
            
//             // str="";
//             for(int j=1; j<=(2*i-1); j++){
//                 str +="*";
//             }
//             System.out.println(str);
//         }
        
    
//     }
// }

///////////////////////////////////////////////////////

public class pattern {
    public static void main(String[] args) {
        int N=5;

        for(int i=1; i<=N; i++){

            String str="";
            for(int j=1; j<=5; j++){
                if(i==j || j==1 || i==N){
                    str+="*";
                }
                else{
                    str+=" ";
                }

                
            }
            System.out.println(str);
            
        }
        
    
    }
}