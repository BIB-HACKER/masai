class book {
    public String author;
    public String title;

    public static void show(){
        System.out.println("Author :"+ author);
        System.out.println("Title :"+ title);
    }

    public static void main(String[] args) {
        book reachdad=new book();  // object created
        reachdad.author="Bibhakar";  
        reachdad.title="make money";

        book poorhdad=new book();  // object created
        poorchdad.author="Bibhakar";
        poorchdad.title="make money";

        reachdad.show();
        poorhdad.show();
    }
}
