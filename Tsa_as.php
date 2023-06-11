<?php
session_start();

include('./dbcon.php');

if (isset($_GET['subject_id'])) {
  $subject_id = $_GET['subject_id'];

  // Fetch the subject from the database
  $sql = "SELECT * FROM tblsubjects WHERE id = $subject_id";
  $result = mysqli_query($con, $sql);
  $subject = mysqli_fetch_assoc($result);

  // Check if the subject exists before using it
  if ($subject) {
    // Fetch all questions for the selected subject
    $sql = "SELECT * FROM tsa_questions WHERE subject = '{$subject['subject']}'";
    $result = mysqli_query($con, $sql);
    $questions = mysqli_fetch_all($result, MYSQLI_ASSOC);

    // Shuffle the questions to randomize their order
    shuffle($questions);
  }
}

?>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="" href="./css/tsa_as_style.css">
</head>
<body>
<div class="container">
    <?php if (isset($subject)): ?>
        <h1><?php echo $subject['subject']; ?> TSA</h1>
        <div class="timer">
            <span id="timer"></span>
        </div>
        <form method="post" action="tsa_quiz_result.php">
            <?php foreach ($questions as $index => $question): ?>
                <div class="form-group">
                    <h4><?php echo ($index + 1) . '. ' . $question['question']; ?></h4>
                    <?php $options = array($question['option1'], $question['option2'], $question['option3'], $question['option4']); shuffle($options); ?>
                    <?php foreach ($options as $option) : ?>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="question_<?php echo $question['id']; ?>" id="option_<?php echo $option; ?>" value="<?php echo $option; ?>" required>
                            <label class="form-check-label" for="option_<?php echo $option; ?>"><?php echo $option; ?></label>
                        </div>
                    <?php endforeach; ?>
                </div>
            <?php endforeach; ?>

            <input type="hidden" name="subject_id" value="<?php echo $subject_id; ?>">
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    <?php else: ?>
        <p>Invalid subject selected.</p>
    <?php endif; ?>
</div>

<script>
    // Timer Countdown
    var timerElement = document.getElementById('timer');
    var timerSeconds = 120; // Change this to set the quiz duration in seconds

    function startTimer() {
        var timer = setInterval(function() {
            timerSeconds--;
            timerElement.textContent = formatTime(timerSeconds);

            if (timerSeconds <= 0) {
                clearInterval(timer);
                document.forms[0].submit(); // Submit the form when time runs out
            }
        }, 1000);
    }

    function formatTime(seconds) {
        var minutes = Math.floor(seconds / 60);
        var remainingSeconds = seconds % 60;

        return minutes.toString().padStart(2, '0') + ':' + remainingSeconds.toString().padStart(2, '0');
    }

    startTimer();
</script>
</body>
</html>
