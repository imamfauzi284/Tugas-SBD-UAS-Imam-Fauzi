# Tugas-SBD-UAS-Imam-Fauzi
### Nama : Imam Fauzi
### NIM : 312010220
### Kelas : TI.20.D.2
### Matkul : Sistem Basis Data
### Dosen : Muhammad Najamuddin Dwi Miharja, S.Kom, M.kom

## menampilkan login
![1 login](https://user-images.githubusercontent.com/106543547/179646280-82ca2a28-6abe-4919-9fb2-90a29c7a86e7.JPG)
## menampilkan Halaman home sistem klinik
![2 home](https://user-images.githubusercontent.com/106543547/179646310-b345a884-bc29-4eb2-83c0-e2e9d5f45d3f.JPG)
## menampilkan Data pasien
![3 tabel pasien](https://user-images.githubusercontent.com/106543547/179646349-e396a810-7ef0-4b90-8ba7-34bece7d3349.JPG)
## menampilkan tabel pasien tambah
![4 tambah pasien](https://user-images.githubusercontent.com/106543547/179646366-12ee56e1-96f0-455b-beb4-e3964639b98b.JPG)
## menampilkan Hasil tabel pasien tambah
![5 hasil tambah pasien](https://user-images.githubusercontent.com/106543547/179646384-2483b94d-9ef4-4f25-bcb8-91a9488bf252.JPG)
## menampilkan tabel hapus
![6 hapus pasien](https://user-images.githubusercontent.com/106543547/179646400-96b89e1b-b4a2-47cd-bd40-8e00af1f4bc6.JPG)
## menampilkan Hasil tabel pasien hapus
![7 hasil hapus pasien](https://user-images.githubusercontent.com/106543547/179646433-bc390ace-d00a-4065-a45a-a9079407f131.JPG)
## menampilkan data dokter
![8 tabel dokter](https://user-images.githubusercontent.com/106543547/179646442-cb974a90-7d6c-4cf8-bb9c-74ce14157808.JPG)
#### Pada Data dokter pada sistem klinik juga di berikan perintah tambah, hapus dan juga edit
## menampilkan data obat
![9 tabel obat](https://user-images.githubusercontent.com/106543547/179646453-e0156cb5-b909-4739-b742-508da1504b58.JPG)
#### Jadi Fungsi dari triger ini untuk menampilkan perubahan nama obat setelah dilakukan proses update pada sistem klinik tersebut.Didalam modul data obat saya memberikan Trigger create table log_obat(id_log int(100) auto_increment primary key, id_obat int(10), nama_obat_lama varchar(100), nama_obat_baru varchar(100), waktu date not null)
#### create trigger update_nama_obat before update on obat for each row insert into log_obat set id_obat=old.id_obat, nama_obat_lama = old.nama_obat, nama_obat_baru=new.nama_obat, waktu = now();

## menampilkan tabel user
![10 tabel user](https://user-images.githubusercontent.com/106543547/179646462-647faf9e-b0f5-4cf2-bc52-380d9d4c0ab8.JPG)
## Implementasi Fungsi.
### Mengimplementasikan Fungsi untuk menampilkan total data :
#### CREATE FUNCTION fn_totalUsers() RETURNS INT(11) UNSIGNED NOT DETERMINISTIC NO SQL SQL SECURITY DEFINER RETURN (SELECT COUNT(id_pasien) FROM pasien)
## menampilkan Dashboard Sistem Klinik
![11 dashboard](https://user-images.githubusercontent.com/106543547/179646502-b30bbcf1-08ac-426b-91ec-48d91041c694.JPG)
