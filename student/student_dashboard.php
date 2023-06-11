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

  <!-- Tailwind CSS -->
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.17/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>
  <div id="notifications-panel"></div>

  <div class="container my-3">
    <div class="row">
      <?php
     
      include('../dbcon.php');
      $user_id = $_SESSION['id'];

      $sql = "SELECT * FROM users WHERE id='$user_id'";
      $result = mysqli_query($con, $sql);
      
      while ($row = mysqli_fetch_assoc($result)):
      ?>
      <div class="col-md-7">
        <div class="card">
          <img class="card-img-top" style="width: 100px" src="../uploads/<?php echo $row['picture']; ?>" alt="Profile Picture">
          <div class="card-body">
            <h5 class="card-title"><?php echo $row['fname'] . ' ' . $row['lname']; ?></h5>
            <p class="card-text">Email: <?php echo $row['email']; ?></p>
            <p class="card-text">Phone: <?php echo $row['phone']; ?></p>
            <p class="card-text">Address: <?php echo $row['address']; ?></p>
          </div>
        </div>
      </div>
      <?php endwhile; ?>
    </div>
  
    <h3>Schedule</h3>
    <div class="row">
      <div class="col-sm">
        <?php include('../tutor/calender.php'); ?>
      </div>
    </div>
  </div>
</body>
</html>
