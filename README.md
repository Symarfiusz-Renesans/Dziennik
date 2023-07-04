# Dziennik
Aplikacja bazodanowa działająca na PHP, której baza działa na SQL Server Management Studio. Aplikacja również używa HTML i SASS.

## Jak uruchomić na swojej maszynie
Aby Aplikacja działała, jak trzeba, na maszynie musi być zainstalowany SQL Server Management Studio (najlepiej 19) oraz XAMPP z wtyczkami obsługującymi SQL Server. 
Po zainstalowaniu potrzebnych programów i jej odpowiedniej konfiguracji należy zaimportować bazę danych *praktyki.sql*, którą można znaleźćw folderze: kopiaZapasowaBazy. Zaleca się również przełączyć logowanie na "SQL Server Authentication".
Następnie w folderze *czystyPHP* znajduje się plik o nazwie: *check.php* który łączy się z SQL Server. Aby jednak działał on poprawnie, potrzeba zamienić w nim jedną rzecz, a mianowice wartość zmiennej *$serverName* na nazwę Serwera, na której jest postawiona baza danych

## Jak to funkcjonuje?
Gdy po raz pierwszy wejdzie się na stronę (lub po usunięciu się plików COOKIE) wita nas formularz do logowania. Chcąc się zalogować musimy wziąć jakikolwiek login i hasło (które domyślnie brzmi "admin") z tabeli 'uzytkownicy'.
W zależności do jakiego typu uzytkownika zalogowaliśmy się, czekają na nas różne opcje. Jedynym wyjątkiem jest strona *Dane o Szkole*, która, jak sama nazwa wskazuje pokazuje dane o szkole, do której dany użytkownik uczęszcza.

## Typy Użytkowników
 
### Student
Student ma 4 opcje, wliczając *Dane o Szkole*:

#### Pokaż Oceny
#### Pokaż Nauczycieli
#### Pokaż Praktyki
Ta opcja pokazuje się jedynie wtedy, gdy student jest w szkole branżowej lub technikum.

### Nauczyciel
Nauczyciel również ma 4 opcje:
#### Pokaż Studentów
#### Pokaż Praktyki
Pokazuje się jedynie wtedy, gdy nauczyciel jest opienkunem praktyk.
#### Wstaw Ocenę

### Dyrektor
Nauczyciel ma najwięcej, bo aż 7, opcji:

#### Pokaż Studentów
#### Pokaż Nauczycieli
#### Zmień Dyrektora
#### Zatrudnij nauczyciela
Dwa powyższe działają ino wtedy, gdy jest sierpień albo lipiec

#### Dodaj Studenta
#### Usuń Studenta
