<?php
include '../db.php';

$id_transaksi = $_POST['id_transaksi'];
$status = $_POST['status'];
$query = "UPDATE tb_transaksi SET status='$status' WHERE id='$id_transaksi'";

if (mysqli_query($conn, $query)) {
    header("location: index.php?alert=sukses");
} else {
    header("location: index.php?alert=gagal");
}
