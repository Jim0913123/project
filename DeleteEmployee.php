<?php
include 'dbconnect.php';

if (isset($_GET['id'])) {
    $empID = $_GET['id'];
    
    $sql = "DELETE FROM Employee WHERE TEmpID=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $empID);

    if ($stmt->execute()) {
        echo "<script>alert('Record Deleted Successfully'); window.location='ViewEmployees.php';</script>";
    } else {
        echo "<script>alert('Error Deleting Record');</script>";
    }
}

$conn->close();
?>
