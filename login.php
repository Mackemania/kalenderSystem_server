<?PHP
    require_once("kalenderSystem_db.php");
    $db = new DB("localhost", "root", "", "kalendersystem");

    if(isset($_REQUEST["username"]) && isset($_REQUEST["password"])) {

        $user = $_REQUEST["username"];
        $password = $_REQUEST["password"];
        
        $SQL = "SELECT userID FROM Users WHERE username=? AND BINARY password=?";
        $types= "ss";
        $params= [$user, $password];
        $matrix = $db->getData($SQL, $types, $params);

        if(count($matrix)==1) {

            $hashkey= "";
            while(strlen($hashkey)<30) {

                $hashkey= "";
                for($i=0; $i<30; $i++) {

                    $int= random_int(48, 122);
                    if($int == 92) {
                        $int = 32;
                    }
                    $hashkey= $hashkey.chr($int);
                }
            }
            $userID= $matrix[0][0];
            $SQL = "INSERT INTO hash(userID, hash) VALUES(?, ?)";
            $types= "is";
            $params= [$userID, $hashkey];
            $db->execute($SQL, $types, $params);

            $userHash= [$userID, $hashkey];
            $userHash= json_encode($userHash, JSON_FORCE_OBJECT);
            echo($userHash);
        } else {

            echo "0";
        }
    } else {

        echo "0";
    }
    
?>