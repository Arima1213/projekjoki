<?php 
include '../db.php';
$id_transaksi  = $_GET['id_transaksi'];
$status  = $_GET['status'];

// set status
$setStatus = mysqli_query($conn, "update tb_transaksi set status='$status' where id='$id_transaksi'");

$transaksi = mysqli_query($conn,"select * from tb_transaksi_detail,tb_bahan_baku where tb_transaksi_detail.id_bahan_baku=tb_bahan_baku.id and tb_transaksi_detail.id_transaksi='$id_transaksi'");
while($d=mysqli_fetch_array($transaksi)){
    $produk = $d['id_produk'];
    $stok= $d['stok'];
    $jumlah = $d['jumlah'];
    $stokKembali = $d['stok'] + $d['jumlah'];

    $editTransaksi = mysqli_query($conn,"select * from tb_transaksi where id='$id_transaksi'");
    while($i = mysqli_fetch_array($editTransaksi)){
        if($i['status'] == "3"){
            //update stock
            mysqli_query($con, "update tb_bahan_baku set stok='$stokKembali' where id='$produk'");
        }
    }
}

header("location:index.php");