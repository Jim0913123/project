<?php
include 'dbconnect.php';

if (isset($_POST['saverec'])) {
    $pempID = $_POST['EmpID'];
    $pfn = $_POST['fname'];
    $pmn = $_POST['mname'];
    $plastn = $_POST['lname'];
    $pD_id = $_POST['D_id'];
    $pRC = $_POST['rankcode'];

    $sql = "INSERT INTO Employee (TEmpID, Tfn, Tmn, Tln, TdeptID, Trankcode) 
            VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssss", $pempID, $pfn, $pmn, $plastn, $pD_id, $pRC);

    if ($stmt->execute()) {
        echo "<script>alert('Record Successfully Created'); window.location='ViewEmployees.php';</script>";
    } else {
        echo "Error: " . $stmt->error;
    }
    $stmt->close();
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Employee</title>
    <link rel="stylesheet" href="mycss.css"> <!-- External CSS -->
    
</head>
<body>

    <h1 class="size">Add Employee</h1>

    <div class="form-container">
        <form action="" method="POST">
            <div class="form-group">
                <label>Employee ID:</label> 
                <input type="text" name="EmpID" required>
            </div>

            <div class="form-group">
                <label>First Name:</label> 
                <input type="text" name="fname" required>
            </div>

            <div class="form-group">
                <label>Middle Name:</label> 
                <input type="text" name="mname">
            </div>

            <div class="form-group">
                <label>Last Name:</label> 
                <input type="text" name="lname" required>
            </div>

            <div class="form-group">
                <label>Department ID:</label> 
                <input type="text" name="D_id" required>
            </div>

            <div class="form-group">
                <label>Rank Code:</label> 
                <input type="text" name="rankcode" required>
            </div>

            <div class="submit-btn">
                <input type="submit" name="saverec" value="Save Record">
            </div>
        </form>
    </div>

</body>
</html>
