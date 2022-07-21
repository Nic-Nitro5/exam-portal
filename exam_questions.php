<?php 
require_once("config/db.php");
session_start();
if(!isset($_SESSION['user'])){
    $_SESSION['guest'] = true;
}
// Get all exams
$error = "";
$query = "SELECT * FROM `questions` WHERE examinations_id =".$_REQUEST['id'];
$result = mysqli_query($connection, $query);
if($result->num_rows < 0){
    $error = "Could Not fetch data.";
}

// Delete product
if($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['delete_question'])){
    $delete_query = "DELETE FROM questions WHERE examinations_id = ".$_REQUEST['id'];
    $delete_result = mysqli_query($connection, $delete_query);

    if($delete_result){
        $success = "Exam deleted successfully.";
        echo "<script>setTimeout(function(){location.href='".$base_url."/index.php';}, 3000);</script>";
    }else{
        $error = "Could Not delete exam question.";
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
        <div>
            <a class="btn btn-success float-end" href="add_question.php?exam_id=<?php echo $_REQUEST['id'] ?>">Add Question</a>
        </div>
        <h3>All Exam Questions</h3>
        <table class="table table-striped table-hover"> 
            <tr>
                <th>ID</th>
                <th>Examination ID</th>
                <th>Question</th>
                <th>Option 1</th>
                <th>Option 2</th>
                <th>Option 3</th>
                <th>Option 4</th>
                <th>Answer</th>
                <?php if(isset($_SESSION['user'])){ ?>
                    <th>Action</th>
                <?php } ?>
            </tr>
            <?php 
            if($result->num_rows > 0){
                while($question_data = mysqli_fetch_array($result)){
            ?>
            <tr>
                <td><?php echo $question_data['id']; ?></td>
                <td><?php echo $question_data['examinations_id']; ?></td>
                <td><?php echo $question_data['question']; ?></td>
                <td><?php echo $question_data['option_1']; ?></td>
                <td><?php echo $question_data['option_2']; ?></td>
                <td><?php echo $question_data['option_3']; ?></td>
                <td><?php echo $question_data['option_4']; ?></td>
                <td><?php echo $question_data['answer']; ?></td>
                <td class="nowrap">
                    <?php if(isset($_SESSION['user']) && $_SESSION['user']['admin'] == 1){ ?>
                       <div class="d-flex">
                            <a class="btn btn-primary mx-1" href="edit_exam.php?id=<?php echo $question_data['id']; ?>">Edit</a>
                            <form action="" method="post" id="delete_exam_question">
                                <button class="btn btn-danger float-end" name="delete_question" type="submit">Delete Question</button>
                            </form>
                       </div>
                    <?php } ?> 
                </td>
            </tr>
            <?php }}else{
                echo '<h6 class="text-danger">No exam questions recorded yet.</h6>';
            } ?>
        </table>
    </div>
</section>
<?php require_once("footer.php"); ?>