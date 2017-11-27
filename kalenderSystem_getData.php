<?PHP
    require_once("kalenderSystem_db.php");

    $db = new DB("localhost", "root", "", "test2");

    if(isset($_REQUEST["SQL"]) && isset($_REQUEST["types"]) && isset($_REQUEST["values"])) {
        
        $SQL = $_REQUEST["SQL"]; 
        $types = $_REQUEST["types"];
        $values = $_REQUEST["values"];

    } else if (isset($_REQUEST["SQL"])) {

        $SQL = $_REQUEST["SQL"];
        //echo($SQL);
        $types = "";
        $values = "";
        $matrix = $db->getData($SQL, $types, $values);
        
        $matrix = json_encode($matrix, JSON_FORCE_OBJECT);
        echo($matrix);

    } else {
        $SQL = "SELECT * FROM col";
        echo("FEL");
    }
?>