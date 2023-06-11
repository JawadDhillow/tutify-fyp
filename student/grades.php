<?php
session_start();

// Check if the 'user_name' session variable is set
if (!isset($_SESSION['user_name'])) {
  header('Location: ../signin.php'); // Redirect to the login page if the user is not logged in
  exit();
}
include('./header.php');
?>
<!DOCTYPE html>
<html>
<head>
  <title>Grades Page</title>
  <style>
    body {
      font-family: Arial, sans-serif;
     
      margin: 0;
      padding: 0;
    }
    
    .container {
      max-width: 1000px;
      margin: 10 auto;
      padding: 20px;
      border: 1px solid lightgrey;
    border-radius: 3px;
    }
    
    h1 {
      text-align: center;
      margin-top: 0;
    }
    
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }
    
    table th,
    table td {
      padding: 10px;
      text-align: center;
      border-bottom: 1px solid #ddd;
    }
    
    table th {
      background-color: #f5f5f5;
    }
    
    .grade-label {
      font-weight: bold;
    }
    
    .grade-pass {
      color: green;
    }
    
    .grade-fail {
      color: red;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Grades Page</h1>

    <table>
      <thead>
        <tr>
          <th>Course_id</th>
          <th>Assessment_id</th>
          <th>Grade</th>
        </tr>
      </thead>
      <tbody>
        <?php
        // Fetch grades from the database
        include('../dbcon.php');
        
        $sql = "SELECT course_id,assesment_id, grade FROM grades";
        $result = $con->query($sql);

        if ($result !== false && $result->num_rows > 0) {
          while ($row = $result->fetch_assoc()) {
             $course_id= $row["course_id"];
            $assessment = $row["assesment_id"];
            $grade = $row["grade"];

            echo "<tr>";
            echo "<td>$course_id</td>";
            echo "<td>$assessment</td>";
            echo "<td class='grade-label'>$grade</td>";
            echo "</tr>";
          }
        } else {
          echo "<tr><td colspan='2'>No grades found</td></tr>";
        }

        $con->close();
        ?>
      </tbody>
    </table>
    
    
  </div>
</body>
</html>
