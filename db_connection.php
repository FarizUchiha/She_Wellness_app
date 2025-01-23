<?php
// File: db_connection.php
$host = 'localhost';
$user = 'root';
$password = ''; // Set your MySQL root password
$database = 'wellness_app';

$conn = new mysqli($host, $user, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>