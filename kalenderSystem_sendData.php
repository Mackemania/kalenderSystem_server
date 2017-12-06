<?PHP
    require_once("kalenderSystem_db.php");

    $db = new DB("localhost", "root", "", "kalendersystem");

    if(isset($_REQUEST["SQL"]) && isset($_REQUEST["types"]) && isset($_REQUEST["values"]) && isset($_REQUEST["userID"]) && isset($_REQUEST["hashkey"])) {
        
        $userID = $_REQUEST["userID"];
        $hash = $_REQUEST["hashkey"];

        $SQL = "SELECT userID FROM hash WHERE hash=? AND userID=?";
        $types = "si";
        $values = [$hash, $userID];

        $matrix = $db->getData($SQL, $types, $values);

        if(count($matrix) == 1) {
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

            //echo($SQL);
            //echo($types);
            //echo($values[0]);
            
            $db->execute($SQL, $types, $values);
            echo("1");
        } else {

            echo("0");

        }

    } else {

        echo("Missing arguments");

    }
?>