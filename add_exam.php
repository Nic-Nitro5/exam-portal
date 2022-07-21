<?php 
require_once("config/db.php");
session_start();
if(!isset($_SESSION['user'])){
    echo "<script>location.href='login.php';</script>";
}
$error = "";
if($_SERVER["REQUEST_METHOD"] == "POST"){
    $query = "INSERT INTO `examinations`(`module_code`, `start_time`, `completion_time`, `exam_type`, `exam_date`) VALUES ('".$_POST['module_code']."', '".$_POST['start_time']."', '".$_POST['end_time']."', 'MCQ', '".$_POST['exam_date']."')";
    $result = mysqli_query($connection, $query);
  
    if($result){
      $success = "Exam added successfully.";
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
            <h1 class="h3 mb-3 fw-normal">Add Exam</h1>
            <div class="form-floating">
                <select class="form-control" name="module_code" id="module_code">
                    <!-- Get all module codes -->
                    <?php
                        // get all module codes
                        $query = "SELECT * FROM modules";
                        $result = mysqli_query($connection, $query);
                        if($result->num_rows > 0){
                            while($all_codes = mysqli_fetch_array($result)){
                    ?>
                        <option value="<?php echo $all_codes['module_code']; ?>"><?php echo $all_codes['module_name']; ?></option>
                    <?php }} ?>
                </select>
                <label for="name">Module</label>
            </div>
            <div class="form-floating">
                <input type="text" class="form-control" id="datepicker" name="exam_date" placeholder="Start Date">
                <label for="exam_date">Start Date</label>
            </div>
            <div class="form-floating">
                <select class="form-control" name="start_time" id="start_time">
                    <option value="9AM">9AM</option>
                    <option value="10AM">10AM</option>
                    <option value="11AM">11AM</option>
                    <option value="12PM">12PM</option>
                    <option value="1PM">1PM</option>
                    <option value="2PM">2PM</option>
                </select>
                <label for="start_time">Start Time</label>
            </div>
            <div class="form-floating">
                <select class="form-control" name="end_time" id="end_time">
                    <option value="9AM">9AM</option>
                    <option value="10AM">10AM</option>
                    <option value="11AM">11AM</option>
                    <option value="12PM">12PM</option>
                    <option value="1PM">1PM</option>
                    <option value="2PM">2PM</option>
                </select>
                <label for="end_time">End Time</label>
            </div>
            <div class="form-floating">
                <input type="text" class="form-control" id="contact_number" name="exam_type" value="MCQ" disabled>
                <label for="exam_type">Exam Type</label>
            </div>
            <div class="checkbox mb-3">
                <label>
                    <a href="<?php echo $base_url; ?>/index.php"><small>View All Exams</small></a>
                </label>
            </div>
            <button class="w-100 btn btn-lg btn-primary" type="submit">Add New Exam</button>
            <p class="mt-5 mb-3 text-muted">© 2021</p>
        </form>
    </div>
</section>
<script>
    $('#add_exam_form').on('submit', function(e){
        var module_code = $('select[name="module_code"]').val().trim();
        var exam_date = $('input[name="exam_date"]').val().trim();
        var exam_type = $('input[name="exam_type"]').val().trim();
        var start_time = $('select[name="start_time"]').val().trim();
        var end_time = $('select[name="end_time"]').val().trim();

        $('.validation_errors').text('');

        if(module_code.length <= 0){
            e.preventDefault();
            hideShowValidation();
            $('.validation_errors').text('Module Code is required');
            return;
        }

        if(exam_date.length <= 0){
            e.preventDefault();
            hideShowValidation();
            $('.validation_errors').text('Date is required');
            return;
        }

        if(start_time.length <= 0){
            e.preventDefault();
            hideShowValidation();
            $('.validation_errors').text('Start time is required');
            return;
        }
        
        if(end_time.length <= 0){
            e.preventDefault();
            hideShowValidation();
            $('.validation_errors').text('End time is required');
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