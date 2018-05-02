<?php
session_start();
$nameErr = $pwdErr = "";
?>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    $name = test_input($_REQUEST['username']);
    $passwords = test_input($_REQUEST['password']);
    if (empty($name) || empty($passwords)) {
      if (empty($name)){
        $nameErr = "Name is required";            
      }
      if (empty($passwords)){
        $pwdErr = "Password is required";
      }
    }
    elseif(($passwords >8060) && ($passwords <8071)){
      $nameErr ="Driver cannot login";
    }
  
       else {  
            $servername = "localhost";
            $username = "root";
            $password = "root";      
            $conn = new PDO("mysql:host=$servername;dbname=mysql", $username, $password);            
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            $sql = "use golfcartsystem";
            $conn->exec($sql);
            
            $getUsers = $conn->prepare("select count(*) from person where person_id =$passwords and mobile = '$name' ;");
            $getUsers->execute();
            $users = $getUsers->fetchAll();

            foreach ($users as $user) {
            if($user[0] == 1)
            {
              $_SESSION["user"] = $name;
              $_SESSION["personid"] = $passwords;
              ?>
              <script type="text/javascript">
              window.location="main.php";
              </script>
<?php
}
else
{
  ?>
  <div class="alert alert-danger fade in">
  <strong>Danger!</strong> Please enter valid credentials!!!
  </div>
<?php
}
}
}
}
  function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>

<!doctype html>
<html lang="en">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <title>Login Details</title>
    <style>
    body{
                        background-repeat: no-repeat, repeat;
                        background-color: #000000;
                    }
    	.login1{
    		margin-left: 420px;
    		margin-top: 50px;
        font-family: cursive;
    	}  
      .headin{
        color: #66e0ff;
        font-size: 50px;
        font-family: ;
      }    
      .error{
        color: #ff4d4d;
      }
    </style>
</head>

<body>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

    <br><br>
<center><h1 class="headin"> Golf Cart Ride System </h1></center>
	<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" class="login1" method="POST">
  <div class="row" style="margin-top: 100px; margin-bottom: 300px;">
    <div class="col-sm-offset-8 col-sm-6">
      <form >
        <div class="form-group">
          <label for="exampleInputEmail1" style="color: #ffffff">Username</label>
          <input type="text" class="form-control" id="username" name="username" placeholder="Username">
          <span class="error"> <?php echo $nameErr;?></span>
        </div>
        <div class="form-group">
          <label for="exampleInputPassword1" style="color: #ffffff">Password</label>
          <input type="password" class="form-control" id="password" name="password" placeholder="Password">
          <span class="error"> <?php echo $pwdErr;?></span>

        </div>
        <button type="submit" class="btn btn-default">Submit</button>
        <!-- <?php if(isset($isValidUser) && !$isValidUser){ ?>
        <br><br>
        <p class="text-danger">* Invalid Login Credentials</p>
        <?php } ?> -->
      </form>
    </div>
  </div>
</form>
</body>
</html>