<?php 
require_once("config/db.php");
session_start();
if(!isset($_SESSION['user'])){
    echo "<script>location.href='login.php';</script>";
}
$error = "";
if($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['module_code'])){
    $query = "UPDATE `examinations` SET `module_code` = '".$_POST['module_code']."', start_time = '".$_POST['start_time']."', completion_time = '".$_POST['end_time']."', exam_type = 'MCQ', exam_date = '".$_POST['exam_date']."' WHERE id = ". $_REQUEST['id'];
    $result = mysqli_query($connection, $query);
  
    if($result){
      $success = "Exam updated successfully.";
    }else{
      $error = "Something went wrong, please try again.";
    }
}

// get product details
$query_product = "SELECT * FROM `examinations` WHERE id = " . $_REQUEST['id'];
$exam_result = mysqli_query($connection, $query_product);
if($exam_result->num_rows < 0){
    $error = "Could Not fetch data.";
}

// Delete exam
if($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['delete_exam'])){
    $delete_query = "DELETE FROM examinations WHERE id = ".$_REQUEST['id'];
    $delete_result = mysqli_query($connection, $delete_query);

    if($delete_result){
        $success = "Exam deleted successfully.";
        echo "<script>setTimeout(function(){location.href='".$base_url."/index.php';}, 3000);</script>";
    }else{
        $error = "Could Not delete exam.";
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
        <?php 
            if($exam_result->num_rows > 0){
                while($exam_info = mysqli_fetch_array($exam_result)){
        ?>
        <!-- delete exam button -->
        <div>
            <form action="" method="post" id="delete_exam_form">
                <button class="btn btn-danger float-end" name="delete_exam" type="submit">Delete this exam</button>
            </form>
        </div>
        <form action="" method="post" id="update_product_form">
            <h1 class="h3 mb-3 fw-normal">Update exam</h1>
            <div class="form-floating">
                <input type="text" class="form-control" id="module_code" name="module_code" value="<?php echo $exam_info['module_code'] ?>" readonly>
                <label for="module_code">Module Code</label>
            </div>
            <div class="form-floating">
                <input type="text" class="form-control" id="datepicker" name="exam_date" placeholder="Start Date" value="<?php echo $exam_info['exam_date'] ?>">
                <label for="exam_date">Start Date</label>
            </div>
            <div class="form-floating">
                <select class="form-control" name="start_time" id="start_time" value="<?php echo $exam_info['start_time'] ?>">
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
                <select class="form-control" name="end_time" id="end_time" value="<?php echo $exam_info['completion_time'] ?>">
                    <option value="9AM">9AM</option>
                    <option value="10AM">10AM</option>
                    <option value="11AM">11AM</option>
                    <option value="12PM">12PM</option>
                    <option value="1PM">1PM</option>
                    <option value="2PM">2PM</option>
                </select>
                <label for="end_time">End Time</label>
            </div>
            <?php }} ?>
            <div class="checkbox mb-3">
                <label>
                    <a href="<?php echo $base_url; ?>/index.php"><small>View All exams</small></a>
                </label>
            </div>
            <button class="w-100 btn btn-lg btn-primary" type="submit">Update exam</button>
            <p class="mt-5 mb-3 text-muted">© 2021</p>
        </form>
    </div>
</section>
<script>
    $('#update_product_form').on('submit', function(e){
        var name = $('input[name="name"]').val().trim();
        var email = $('input[name="email"]').val().trim();
        var contact_number = $('input[name="contact_number"]').val().trim();
        var reason = $('input[name="reason"]').val().trim();

        $('.validation_errors').text('');

        if(name.length <= 0){
            e.preventDefault();
            hideShowValidation();
            $('.validation_errors').text('Item code is required');
            return;
        }

        if(email.length <= 0){
            e.preventDefault();
            hideShowValidation();
            $('.validation_errors').text('email is required');
            return;
        }

        if(contact_number.length <= 0){
            e.preventDefault();
            hideShowValidation();
            $('.validation_errors').text('contact_number is required');
            return;
        }

        if(reason.length <= 0){
            e.preventDefault();
            hideShowValidation();
            $('.validation_errors').text('reason is required');
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