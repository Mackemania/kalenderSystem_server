<?PHP
    require_once("kalenderSystem_db.php");

    $db = new DB("localhost", "root", "", "kalendersystem");

    if(isset($_REQUEST["userID"]) && isset($_REQUEST["hashkey"])) {

        $userID = $_REQUEST["userID"];
        $hashkey = $_REQUEST["hashkey"];

        $SQL = "SELECT hashID FROM hash WHERE userID=? AND BINARY hash = ?";
        $types = "is";
        $values = [$userID, $hashkey];
        $matrix = $db->getData($SQL, $types, $values);
        
        if(count($matrix) == 1) {
            if(isset($_REQUEST["SQL"]) && isset($_REQUEST["types"]) && isset($_REQUEST["values"])) {
                
                

                
                $SQL = $_REQUEST["SQL"]; 
                $types = $_REQUEST["types"];
                $values = $_REQUEST["values"];
                //echo($values."</br>");
                //echo("<script>console.log('$values')</script>");
                $temp = json_decode($values, true);

                //echo($temp["0"]);

                if(count($temp)>1) {
                    $values = array();
                    for($i = 0; $i<count($temp); $i++) {
                    
                        $values[$i] = $temp["".$i];
                    
                    }

                } else {

                    $values = $temp["0"];
                }

                //echo($values);
                $matrix = $db->getData($SQL, $types, $values);
                $matrix = json_encode($matrix, JSON_FORCE_OBJECT);
                echo($matrix);

            } else if (isset($_REQUEST["SQL"]) && isset($_REQUEST["types"])) {

                $types = $_REQUEST["types"];
                $SQL = $_REQUEST["SQL"];

                if($types == "¤") {
                    //echo($SQL);
                    $types = "";
                    $values = "";
                    $matrix = $db->getData($SQL, $types, $values);
                    $matrix = json_encode($matrix, JSON_FORCE_OBJECT);
                    echo($matrix);
                } else {
                    echo("0");
                }

            } else {

                echo("0");
            }

        } else {

            echo("0");
        }

    } else {

        echo("0");
    }
?>