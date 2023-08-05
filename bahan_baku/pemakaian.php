<?php
$current = "data Pupuk";
require_once '../layouts/header.php';

// Define the missing functions or include their definition files

// Assuming you have a function to retrieve data from the database with proper sanitization
function single($table, $id)
{
  // Implement your code to retrieve the data from the database based on $table and $id
  // Make sure to sanitize $id to prevent SQL injection
  // Return the data as an associative array
}

// Assuming you have a function to insert data into the database with proper sanitization
function insert($table, $data)
{
  // Implement your code to insert the data into the database
  // Make sure to sanitize the input data to prevent SQL injection
  // Return true on success, false on failure
}

// Assuming you have a function to update the 'Jumlah Stok' in the database
function updateBahan($message)
{
  // Implement your code to update the 'Jumlah Stok' based on the message
}

// Assuming you have a function to sanitize input data to prevent SQL injection
function sanitize($input)
{
  // Implement your code to sanitize the input data before using it in queries
  // Return the sanitized data
}

if (isset($_POST["simpan"])) {
  unset($_POST["simpan"]);
  $_POST['tanggal'] = date("Y-m-d");
  // Sanitize the input before using it in the query to prevent SQL injection
  $_POST = array_map('sanitize', $_POST);
  $res = insert("tb_pemakaian", $_POST);
  // Assuming $total is calculated somewhere in the code, or retrieved from the database
  $total = 100; // Replace this with the actual value of $total
  updateBahan('Jumlah Stok :' . $total . '');
  if ($res) {
    $success = true;
  } else {
    $failed = true;
  }
}
?>

<!-- Content Header (Page header) -->
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0 text-dark">Pemakaian</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="/">Home</a></li>
                    <li class="breadcrumb-item"><a href="/bahan_baku/index.php">Pupuk</a></li>
                    <li class="breadcrumb-item active">Pemakaian</li>
                </ol>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->

<!-- Main content -->
<section class="content">
    <div class="container-fluid">

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <?php if (isset($success)) : ?>
                        <div class="alert alert-success">Berhasil meyimpan data</div>
                        <?php elseif (isset($failed)) : ?>
                        <div class="alert alert-danger">Gagal meyimpan data</div>
                        <?php endif ?>
                        <form method="post">
                            <div class="form-group">
                                <label>Nama Pupuk</label>
                                <input type="text" name="nama_bahan_baku" readonly=""
                                    value="<?= $bahan_baku['nama_bahan_baku'] ?>" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Jumlah</label>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Ton</span>
                                    </div>
                                    <input type="number" name="jumlah" class="form-control" required>
                                    <div class="input-group-append">
                                        <span class="input-group-text">.00</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Keterangan</label>
                                <input type="text" name="keterangan" value="" class="form-control" required>
                            </div>
                            <button class="btn btn-success" name="simpan">Simpan</button>
                            <a href="index.php" class="btn btn-warning">Kembali</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <?php
    require_once '../layouts/footer.php';
    ?>