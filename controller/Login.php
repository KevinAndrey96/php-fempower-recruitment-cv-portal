<?php
session_start();
require_once "../lib/PDO.php";

if (!empty($_POST["username"])) {
  $USER = trim($_POST["username"]);
  $PASS = $_POST["password"] ?? '';
  $TIPO = (int)($_POST["BtnTipoU"] ?? 3); // 3 para persona y 1 para empresa

  $stmt = $db->prepare("SELECT * FROM usuarios WHERE username = ? AND tipo_usuario = ? AND estado = 1");
  $stmt->execute([$USER, $TIPO]);
  $row = $stmt->fetch();

  if ($row && password_verify($PASS, $row["password"])) {
    $_SESSION["Active"] = true;
    $_SESSION["UserName"] = $USER;
    $_SESSION["idUsuario"] = $row["id"];
    $_SESSION["Rol"] = (int)$row["tipo_usuario"];
    $_SESSION["created"] = time();
    header("Location: ../welcome.php");
    exit;
  } else {
    echo '<script type="text/javascript">
      window.alert("Usuario o contraseña incorrectos");
      window.location.href="../index.php";
    </script>';
    exit;
  }
}

header("Location: ../index.php");
exit;
