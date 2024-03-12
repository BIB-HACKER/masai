class Mainclass{
      public static void main(String[] args) {
        sample sample = new sample();
        System.out.println(sample.publicvar); // 1
        // System.out.println(sample.protectedvar); // 2
        // System.out.println(sample.privatevar); // 3
}
}


class sample {
    public int publicvar=1; // accessible form anuwere
    protected int protectedvar=2; // accessible within package and subclass
    private int privatevar = 3; // accessible only within sample class

    public void display() {
        System.out.println(publicvar);
        System.out.println(protectedvar);
        System.out.println(privatevar);
    }
  
}

