<?php
include('../dbcon.php');

if (isset($_POST['content_id'])) {
    $content_id = $_POST['content_id'];
    $sql = "DELETE FROM course_content WHERE content_id='$content_id'";
    mysqli_query($con, $sql);
}
?>

<?php
if (!isset($_SESSION['user_name'])) {
    header('Location: ../signin.php');
    exit();
}

include('../dbcon.php');

if (isset($_POST['submit'])) {
    $contentTitle = $_POST['contenttitle'];
    $contentType = $_POST['contenttype'];
    $courseID = $_SESSION['course_id'];

    $fileName = $_FILES['contentfile']['name'];
    $fileTmpName = $_FILES['contentfile']['tmp_name'];
    $fileSize = $_FILES['contentfile']['size'];
    $fileError = $_FILES['contentfile']['error'];
    $fileType = $_FILES['contentfile']['type'];

    $fileExt = strtolower(pathinfo($fileName, PATHINFO_EXTENSION));
    $allowedExtensions = array('pdf', 'ppt', 'pptx', 'doc', 'docx', 'mp4');

    if (in_array($fileExt, $allowedExtensions)) {
        if ($fileError === 0) {
            if ($fileSize < 5242880000) {
                $newFileName = uniqid('', true) . '.' . $fileExt;
                $fileDestination = '../uploads/content/' . $newFileName;
                move_uploaded_file($fileTmpName, $fileDestination);

                $query = "INSERT INTO course_content (course_id, content_title, content_type, content_file)
                          VALUES ('$courseID', '$contentTitle', '$contentType', '$fileDestination')";
                mysqli_query($con, $query);
            } else {
                echo 'Error: The file size exceeds the maximum limit.';
            }
        } else {
            echo 'Error: An error occurred during file upload.';
        }
    } else {
        echo 'Error: Invalid file extension. Only PDF, PPT, PPTX, DOC, DOCX, and MP4 files are allowed.';
    }
}
?>

<!-- Course Content Upload Form -->
<div class="container">
    <h2>Manage Course Content</h2>
    <form action="" method="POST" enctype="multipart/form-data">
        <div class="form-group">
            <label for="contenttitle">Content Title</label>
            <input type="text" class="form-control" id="contenttitle" placeholder="Enter Content Title" name="contenttitle" required>
        </div>

        <div class="form-group">
            <label for="contenttype">Content Type</label>
            <select class="form-control" id="contenttype" name="contenttype" required>
                <option value="slides">Slides</option>
                <option value="documents">Documents</option>
                <option value="video">Video Lecture</option>
            </select>
        </div>

        <div class="form-group">
            <label for="contentfile">Upload Content File</label>
            <input type="file" class="form-control-file" id="contentfile" name="contentfile" required>
        </div>

        <button class="btn btn-primary" type="submit" name="submit" value="submit">Upload</button>
    </form>
</div>

<!-- Manage Course Content -->
<div class="container " >
    <h2>Manage Course Content</h2>
    <?php
    include('../dbcon.php');
    $course_id = $_SESSION['course_id'];

    $query = "SELECT * FROM course_content WHERE course_id = '$course_id'";
    $query_run = mysqli_query($con, $query);
    $content = mysqli_num_rows($query_run);
    
    if ($content > 0) {
        while ($row = mysqli_fetch_array($query_run)) {
            $content_id = $row['content_id'];
            $content_title = $row['content_title'];
            $content_type = $row['content_type'];
            $content_file = $row['content_file'];
            ?>
            <div class="row">
                <div class="col-md-5">
                    <div class="card" style="background: linear-gradient(to right, #a0f2eb, #a197f7); padding: 20px;">
                        <div class="card-body">
                            <h4 class="card-title"><?php echo $content_title; ?></h4>
                            <p class="card-text">Type: <?php echo $content_type; ?></p>
                            <a href="<?php echo $content_file; ?>" class="btn btn-primary" target="_blank">View</a>
                        </div>
                        <div class="card-footer" style="text-align: right;">
                            <form action="" method="post">
                                <input type="hidden" name="content_id" value="<?php echo $row['content_id']; ?>">
                                <button type="submit" class="btn btn-danger">Delete</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <?php
        }
    }
    ?>
</div>

