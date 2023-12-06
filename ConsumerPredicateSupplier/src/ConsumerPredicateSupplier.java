import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.function.Consumer;
import java.util.function.Predicate;
import java.util.function.Supplier;

// Consumer Predicate Supplier is functional interface use for stream api +  lambda esxpresseion
public class ConsumerPredicateSupplier {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<Integer> lst = Arrays.asList(1, 5, 3, 8, 9, 7, 6, 0);

		Collections.sort(lst);

		// lst.forEach(new Consum());
		// lst.forEach(new Consumer<Integer>() {public void accept(Integer t){
		// System.out.println(t); }});
		// lst.forEach(System.out::println);
		// lst.stream().forEach(t->System.out.println(t));

		// lst.stream().filter(new Predi()).forEach(t->System.out.println(t));
		// lst.stream().filter(t-> t%2==0).forEach(System.out::println);

		List<String> str = Arrays.asList("h", "e");
		Supplier<String> su = () -> "supplier functional interface";
		// System.err.println(su.get());
		// System.out.println(str.stream().findAny().orElseGet(new Supp()));
		List lt = Arrays.asList();
		System.err.println(lt.stream().findAny().orElseGet(() -> " this is another supplier"));
	}
}

class Consum implements Consumer<Integer> {

	@Override
	public void accept(Integer t) {
		// TODO Auto-generated method stub
		System.out.println(t);
	}

}

class Predi implements Predicate<Integer> {

	@Override
	public boolean test(Integer t) {
		if (t % 2 == 1) // odd
			return true;
		else
			return false;
	}

}

class Supp implements Supplier<String> {

	@Override
	public String get() {
		// TODO Auto-generated method stub
		return "supplier for print only";
	}

}