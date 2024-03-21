public class Problem5  
{  
public static void main(String args[])  
{  
int rows=5;  
 
char symbol='*';  

for(int i=1; i<=rows; i++)  {  
for(int j=rows; j>i; j--)  {  
      
System.out.print(" ");  
}    
System.out.print(symbol);  
for(int j=1; j<(i-1)*2; j++)  
{       
System.out.print(" ");  
}  
if(i==1)  
{     
System.out.print("\n");  
System.out.print("\n");
}  
else  
{          
System.out.print(symbol+"\n");  
System.out.println();
}  
}    
for(int i=rows-1; i>=1; i--)  
{  
for(int j=rows; j>i; j--)  
{          
System.out.print(" ");  
}    
System.out.print(symbol);  
for(int j=1; j<(i-1)*2; j++)  
{  
    
System.out.print(" ");  
}  
if(i==1)  
{  
        
System.out.print("\n");  
}  
else  
{  
 
System.out.print(symbol+"\n");  
System.out.println();
}  
}  
}  
}  
