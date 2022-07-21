<?php 
    // host, server username, server password, database
    $connection = mysqli_connect('localhost', 'root', '', 'exam-portal');
    if(!$connection){
        die('Database Connection Error!');
    }
    $base_url = "http://" . $_SERVER['SERVER_NAME'] . "/exam-portal";
?>