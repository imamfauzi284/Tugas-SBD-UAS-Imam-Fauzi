<?php
include "koneksi.php";
$id= $_GET['id'];
$sql = "SELECT * FROM pasien WHERE id_pasien = '{$id}'";
$result = mysqli_query($conn, $sql);
if (!$result) die('Error: Data tidak tersedia');
$data = mysqli_fetch_array($result); 
function is_select($var, $val) 
{
    if ($var == $val) return 'selected="selected"';
    return false;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>

<script language="javascript">
function cekform(){     
    //ini untuk ngecek formnya (semua form tidak boleh kosong)
    if(document.frmtambah.id_pasien.value==""){
        alert('ID Pasien Harus Diisi');
        document.frmtambah.id_pasien.focus();
        return false;
    } else if(document.frmtambah.nama_pasien.value==""){
        alert('Nama Pasien Harus Diisi');
        document.frmtambah.nama_pasien.focus();
        return false;
    } else if(document.frmtambah.jenis_kelamin.value==""){
        alert('Jenis Kelamin Harus Diisi');
        document.frmtambah.jenis_kelamin.focus();
        return false;
    } else if(document.frmtambah.umur.value==""){
        alert('Umur Harus Diisi');
        document.frmtambah.umur.focus();
        return false;
    }
}
</script>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Data Klinik</title>
  <link rel="icon" type="image/png" href="image/logim.png">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href=" plugins/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href=" plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href=" plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href=" plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <link rel="stylesheet" href=" dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">

    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
          <i class="fas fa-th-large"></i>
        </a>
      </li>
    </ul>
  </nav>

  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <div class="sidebar">
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="image/logim.png" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">Admin Klinik,</a>
        </div>
        <div>
            <a href="logout.php" class="btn">Logout</a>
            </div>
      </div>

      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>

      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Dashboard
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="dashboard.php" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Dashboard Klinik</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item menu-open">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-table"></i>
              <p>
                Data Klinik
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="tabel.php" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Data Pasien</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="dokter.php" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Data Dokter</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="obat.php" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Data Obat</p>
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </nav>
    </div>
  </aside>

  <div class="content-wrapper">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Tambah Data Pasien</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
            <div class="card">
                  <a href="TABEL.php" class="btn btn-primary"> 
                  Kembali</a>
                </div>
            </ol>
          </div>
        </div>
      </div>
    </section>

    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-6">
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Silahkan Isi</h3>
              </div>
                <div class="card-body">
                  <div class="form-group">
                      <form action="" method="post" name="frmtambah" onsubmit="return cekform()">
                      <div class="form-group">
                          <input name="id_pasien" class="form-control" placeholder="ID Pasien" type="hidden" id="id_pasien" value="<?php echo $data['id_pasien']?>" >
                      </div>
                      <div class="form-group">
                          <input name="nama_pasien" class="form-control" placeholder="Nama Pasien" type="text" id="nama_pasien" value="<?php echo $data['nama_pasien']?>" >
                      </div>
                      </div>
                    <div class="form-group">
                    <label for="jenis_kelamin">Jenis Kelamin</label>
                    <div>
                        <label class="radio-inline">
                            <input type="radio" name="jenis_kelamin" value="Laki-laki" required <?php echo $data['jenis_kelamin'] == "Laki-laki" ? "checked" : null ?>> Laki-laki
                        </label>

                        <label class="radio-inline">
                            <input type="radio" name="jenis_kelamin" value="Perempuan" required <?php echo $data['jenis_kelamin'] == "Perempuan" ? "checked" : null ?>> Perempuan
                        </label>
                    </div>
                </div>
                    <div class="form-group">
                        <input name="umur" class="form-control" placeholder="Umur" type="number" id="umur" value="<?php echo $data['umur']?>">
                    </div>
                    <div class="card-footer">
                        <input name="tambah" type="submit" class="btn btn-primary "id="tambah" value="Submit" >
                    </div>
              </form>
            </div>
        </div>
      </div>
    </section>
  </div>
  <footer class="main-footer">
    <strong>Copyright &copy; 2022. </strong> All rights reserved.
  </footer>

  <aside class="control-sidebar control-sidebar-dark">
  </aside>
</div>

<script src=" plugins/jquery/jquery.min.js"></script>
<script src=" plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src=" plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
<script src=" dist/js/adminlte.min.js"></script>
</script>
</body>
</html>
<?php
include "koneksi.php";
if(isset($_POST['tambah'])){
    $id_pasien = $_POST['id_pasien'];
    $nama_pasien = $_POST['nama_pasien'];
    $jenis_kelamin = $_POST['jenis_kelamin'];
    $umur = $_POST['umur'];
    mysqli_query($conn, "UPDATE pasien
    SET id_pasien='$id_pasien', nama_pasien='$nama_pasien', jenis_kelamin='$jenis_kelamin', umur='$umur' WHERE id_pasien='$id'")or die (mysqli_error($conn));

    echo "<script>alert('Data berhasil diUpdate')</script>";
    echo "<meta http-equiv='refresh' content='1;url=http://localhost/WEB/TABEL.php'>";
    
  }

?>