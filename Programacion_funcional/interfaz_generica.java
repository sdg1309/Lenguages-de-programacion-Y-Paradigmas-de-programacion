interface TestGeneric<T>{
  boolean test(T n, T m);
}

public class interfaz_generica{
   public static void main(String[] args){
    TestGeneric<Integer> isFactor = (n,m) -> (n%m)==0;
    if(isFactor.test(10, 2)){
      System.out.println("Es divisible");
    }

    if(!isFactor.test(4, 10)){
      System.out.println("No es divisible");
    }

   }

}