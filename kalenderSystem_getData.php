<?PHP
    require_once("kalenderSystem_db.php");

    $db = new DB("localhost", "root", "", "test2");

    if(isset($_REQUEST["SQL"]) && isset($_REQUEST["types"]) && isset($_REQUEST["values"])) {
        
        $SQL = $_REQUEST["SQL"]; 
        $types = $_REQUEST["types"];
        $values = $_REQUEST["values"];

        $temp = json_decode($values, true);

        if(count($temp)>1) {
            $values = array();
            for($i = 0; $i<count($temp); $i++) {
            
                $values[$i] = $temp["".$i];
            
            }

        } else {

            $values = $temp["0"];
        }

        $matrix = $db->getData($SQL, $types, $values);
        $matrix = json_encode($matrix, JSON_FORCE_OBJECT);
        echo($matrix);

    } else if (isset($_REQUEST["SQL"])) {

        $SQL = $_REQUEST["SQL"];
        //echo($SQL);
        $types = "";
        $values = "";
        $matrix = $db->getData($SQL, $types, $values);
        $matrix = json_encode($matrix, JSON_FORCE_OBJECT);
        echo($matrix);

    } else {

        echo("FEL");
    }
?>