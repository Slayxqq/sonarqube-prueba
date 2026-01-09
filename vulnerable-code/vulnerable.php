<?php

// VULNERABILIDAD 1: SQL Injection
$user_id = $_GET['id'];
$query = "SELECT * FROM users WHERE id = " . $user_id;
$result = mysqli_query($conn, $query);

// VULNERABILIDAD 2: Hardcoded Credentials
$DB_PASSWORD = "root@1234";
$API_KEY = "sk-1234567890abcdefg";
$SECRET = "my-secret-key-12345";

// VULNERABILIDAD 3: Command Injection
$input = $_GET['command'];
shell_exec("ls " . $input);

// VULNERABILIDAD 4: Path Traversal
$file = $_GET['file'];
include("/var/www/html/uploads/" . $file);

// VULNERABILIDAD 5: Weak Hashing
function hash_password($password) {
    return md5($password);
}

// VULNERABILIDAD 6: XSS - Cross-Site Scripting
$search_query = $_GET['search'];
echo "Results for: " . $search_query;

// VULNERABILIDAD 7: Local File Inclusion (LFI)
$page = $_GET['page'];
include($page . ".php");

// VULNERABILIDAD 8: Insecure Deserialization
$data = unserialize($_POST['data']);

// VULNERABILIDAD 9: Weak Session Management
session_start();
$_SESSION['user_id'] = $_GET['user_id'];
$_SESSION['is_admin'] = true;

// VULNERABILIDAD 10: Use of Deprecated Functions
mysql_connect("localhost", "user", "password");
$result = mysql_query("SELECT * FROM users");

// VULNERABILIDAD 11: Sensitive Data in Logs
error_log("User password: " . $_POST['password']);
error_log("Credit card: " . $_POST['cc_number']);

// VULNERABILIDAD 12: No Input Validation
$email = $_POST['email'];
$message = $_POST['message'];
mail($email, "Notification", $message);

?>
