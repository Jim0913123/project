<?php
include 'dbconnect.php';

$search = isset($_GET['search']) ? trim($_GET['search']) : '';

// Execute query only if search is performed
$result = null;
if ($search !== '') {
    // Use prepared statements to prevent SQL injection
    $sql = "SELECT * FROM Employee 
            WHERE TEmpID LIKE ? 
            OR Tfn LIKE ? 
            OR Tln LIKE ? 
            OR TdeptID LIKE ?";
    $stmt = $conn->prepare($sql);
    if ($stmt) {
        $searchTerm = "%$search%";
        $stmt->bind_param("ssss", $searchTerm, $searchTerm, $searchTerm, $searchTerm);
        $stmt->execute();
        $result = $stmt->get_result();
    } else {
        die("Error preparing statement: " . $conn->error);
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>View Employees</title>
    <link rel="stylesheet" type="text/css" href="mycss.css">
</head>
<body>
    <h1>Employee Records</h1>

    <!-- Search Form -->
    <div class="form-container">
        <form method="GET">
            <div class="form-group">
                <label for="search">Search by ID, Name, or Dept ID</label>
                <input type="text" id="search" name="search" placeholder="Enter search term" value="<?= htmlspecialchars($search) ?>">
            </div>
            <div class="submit-btn">
                <input type="submit" value="Search">
            </div>
        </form>
    </div>

    <!-- Table with headers always visible -->
    <table>
        <tr>
            <th>Employee ID</th>
            <th>First Name</th>
            <th>Middle Name</th>
            <th>Last Name</th>
            <th>Department ID</th>
            <th>Rank Code</th>
            <th>Actions</th>
        </tr>

        <?php if ($search !== '' && $result && $result->num_rows > 0) { ?>
            <?php while ($row = $result->fetch_assoc()) { ?>
                <tr>
                    <td><?= htmlspecialchars($row['TEmpID']) ?></td>
                    <td><?= htmlspecialchars($row['Tfn']) ?></td>
                    <td><?= htmlspecialchars($row['Tmn']) ?></td>
                    <td><?= htmlspecialchars($row['Tln']) ?></td>
                    <td><?= htmlspecialchars($row['TdeptID']) ?></td>
                    <td><?= htmlspecialchars($row['Trankcode']) ?></td>
                    <td>
                        <a href="UpdateEmployee.php?id=<?= $row['TEmpID'] ?>">Edit</a> | 
                        <a href="DeleteEmployee.php?id=<?= $row['TEmpID'] ?>" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
            <?php } ?>
        <?php } elseif ($search !== '') { ?>
            <tr>
                <td colspan="7" style="text-align: center;">No results found.</td>
            </tr>
        <?php } ?>
    </table>
</body>
</html>

<?php
// Close the database connection
if (isset($stmt)) {
    $stmt->close();
}
$conn->close();
?>