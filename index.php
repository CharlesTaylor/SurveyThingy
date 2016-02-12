<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <?php
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);
    $mysqli = mysqli_connect("ADDRESS", "USER", "PASS", "survey_database_of_stuff");

    if (mysqli_connect_errno($mysqli)) {
        echo "Failed to connect to MySQL: " . mysqli_connect_error();
    }
    $sql = "SELECT * FROM `Question` WHERE Q_surveyID = 1 LIMIT 0, 30 ";
    $result = mysqli_query($mysqli,$sql);

    $json = "{";
    while($item  = mysqli_fetch_array($result)){

        $json = $json."\"".$item['ID']."\":{\"q\":\"".$item['Q_text']."\",\"s\":[";
        $sql = "SELECT * FROM `Selection` WHERE SQ_ID = ".$item['ID'] ." LIMIT 0, 30 ";
        $ressel = mysqli_query($mysqli,$sql);
        while($sel  = mysqli_fetch_array($ressel)){
            $json = $json."\"".$sel['S_text']."\",";
        }
        $json = substr($json,0,strlen($json)-1)."]},";
    }
    $json = substr($json,0,strlen($json)-1)."}";
    echo "<script> var data = JSON.parse('".$json."'); </script>\n";





    ?>
    <script type="text/javascript" src="script.js"></script>
    <style>
        body{
            background-color: #262626;
            align-items:center;

        }
        section{
            background-color: antiquewhite;
            vertical-align: middle;
            margin: 0 auto;
            width: 40%;
        }
        #submit{
            background-color: antiquewhite;
            vertical-align: middle;
            margin: 0 auto;
            width: 100%;
            background-color:sandybrown;
        }

    </style>
</head>
<body>
<form action="send.php" method="POST">
    <div id="q">

    </div>
    <section>
        <input id="submit" type="submit">
    </section>

</form>




<script>load();</script>
</body>
</html>