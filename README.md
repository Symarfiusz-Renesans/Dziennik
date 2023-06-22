# Dziennik
Aplikacja bazodanowa działająca na PHP, której baza działa na SQL Server Management Studio. Aplikacja również używa HTML i SASS.

## Jak uruchomić na swojej maszynie
Aby Aplikacja działała, jak trzeba, na maszynie musi być zainstalowany SQL Server Management Studio (najlepiej 19) oraz XAMPP z wtyczkami obsługującymi SQL Server. 
Po zainstalowaniu potrzebnych programów i jej odpowiedniej konfiguracji należy zaimportować bazę danych *praktyki.sql*, którą można znaleźćw folderze: kopiaZapasowaBazy. Zaleca się również przełączyć logowanie na "SQL Server Authentication".
Następnie w folderze *czystyPHP* znajduje się plik o nazwie: *check.php* który łączy się z SQL Server. Aby jednak działał on poprawnie, potrzeba zamienić w nim jedną rzecz, a mianowice wartość zmiennej *$serverName* na nazwę Serwera, na której jest postawiona baza danych

## Co działa?
Na chwilę obecną projekt jest niekompletny i nie działa w całości.
Działa jedynie częściowo *index.php*, które sprawdza czy jest użytkownik jest zalogowany. Jeśli nie odsyła go do strony *logowanie.php*, które działa w całości.
Sama baza danych nie ma na chwilę obecną żadnych większych błędów, ale prawie w całości jest pusta, a niestety coraz trudniej o generatora danych w internecie (na serio, gdzie one zniknęły?).

## Ciąg dalszy nastąpi!
Proszę o cierpliwość!
