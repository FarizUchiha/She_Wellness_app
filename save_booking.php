<?php
// File: save_booking.php
include 'db_connection.php';

$data = json_decode(file_get_contents('php://input'), true);

$name = $data['name'];
$session_id = $data['session_id'];
$duration = $data['duration'];
$start_date = $data['start_date'];
$total_price = $data['total_price'];

$sql = "INSERT INTO bookings (name, session_id, duration, start_date, total_price) VALUES (?, ?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("siisd", $name, $session_id, $duration, $start_date, $total_price);

$response = [];
if ($stmt->execute()) {
    $response['status'] = 'success';
} else {
    $response['status'] = 'error';
    $response['message'] = $stmt->error;
}

header('Content-Type: application/json');
echo json_encode($response);
?>
