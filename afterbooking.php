<?php
session_start();
if($_SESSION["user"]==""){
?>
<script type="text/javascript">
window.location="index.php";
</script>
<?php
}
?>

<?php
$servername = "localhost";
    $username = "root";
    $password = "root";      
    $conn = new PDO("mysql:host=$servername;dbname=mysql", $username, $password);            
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $sql = "use golfcartsystem";
    $conn->exec($sql);

	if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $start_loc = ($_REQUEST['start_loc']);
    $end_loc = ($_REQUEST['end_loc']);
    $date1 =  ($_REQUEST['date1']);
    $time1 =  ($_REQUEST['time1']);

    if (empty($date1)){
        $dateErr = "Date value is required";            
    }
    if (empty($time1)){
    $timeErr = "Time value is required";
    }
    
    $getUsers = $conn->prepare("select buildingcode from location where buildingname = '$start_loc';");
    $getUsers->execute();
    $users = $getUsers->fetchAll();
    foreach ($users as $user) {   
    $start_loc = $user['buildingcode'];   	
	}

	$getUsers = $conn->prepare("select buildingcode from location where buildingname = '$end_loc';");
    $getUsers->execute();
    $users = $getUsers->fetchAll();
    foreach ($users as $user) {   
    $end_loc = $user['buildingcode'];   	
	}

	$getUsers = $conn->prepare("select cart_id, numberofavailableseats from golfcart where numberofavailableseats>0 order by rand() limit 1;");
    $getUsers->execute();
    $users = $getUsers->fetchAll();
    foreach ($users as $user) {   
    $cart_id = $user['cart_id'];
    $number = $user['numberofavailableseats'];
	}

    $getUsers = $conn->prepare("update golfcart set numberofavailableseats=$number-1 where cart_id=$cart_id");
    $getUsers->execute();

	$getUsers = $conn->prepare("select driver_id from driver where driver_id like '%$cart_id';");
    $getUsers->execute();
    $users = $getUsers->fetchAll();
    foreach ($users as $user) {   
    $driver_id = $user['driver_id'];   	
	}

	$startTime = strtotime("+0 minutes", strtotime($time1));		
	$startTime= date('h:i:s', $startTime);	

	$finalTime = strtotime("+15 minutes", strtotime($time1));
	$finalTime = date('h:i:s', $finalTime);

	$getUsers = $conn->prepare("insert into ride (cart_id, driver_id, start_location_code, end_location_code, bookeddate, start_time, end_time) values ($cart_id, $driver_id, '$start_loc', '$end_loc', '$date1', '$startTime', '$finalTime');");
    $getUsers->execute();

    $getUsers = $conn->prepare("select max(ride_id) as 'ride_id' from ride;");
    $getUsers->execute();
    $users = $getUsers->fetchAll();
    foreach ($users as $user) {   
    $ride_id = $user['ride_id'];   	
	}

	$person_id = $_SESSION["personid"];

    $getUsers = $conn->prepare("insert into booking (person_id, ride_id, cancelledyorn) values ($person_id, $ride_id, 0);");
    $getUsers->execute();
    echo "<script type='text/javascript'> document.location = 'ride_history.php'; </script>";    

}
?>