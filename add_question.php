<?php 
require_once("config/db.php");
session_start();
if(!isset($_SESSION['user'])){
    echo "<script>location.href='login.php';</script>";
}
$error = "";
if($_SERVER["REQUEST_METHOD"] == "POST"){
    $query = "INSERT INTO `questions`(`examinations_id`, `question`, `option_1`, `option_2`, `option_3`, `option_4`, `answer`) VALUES ('".$_REQUEST['exam_id']."', '".$_POST['question']."', '".$_POST['option_1']."', '".$_POST['option_2']."', '".$_POST['option_3']."', '".$_POST['option_4']."', '".$_POST['answer']."')";
    $result = mysqli_query($connection, $query);
  
    if($result){
      $success = "Exam question added successfully.";
    }else{
      $error = "Something went wrong, please try again.";
    }
}
?>
<?php require_once("header.php"); ?>
<section class="text-center">
    <div class="container card rounded shadow-sm my-4 p-4">
        <?php if(!empty($error)){ ?>
            <div class="alert alert-danger"><?php echo $error; ?></div>
        <?php } ?>
        <?php if(!empty($success)){ ?>
            <div class="alert alert-success"><?php echo $success; ?></div>
        <?php } ?>
        <p class="validation_errors d-none text-danger fw-bold"></p>
        <form action="" method="post" id="add_exam_form">
            <h1 class="h3 mb-3 fw-normal">Add Question</h1>
            <div class="mb-3 text-start">
                <label for="question" class="form-label">Question</label>
                <textarea class="form-control" id="question" name="question" rows="3"></textarea>
            </div>
            <div class="mb-3 text-start">
                <label for="option_1" class="form-label">Option 1</label>
                <textarea class="form-control" id="option_1" name="option_1" rows="3"></textarea>
            </div>
            <div class="mb-3 text-start">
                <label for="option_2" class="form-label">Option 2</label>
                <textarea class="form-control" id="option_2" name="option_2" rows="3"></textarea>
            </div>
            <div class="mb-3 text-start">
                <label for="option_3" class="form-label">Option 3</label>
                <textarea class="form-control" id="option_3" name="option_3" rows="3"></textarea>
            </div>
            <div class="mb-3 text-start">
                <label for="option_4" class="form-label">Option 4</label>
                <textarea class="form-control" id="option_4" name="option_4" rows="3"></textarea>
            </div>
            <div class="mb-3 text-start">
                <label for="answer">Answer</label>
                <select class="form-select" name="answer" id="answer">
                    <option value="option_1">Option 1</option>
                    <option value="option_2">Option 2</option>
                    <option value="option_3">Option 3</option>
                    <option value="option_4">Option 4</option>
                </select>
            </div>
            <div class="checkbox mb-3">
                <label>
                    <a href="<?php echo $base_url; ?>/index.php"><small>View Question</small></a>
                </label>
            </div>
            <button class="w-100 btn btn-lg btn-primary" type="submit">Add New Exam</button>
            <p class="mt-5 mb-3 text-muted">© 2021</p>
        </form>
    </div>
</section>
<script>
    $('#add_exam_form').on('submit', function(e){
        var question = $('textarea[name="question"]').val();
        var option_1 = $('textarea[name="option_1"]').val();
        var option_2 = $('textarea[name="option_2"]').val();
        var option_3 = $('textarea[name="option_3"]').val();
        var option_4 = $('textarea[name="option_4"]').val();
        var answer = $('select[name="answer"]').val().trim();

        $('.validation_errors').text('');

        if(question.length <= 0){
            e.preventDefault();
            hideShowValidation();
            $('.validation_errors').text('Answer is required');
            return;
        }

        if(option_1.length <= 0){
            e.preventDefault();
            hideShowValidation();
            $('.validation_errors').text('Option 1 is required');
            return;
        }

        if(option_2.length <= 0){
            e.preventDefault();
            hideShowValidation();
            $('.validation_errors').text('Option 2 is required');
            return;
        }
        
        if(option_3.length <= 0){
            e.preventDefault();
            hideShowValidation();
            $('.validation_errors').text('Option 3 is required');
            return;
        }

        if(option_4.length <= 0){
            e.preventDefault();
            hideShowValidation();
            $('.validation_errors').text('Option 4 is required');
            return;
        }

        if(answer.length <= 0){
            e.preventDefault();
            hideShowValidation();
            $('.validation_errors').text('Answer is required');
            return;
        }
    });

    function hideShowValidation(){
        if($('.validation_errors').hasClass('d-none')){
            $('.validation_errors').removeClass('d-none');
            $('.validation_errors').addClass('d-block');
        }else{
            $('.validation_errors').addClass('d-none');
        }
    }
</script>
<?php require_once("footer.php"); ?>