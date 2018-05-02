<?php
session_start();
if($_SESSION["user"]==""){
?>
<script type="text/javascript">
window.location="index.php";
</script>
<?php
}
$personid = $_SESSION["personid"];  
$servername = "localhost";
$username = "root";
$password = "root";      
$conn = new PDO("mysql:host=$servername;dbname=mysql", $username, $password);            
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$sql = "use golfcartsystem";
$conn->exec($sql);

$getUsers = $conn->prepare("select numberofcancels from person where person_id =$personid;");
$getUsers->execute();
$users = $getUsers->fetchAll();

foreach ($users as $user) {
$numberofcancels = $user[0];
}
?>

<html>
                <head>
                    <style>
                    body{
                        background-repeat: no-repeat, repeat;  
                        background-color: #000000;                        
                    }
                    .text1{
                        font-size: 20px;
                        color: #66e0ff;
                        font-style: italic;
                    }
                        .btn{
                            background-color: #4CAF50;
                            border: none;
                            color: white;
                            padding: 20px;
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
                        font-family: cursive;
                    }

                    .btn:active:after {
                        padding: 0;
                        margin: 0;
                        opacity: 1;
                        transition: 0s
                        font-family: cursive;
                    }
                    </style>
                </head>
                <body">
                    <marquee class="text1"> Welcome to Golf cart ride booking system !!! </marquee>
                    <center>
                    <br><br><br><br><br><br><br><br><br><br><br><br><br>                    

    <form name="form1" method="post" action="ride_history.php" >
    <input type="submit" class="btn" name="ride_hist" value="Ride History" formaction="ride_history.php" >&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
    <input type="submit" class="btn" name="bookride" value="Book a ride!!!" formaction="booking.php" >&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
    <input type="submit" class="btn" name="location" value="Locations" formaction="location.php">&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
    <input type="submit" class="btn" name="aboutme" value="About me" formaction="aboutme.php">&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
    <input type="submit" class="btn" name="logout" style="background-color: #ff4d4d" value="Logout" formaction="logout.php">
    </form>
    </center>               
    </body>
    </html>