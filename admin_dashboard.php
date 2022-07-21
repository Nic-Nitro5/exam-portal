<?php 
require_once("config/db.php");
session_start();
if($_SESSION['user']['admin'] != 1){
   echo '<script>window.location.href = "login.php"</script>';
}
?>
<?php require_once("header.php"); ?>
<section>
    <!-- Charts -->
    <div class="container card rounded bg-white shadow-sm my-4 p-4">
        <canvas id="myChart" width="400" height="400"></canvas>
    </div>
</section>
<script>
<?php 
// Number of students
$query_students = "SELECT COUNT(*) FROM `users` WHERE student = 1";
$result_students = mysqli_query($connection, $query_students);
if($result_students->num_rows < 0){
    $error = "Could Not fetch data.";
}else{
    $total_students = $result_students->fetch_row();
}
// Number of submissions
$query_submissions = "SELECT COUNT(*) AS submissions FROM `enrolment_results`";
$result_submissions = mysqli_query($connection, $query_submissions);
if($result_submissions->num_rows < 0){
    $error = "Could Not fetch data.";
}else{
    $total_submissions = $result_submissions->fetch_row();
}

// Number of submissions for each module 
$query_submissions_module = "SELECT COUNT(*) AS submissions_by_module FROM `enrolment_results` GROUP BY examinations_id";
$result_submissions_module = mysqli_query($connection, $query_submissions_module);
if($result_submissions_module->num_rows < 0){
    $error = "Could Not fetch data.";
}else{
    $total_submissions_module = $result_submissions_module->fetch_row();
}

// Add MIS data **Change variable names and input your sql querie accordingly**
// $query_submissions_module = "SELECT COUNT(*) AS submissions_by_module FROM `enrolment_results` GROUP BY examinations_id";
// $result_submissions_module = mysqli_query($connection, $query_submissions_module);
// if($result_submissions_module->num_rows < 0){
//     $error = "Could Not fetch data.";
// }else{
//     $total_submissions_module = $result_submissions_module->fetch_row();
// }
?>
const ctx = document.getElementById('myChart').getContext('2d');
const myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['Total Students', 'Total Submissions', 'Total Submission Per Module'],
        datasets: [{
            label: 'Student Data',
            data: [<?php echo $total_students[0]; ?>, <?php echo $total_submissions[0]; ?>, <?php echo $total_submissions_module[0]; ?>],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                // 'rgba(75, 192, 192, 0.2)',
                // 'rgba(153, 102, 255, 0.2)',
                // 'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                // 'rgba(75, 192, 192, 1)',
                // 'rgba(153, 102, 255, 1)',
                // 'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
</script>
<?php require_once("footer.php"); ?>