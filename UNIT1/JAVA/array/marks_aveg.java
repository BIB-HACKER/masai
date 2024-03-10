public class marks_aveg {
    public static void main(String[] args) {
        int[] subject_marks = new int[]{10,15,19,20,21};

        int sum_marks=0;

        // sum_marks=subject_marks[0]+subject_marks[1]
        //          +subject_marks[2]+subject_marks[3]+subject_marks[4]


        for(int i=0; i<=subject_marks.length-1; i++){
            sum_marks+=subject_marks[i];
        }
        System.out.println(sum_marks);

        double aveg = sum_marks/subject_marks.length;
        System.out.println(aveg);
    }
}
