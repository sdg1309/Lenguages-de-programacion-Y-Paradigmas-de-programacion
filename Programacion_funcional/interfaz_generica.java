interface TestGeneric<T>{
  boolean test(T n, T m);
}

public class interfaz_generica{
   public static void main(String[] args){
    TestGeneric<Integer> isFactor = (n,d) -> (n%d)==0;
    if(isFactor.test(4, 10)){
      System.out.println("Hola");
    }
   }

}