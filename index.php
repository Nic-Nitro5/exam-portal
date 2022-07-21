<?php 
require_once("config/db.php");
session_start();
if(!isset($_SESSION['user'])){
    $_SESSION['guest'] = true;
}
// Get all exams
$error = "";
$query = "SELECT * FROM `examinations`";
$result = mysqli_query($connection, $query);
if($result->num_rows < 0){
    $error = "Could Not fetch data.";
}
?>
<?php require_once("header.php"); ?>
<section>
    <div class="container card rounded bg-white shadow-sm my-4 p-4">
        <?php if(!empty($error)){ ?>
            <div class="alert alert-danger"><?php echo $error; ?></div>
        <?php } ?>
        <h3>All Exams</h3>
        <table class="table table-striped table-hover"> 
            <tr>
                <th>ID</th>
                <th>Module Code</th>
                <th>Start Time</th>
                <th>End Time</th>
                <th>Exam Type</th>
                <th>Exam Date</th>
                <?php if(isset($_SESSION['user'])){ ?>
                    <th>Action</th>
                <?php } ?>
            </tr>
            <?php 
            if($result->num_rows > 0){
                while($all_exams = mysqli_fetch_array($result)){
            ?>
            <tr>
                <td><?php echo $all_exams['id']; ?></td>
                <td><?php echo $all_exams['module_code']; ?></td>
                <td><?php echo $all_exams['start_time']; ?></td>
                <td><?php echo $all_exams['completion_time']; ?></td>
                <td><?php echo $all_exams['exam_type']; ?></td>
                <td><?php echo $all_exams['exam_date']; ?></td>
                <td class="nowrap">
                    <?php if(isset($_SESSION['user']) && $_SESSION['user']['admin'] == 1){ ?>
                        <a class="btn btn-primary mx-1" href="edit_exam.php?id=<?php echo $all_exams['id']; ?>">Edit</a>
                        <a class="btn btn-secondary mx-1" href="exam_questions.php?id=<?php echo $all_exams['id']; ?>">Questions</a>
                    <?php } ?> 
                    <?php if(isset($_SESSION['user']) && $_SESSION['user']['admin'] == 0){ 
                            // Check if student has taken the exam
                            $query_valid = "SELECT * FROM `enrolment_results` WHERE `examinations_id` =". $all_exams['id'] ." AND student_code = ".$_SESSION['user']['student_number'];
                            $result_valid = mysqli_query($connection, $query_valid);
                            if($result_valid->num_rows <= 0){
                                echo '<a class="btn btn-primary mx-1" href="start_exam.php?id='.$all_exams['id'].'">Start Exam</a>';
                            }else{
                                $row = mysqli_fetch_row($result_valid);
                                echo '<strong>Result: </strong>'.$row[3];
                            }
                        }
                    ?>
                </td>
            </tr>
            <?php }}else{
                echo '<h6 class="text-danger">No exam information recorded yet.</h6>';
            } ?>
        </table>
    </div>
</section>
<?php require_once("footer.php"); ?>