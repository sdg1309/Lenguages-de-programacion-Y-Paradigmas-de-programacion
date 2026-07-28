import java.util.stream.IntStream;

public class Comparación {
    /*Crear un vecto de tipo int para 10 valores
    Mostra la sumatoria, la cantidad, los que mayores o iguales a 4
mostrar promedio
     */

    public static void main(String[] args) {
        int fuente[] = {4, 5, 74, 52, 14, 95, 8};
        int sum = 0;

         // Aqui se usa programacion tradicional con un ciclo for
        for (int i = 0; i < fuente.length; i++) {
            sum += fuente[i];
        }
        System.out.println("La sumatoria es: " + sum);
        System.out.println("La cantidad de elementos en la fuente es: " + fuente.length);
        double prom=sum/fuente.length;
        System.out.println("El promedio es: " + prom);
        System.out.println("");

        //  Aqui se usa un flujo (IntStream) para llegar al mismo objetivo que con un ciclo for, esta es una palicacion de programacion funcional
        System.out.printf("La sumatoria es: %d%n", IntStream.of(fuente).sum()); 
        // Se un flujo de ints dentro de fuente y se suman
        System.out.println("");
        System.out.printf("La cantidad de elementos en la fuente es %d", IntStream.of(fuente).count());
        System.out.println("");
        System.out.printf("El promedio es: %.2f%n", IntStream.of(fuente).average().getAsDouble());


    }
}
