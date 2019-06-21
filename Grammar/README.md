Jezyk to Python, z taką różnicą że zamiast używać tab-ów do oznaczania bloków kodu, używam tak jak w C {} .
W języku nie ma nietypowych instrukcji. Załączona gramatyka pokazuje jakie instrukcje wspiera język.

## Cechy języka
* Identyfikatory(zmienne oraz funkcje) mają widoczność statyczną.
* Język wspiera 5 typów - Int, Boolean, String, List i Tuple
* Język jest typowany dynamicznie.
* Przekazywanie do funkcji odbywa się przez wartość.
* Funkcje przyjmują jeden argument i mogą zwrócić wartość, przy pomocy słowa kluczowego **return**. Zatrzymuje ono wykonanie funkcji zwracając wynik. Możliwe są wywołania rekurencyjne. Można dowolnie zagnieżdzać funkcje z zachowaniem poprawności statycznego wiązania identyfikatorów.
* Wspieram "const assign" np const a = 5 . Oznacza to, że od tej pory wykonanie innego przypisania do zmiennej a, będzie skutkowało błędem.
* Pętla for oblicza początek i koniec zakresu, w momencie jej wywołania. Po każdym obrocie korzysta z poprzednio wyliczonych wartości. Iterator jest typu const, próba przypisania czegoś na iterator skutkuje błędem.
* Wspieram priorytety operatorów, zgodnie z [tym](https://interactivepython.org/runestone/static/CS152f17/Appendices/PrecedenceTable.html)
* Wspieram listy. Listy mają swój rozmiar, który zwiększa się automatycznie przy każdym użyciu .append(x) . 
Można za pomocą operatora [] odwoływać się do konkretnych elementów listy, oraz przypisywać wartości konkretnym elementom.
* Wspieram tuple. Można za ich pomocą grupować zmienne a potem je rozpakowywać. Są one niezmienne.
* Wspieram obsługę błędów wykoanania np: dzielenie przez zero, odwołanie się do nieistniejącego miejsca w tablicy.
* Wspieram funkcje przyjmujące i zwracające wartość dowolnych typów.

Spodziewam się 26 pkt.