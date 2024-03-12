class circle {
    double radius;
    

    circle(double r){
        radius = r;
    }

    public void calculateArea(){
        double area = 3.14 + radius + radius;
        System.out.println("Area is "+area);
    }

    public static void main(String[] args) {
        
        circle c1 = new circle(2.0);
        c1.calculateArea();
    }
}
