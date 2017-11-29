<?PHP
    require_once("kalenderSystem_db.php");

    $db = new DB("localhost", "root", "", "kalendersystem");

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

        //echo($SQL);
        //echo($types);
        //echo($values);
        $db->execute($SQL, $types, $values);
        echo("1");

    } else if (isset($_REQUEST["SQL"]) && isset($_REQUEST["types"]) && !isset($_REQUEST["values"])) {

        $types = $_REQUEST["types"];
        $SQL = $_REQUEST["SQL"];

        if($types == "¤") {
            
            //echo($SQL);
            $types = "";
            $values = "";
            $matrix = $db->execute($SQL, $types, $values);
            
        } else {
         
            echo("No types");

        }

    } else {

        echo("Missing arguments");
    }
?>