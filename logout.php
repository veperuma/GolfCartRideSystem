<?php
session_start();
if($_SESSION["user"]==""){
?>
<script type="text/javascript">
window.location="index.php";
</script>
<?php
}

session_destroy();
  echo "<script type='text/javascript'> document.location = 'index.php'; </script>";
  exit();

?>
