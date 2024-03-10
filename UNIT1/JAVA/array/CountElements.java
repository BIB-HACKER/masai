import java.util.*;
public class CountElements{
	public static int countElements(ArrayList<Integer> arr){
	int count =0;
	for(int element : arr){
	   if(arr.contains(element+1)){
	     count++;
	
	   }
	}
	return count;

	}

	public static void main(String args[]){
	ArrayList<Integer> arr = new ArrayList<>(List.of(1,2,3));
	System.out.println("Output for Example: "+ countElements(arr));

	ArrayList<Integer> arr2 = new ArrayList<>(List.of(1, 1, 3, 3, 5, 5, 7, 7));
	System.out.println("Output for Example 2: " + countElements(arr2));
	}
}