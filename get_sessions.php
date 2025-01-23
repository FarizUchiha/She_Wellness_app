<?php
// File: get_sessions.php
include 'db_connection.php';

$sql = "SELECT id, name, description, image, price FROM sessions";
$result = $conn->query($sql);

$sessions = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $sessions[] = $row;
    }
}

header('Content-Type: application/json');
echo json_encode($sessions);
?>
