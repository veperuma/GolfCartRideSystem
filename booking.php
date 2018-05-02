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
    	.booking{
    		margin-left: 420px;
    		margin-top: 190px;
            font-family: cursive;
    	}  
        .back{
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 10px;
            padding-left: 10px;
            padding-right: 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 15px;
            margin: 2px 2px;
            cursor: pointer;
            border-radius: 10px;
            font-family: cursive;
        }  	
        .btn{
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
            font-family: cursive;
        }
        .btn1{
        	background-color: #17A2B8;
            border: none;
            color: white;
            padding: 7px;
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
        .btn2{
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
			padding-left: 0.5em;
			padding-right:0.5em;
            font-family: cursive;
        }
                    
    </style>
</head>


<body>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

	<form action="afterbooking.php" class="booking" method="POST"> 	
	
	<button type="button" class="btn">Start Location</button>

    <?php
    $servername = "localhost";
    $username = "root";
    $password = "root";      
    $conn = new PDO("mysql:host=$servername;dbname=mysql", $username, $password);            
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $sql = "use golfcartsystem";
    $conn->exec($sql);
    $getUsers = $conn->prepare("select buildingname from location;");
    $getUsers->execute();
    $users = $getUsers->fetchAll();
	echo "<select name='start_loc'>";	
    foreach ($users as $user) {   
    echo $user['buildingname'];   
	echo "<option value='".$user["buildingname"]."'>".$user["buildingname"]."</option>";
	}
	echo "</select>";
	echo "<br><br>";
	?>

	<button type="button" class="btn2">End Location</button>&nbsp 
	<?php
	echo "<select name='end_loc'>";	
    foreach ($users as $user) {   
    echo $user['buildingname'];   
	echo "<option value='".$user["buildingname"]."'>".$user["buildingname"]."</option>";		
	}
	echo "</select>";
	echo "<br><br>";
	?>  

	<input type="button" class="btn1" name="date" value ="Date">&nbsp
	<input class="textbox" type="date" name="date1" required>    <br><br>
	<button type="button" class="btn1">Time</button>&nbsp
	<input class="textbox" type="time" name="time1" required>       
	<center><button type="submit" class="btn1" style="background-color:  #4CAF50" value ="Submit">Submit</button>&nbsp &nbsp
    
</span>
	</center>	

</form>
<span style="position:fixed; right: 0; bottom: 0">
    <form action='main.php' method='POST'>          
    <input type='submit' class="back" value='Go Back' />      
    </form>  
</span>
</body>
</html>

