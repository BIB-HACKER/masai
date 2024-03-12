class car{

    // Attributes
     public String brand; // this not acceseable for all
     public int speed;

   //  static String brand; // this (static) acceseable for all
   //  static int speed;

   // Methods
   public static void printInfo(){
      System.out.println("brand : "+brand);
      System.out.println("speed : "+speed);
   }

     public static void main(String[] args) {
        car tata=new car();  // object created
        tata.brand = "TATA"; 
        tata.speed = 300;
        
        car landrover = new car();  // object created
        landrover.brand= "landrover";
        landrover.speed= 400;
      // brand = "tata";
      // System.out.println(brand);

      tata.printInfo();
      landrover.printInfo();
     }

}
