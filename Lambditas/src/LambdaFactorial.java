public class LambdaFactorial {
    interface NumericFunc {
        int testing(int n);
    }

    public static void main(String[] args) {

        NumericFunc factorial = (n) -> {
            int result = 1;
            for (int i = 1; i <= n; i++) {
                result = i * result;
            }
            return result;
        };
        System.out.println("El  factorial of 5 is " + factorial.testing(5));
    }
}
