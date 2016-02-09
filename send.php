<?php
    $count =0;
    while(isset($_POST[''.$count])){
        echo $_POST[''.$count].'<br>';
        $count++;
    }

?>
