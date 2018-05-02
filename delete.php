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

<!doctype html>
<html lang="en">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <title>Login Details</title>
    <style>
    
    .btn{
            background-color: #17A2B8;
            border: none;
            color: white;
            padding: 5px;
            padding-left: 20px;
            padding-right: 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 15px;
            margin: 2px 2px;
            cursor: pointer;
            border-radius: 10px;
            font-family: cursive;
        }
        .btn1{
        	background-color: #17A2B8;
            border: none;
            color: white;
            padding: 5px;
            padding-left: 5px;
            padding-right: 5px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 15px;
            margin: 2px 2px;
            cursor: pointer;
            border-radius: 10px;
			padding-left: 2.3em;
			padding-right:2.3em;
            font-family: cursive;
        }
        .delete{
    		margin-left: 420px;
    		margin-top: 190px;
            font-family: cursive;
    	}  
    </style>
</head>
<body>
<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" class="delete" method="GET"> 

	<button type="button" class="btn">Ride ID</button>
	<?php
    $servername = "localhost";
    $username = "root";
    $password = "root";      
    $conn = new PDO("mysql:host=$servername;dbname=mysql", $username, $password);            
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $sql = "use golfcartsystem";
    $conn->exec($sql);
    $person_id = $_SESSION["personid"];
    $getUsers = $conn->prepare("select ride_id from booking where person_id=$person_id;");
    $getUsers->execute();
    $users = $getUsers->fetchAll();
	echo "<select name='ride_id'>";	
    foreach ($users as $user) {       
	echo "<option value='".$user["ride_id"]."'>".$user["ride_id"]."</option>";
	}
	echo "</select>";
	
	?> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp 
	<button type="submit" class="btn1" style="background-color:  #4CAF50" value ="Submit">Submit</button>&nbsp
	

</form>

<span style="position:fixed; right: 0; bottom: 0">
    <form action='ride_history.php' method='POST'>          
    <input type='submit' class="btn1" style="background-color:  #4CAF50" value='Go Back' />      
    </form>  
</span>
</body>
</html> 
<?php
if ($_SERVER["REQUEST_METHOD"] == "GET") {
    
    $ride_id = ($_GET["ride_id"]);    
    $personid = $_SESSION["personid"];

    $getUsers = $conn->prepare("update booking set cancelledyorn = 1 where ride_id=$ride_id and person_id=$person_id");
    $getUsers->execute();

	$getUsers = $conn->prepare("delete from booking where ride_id=$ride_id and person_id=$person_id");
    $getUsers->execute();  
    echo "<script type='text/javascript'> document.location = 'ride_history.php'; </script>";    
}


?>