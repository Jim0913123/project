<?php
include 'dbconnect.php';

if (isset($_GET['id'])) {
    $empID = $_GET['id'];
    $sql = "SELECT * FROM Employee WHERE TEmpID = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $empID);
    $stmt->execute();
    $result = $stmt->get_result();
    $employee = $result->fetch_assoc();
}

if (isset($_POST['update'])) {
    $empID = $_POST['EmpID'];
    $fname = $_POST['fname'];
    $mname = $_POST['mname'];
    $lname = $_POST['lname'];
    $deptID = $_POST['D_id'];
    $rankcode = $_POST['rankcode'];

    $sql = "UPDATE Employee SET Tfn=?, Tmn=?, Tln=?, TdeptID=?, Trankcode=? WHERE TEmpID=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssss", $fname, $mname, $lname, $deptID, $rankcode, $empID);

    if ($stmt->execute()) {
        echo "<script>alert('Record Updated Successfully'); window.location='ViewEmployees.php';</script>";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Update Employee</title>
    <link rel="stylesheet" type="text/css" href="mycss.css">
</head>
<body>
    <h1>Update Employee</h1>
    <div class="form-container">
        <form action="" method="POST">
            <div class="form-group">
                <label for="EmpID">Employee ID</label>
                <input type="text" id="EmpID" name="EmpID" value="<?= htmlspecialchars($employee['TEmpID']) ?>" readonly>
            </div>
            <div class="form-group">
                <label for="fname">First Name</label>
                <input type="text" id="fname" name="fname" value="<?= htmlspecialchars($employee['Tfn']) ?>" required>
            </div>
            <div class="form-group">
                <label for="mname">Middle Name</label>
                <input type="text" id="mname" name="mname" value="<?= htmlspecialchars($employee['Tmn']) ?>">
            </div>
            <div class="form-group">
                <label for="lname">Last Name</label>
                <input type="text" id="lname" name="lname" value="<?= htmlspecialchars($employee['Tln']) ?>" required>
            </div>
            <div class="form-group">
                <label for="D_id">Department ID</label>
                <input type="text" id="D_id" name="D_id" value="<?= htmlspecialchars($employee['TdeptID']) ?>" required>
            </div>
            <div class="form-group">
                <label for="rankcode">Rank Code</label>
                <input type="text" id="rankcode" name="rankcode" value="<?= htmlspecialchars($employee['Trankcode']) ?>" required>
            </div>
            <div class="submit-btn">
                <input type="submit" name="update" value="Update Employee">
            </div>
        </form>
    </div>
</body>
</html>
