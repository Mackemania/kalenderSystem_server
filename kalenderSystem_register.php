<?PHP

    require_once("kalenderSystem_db.php");
    $db = new DB("localhost", "root", "", "kalendersystem");

    if(isset($_REQUEST["username"]) && isset($_REQUEST["password"]) && isset($_REQUEST["email"]) && isset($_REQUEST["firstName"]) && isset($_REQUEST["lastName"])) {
        
        $username = $_REQUEST["username"];
        $password = $_REQUEST["password"];
        $email = $_REQUEST["email"];
        $firstName = $_REQUEST["firstName"];
        $lastName = $_REQUEST["lastName"];

        $SQL = "SELECT username FROM users WHERE username = ? OR email = ?";
        $types = "ss";
        $values = [$username, $email];
        $matrix = $db->getData($SQL, $types, $values);

        if(count($matrix) == 0) {

            $SQL = "INSERT INTO users(username, password, email, firstName, lastName) VALUES(?, ?, ?, ?, ?)";
            $types = "sssss";
            $values = [$username, $password, $email, $firstName, $lastName];
            $db->execute($SQL, $types, $values);
            
            echo("1");

        } else {

            echo("Username or E-mail already in use");
        }

    } else {

        echo("Missing arguments");
    
    }

?>