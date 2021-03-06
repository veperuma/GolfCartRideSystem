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

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<style>
.btn{
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 8px;
    font-family: cursive;
}
.btn:after {
    content: "";
    background: #f1f1f1;
    display: block;
    position: absolute;
    padding-top: 300%;
    padding-left: 350%;
    margin-left: -20px !important;
    margin-top: -120%;
    opacity: 0;
    transition: all 0.8s    
}

.btn:active:after {
    padding: 0;
    margin: 0;
    opacity: 1;
    transition: 0s
}
</style>
</head>

<body>
<center>

<?php
echo "<table class='table'>";
echo "<thead class='thead-dark'>";
echo "<tr><th>Ride ID</th><th>Start Location</th><th>End Location</th><th>Booking Date</th><th>Start time</th><th>Rating</th>
<th>Booking Status</th></tr>";
echo "</thead>";

class TableRows extends RecursiveIteratorIterator { 
    function __construct($it) { 
        parent::__construct($it, self::LEAVES_ONLY); 
    }

    function current() {
        return "<td style='width:150px;border:1px solid black;'>" . parent::current(). "</td>";
    }

    function beginChildren() { 
        echo "<tr>"; 
    } 

    function endChildren() { 
        echo "</tr>" . "\n";
    } 
} 

$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "golfcartsystem";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $personid = $_SESSION["personid"];    
    $stmt = $conn->prepare("select ride_id, start_location_code, end_location_code, bookeddate, start_time, rating, cancelledyorn from rideview where person_id=$personid;");
    $stmt->execute();

    $result = $stmt->setFetchMode(PDO::FETCH_ASSOC); 
    foreach(new TableRows(new RecursiveArrayIterator($stmt->fetchAll())) as $k=>$v) { 
        echo $v;
    }
}
catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}
$conn = null;
echo "</table>";
?>

</center>

<span style="position:fixed; right: 315; bottom: 0">
    <form action='rating.php' method='POST'>          
    <input type='submit' class="btn" value='Update Rating' />      
    </form>  
</span>
<span style="position:fixed; right: 185; bottom: 0">
    <form action='delete.php' method='POST'>          
    <input type='submit' class="btn" value='Delete a ride' />      
    </form>  
</span>
<span style="position:fixed; right: 90; bottom: 0">
    <form action='main.php' method='POST'>          
    <input type='submit' class="btn" value='Go Back' />      
    </form>  
</span>
<span style="position:fixed; right: 0; bottom: 0">
    <form action='logout.php' method='POST'>          
    <input type='submit' class="btn" value='Logout' />      
    </form>  
</span>

<span style="position:fixed; left: 0; bottom: 0">
    <h6 style="color: #ff4d4d">***Booking Status=0 indicates Not cancelled</h6>   
    
</span>

</body>
</html>