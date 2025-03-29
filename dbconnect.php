<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbn = "W5A1Erosido";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbn);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
?>
