<?php 
require_once("config/db.php");
session_start();
if(!isset($_SESSION['user'])){
    $_SESSION['guest'] = true;
}

// Get all questions
$query = "SELECT * FROM `questions` WHERE `examinations_id` =". $_REQUEST['id'];
$result_questions = mysqli_query($connection, $query);
if($result_questions->num_rows < 0){
    $error = "Could Not fetch data.";
}

// Get exam module code
$query_module = "SELECT module_code  FROM `examinations` WHERE `id` =". $_REQUEST['id'];
$result_module = mysqli_query($connection, $query_module);
if($result_module->num_rows < 0){
    $error = "Could Not fetch data.";
}else{
    $module_code = $result_module->fetch_row()[0];
}

// Post exam
if($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['submit_exam'])){
    // Enrol student
    $query_enrol = "INSERT INTO `enrolment_results`(`student_code`, `examinations_id`) VALUES ('".$_SESSION['user']['student_number']."', '".$_REQUEST['id']."')";
    $result_enrol = mysqli_query($connection, $query_enrol);
    if(!$result_enrol){
        $error = "Could enrol student.";
    }

    // Calculate results
    $count = 1;
    $score = 0;
    while($all_exam_answers = mysqli_fetch_array($result_questions)){
        foreach($_POST as $submitted_answer){
            $submitted_answer = str_replace("question".$count."_","", $submitted_answer);
            if($submitted_answer == $all_exam_answers['answer']){
                $score++;
            }
        }
        $count++;
        $total_questions = count($_POST) - 1;
    }

    $final_pass_mark = round((($score / $total_questions) * 100), 2);

    $query = "UPDATE `enrolment_results` SET `result` = '".$final_pass_mark."%' WHERE examinations_id = ". $_REQUEST['id'];
    $result = mysqli_query($connection, $query);
  
    if($result){
        $success = "Exam submitted successfully.";

        //   Send email to all admin users
        $query_admins = "SELECT email FROM `users` WHERE `admin` = 1";
        $result_admins = mysqli_query($connection, $query_admins);
        if($result_admins->num_rows > 0){
            foreach($result_admins->fetch_array() as $admin){
                $to      = $admin;
                $subject = 'New Submission';
                $message = 'Good Day Admin, There is a new exam submission for '.$module_code;
                $headers = 'From: webmaster@example.com'       . "\r\n" .
                            'Reply-To: webmaster@example.com' . "\r\n" .
                            'X-Mailer: PHP/' . phpversion();

                mail($to, $subject, $message, $headers);
            }
        }

        echo "<script>setTimeout(function(){location.href='".$base_url."/index.php';}, 3000);</script>";
    }else{
      $error = "Something went wrong, please try again.";
    }
}
?>
<?php require_once("header.php"); ?>
<section>
    <div class="container card rounded bg-white shadow-sm my-4 p-4">
        <?php if(!empty($error)){ ?>
            <div class="alert alert-danger"><?php echo $error; ?></div>
        <?php } ?>
        <?php if(!empty($success)){ ?>
            <div class="alert alert-success"><?php echo $success; ?></div>
        <?php } ?>
        <h3>Exam for module code: <?php echo $module_code; ?></h3>
        <form action="" method="post">
            <?php 
                if($result_questions->num_rows > 0){
                    $i = 1;
                    while($all_exam_questions = mysqli_fetch_array($result_questions)){
                ?>
            <div class="my-2">
                <h6><?php echo $all_exam_questions['question']; ?></h6>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="question<?php echo $i; ?>" value="question<?php echo $i.'_option_1'; ?>" id="question<?php echo $i.'_option_1'; ?>">
                        <label class="form-check-label" for="question<?php echo $i.'_option_1'; ?>">
                            <?php echo $all_exam_questions['option_1']; ?>
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="question<?php echo $i; ?>" value="question<?php echo $i.'_option_2'; ?>" id="question<?php echo $i.'_option_2'; ?>">
                        <label class="form-check-label" for="question<?php echo $i.'_option_2'; ?>">
                            <?php echo $all_exam_questions['option_2']; ?>
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="question<?php echo $i; ?>" value="question<?php echo $i.'_option_3'; ?>" id="question<?php echo $i.'_option_3'; ?>">
                        <label class="form-check-label" for="question<?php echo $i.'_option_3'; ?>">
                            <?php echo $all_exam_questions['option_3']; ?>
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="question<?php echo $i; ?>" value="question<?php echo $i.'_option_4'; ?>" id="question<?php echo $i.'_option_4'; ?>">
                        <label class="form-check-label" for="question<?php echo $i.'_option_4'; ?>">
                            <?php echo $all_exam_questions['option_4']; ?>
                        </label>
                    </div>
            </div>
            <?php $i++; }} ?>
            <button class="btn btn-primary w-100 my-2" name="submit_exam" type="submit">Submit</button>
        </form>
    </div>
</section>
