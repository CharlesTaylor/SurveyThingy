<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
require_once("auth.php");
$mysqli = mysqli_connect($host, $username, $pass, $database);
if (mysqli_connect_errno($mysqli)) {
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
}




$count =0;
//echo $_POST['cnt'];
while($count <= $_POST['cnt']){
    if(isset($_POST[''.$count])){


        $ar = explode(" ",$_POST[''.$count]);
        echo $ar[0]." - ".$ar[1];
        $sql = "UPDATE `Selection` SET `S_score`=`S_score`+1 WHERE `SQ_ID` = 1 AND `S_text` = \"YES\"";

        $result = mysqli_query($mysqli,$sql);
    }

    $count++;
}

?>
