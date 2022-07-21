<?php 
require_once("config/db.php");
session_start();
if(!isset($_SESSION['user'])){
    $_SESSION['guest'] = true;
}
// Get all visitors
$error = "";
$query = "SELECT * FROM `examinations` WHERE `module_code` LIKE '%". $_REQUEST['module_code'] ."%'";
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
        <h3>Search Exams</h3>
        <h6>These exams have a module code like <span class="text-primary fw-bold fst-italic"><?php echo $_REQUEST['module_code']; ?></span></h6>
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
                        <a class="btn btn-primary mx-1" href="edit_visitor.php?id=<?php echo $all_exams['id']; ?>">Edit</a>
                        <a class="btn btn-secondary mx-1" href="exam_questions.php?id=<?php echo $all_exams['id']; ?>">Questions</a>
                    <?php } ?> 
                </td>
            </tr>
            <?php }}else{
                echo '<h6 class="text-danger">No exams found.</h6>';
            } ?>
        </table>
    </div>
</section>
<?php require_once("footer.php"); ?>