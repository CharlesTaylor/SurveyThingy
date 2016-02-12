//TODO Display a chart according to current results after implementing a datbase

<?php

    $mysqli = mysqli_connect("ADDRESS", "USER", "PASS", "survey_database_of_stuff");
    if (mysqli_connect_errno($mysqli)) {
        echo "Failed to connect to MySQL: " . mysqli_connect_error();
    }
    $result = mysqli_query($mysqli,"SELECT *");
    $row = mysqli_fetch_assoc($res);
    echo $row;

    $count =0;
    while(isset($_POST[''.$count])){
        echo $_POST[''.$count].'<br>';
        $count++;
    }

?>
