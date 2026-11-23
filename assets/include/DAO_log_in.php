<?php

include 'credenciales.php';
include 'TBL_log_in.php';

class DAO_log_in {

  private $con;

  public function __construct() {

  }

  public function conectar() {
    try {
      $this->con = new mysqli(SERVERNAME, USERNAME, PASSWORD, DBNAME) or die("Error de conexión a la base de datos");
      $this->con->set_charset("utf8");
    } catch (Exception $ex) {
      echo $ex->getTraceAsString();
    }
  }

  public function desconectar() {
    $this->con->close();
  }

  public function getLog_inById($id) {
    $sql = "SELECT * FROM log_in WHERE id = " . (int)$id;
    $this->conectar();
    $result = $this->con->query($sql);
    $this->desconectar();
    $rpta = null;
    while ($row = mysqli_fetch_array($result)) {
      $rpta = $row;
    }
    if ($result) {
      $result->close();
    }
    return $rpta;
  }

  public function getLastLog_inByUsername($username) {
    $sql = "SELECT * FROM log_in WHERE username = '" . $this->con->real_escape_string($username) . "' ORDER BY date_login DESC LIMIT 1";
    $this->conectar();
    $result = $this->con->query($sql);
    $this->desconectar();
    $rpta = null;
    while ($row = mysqli_fetch_array($result)) {
      $rpta = $row;
    }
    if ($result) {
      $result->close();
    }
    return $rpta;
  }

  public function insertaAcceso($obj) {
    $myObj = new log_in();
    $myObj = $obj;
    $sql = "INSERT INTO log_in(idUsuario, username) values (" . $myObj->getIdUsuario() . ",'" . $myObj->getUsername() . "')";
    $this->conectar();
    if ($this->con->query($sql)) {
      $rpta = true;
    } else {
      $rpta = false;
    }
    $this->desconectar();
    return $rpta;
  }

  public function RegistraSalida($id) {
    $myObj = new log_in();
    $myObj = $obj;
    $sql = "UPDATE log_in SET date_logoff = CURRENT_TIMESTAMP WHERE  id = " . $id;
    $this->conectar();
    if ($this->con->query($sql)) {
      $rpta = true;
    } else {
      $rpta = false;
    }
    $this->desconectar();
    return $rpta;
  }

}

?>