/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100138
 Source Host           : localhost:3306
 Source Schema         : sik_1707

 Target Server Type    : MySQL
 Target Server Version : 100138
 File Encoding         : 65001

 Date: 14/08/2021 08:30:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `usere` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `passworde` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for akun_bayar
-- ----------------------------
DROP TABLE IF EXISTS `akun_bayar`;
CREATE TABLE `akun_bayar`  (
  `nama_bayar` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_rek` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ppn` double NULL DEFAULT NULL,
  PRIMARY KEY (`nama_bayar`) USING BTREE,
  INDEX `akun_bayar_ibfk_1`(`kd_rek`) USING BTREE,
  INDEX `ppn`(`ppn`) USING BTREE,
  CONSTRAINT `akun_bayar_ibfk_1` FOREIGN KEY (`kd_rek`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for akun_penagihan_piutang
-- ----------------------------
DROP TABLE IF EXISTS `akun_penagihan_piutang`;
CREATE TABLE `akun_penagihan_piutang`  (
  `kd_rek` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_bank` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `atas_nama` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_rek` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kd_rek`) USING BTREE,
  CONSTRAINT `akun_penagihan_piutang_ibfk_1` FOREIGN KEY (`kd_rek`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for akun_piutang
-- ----------------------------
DROP TABLE IF EXISTS `akun_piutang`;
CREATE TABLE `akun_piutang`  (
  `nama_bayar` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_rek` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_pj` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nama_bayar`) USING BTREE,
  UNIQUE INDEX `kd_rek_2`(`kd_rek`, `kd_pj`) USING BTREE,
  INDEX `kd_rek`(`kd_rek`) USING BTREE,
  INDEX `kd_pj`(`kd_pj`) USING BTREE,
  CONSTRAINT `akun_piutang_ibfk_1` FOREIGN KEY (`kd_rek`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `akun_piutang_ibfk_2` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ambil_dankes
-- ----------------------------
DROP TABLE IF EXISTS `ambil_dankes`;
CREATE TABLE `ambil_dankes`  (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `ktg` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dankes` double NOT NULL,
  PRIMARY KEY (`id`, `tanggal`) USING BTREE,
  INDEX `ktg`(`ktg`) USING BTREE,
  INDEX `dankes`(`dankes`) USING BTREE,
  CONSTRAINT `ambil_dankes_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for angsuran_koperasi
-- ----------------------------
DROP TABLE IF EXISTS `angsuran_koperasi`;
CREATE TABLE `angsuran_koperasi`  (
  `id` int(11) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_angsur` date NOT NULL,
  `pokok` double NOT NULL,
  `jasa` double NOT NULL,
  PRIMARY KEY (`id`, `tanggal_pinjam`, `tanggal_angsur`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `pokok`(`pokok`) USING BTREE,
  INDEX `jasa`(`jasa`) USING BTREE,
  CONSTRAINT `angsuran_koperasi_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for antriapotek
-- ----------------------------
DROP TABLE IF EXISTS `antriapotek`;
CREATE TABLE `antriapotek`  (
  `loket` int(11) NOT NULL,
  `antrian` int(11) NOT NULL,
  INDEX `loket`(`loket`) USING BTREE,
  INDEX `antrian`(`antrian`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for antriloket
-- ----------------------------
DROP TABLE IF EXISTS `antriloket`;
CREATE TABLE `antriloket`  (
  `loket` int(11) NOT NULL,
  `antrian` int(11) NOT NULL,
  INDEX `loket`(`loket`) USING BTREE,
  INDEX `antrian`(`antrian`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for aplicare_ketersediaan_kamar
-- ----------------------------
DROP TABLE IF EXISTS `aplicare_ketersediaan_kamar`;
CREATE TABLE `aplicare_ketersediaan_kamar`  (
  `kode_kelas_aplicare` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kd_bangsal` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kelas` enum('Kelas 1','Kelas 2','Kelas 3','Kelas Utama','Kelas VIP','Kelas VVIP') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Kelas 1',
  `kapasitas` int(11) NULL DEFAULT NULL,
  `tersedia` int(11) NULL DEFAULT NULL,
  `tersediapria` int(11) NULL DEFAULT NULL,
  `tersediawanita` int(11) NULL DEFAULT NULL,
  `tersediapriawanita` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`kode_kelas_aplicare`, `kd_bangsal`, `kelas`) USING BTREE,
  INDEX `kd_bangsal`(`kd_bangsal`) USING BTREE,
  INDEX `kapasitas`(`kapasitas`) USING BTREE,
  INDEX `tersedia`(`tersedia`) USING BTREE,
  INDEX `tersediapria`(`tersediapria`) USING BTREE,
  INDEX `tersediawanita`(`tersediawanita`) USING BTREE,
  INDEX `tersediapriawanita`(`tersediapriawanita`) USING BTREE,
  CONSTRAINT `aplicare_ketersediaan_kamar_ibfk_1` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for asuhan_gizi
-- ----------------------------
DROP TABLE IF EXISTS `asuhan_gizi`;
CREATE TABLE `asuhan_gizi`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` date NOT NULL,
  `antropometri_bb` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `antropometri_tb` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `antropometri_imt` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `antropometri_lla` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `antropometri_tl` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `antropometri_ulna` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `antropometri_bbideal` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `antropometri_bbperu` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `antropometri_tbperu` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `antropometri_bbpertb` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `antropometri_llaperu` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `biokimia` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fisik_klinis` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alergi_telur` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alergi_susu_sapi` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alergi_kacang` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alergi_gluten` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alergi_udang` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alergi_ikan` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alergi_hazelnut` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pola_makan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `riwayat_personal` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `diagnosis` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `intervensi_gizi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `monitoring_evaluasi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `tanggal`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `asuhan_gizi_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `asuhan_gizi_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for asuransi
-- ----------------------------
DROP TABLE IF EXISTS `asuransi`;
CREATE TABLE `asuransi`  (
  `stts` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `biaya` double NOT NULL,
  PRIMARY KEY (`stts`) USING BTREE,
  INDEX `biaya`(`biaya`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for aturan_pakai
-- ----------------------------
DROP TABLE IF EXISTS `aturan_pakai`;
CREATE TABLE `aturan_pakai`  (
  `tgl_perawatan` date NOT NULL DEFAULT '0000-00-00',
  `jam` time(0) NOT NULL DEFAULT '00:00:00',
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `aturan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tgl_perawatan`, `jam`, `no_rawat`, `kode_brng`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  CONSTRAINT `aturan_pakai_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `aturan_pakai_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bahasa_pasien
-- ----------------------------
DROP TABLE IF EXISTS `bahasa_pasien`;
CREATE TABLE `bahasa_pasien`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_bahasa` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `nama_bahasa`(`nama_bahasa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for balasan_pengaduan
-- ----------------------------
DROP TABLE IF EXISTS `balasan_pengaduan`;
CREATE TABLE `balasan_pengaduan`  (
  `id_pengaduan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pesan_balasan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_pengaduan`) USING BTREE,
  CONSTRAINT `balasan_pengaduan_ibfk_1` FOREIGN KEY (`id_pengaduan`) REFERENCES `pengaduan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bangsal
-- ----------------------------
DROP TABLE IF EXISTS `bangsal`;
CREATE TABLE `bangsal`  (
  `kd_bangsal` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_bangsal` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kd_bangsal`) USING BTREE,
  INDEX `nm_bangsal`(`nm_bangsal`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bank
-- ----------------------------
DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank`  (
  `namabank` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`namabank`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for barcode
-- ----------------------------
DROP TABLE IF EXISTS `barcode`;
CREATE TABLE `barcode`  (
  `id` int(11) NOT NULL,
  `barcode` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `barcode`(`barcode`) USING BTREE,
  CONSTRAINT `barcode_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bayar_pemesanan
-- ----------------------------
DROP TABLE IF EXISTS `bayar_pemesanan`;
CREATE TABLE `bayar_pemesanan`  (
  `tgl_bayar` date NULL DEFAULT NULL,
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `besar_bayar` double NULL DEFAULT NULL,
  `keterangan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_bayar` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_bukti` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  UNIQUE INDEX `tgl_bayar`(`tgl_bayar`, `no_faktur`) USING BTREE,
  INDEX `bayar_pemesanan_ibfk_2`(`nip`) USING BTREE,
  INDEX `bayar_pemesanan_ibfk_3`(`nama_bayar`) USING BTREE,
  INDEX `bayar_pemesanan_ibfk_1`(`no_faktur`) USING BTREE,
  CONSTRAINT `bayar_pemesanan_ibfk_1` FOREIGN KEY (`no_faktur`) REFERENCES `pemesanan` (`no_faktur`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bayar_pemesanan_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bayar_pemesanan_ibfk_3` FOREIGN KEY (`nama_bayar`) REFERENCES `akun_bayar` (`nama_bayar`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bayar_pemesanan_non_medis
-- ----------------------------
DROP TABLE IF EXISTS `bayar_pemesanan_non_medis`;
CREATE TABLE `bayar_pemesanan_non_medis`  (
  `tgl_bayar` date NULL DEFAULT NULL,
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `besar_bayar` double NULL DEFAULT NULL,
  `keterangan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_bayar` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_bukti` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  INDEX `tgl_bayar`(`tgl_bayar`) USING BTREE,
  INDEX `no_faktur`(`no_faktur`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  INDEX `nama_bayar`(`nama_bayar`) USING BTREE,
  CONSTRAINT `bayar_pemesanan_non_medis_ibfk_1` FOREIGN KEY (`no_faktur`) REFERENCES `ipsrspemesanan` (`no_faktur`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bayar_pemesanan_non_medis_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bayar_pemesanan_non_medis_ibfk_3` FOREIGN KEY (`nama_bayar`) REFERENCES `akun_bayar` (`nama_bayar`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bayar_piutang
-- ----------------------------
DROP TABLE IF EXISTS `bayar_piutang`;
CREATE TABLE `bayar_piutang`  (
  `tgl_bayar` date NOT NULL,
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `besar_cicilan` double NOT NULL,
  `catatan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_rek` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_rek_kontra` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`tgl_bayar`, `no_rkm_medis`, `no_rawat`, `kd_rek`, `kd_rek_kontra`) USING BTREE,
  INDEX `no_rkm_medis`(`no_rkm_medis`) USING BTREE,
  INDEX `nota_piutang`(`no_rawat`) USING BTREE,
  INDEX `besar_cicilan`(`besar_cicilan`) USING BTREE,
  INDEX `catatan`(`catatan`) USING BTREE,
  INDEX `kd_rek`(`kd_rek`) USING BTREE,
  INDEX `kd_rek_kontra`(`kd_rek_kontra`) USING BTREE,
  CONSTRAINT `bayar_piutang_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `bayar_piutang_ibfk_2` FOREIGN KEY (`kd_rek`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `bayar_piutang_ibfk_3` FOREIGN KEY (`kd_rek_kontra`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for beri_bhp_radiologi
-- ----------------------------
DROP TABLE IF EXISTS `beri_bhp_radiologi`;
CREATE TABLE `beri_bhp_radiologi`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_periksa` date NOT NULL,
  `jam` time(0) NOT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jumlah` double NOT NULL,
  `harga` double NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  INDEX `tgl_periksa`(`tgl_periksa`) USING BTREE,
  INDEX `jam`(`jam`) USING BTREE,
  INDEX `jumlah`(`jumlah`) USING BTREE,
  CONSTRAINT `beri_bhp_radiologi_ibfk_4` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `beri_bhp_radiologi_ibfk_5` FOREIGN KEY (`kode_brng`) REFERENCES `ipsrsbarang` (`kode_brng`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `beri_bhp_radiologi_ibfk_6` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for beri_obat_operasi
-- ----------------------------
DROP TABLE IF EXISTS `beri_obat_operasi`;
CREATE TABLE `beri_obat_operasi`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime(0) NOT NULL,
  `kd_obat` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hargasatuan` double NOT NULL,
  `jumlah` double NOT NULL,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `kd_obat`(`kd_obat`) USING BTREE,
  INDEX `tanggal`(`tanggal`) USING BTREE,
  INDEX `hargasatuan`(`hargasatuan`) USING BTREE,
  INDEX `jumlah`(`jumlah`) USING BTREE,
  CONSTRAINT `beri_obat_operasi_ibfk_2` FOREIGN KEY (`kd_obat`) REFERENCES `obatbhp_ok` (`kd_obat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `beri_obat_operasi_ibfk_3` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for berkas_digital_perawatan
-- ----------------------------
DROP TABLE IF EXISTS `berkas_digital_perawatan`;
CREATE TABLE `berkas_digital_perawatan`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lokasi_file` varchar(600) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `kode`, `lokasi_file`) USING BTREE,
  INDEX `kode`(`kode`) USING BTREE,
  CONSTRAINT `berkas_digital_perawatan_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `berkas_digital_perawatan_ibfk_2` FOREIGN KEY (`kode`) REFERENCES `master_berkas_digital` (`kode`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for berkas_pegawai
-- ----------------------------
DROP TABLE IF EXISTS `berkas_pegawai`;
CREATE TABLE `berkas_pegawai`  (
  `nik` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_uploud` date NOT NULL,
  `kode_berkas` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `berkas` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  INDEX `nik`(`nik`) USING BTREE,
  INDEX `kode_berkas`(`kode_berkas`) USING BTREE,
  CONSTRAINT `berkas_pegawai_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `pegawai` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `berkas_pegawai_ibfk_2` FOREIGN KEY (`kode_berkas`) REFERENCES `master_berkas_pegawai` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for biaya_harian
-- ----------------------------
DROP TABLE IF EXISTS `biaya_harian`;
CREATE TABLE `biaya_harian`  (
  `kd_kamar` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_biaya` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `besar_biaya` double NOT NULL,
  `jml` int(11) NOT NULL,
  PRIMARY KEY (`kd_kamar`, `nama_biaya`) USING BTREE,
  INDEX `besar_biaya`(`besar_biaya`) USING BTREE,
  INDEX `jml`(`jml`) USING BTREE,
  CONSTRAINT `biaya_harian_ibfk_1` FOREIGN KEY (`kd_kamar`) REFERENCES `kamar` (`kd_kamar`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for biaya_sekali
-- ----------------------------
DROP TABLE IF EXISTS `biaya_sekali`;
CREATE TABLE `biaya_sekali`  (
  `kd_kamar` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_biaya` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `besar_biaya` double NOT NULL,
  PRIMARY KEY (`kd_kamar`, `nama_biaya`) USING BTREE,
  INDEX `kd_kamar`(`kd_kamar`) USING BTREE,
  INDEX `besar_biaya`(`besar_biaya`) USING BTREE,
  CONSTRAINT `biaya_sekali_ibfk_1` FOREIGN KEY (`kd_kamar`) REFERENCES `kamar` (`kd_kamar`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bidang
-- ----------------------------
DROP TABLE IF EXISTS `bidang`;
CREATE TABLE `bidang`  (
  `nama` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`nama`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for billing
-- ----------------------------
DROP TABLE IF EXISTS `billing`;
CREATE TABLE `billing`  (
  `noindex` int(11) NOT NULL,
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_byr` date NULL DEFAULT NULL,
  `no` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_perawatan` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemisah` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `biaya` double NOT NULL,
  `jumlah` double NOT NULL,
  `tambahan` double NOT NULL,
  `totalbiaya` double NOT NULL,
  `status` enum('Laborat','Radiologi','Operasi','Obat','Ranap Dokter','Ranap Dokter Paramedis','Ranap Paramedis','Ralan Dokter','Ralan Dokter Paramedis','Ralan Paramedis','Tambahan','Potongan','Administrasi','Kamar','-','Registrasi','Harian','Service','TtlObat','TtlRanap Dokter','TtlRanap Paramedis','TtlRalan Dokter','TtlRalan Paramedis','TtlKamar','Dokter','Perawat','TtlTambahan','Retur Obat','TtlRetur Obat','Resep Pulang','TtlResep Pulang','TtlPotongan','TtlLaborat','TtlOperasi','TtlRadiologi','Tagihan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `totalbiaya`(`totalbiaya`) USING BTREE,
  INDEX `nm_perawatan`(`nm_perawatan`) USING BTREE,
  INDEX `tgl_byr`(`tgl_byr`) USING BTREE,
  INDEX `no`(`no`) USING BTREE,
  INDEX `pemisah`(`pemisah`) USING BTREE,
  INDEX `biaya`(`biaya`) USING BTREE,
  INDEX `jumlah`(`jumlah`) USING BTREE,
  INDEX `tambahan`(`tambahan`) USING BTREE,
  CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for booking_operasi
-- ----------------------------
DROP TABLE IF EXISTS `booking_operasi`;
CREATE TABLE `booking_operasi`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_paket` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `jam_mulai` time(0) NULL DEFAULT NULL,
  `jam_selesai` time(0) NULL DEFAULT NULL,
  `status` enum('Menunggu','Proses Operasi','Selesai') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `kode_paket`(`kode_paket`) USING BTREE,
  INDEX `kd_dokter`(`kd_dokter`) USING BTREE,
  CONSTRAINT `booking_operasi_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `booking_operasi_ibfk_2` FOREIGN KEY (`kode_paket`) REFERENCES `paket_operasi` (`kode_paket`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `booking_operasi_ibfk_3` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for booking_periksa
-- ----------------------------
DROP TABLE IF EXISTS `booking_periksa`;
CREATE TABLE `booking_periksa`  (
  `no_booking` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `nama` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alamat` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_telp` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_poli` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tambahan_pesan` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` enum('Diterima','Ditolak','Belum Dibalas') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal_booking` datetime(0) NOT NULL,
  PRIMARY KEY (`no_booking`) USING BTREE,
  UNIQUE INDEX `tanggal`(`tanggal`, `no_telp`) USING BTREE,
  INDEX `kd_poli`(`kd_poli`) USING BTREE,
  CONSTRAINT `booking_periksa_ibfk_1` FOREIGN KEY (`kd_poli`) REFERENCES `poliklinik` (`kd_poli`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for booking_periksa_balasan
-- ----------------------------
DROP TABLE IF EXISTS `booking_periksa_balasan`;
CREATE TABLE `booking_periksa_balasan`  (
  `no_booking` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `balasan` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_booking`) USING BTREE,
  CONSTRAINT `booking_periksa_balasan_ibfk_1` FOREIGN KEY (`no_booking`) REFERENCES `booking_periksa` (`no_booking`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for booking_periksa_diterima
-- ----------------------------
DROP TABLE IF EXISTS `booking_periksa_diterima`;
CREATE TABLE `booking_periksa_diterima`  (
  `no_booking` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_booking`) USING BTREE,
  INDEX `no_rkm_medis`(`no_rkm_medis`) USING BTREE,
  CONSTRAINT `booking_periksa_diterima_ibfk_1` FOREIGN KEY (`no_booking`) REFERENCES `booking_periksa` (`no_booking`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `booking_periksa_diterima_ibfk_2` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for booking_registrasi
-- ----------------------------
DROP TABLE IF EXISTS `booking_registrasi`;
CREATE TABLE `booking_registrasi`  (
  `tanggal_booking` date NULL DEFAULT NULL,
  `jam_booking` time(0) NULL DEFAULT NULL,
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal_periksa` date NOT NULL,
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_poli` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_reg` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_pj` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `limit_reg` int(1) NULL DEFAULT NULL,
  `waktu_kunjungan` datetime(0) NULL DEFAULT NULL,
  `status` enum('Terdaftar','Belum','Batal','Dokter Berhalangan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rkm_medis`, `tanggal_periksa`) USING BTREE,
  INDEX `kd_dokter`(`kd_dokter`) USING BTREE,
  INDEX `kd_poli`(`kd_poli`) USING BTREE,
  INDEX `no_rkm_medis`(`no_rkm_medis`) USING BTREE,
  INDEX `kd_pj`(`kd_pj`) USING BTREE,
  CONSTRAINT `booking_registrasi_ibfk_1` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `booking_registrasi_ibfk_2` FOREIGN KEY (`kd_poli`) REFERENCES `poliklinik` (`kd_poli`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `booking_registrasi_ibfk_3` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `booking_registrasi_ibfk_4` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bpjs
-- ----------------------------
DROP TABLE IF EXISTS `bpjs`;
CREATE TABLE `bpjs`  (
  `stts` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `biaya` double NOT NULL,
  PRIMARY KEY (`stts`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bpjs_prb
-- ----------------------------
DROP TABLE IF EXISTS `bpjs_prb`;
CREATE TABLE `bpjs_prb`  (
  `no_sep` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `prb` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_sep`) USING BTREE,
  CONSTRAINT `bpjs_prb_ibfk_1` FOREIGN KEY (`no_sep`) REFERENCES `bridging_sep` (`no_sep`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bridging_dukcapil
-- ----------------------------
DROP TABLE IF EXISTS `bridging_dukcapil`;
CREATE TABLE `bridging_dukcapil`  (
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rkm_medis`) USING BTREE,
  CONSTRAINT `bridging_dukcapil_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bridging_inhealth
-- ----------------------------
DROP TABLE IF EXISTS `bridging_inhealth`;
CREATE TABLE `bridging_inhealth`  (
  `no_sjp` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tglsep` datetime(0) NULL DEFAULT NULL,
  `tglrujukan` datetime(0) NULL DEFAULT NULL,
  `no_rujukan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kdppkrujukan` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nmppkrujukan` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kdppkpelayanan` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nmppkpelayanan` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jnspelayanan` enum('1','2','3','4') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `catatan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `diagawal` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nmdiagnosaawal` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `diagawal2` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nmdiagnosaawal2` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kdpolitujuan` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nmpolitujuan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `klsrawat` enum('000','100','101','102','103','104','110','200','201','202','203','204','210','300','301','302','303','304','310','311','312','400','401','402','403','404','410','411','412','413','500','510','511','512','610','611','612','613','710','711','712','713','910','911','912','913') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `klsdesc` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kdbu` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nmbu` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lakalantas` enum('0','1','2') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lokasilaka` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `user` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nomr` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_pasien` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal_lahir` date NULL DEFAULT NULL,
  `jkel` enum('LAKI-LAKI','PEREMPUAN') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_kartu` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tglpulang` datetime(0) NULL DEFAULT NULL,
  `plan` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `plandesc` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `idakomodasi` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tipesjp` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tipecob` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_sjp`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  CONSTRAINT `bridging_inhealth_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bridging_rujukan_bpjs
-- ----------------------------
DROP TABLE IF EXISTS `bridging_rujukan_bpjs`;
CREATE TABLE `bridging_rujukan_bpjs`  (
  `no_sep` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tglRujukan` date NULL DEFAULT NULL,
  `ppkDirujuk` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nm_ppkDirujuk` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jnsPelayanan` enum('1','2') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `catatan` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `diagRujukan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_diagRujukan` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tipeRujukan` enum('0. Penuh','1. Partial','2. Rujuk Balik') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `poliRujukan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_poliRujukan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_rujukan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `user` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_sep`) USING BTREE,
  CONSTRAINT `bridging_rujukan_bpjs_ibfk_1` FOREIGN KEY (`no_sep`) REFERENCES `bridging_sep` (`no_sep`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bridging_sep
-- ----------------------------
DROP TABLE IF EXISTS `bridging_sep`;
CREATE TABLE `bridging_sep`  (
  `no_sep` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tglsep` date NULL DEFAULT NULL,
  `tglrujukan` date NULL DEFAULT NULL,
  `no_rujukan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kdppkrujukan` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nmppkrujukan` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kdppkpelayanan` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nmppkpelayanan` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jnspelayanan` enum('1','2') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `catatan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `diagawal` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nmdiagnosaawal` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kdpolitujuan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nmpolitujuan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `klsrawat` enum('1','2','3') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lakalantas` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `user` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nomr` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_pasien` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal_lahir` date NULL DEFAULT NULL,
  `peserta` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jkel` enum('L','P') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_kartu` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tglpulang` datetime(0) NULL DEFAULT NULL,
  `asal_rujukan` enum('1. Faskes 1','2. Faskes 2(RS)') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `eksekutif` enum('0. Tidak','1.Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cob` enum('0. Tidak','1.Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `penjamin` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `notelep` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `katarak` enum('0. Tidak','1.Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tglkkl` date NOT NULL,
  `keterangankkl` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `suplesi` enum('0. Tidak','1.Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_sep_suplesi` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kdprop` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nmprop` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kdkab` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nmkab` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kdkec` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nmkec` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `noskdp` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kddpjp` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nmdpdjp` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_sep`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  CONSTRAINT `bridging_sep_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bridging_surat_kontrol_bpjs
-- ----------------------------
DROP TABLE IF EXISTS `bridging_surat_kontrol_bpjs`;
CREATE TABLE `bridging_surat_kontrol_bpjs`  (
  `no_sep` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_surat` date NOT NULL,
  `no_surat` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_rencana` date NULL DEFAULT NULL,
  `kd_dokter_bpjs` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nm_dokter_bpjs` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_poli_bpjs` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nm_poli_bpjs` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_surat`) USING BTREE,
  INDEX `bridging_surat_kontrol_bpjs_ibfk_1`(`no_sep`) USING BTREE,
  CONSTRAINT `bridging_surat_kontrol_bpjs_ibfk_1` FOREIGN KEY (`no_sep`) REFERENCES `bridging_sep` (`no_sep`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bridging_surat_pri_bpjs
-- ----------------------------
DROP TABLE IF EXISTS `bridging_surat_pri_bpjs`;
CREATE TABLE `bridging_surat_pri_bpjs`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_kartu` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_surat` date NOT NULL,
  `no_surat` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_rencana` date NULL DEFAULT NULL,
  `kd_dokter_bpjs` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nm_dokter_bpjs` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_poli_bpjs` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nm_poli_bpjs` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `diagnosa` varchar(130) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_surat`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  CONSTRAINT `bridging_surat_pri_bpjs_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bukti_pemesanan
-- ----------------------------
DROP TABLE IF EXISTS `bukti_pemesanan`;
CREATE TABLE `bukti_pemesanan`  (
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `photo` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_faktur`) USING BTREE,
  CONSTRAINT `bukti_pemesanan_ibfk_1` FOREIGN KEY (`no_faktur`) REFERENCES `pemesanan` (`no_faktur`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bukti_pemesanan_logistik
-- ----------------------------
DROP TABLE IF EXISTS `bukti_pemesanan_logistik`;
CREATE TABLE `bukti_pemesanan_logistik`  (
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `photo` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_faktur`) USING BTREE,
  CONSTRAINT `bukti_pemesanan_logistik_ibfk_1` FOREIGN KEY (`no_faktur`) REFERENCES `ipsrspemesanan` (`no_faktur`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bukti_penagihan_piutang
-- ----------------------------
DROP TABLE IF EXISTS `bukti_penagihan_piutang`;
CREATE TABLE `bukti_penagihan_piutang`  (
  `no_tagihan` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `photo` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_tagihan`) USING BTREE,
  CONSTRAINT `bukti_penagihan_piutang_ibfk_1` FOREIGN KEY (`no_tagihan`) REFERENCES `penagihan_piutang` (`no_tagihan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cacat_fisik
-- ----------------------------
DROP TABLE IF EXISTS `cacat_fisik`;
CREATE TABLE `cacat_fisik`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_cacat` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `nama_cacat`(`nama_cacat`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for catatan_pasien
-- ----------------------------
DROP TABLE IF EXISTS `catatan_pasien`;
CREATE TABLE `catatan_pasien`  (
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `catatan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`no_rkm_medis`) USING BTREE,
  INDEX `no_rkm_medis`(`no_rkm_medis`) USING BTREE,
  CONSTRAINT `catatan_pasien_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for catatan_perawatan
-- ----------------------------
DROP TABLE IF EXISTS `catatan_perawatan`;
CREATE TABLE `catatan_perawatan`  (
  `tanggal` date NULL DEFAULT NULL,
  `jam` time(0) NULL DEFAULT NULL,
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `catatan` varchar(700) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `kd_dokter`(`kd_dokter`) USING BTREE,
  CONSTRAINT `catatan_perawatan_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `catatan_perawatan_ibfk_2` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for closing_kasir
-- ----------------------------
DROP TABLE IF EXISTS `closing_kasir`;
CREATE TABLE `closing_kasir`  (
  `shift` enum('Pagi','Siang','Sore','Malam') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jam_masuk` time(0) NOT NULL,
  `jam_pulang` time(0) NOT NULL,
  PRIMARY KEY (`shift`) USING BTREE,
  INDEX `jam_masuk`(`jam_masuk`) USING BTREE,
  INDEX `jam_pulang`(`jam_pulang`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cssd_barang
-- ----------------------------
DROP TABLE IF EXISTS `cssd_barang`;
CREATE TABLE `cssd_barang`  (
  `no_inventaris` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jenis_barang` enum('Heacting Set','Partus Set','Set Bedah') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_inventaris`) USING BTREE,
  CONSTRAINT `cssd_barang_ibfk_1` FOREIGN KEY (`no_inventaris`) REFERENCES `inventaris` (`no_inventaris`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for dansos
-- ----------------------------
DROP TABLE IF EXISTS `dansos`;
CREATE TABLE `dansos`  (
  `dana` double NOT NULL,
  PRIMARY KEY (`dana`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for data_batch
-- ----------------------------
DROP TABLE IF EXISTS `data_batch`;
CREATE TABLE `data_batch`  (
  `no_batch` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tgl_beli` date NOT NULL,
  `tgl_kadaluarsa` date NOT NULL,
  `asal` enum('Penerimaan','Pengadaan','Hibah') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dasar` double NOT NULL,
  `h_beli` double NULL DEFAULT NULL,
  `ralan` double NULL DEFAULT NULL,
  `kelas1` double NULL DEFAULT NULL,
  `kelas2` double NULL DEFAULT NULL,
  `kelas3` double NULL DEFAULT NULL,
  `utama` double NULL DEFAULT NULL,
  `vip` double NULL DEFAULT NULL,
  `vvip` double NULL DEFAULT NULL,
  `beliluar` double NULL DEFAULT NULL,
  `jualbebas` double NULL DEFAULT NULL,
  `karyawan` double NULL DEFAULT NULL,
  `jumlahbeli` double NOT NULL,
  `sisa` double NOT NULL,
  PRIMARY KEY (`no_batch`, `kode_brng`, `no_faktur`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  CONSTRAINT `data_batch_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for data_hais
-- ----------------------------
DROP TABLE IF EXISTS `data_hais`;
CREATE TABLE `data_hais`  (
  `tanggal` date NOT NULL,
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ETT` int(11) NULL DEFAULT NULL,
  `CVL` int(11) NULL DEFAULT NULL,
  `IVL` int(11) NULL DEFAULT NULL,
  `UC` int(11) NULL DEFAULT NULL,
  `VAP` int(11) NULL DEFAULT NULL,
  `IAD` int(11) NULL DEFAULT NULL,
  `PLEB` int(11) NULL DEFAULT NULL,
  `ISK` int(11) NULL DEFAULT NULL,
  `ILO` int(11) NOT NULL,
  `HAP` int(11) NULL DEFAULT NULL,
  `Tinea` int(11) NULL DEFAULT NULL,
  `Scabies` int(11) NULL DEFAULT NULL,
  `DEKU` enum('IYA','TIDAK') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `SPUTUM` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DARAH` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `URINE` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ANTIBIOTIK` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_kamar` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tanggal`, `no_rawat`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `ETT`(`ETT`) USING BTREE,
  INDEX `CVL`(`CVL`) USING BTREE,
  INDEX `IVL`(`IVL`) USING BTREE,
  INDEX `SPUTUM`(`SPUTUM`) USING BTREE,
  INDEX `ANTIBIOTIK`(`ANTIBIOTIK`) USING BTREE,
  INDEX `DARAH`(`DARAH`) USING BTREE,
  INDEX `URINE`(`URINE`) USING BTREE,
  INDEX `DEKU`(`DEKU`) USING BTREE,
  INDEX `ISK`(`ISK`) USING BTREE,
  INDEX `PLEB`(`PLEB`) USING BTREE,
  INDEX `IAD`(`IAD`) USING BTREE,
  INDEX `VAP`(`VAP`) USING BTREE,
  INDEX `UC`(`UC`) USING BTREE,
  INDEX `ILO`(`ILO`) USING BTREE,
  INDEX `kd_kamar`(`kd_kamar`) USING BTREE,
  CONSTRAINT `data_HAIs_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `data_HAIs_ibfk_2` FOREIGN KEY (`kd_kamar`) REFERENCES `kamar` (`kd_kamar`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for data_klasifikasi_pasien_ranap
-- ----------------------------
DROP TABLE IF EXISTS `data_klasifikasi_pasien_ranap`;
CREATE TABLE `data_klasifikasi_pasien_ranap`  (
  `tanggal` date NOT NULL,
  `no_rawat` varchar(51) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Minimal` enum('TIDAK','IYA') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Partial` enum('TIDAK','IYA') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Total` enum('TIDAK','IYA') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_kamar` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tanggal`, `no_rawat`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `kd_kamar`(`kd_kamar`) USING BTREE,
  CONSTRAINT `data_klasifikasi_pasien_ranap_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `data_klasifikasi_pasien_ranap_ibfk_2` FOREIGN KEY (`kd_kamar`) REFERENCES `kamar` (`kd_kamar`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for data_tb
-- ----------------------------
DROP TABLE IF EXISTS `data_tb`;
CREATE TABLE `data_tb`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_tb_03` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_periode_laporan` enum('1=Januari - Maret','2=April - Juni','3=Juli - September','4=Oktober - Desember') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal_buat_laporan` datetime(0) NULL DEFAULT NULL,
  `tahun_buat_laporan` year NULL DEFAULT NULL,
  `kd_wasor` int(11) NULL DEFAULT NULL,
  `noregkab` int(11) NULL DEFAULT NULL,
  `id_propinsi` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_kabupaten` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_kecamatan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_kelurahan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_rujukan` enum('Inisiatif pasien/Keluarga','Anggota Masyarakat/Kader','Faskes','Dokter Praktek Mandiri','Poli lain','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sebutkan1` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tipe_diagnosis` enum('Terkonfirmasi bakteriologis','Terdiagnosis klinis') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `klasifikasi_lokasi_anatomi` enum('Paru','Ekstraparu') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `klasifikasi_riwayat_pengobatan` enum('Baru','Kambuh','Diobati setelah gagal','Diobati Setelah Putus Berobat','Lain-lain','Riwayat Pengobatan Sebelumnya Tidak Diketahui','Pindahan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `klasifikasi_status_hiv` enum('Positif','Negatif','Tidak diketahui') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `total_skoring_anak` enum('1','2','3','4','5','6','7','8','9','10','11','12','13','Tidak dilakukan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `konfirmasiSkoring5` enum('Uji Tuberkulin Positif','Ada Kontak TB Paru','Uji Tuberkulin Negatif','Tidak Ada Kontak TB Paru') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `konfirmasiSkoring6` enum('Ada Kontak TB Paru','Tidak Ada','Tidak Jelas Kontak TB Paru') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal_mulai_pengobatan` date NULL DEFAULT NULL,
  `paduan_oat` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sumber_obat` enum('Program TB','Bayar Sendiri','Asuransi','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sebutkan` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sebelum_pengobatan_hasil_mikroskopis` enum('Positif','Negatif','Tidak dilakukan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sebelum_pengobatan_hasil_tes_cepat` enum('Rif sensitif','Rif resisten','Negatif','Rif Indeterminated','Invalid','Error','No Result','Tidak dilakukan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sebelum_pengobatan_hasil_biakan` enum('Negatif','1-19 BTA','1+','2+','3+','4+','NTM','Kontaminasi','Tidak dilakukan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `noreglab_bulan_2` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hasil_mikroskopis_bulan_2` enum('Positif','Negatif','Tidak dilakukan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `noreglab_bulan_3` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hasil_mikroskopis_bulan_3` enum('Positif','Negatif','Tidak dilakukan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `noreglab_bulan_5` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hasil_mikroskopis_bulan_5` enum('Positif','Negatif','Tidak dilakukan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `akhir_pengobatan_noreglab` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `akhir_pengobatan_hasil_mikroskopis` enum('Positif','Negatif','Tidak dilakukan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal_hasil_akhir_pengobatan` date NULL DEFAULT NULL,
  `hasil_akhir_pengobatan` enum('Sembuh','Pengobatan Lengkap','Lost To Follow Up','Meninggal','Gagal','Pindah') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal_dianjurkan_tes` date NULL DEFAULT NULL,
  `tanggal_tes_hiv` date NULL DEFAULT NULL,
  `hasil_tes_hiv` enum('Reaktif','Non Reaktif','Indeterminated') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ppk` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `art` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tb_dm` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `terapi_dm` enum('OHO','Inj. Insulin','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pindah_ro` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status_pengobatan` enum('Sesuai Standar','Tidak Sesuai Standar') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `foto_toraks` enum('Positif','Negatif','Tidak Dilakukan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `toraks_tdk_dilakukan` enum('Tidak dilakukan','Setelah terapi antibioka non OAT: tidak ada perbaikan Klinis, ada faktor resiko TB, dan atas pertimbangan dokter','Setelah terapi antibioka non OAT: ada Perbaikan Klinis') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keterangan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_icd_x` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  INDEX `kode_icd_x`(`kode_icd_x`) USING BTREE,
  CONSTRAINT `data_tb_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `data_tb_ibfk_2` FOREIGN KEY (`kode_icd_x`) REFERENCES `penyakit` (`kd_penyakit`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for data_triase_igd
-- ----------------------------
DROP TABLE IF EXISTS `data_triase_igd`;
CREATE TABLE `data_triase_igd`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_kunjungan` datetime(0) NOT NULL,
  `cara_masuk` enum('Jalan','Brankar','Kursi Roda','Digendong') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alat_transportasi` enum('-','AGD','Sendiri','Swasta') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alasan_kedatangan` enum('Datang Sendiri','Polisi','Rujukan','-') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan_kedatangan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_kasus` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tekanan_darah` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nadi` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pernapasan` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `suhu` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `saturasi_o2` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nyeri` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  INDEX `kode_kasus`(`kode_kasus`) USING BTREE,
  CONSTRAINT `data_triase_igd_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `data_triase_igd_ibfk_2` FOREIGN KEY (`kode_kasus`) REFERENCES `master_triase_macam_kasus` (`kode_kasus`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for data_triase_igddetail_skala1
-- ----------------------------
DROP TABLE IF EXISTS `data_triase_igddetail_skala1`;
CREATE TABLE `data_triase_igddetail_skala1`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_skala1` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `kode_skala1`) USING BTREE,
  INDEX `data_triase_igddetail_skala1_ibfk_1`(`kode_skala1`) USING BTREE,
  CONSTRAINT `data_triase_igddetail_skala1_ibfk_1` FOREIGN KEY (`kode_skala1`) REFERENCES `master_triase_skala1` (`kode_skala1`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `data_triase_igddetail_skala1_ibfk_2` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for data_triase_igddetail_skala2
-- ----------------------------
DROP TABLE IF EXISTS `data_triase_igddetail_skala2`;
CREATE TABLE `data_triase_igddetail_skala2`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_skala2` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `kode_skala2`) USING BTREE,
  INDEX `kode_skala2`(`kode_skala2`) USING BTREE,
  CONSTRAINT `data_triase_igddetail_skala2_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `data_triase_igddetail_skala2_ibfk_2` FOREIGN KEY (`kode_skala2`) REFERENCES `master_triase_skala2` (`kode_skala2`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for data_triase_igddetail_skala3
-- ----------------------------
DROP TABLE IF EXISTS `data_triase_igddetail_skala3`;
CREATE TABLE `data_triase_igddetail_skala3`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_skala3` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `kode_skala3`) USING BTREE,
  INDEX `kode_skala3`(`kode_skala3`) USING BTREE,
  CONSTRAINT `data_triase_igddetail_skala3_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `data_triase_igddetail_skala3_ibfk_2` FOREIGN KEY (`kode_skala3`) REFERENCES `master_triase_skala3` (`kode_skala3`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for data_triase_igddetail_skala4
-- ----------------------------
DROP TABLE IF EXISTS `data_triase_igddetail_skala4`;
CREATE TABLE `data_triase_igddetail_skala4`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_skala4` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `kode_skala4`) USING BTREE,
  INDEX `kode_skala4`(`kode_skala4`) USING BTREE,
  CONSTRAINT `data_triase_igddetail_skala4_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `data_triase_igddetail_skala4_ibfk_2` FOREIGN KEY (`kode_skala4`) REFERENCES `master_triase_skala4` (`kode_skala4`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for data_triase_igddetail_skala5
-- ----------------------------
DROP TABLE IF EXISTS `data_triase_igddetail_skala5`;
CREATE TABLE `data_triase_igddetail_skala5`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_skala5` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `kode_skala5`) USING BTREE,
  INDEX `kode_skala5`(`kode_skala5`) USING BTREE,
  CONSTRAINT `data_triase_igddetail_skala5_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `data_triase_igddetail_skala5_ibfk_2` FOREIGN KEY (`kode_skala5`) REFERENCES `master_triase_skala5` (`kode_skala5`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for data_triase_igdprimer
-- ----------------------------
DROP TABLE IF EXISTS `data_triase_igdprimer`;
CREATE TABLE `data_triase_igdprimer`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keluhan_utama` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kebutuhan_khusus` enum('-','UPPA','Airborne','Dekontaminan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `catatan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `plan` enum('Ruang Resusitasi','Ruang Kritis') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggaltriase` datetime(0) NOT NULL,
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  INDEX `nip`(`kd_dokter`) USING BTREE,
  CONSTRAINT `data_triase_igdprimer_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `data_triase_igdprimer_ibfk_2` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for data_triase_igdsekunder
-- ----------------------------
DROP TABLE IF EXISTS `data_triase_igdsekunder`;
CREATE TABLE `data_triase_igdsekunder`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `anamnesa_singkat` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `catatan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `plan` enum('Zona Kuning','Zona Hijau') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggaltriase` datetime(0) NOT NULL,
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  INDEX `nip`(`kd_dokter`) USING BTREE,
  CONSTRAINT `data_triase_igdsekunder_ibfk_1` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `data_triase_igdsekunder_ibfk_2` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for databarang
-- ----------------------------
DROP TABLE IF EXISTS `databarang`;
CREATE TABLE `databarang`  (
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nama_brng` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_satbesar` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `letak_barang` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dasar` double NOT NULL,
  `h_beli` double NULL DEFAULT NULL,
  `ralan` double NULL DEFAULT NULL,
  `kelas1` double NULL DEFAULT NULL,
  `kelas2` double NULL DEFAULT NULL,
  `kelas3` double NULL DEFAULT NULL,
  `utama` double NULL DEFAULT NULL,
  `vip` double NULL DEFAULT NULL,
  `vvip` double NULL DEFAULT NULL,
  `beliluar` double NULL DEFAULT NULL,
  `jualbebas` double NULL DEFAULT NULL,
  `karyawan` double NULL DEFAULT NULL,
  `stokminimal` double NULL DEFAULT NULL,
  `kdjns` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `isi` double NOT NULL,
  `kapasitas` double NOT NULL,
  `expire` date NULL DEFAULT NULL,
  `status` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_industri` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_kategori` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_golongan` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_brng`) USING BTREE,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  INDEX `kdjns`(`kdjns`) USING BTREE,
  INDEX `nama_brng`(`nama_brng`) USING BTREE,
  INDEX `letak_barang`(`letak_barang`) USING BTREE,
  INDEX `h_beli`(`h_beli`) USING BTREE,
  INDEX `h_distributor`(`ralan`) USING BTREE,
  INDEX `h_grosir`(`kelas1`) USING BTREE,
  INDEX `h_retail`(`kelas2`) USING BTREE,
  INDEX `stok`(`stokminimal`) USING BTREE,
  INDEX `kapasitas`(`kapasitas`) USING BTREE,
  INDEX `kode_industri`(`kode_industri`) USING BTREE,
  INDEX `kelas3`(`kelas3`) USING BTREE,
  INDEX `utama`(`utama`) USING BTREE,
  INDEX `vip`(`vip`) USING BTREE,
  INDEX `vvip`(`vvip`) USING BTREE,
  INDEX `beliluar`(`beliluar`) USING BTREE,
  INDEX `jualbebas`(`jualbebas`) USING BTREE,
  INDEX `karyawan`(`karyawan`) USING BTREE,
  INDEX `expire`(`expire`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `kode_kategori`(`kode_kategori`) USING BTREE,
  INDEX `kode_golongan`(`kode_golongan`) USING BTREE,
  INDEX `kode_satbesar`(`kode_satbesar`) USING BTREE,
  CONSTRAINT `databarang_ibfk_2` FOREIGN KEY (`kdjns`) REFERENCES `jenis` (`kdjns`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `databarang_ibfk_3` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `databarang_ibfk_4` FOREIGN KEY (`kode_industri`) REFERENCES `industrifarmasi` (`kode_industri`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `databarang_ibfk_5` FOREIGN KEY (`kode_kategori`) REFERENCES `kategori_barang` (`kode`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `databarang_ibfk_6` FOREIGN KEY (`kode_golongan`) REFERENCES `golongan_barang` (`kode`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `databarang_ibfk_7` FOREIGN KEY (`kode_satbesar`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for datasuplier
-- ----------------------------
DROP TABLE IF EXISTS `datasuplier`;
CREATE TABLE `datasuplier`  (
  `kode_suplier` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_suplier` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alamat` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kota` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_telp` varchar(13) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_bank` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rekening` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_suplier`) USING BTREE,
  INDEX `nama_suplier`(`nama_suplier`) USING BTREE,
  INDEX `alamat`(`alamat`) USING BTREE,
  INDEX `kota`(`kota`) USING BTREE,
  INDEX `no_telp`(`no_telp`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for departemen
-- ----------------------------
DROP TABLE IF EXISTS `departemen`;
CREATE TABLE `departemen`  (
  `dep_id` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`dep_id`) USING BTREE,
  INDEX `nama`(`nama`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for deposit
-- ----------------------------
DROP TABLE IF EXISTS `deposit`;
CREATE TABLE `deposit`  (
  `no_deposit` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_deposit` datetime(0) NOT NULL,
  `nama_bayar` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `besarppn` double NOT NULL,
  `besar_deposit` double NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_deposit`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  INDEX `besar_deposit`(`besar_deposit`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `nama_bayar`(`nama_bayar`) USING BTREE,
  CONSTRAINT `deposit_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `deposit_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `deposit_ibfk_3` FOREIGN KEY (`nama_bayar`) REFERENCES `akun_bayar` (`nama_bayar`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detail_beri_diet
-- ----------------------------
DROP TABLE IF EXISTS `detail_beri_diet`;
CREATE TABLE `detail_beri_diet`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_kamar` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` enum('Pagi','Pagi2','Pagi3','Siang','Siang2','Siang3','Sore','Sore2','Sore3','Malam','Malam2','Malam3') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_diet` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `kd_kamar`, `tanggal`, `waktu`, `kd_diet`) USING BTREE,
  INDEX `kd_kamar`(`kd_kamar`) USING BTREE,
  INDEX `kd_diet`(`kd_diet`) USING BTREE,
  INDEX `tanggal`(`tanggal`) USING BTREE,
  INDEX `waktu`(`waktu`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  CONSTRAINT `detail_beri_diet_ibfk_4` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detail_beri_diet_ibfk_5` FOREIGN KEY (`kd_kamar`) REFERENCES `kamar` (`kd_kamar`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detail_beri_diet_ibfk_6` FOREIGN KEY (`kd_diet`) REFERENCES `diet` (`kd_diet`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detail_beri_diet_ibfk_7` FOREIGN KEY (`waktu`) REFERENCES `jam_diet_pasien` (`waktu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detail_nota_inap
-- ----------------------------
DROP TABLE IF EXISTS `detail_nota_inap`;
CREATE TABLE `detail_nota_inap`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_bayar` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `besarppn` double NULL DEFAULT NULL,
  `besar_bayar` double NULL DEFAULT NULL,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `nama_bayar`(`nama_bayar`) USING BTREE,
  INDEX `besarppn`(`besarppn`) USING BTREE,
  INDEX `besar_bayar`(`besar_bayar`) USING BTREE,
  CONSTRAINT `detail_nota_inap_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detail_nota_inap_ibfk_2` FOREIGN KEY (`nama_bayar`) REFERENCES `akun_bayar` (`nama_bayar`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detail_nota_jalan
-- ----------------------------
DROP TABLE IF EXISTS `detail_nota_jalan`;
CREATE TABLE `detail_nota_jalan`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_bayar` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `besarppn` double NULL DEFAULT NULL,
  `besar_bayar` double NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`, `nama_bayar`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `nama_bayar`(`nama_bayar`) USING BTREE,
  INDEX `besarppn`(`besarppn`) USING BTREE,
  INDEX `besar_bayar`(`besar_bayar`) USING BTREE,
  CONSTRAINT `detail_nota_jalan_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detail_nota_jalan_ibfk_2` FOREIGN KEY (`nama_bayar`) REFERENCES `akun_bayar` (`nama_bayar`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detail_obat_racikan
-- ----------------------------
DROP TABLE IF EXISTS `detail_obat_racikan`;
CREATE TABLE `detail_obat_racikan`  (
  `tgl_perawatan` date NOT NULL,
  `jam` time(0) NOT NULL,
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_racik` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`tgl_perawatan`, `jam`, `no_rawat`, `no_racik`, `kode_brng`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  CONSTRAINT `detail_obat_racikan_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detail_obat_racikan_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detail_obat_racikan_jual
-- ----------------------------
DROP TABLE IF EXISTS `detail_obat_racikan_jual`;
CREATE TABLE `detail_obat_racikan_jual`  (
  `nota_jual` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_racik` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`nota_jual`, `no_racik`, `kode_brng`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  CONSTRAINT `detail_obat_racikan_jual_ibfk_1` FOREIGN KEY (`nota_jual`) REFERENCES `penjualan` (`nota_jual`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detail_obat_racikan_jual_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detail_pemberian_obat
-- ----------------------------
DROP TABLE IF EXISTS `detail_pemberian_obat`;
CREATE TABLE `detail_pemberian_obat`  (
  `tgl_perawatan` date NOT NULL DEFAULT '0000-00-00',
  `jam` time(0) NOT NULL DEFAULT '00:00:00',
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h_beli` double NULL DEFAULT NULL,
  `biaya_obat` double NULL DEFAULT NULL,
  `jml` double NOT NULL,
  `embalase` double NULL DEFAULT NULL,
  `tuslah` double NULL DEFAULT NULL,
  `total` double NOT NULL,
  `status` enum('Ralan','Ranap') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_bangsal` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_batch` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`tgl_perawatan`, `jam`, `no_rawat`, `kode_brng`, `no_batch`, `no_faktur`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `kd_obat`(`kode_brng`) USING BTREE,
  INDEX `tgl_perawatan`(`tgl_perawatan`) USING BTREE,
  INDEX `jam`(`jam`) USING BTREE,
  INDEX `jml`(`jml`) USING BTREE,
  INDEX `tambahan`(`embalase`) USING BTREE,
  INDEX `total`(`total`) USING BTREE,
  INDEX `biaya_obat`(`biaya_obat`) USING BTREE,
  INDEX `kd_bangsal`(`kd_bangsal`) USING BTREE,
  INDEX `tuslah`(`tuslah`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  CONSTRAINT `detail_pemberian_obat_ibfk_3` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detail_pemberian_obat_ibfk_4` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detail_pemberian_obat_ibfk_5` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detail_penagihan_piutang
-- ----------------------------
DROP TABLE IF EXISTS `detail_penagihan_piutang`;
CREATE TABLE `detail_penagihan_piutang`  (
  `no_tagihan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sisapiutang` double NOT NULL,
  PRIMARY KEY (`no_tagihan`, `no_rawat`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  CONSTRAINT `detail_penagihan_piutang_ibfk_1` FOREIGN KEY (`no_tagihan`) REFERENCES `penagihan_piutang` (`no_tagihan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detail_penagihan_piutang_ibfk_2` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detail_pengajuan_barang_medis
-- ----------------------------
DROP TABLE IF EXISTS `detail_pengajuan_barang_medis`;
CREATE TABLE `detail_pengajuan_barang_medis`  (
  `no_pengajuan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jumlah` double NULL DEFAULT NULL,
  `h_pengajuan` double NULL DEFAULT NULL,
  `total` double NOT NULL,
  `jumlah2` double NOT NULL,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  INDEX `no_pengajuan`(`no_pengajuan`) USING BTREE,
  CONSTRAINT `detail_pengajuan_barang_medis_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detail_pengajuan_barang_medis_ibfk_2` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detail_pengajuan_barang_medis_ibfk_3` FOREIGN KEY (`no_pengajuan`) REFERENCES `pengajuan_barang_medis` (`no_pengajuan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detail_pengajuan_barang_nonmedis
-- ----------------------------
DROP TABLE IF EXISTS `detail_pengajuan_barang_nonmedis`;
CREATE TABLE `detail_pengajuan_barang_nonmedis`  (
  `no_pengajuan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jumlah` double NULL DEFAULT NULL,
  `h_pengajuan` double NULL DEFAULT NULL,
  `total` double NOT NULL,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  INDEX `no_pengajuan`(`no_pengajuan`) USING BTREE,
  CONSTRAINT `detail_pengajuan_barang_nonmedis_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `ipsrsbarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detail_pengajuan_barang_nonmedis_ibfk_2` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detail_pengajuan_barang_nonmedis_ibfk_3` FOREIGN KEY (`no_pengajuan`) REFERENCES `pengajuan_barang_nonmedis` (`no_pengajuan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detail_pengeluaran_obat_bhp
-- ----------------------------
DROP TABLE IF EXISTS `detail_pengeluaran_obat_bhp`;
CREATE TABLE `detail_pengeluaran_obat_bhp`  (
  `no_keluar` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_batch` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jumlah` double NOT NULL,
  `harga_beli` double NOT NULL,
  `total` double NOT NULL,
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `jumlah`(`jumlah`) USING BTREE,
  INDEX `harga_beli`(`harga_beli`) USING BTREE,
  INDEX `total`(`total`) USING BTREE,
  INDEX `no_keluar`(`no_keluar`) USING BTREE,
  CONSTRAINT `detail_pengeluaran_obat_bhp_ibfk_1` FOREIGN KEY (`no_keluar`) REFERENCES `pengeluaran_obat_bhp` (`no_keluar`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detail_pengeluaran_obat_bhp_ibfk_2` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detail_pengeluaran_obat_bhp_ibfk_3` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detail_periksa_lab
-- ----------------------------
DROP TABLE IF EXISTS `detail_periksa_lab`;
CREATE TABLE `detail_periksa_lab`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_periksa` date NOT NULL,
  `jam` time(0) NOT NULL,
  `id_template` int(11) NOT NULL,
  `nilai` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nilai_rujukan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bagian_rs` double NOT NULL,
  `bhp` double NOT NULL,
  `bagian_perujuk` double NOT NULL,
  `bagian_dokter` double NOT NULL,
  `bagian_laborat` double NOT NULL,
  `kso` double NULL DEFAULT NULL,
  `menejemen` double NULL DEFAULT NULL,
  `biaya_item` double NOT NULL,
  PRIMARY KEY (`no_rawat`, `kd_jenis_prw`, `tgl_periksa`, `jam`, `id_template`) USING BTREE,
  INDEX `id_template`(`id_template`) USING BTREE,
  INDEX `kd_jenis_prw`(`kd_jenis_prw`) USING BTREE,
  INDEX `tgl_periksa`(`tgl_periksa`) USING BTREE,
  INDEX `jam`(`jam`) USING BTREE,
  INDEX `nilai`(`nilai`) USING BTREE,
  INDEX `nilai_rujukan`(`nilai_rujukan`) USING BTREE,
  INDEX `keterangan`(`keterangan`) USING BTREE,
  INDEX `biaya_item`(`biaya_item`) USING BTREE,
  INDEX `menejemen`(`menejemen`) USING BTREE,
  INDEX `kso`(`kso`) USING BTREE,
  INDEX `bagian_rs`(`bagian_rs`) USING BTREE,
  INDEX `bhp`(`bhp`) USING BTREE,
  INDEX `bagian_perujuk`(`bagian_perujuk`) USING BTREE,
  INDEX `bagian_dokter`(`bagian_dokter`) USING BTREE,
  INDEX `bagian_laborat`(`bagian_laborat`) USING BTREE,
  CONSTRAINT `detail_periksa_lab_ibfk_10` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detail_periksa_lab_ibfk_11` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_lab` (`kd_jenis_prw`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detail_periksa_lab_ibfk_12` FOREIGN KEY (`id_template`) REFERENCES `template_laboratorium` (`id_template`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detail_periksa_labpa
-- ----------------------------
DROP TABLE IF EXISTS `detail_periksa_labpa`;
CREATE TABLE `detail_periksa_labpa`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_periksa` date NOT NULL,
  `jam` time(0) NOT NULL,
  `diagnosa_klinik` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `makroskopik` varchar(1024) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mikroskopik` varchar(1024) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kesimpulan` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kesan` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`, `kd_jenis_prw`, `tgl_periksa`, `jam`) USING BTREE,
  INDEX `kd_jenis_prw`(`kd_jenis_prw`) USING BTREE,
  CONSTRAINT `detail_periksa_labpa_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detail_periksa_labpa_ibfk_2` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_lab` (`kd_jenis_prw`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detail_periksa_labpa_gambar
-- ----------------------------
DROP TABLE IF EXISTS `detail_periksa_labpa_gambar`;
CREATE TABLE `detail_periksa_labpa_gambar`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_periksa` date NOT NULL,
  `jam` time(0) NOT NULL,
  `photo` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`, `kd_jenis_prw`, `tgl_periksa`, `jam`) USING BTREE,
  INDEX `kd_jenis_prw`(`kd_jenis_prw`) USING BTREE,
  CONSTRAINT `detail_periksa_labpa_gambar_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detail_periksa_labpa_gambar_ibfk_2` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_lab` (`kd_jenis_prw`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detail_permintaan_medis
-- ----------------------------
DROP TABLE IF EXISTS `detail_permintaan_medis`;
CREATE TABLE `detail_permintaan_medis`  (
  `no_permintaan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jumlah` double NULL DEFAULT NULL,
  `keterangan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  INDEX `no_permintaan`(`no_permintaan`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  CONSTRAINT `detail_permintaan_medis_ibfk_1` FOREIGN KEY (`no_permintaan`) REFERENCES `permintaan_medis` (`no_permintaan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detail_permintaan_medis_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detail_permintaan_medis_ibfk_3` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detail_permintaan_non_medis
-- ----------------------------
DROP TABLE IF EXISTS `detail_permintaan_non_medis`;
CREATE TABLE `detail_permintaan_non_medis`  (
  `no_permintaan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jumlah` double NULL DEFAULT NULL,
  `keterangan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  INDEX `no_permintaan`(`no_permintaan`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  CONSTRAINT `detail_permintaan_non_medis_ibfk_1` FOREIGN KEY (`no_permintaan`) REFERENCES `permintaan_non_medis` (`no_permintaan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detail_permintaan_non_medis_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `ipsrsbarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detail_permintaan_non_medis_ibfk_3` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detail_permintaan_stok_obat_pasien
-- ----------------------------
DROP TABLE IF EXISTS `detail_permintaan_stok_obat_pasien`;
CREATE TABLE `detail_permintaan_stok_obat_pasien`  (
  `no_permintaan` varchar(14) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jml` double NULL DEFAULT NULL,
  `aturan_pakai` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  INDEX `no_permintaan`(`no_permintaan`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  CONSTRAINT `detail_permintaan_stok_obat_pasien_ibfk_1` FOREIGN KEY (`no_permintaan`) REFERENCES `permintaan_stok_obat_pasien` (`no_permintaan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detail_permintaan_stok_obat_pasien_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detail_piutang_pasien
-- ----------------------------
DROP TABLE IF EXISTS `detail_piutang_pasien`;
CREATE TABLE `detail_piutang_pasien`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_bayar` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_pj` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `totalpiutang` double NULL DEFAULT NULL,
  `sisapiutang` double NULL DEFAULT NULL,
  `tgltempo` date NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`, `nama_bayar`) USING BTREE,
  INDEX `kd_pj`(`kd_pj`) USING BTREE,
  INDEX `nama_bayar`(`nama_bayar`) USING BTREE,
  CONSTRAINT `detail_piutang_pasien_ibfk_3` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detail_piutang_pasien_ibfk_4` FOREIGN KEY (`nama_bayar`) REFERENCES `akun_piutang` (`nama_bayar`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detail_piutang_pasien_ibfk_5` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detail_surat_pemesanan_medis
-- ----------------------------
DROP TABLE IF EXISTS `detail_surat_pemesanan_medis`;
CREATE TABLE `detail_surat_pemesanan_medis`  (
  `no_pemesanan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jumlah` double NULL DEFAULT NULL,
  `h_pesan` double NULL DEFAULT NULL,
  `subtotal` double NULL DEFAULT NULL,
  `dis` double NOT NULL,
  `besardis` double NOT NULL,
  `total` double NOT NULL,
  `jumlah2` double NULL DEFAULT NULL,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  INDEX `jumlah`(`jumlah`) USING BTREE,
  INDEX `h_pesan`(`h_pesan`) USING BTREE,
  INDEX `subtotal`(`subtotal`) USING BTREE,
  INDEX `dis`(`dis`) USING BTREE,
  INDEX `besardis`(`besardis`) USING BTREE,
  INDEX `total`(`total`) USING BTREE,
  INDEX `no_pemesanan`(`no_pemesanan`) USING BTREE,
  CONSTRAINT `detail_surat_pemesanan_medis_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detail_surat_pemesanan_medis_ibfk_2` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detail_surat_pemesanan_medis_ibfk_3` FOREIGN KEY (`no_pemesanan`) REFERENCES `surat_pemesanan_medis` (`no_pemesanan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detail_surat_pemesanan_non_medis
-- ----------------------------
DROP TABLE IF EXISTS `detail_surat_pemesanan_non_medis`;
CREATE TABLE `detail_surat_pemesanan_non_medis`  (
  `no_pemesanan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jumlah` double NULL DEFAULT NULL,
  `h_pesan` double NULL DEFAULT NULL,
  `subtotal` double NULL DEFAULT NULL,
  `dis` double NOT NULL,
  `besardis` double NOT NULL,
  `total` double NOT NULL,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  INDEX `jumlah`(`jumlah`) USING BTREE,
  INDEX `h_pesan`(`h_pesan`) USING BTREE,
  INDEX `subtotal`(`subtotal`) USING BTREE,
  INDEX `dis`(`dis`) USING BTREE,
  INDEX `besardis`(`besardis`) USING BTREE,
  INDEX `total`(`total`) USING BTREE,
  INDEX `no_pemesanan`(`no_pemesanan`) USING BTREE,
  CONSTRAINT `detail_surat_pemesanan_non_medis_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `ipsrsbarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detail_surat_pemesanan_non_medis_ibfk_2` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detail_surat_pemesanan_non_medis_ibfk_3` FOREIGN KEY (`no_pemesanan`) REFERENCES `surat_pemesanan_non_medis` (`no_pemesanan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detail_titip_faktur
-- ----------------------------
DROP TABLE IF EXISTS `detail_titip_faktur`;
CREATE TABLE `detail_titip_faktur`  (
  `no_tagihan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_tagihan`, `no_faktur`) USING BTREE,
  INDEX `no_faktur`(`no_faktur`) USING BTREE,
  CONSTRAINT `detail_titip_faktur_ibfk_1` FOREIGN KEY (`no_tagihan`) REFERENCES `titip_faktur` (`no_tagihan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detail_titip_faktur_ibfk_2` FOREIGN KEY (`no_faktur`) REFERENCES `pemesanan` (`no_faktur`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detailbeli
-- ----------------------------
DROP TABLE IF EXISTS `detailbeli`;
CREATE TABLE `detailbeli`  (
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jumlah` double NULL DEFAULT NULL,
  `h_beli` double NULL DEFAULT NULL,
  `subtotal` double NULL DEFAULT NULL,
  `dis` double NOT NULL,
  `besardis` double NOT NULL,
  `total` double NOT NULL,
  `no_batch` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jumlah2` double NULL DEFAULT NULL,
  `kadaluarsa` date NULL DEFAULT NULL,
  INDEX `no_faktur`(`no_faktur`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  INDEX `jumlah`(`jumlah`) USING BTREE,
  INDEX `h_beli`(`h_beli`) USING BTREE,
  INDEX `subtotal`(`subtotal`) USING BTREE,
  INDEX `dis`(`dis`) USING BTREE,
  INDEX `besardis`(`besardis`) USING BTREE,
  INDEX `total`(`total`) USING BTREE,
  INDEX `jumlah2`(`jumlah2`) USING BTREE,
  CONSTRAINT `detailbeli_ibfk_5` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detailbeli_ibfk_6` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detailbeli_ibfk_7` FOREIGN KEY (`no_faktur`) REFERENCES `pembelian` (`no_faktur`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detailhibah_obat_bhp
-- ----------------------------
DROP TABLE IF EXISTS `detailhibah_obat_bhp`;
CREATE TABLE `detailhibah_obat_bhp`  (
  `no_hibah` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jumlah` double NULL DEFAULT NULL,
  `h_hibah` double NULL DEFAULT NULL,
  `subtotalhibah` double NULL DEFAULT NULL,
  `h_diakui` double NOT NULL,
  `subtotaldiakui` double NOT NULL,
  `no_batch` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jumlah2` double NULL DEFAULT NULL,
  `kadaluarsa` date NULL DEFAULT NULL,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  INDEX `no_hibah`(`no_hibah`) USING BTREE,
  CONSTRAINT `detailhibah_obat_bhp_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detailhibah_obat_bhp_ibfk_2` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detailhibah_obat_bhp_ibfk_3` FOREIGN KEY (`no_hibah`) REFERENCES `hibah_obat_bhp` (`no_hibah`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detailjual
-- ----------------------------
DROP TABLE IF EXISTS `detailjual`;
CREATE TABLE `detailjual`  (
  `nota_jual` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `h_jual` double NULL DEFAULT NULL,
  `h_beli` double NULL DEFAULT NULL,
  `jumlah` double NULL DEFAULT NULL,
  `subtotal` double NULL DEFAULT NULL,
  `dis` double NULL DEFAULT NULL,
  `bsr_dis` double NULL DEFAULT NULL,
  `tambahan` double NULL DEFAULT NULL,
  `embalase` double NOT NULL,
  `tuslah` double NOT NULL,
  `aturan_pakai` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `total` double NULL DEFAULT NULL,
  `no_batch` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  INDEX `nota_jual`(`nota_jual`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  INDEX `h_jual`(`h_jual`) USING BTREE,
  INDEX `h_beli`(`h_beli`) USING BTREE,
  INDEX `jumlah`(`jumlah`) USING BTREE,
  INDEX `subtotal`(`subtotal`) USING BTREE,
  INDEX `dis`(`dis`) USING BTREE,
  INDEX `bsr_dis`(`bsr_dis`) USING BTREE,
  INDEX `tambahan`(`tambahan`) USING BTREE,
  INDEX `total`(`total`) USING BTREE,
  CONSTRAINT `detailjual_ibfk_1` FOREIGN KEY (`nota_jual`) REFERENCES `penjualan` (`nota_jual`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detailjual_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detailjual_ibfk_3` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detailjurnal
-- ----------------------------
DROP TABLE IF EXISTS `detailjurnal`;
CREATE TABLE `detailjurnal`  (
  `no_jurnal` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_rek` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `debet` double NULL DEFAULT NULL,
  `kredit` double NULL DEFAULT NULL,
  INDEX `no_jurnal`(`no_jurnal`) USING BTREE,
  INDEX `kd_rek`(`kd_rek`) USING BTREE,
  INDEX `debet`(`debet`) USING BTREE,
  INDEX `kredit`(`kredit`) USING BTREE,
  CONSTRAINT `detailjurnal_ibfk_1` FOREIGN KEY (`no_jurnal`) REFERENCES `jurnal` (`no_jurnal`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detailjurnal_ibfk_2` FOREIGN KEY (`kd_rek`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detailpesan
-- ----------------------------
DROP TABLE IF EXISTS `detailpesan`;
CREATE TABLE `detailpesan`  (
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jumlah` double NULL DEFAULT NULL,
  `h_pesan` double NULL DEFAULT NULL,
  `subtotal` double NULL DEFAULT NULL,
  `dis` double NOT NULL,
  `besardis` double NOT NULL,
  `total` double NOT NULL,
  `no_batch` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jumlah2` double NULL DEFAULT NULL,
  `kadaluarsa` date NULL DEFAULT NULL,
  INDEX `no_faktur`(`no_faktur`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  INDEX `jumlah`(`jumlah`) USING BTREE,
  INDEX `h_pesan`(`h_pesan`) USING BTREE,
  INDEX `subtotal`(`subtotal`) USING BTREE,
  INDEX `dis`(`dis`) USING BTREE,
  INDEX `besardis`(`besardis`) USING BTREE,
  INDEX `total`(`total`) USING BTREE,
  INDEX `jumlah2`(`jumlah2`) USING BTREE,
  CONSTRAINT `detailpesan_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detailpesan_ibfk_2` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detailpesan_ibfk_3` FOREIGN KEY (`no_faktur`) REFERENCES `pemesanan` (`no_faktur`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detailpiutang
-- ----------------------------
DROP TABLE IF EXISTS `detailpiutang`;
CREATE TABLE `detailpiutang`  (
  `nota_piutang` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `h_jual` double NULL DEFAULT NULL,
  `h_beli` double NULL DEFAULT NULL,
  `jumlah` double NULL DEFAULT NULL,
  `subtotal` double NULL DEFAULT NULL,
  `dis` double NULL DEFAULT NULL,
  `bsr_dis` double NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  `no_batch` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `aturan_pakai` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  INDEX `nota_jual`(`nota_piutang`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  INDEX `h_jual`(`h_jual`) USING BTREE,
  INDEX `h_beli`(`h_beli`) USING BTREE,
  INDEX `jumlah`(`jumlah`) USING BTREE,
  INDEX `subtotal`(`subtotal`) USING BTREE,
  INDEX `dis`(`dis`) USING BTREE,
  INDEX `bsr_dis`(`bsr_dis`) USING BTREE,
  INDEX `total`(`total`) USING BTREE,
  CONSTRAINT `detailpiutang_ibfk_1` FOREIGN KEY (`nota_piutang`) REFERENCES `piutang` (`nota_piutang`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detailpiutang_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detailpiutang_ibfk_3` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for deteksi_dini_corona
-- ----------------------------
DROP TABLE IF EXISTS `deteksi_dini_corona`;
CREATE TABLE `deteksi_dini_corona`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` date NOT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `gejala_demam` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `gejala_batuk` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `gejala_sesak` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `gejala_tanggal_pertama` date NULL DEFAULT NULL,
  `gejala_riwayat_sakit` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `gejala_riwayat_periksa` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `faktor_riwayat_perjalanan` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `faktor_asal_daerah` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `faktor_tanggal_kedatangan` date NOT NULL,
  `faktor_paparan_kontakpositif` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `faktor_paparan_kontakpdp` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `faktor_paparan_faskespositif` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `faktor_paparan_perjalananln` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `faktor_paparan_pasarhewan` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kesimpulan` enum('ODP','PDP','OTG','Bukan ketiganya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tindak_lanjut` enum('Rujuk','Rawat Inap','Rawat Jalan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `deteksi_dini_corona_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `deteksi_dini_corona_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detreturbeli
-- ----------------------------
DROP TABLE IF EXISTS `detreturbeli`;
CREATE TABLE `detreturbeli`  (
  `no_retur_beli` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `h_beli` double NULL DEFAULT NULL,
  `jml_beli` double NULL DEFAULT NULL,
  `h_retur` double NULL DEFAULT NULL,
  `jml_retur` double NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  `no_batch` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jml_retur2` double NULL DEFAULT NULL,
  INDEX `no_retur_beli`(`no_retur_beli`) USING BTREE,
  INDEX `no_faktur`(`no_faktur`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  INDEX `h_beli`(`h_beli`) USING BTREE,
  INDEX `jml_beli`(`jml_beli`) USING BTREE,
  INDEX `h_retur`(`h_retur`) USING BTREE,
  INDEX `jml_retur`(`jml_retur`) USING BTREE,
  INDEX `total`(`total`) USING BTREE,
  INDEX `jml_retur2`(`jml_retur2`) USING BTREE,
  CONSTRAINT `detreturbeli_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detreturbeli_ibfk_3` FOREIGN KEY (`no_retur_beli`) REFERENCES `returbeli` (`no_retur_beli`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detreturbeli_ibfk_4` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detreturjual
-- ----------------------------
DROP TABLE IF EXISTS `detreturjual`;
CREATE TABLE `detreturjual`  (
  `no_retur_jual` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nota_jual` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jml_jual` double NULL DEFAULT NULL,
  `h_jual` double NULL DEFAULT NULL,
  `jml_retur` double NULL DEFAULT NULL,
  `h_retur` double NULL DEFAULT NULL,
  `subtotal` double NULL DEFAULT NULL,
  `no_batch` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  INDEX `no_retur_jual`(`no_retur_jual`) USING BTREE,
  INDEX `nota_jual`(`nota_jual`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  INDEX `jml_jual`(`jml_jual`) USING BTREE,
  INDEX `h_jual`(`h_jual`) USING BTREE,
  INDEX `jml_retur`(`jml_retur`) USING BTREE,
  INDEX `h_retur`(`h_retur`) USING BTREE,
  INDEX `subtotal`(`subtotal`) USING BTREE,
  CONSTRAINT `detreturjual_ibfk_1` FOREIGN KEY (`no_retur_jual`) REFERENCES `returjual` (`no_retur_jual`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detreturjual_ibfk_3` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detreturjual_ibfk_4` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detreturpiutang
-- ----------------------------
DROP TABLE IF EXISTS `detreturpiutang`;
CREATE TABLE `detreturpiutang`  (
  `no_retur_piutang` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nota_piutang` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jml_piutang` double NULL DEFAULT NULL,
  `h_piutang` double NULL DEFAULT NULL,
  `jml_retur` double NULL DEFAULT NULL,
  `h_retur` double NULL DEFAULT NULL,
  `subtotal` double NULL DEFAULT NULL,
  `no_batch` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  INDEX `no_retur_piutang`(`no_retur_piutang`) USING BTREE,
  INDEX `nota_piutang`(`nota_piutang`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  INDEX `jml_piutang`(`jml_piutang`) USING BTREE,
  INDEX `h_piutang`(`h_piutang`) USING BTREE,
  INDEX `jml_retur`(`jml_retur`) USING BTREE,
  INDEX `h_retur`(`h_retur`) USING BTREE,
  INDEX `subtotal`(`subtotal`) USING BTREE,
  CONSTRAINT `detreturpiutang_ibfk_4` FOREIGN KEY (`no_retur_piutang`) REFERENCES `returpiutang` (`no_retur_piutang`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detreturpiutang_ibfk_5` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detreturpiutang_ibfk_6` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for diagnosa_corona
-- ----------------------------
DROP TABLE IF EXISTS `diagnosa_corona`;
CREATE TABLE `diagnosa_corona`  (
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_icd` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_penyakit` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` enum('Primer','Sekunder') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rkm_medis`, `kode_icd`) USING BTREE,
  CONSTRAINT `diagnosa_corona_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien_corona` (`no_rkm_medis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for diagnosa_pasien
-- ----------------------------
DROP TABLE IF EXISTS `diagnosa_pasien`;
CREATE TABLE `diagnosa_pasien`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_penyakit` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('Ralan','Ranap') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `prioritas` tinyint(4) NOT NULL,
  `status_penyakit` enum('Lama','Baru') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`, `kd_penyakit`, `status`) USING BTREE,
  INDEX `kd_penyakit`(`kd_penyakit`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `prioritas`(`prioritas`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  CONSTRAINT `diagnosa_pasien_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `diagnosa_pasien_ibfk_2` FOREIGN KEY (`kd_penyakit`) REFERENCES `penyakit` (`kd_penyakit`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for diet
-- ----------------------------
DROP TABLE IF EXISTS `diet`;
CREATE TABLE `diet`  (
  `kd_diet` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_diet` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd_diet`) USING BTREE,
  INDEX `nama_diet`(`nama_diet`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for dokter
-- ----------------------------
DROP TABLE IF EXISTS `dokter`;
CREATE TABLE `dokter`  (
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_dokter` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jk` enum('L','P') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tmp_lahir` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_lahir` date NULL DEFAULT NULL,
  `gol_drh` enum('A','B','O','AB','-') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `agama` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `almt_tgl` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_telp` varchar(13) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `stts_nikah` enum('BELUM MENIKAH','MENIKAH','JANDA','DUDHA','JOMBLO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_sps` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alumni` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_ijn_praktek` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd_dokter`) USING BTREE,
  INDEX `kd_sps`(`kd_sps`) USING BTREE,
  INDEX `nm_dokter`(`nm_dokter`) USING BTREE,
  INDEX `jk`(`jk`) USING BTREE,
  INDEX `tmp_lahir`(`tmp_lahir`) USING BTREE,
  INDEX `tgl_lahir`(`tgl_lahir`) USING BTREE,
  INDEX `gol_drh`(`gol_drh`) USING BTREE,
  INDEX `agama`(`agama`) USING BTREE,
  INDEX `almt_tgl`(`almt_tgl`) USING BTREE,
  INDEX `no_telp`(`no_telp`) USING BTREE,
  INDEX `stts_nikah`(`stts_nikah`) USING BTREE,
  INDEX `alumni`(`alumni`) USING BTREE,
  INDEX `no_ijn_praktek`(`no_ijn_praktek`) USING BTREE,
  INDEX `kd_dokter`(`kd_dokter`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  CONSTRAINT `dokter_ibfk_2` FOREIGN KEY (`kd_sps`) REFERENCES `spesialis` (`kd_sps`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `dokter_ibfk_3` FOREIGN KEY (`kd_dokter`) REFERENCES `pegawai` (`nik`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for dpjp_ranap
-- ----------------------------
DROP TABLE IF EXISTS `dpjp_ranap`;
CREATE TABLE `dpjp_ranap`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `kd_dokter`) USING BTREE,
  INDEX `dpjp_ranap_ibfk_2`(`kd_dokter`) USING BTREE,
  CONSTRAINT `dpjp_ranap_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `dpjp_ranap_ibfk_2` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for emergency_index
-- ----------------------------
DROP TABLE IF EXISTS `emergency_index`;
CREATE TABLE `emergency_index`  (
  `kode_emergency` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_emergency` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `indek` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`kode_emergency`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for evaluasi_kinerja
-- ----------------------------
DROP TABLE IF EXISTS `evaluasi_kinerja`;
CREATE TABLE `evaluasi_kinerja`  (
  `kode_evaluasi` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_evaluasi` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `indek` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`kode_evaluasi`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for evaluasi_kinerja_pegawai
-- ----------------------------
DROP TABLE IF EXISTS `evaluasi_kinerja_pegawai`;
CREATE TABLE `evaluasi_kinerja_pegawai`  (
  `id` int(11) NOT NULL,
  `kode_evaluasi` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tahun` year NOT NULL,
  `bulan` tinyint(4) NOT NULL,
  `keterangan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `kode_evaluasi`, `tahun`, `bulan`) USING BTREE,
  INDEX `kode_evaluasi`(`kode_evaluasi`) USING BTREE,
  CONSTRAINT `evaluasi_kinerja_pegawai_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `evaluasi_kinerja_pegawai_ibfk_2` FOREIGN KEY (`kode_evaluasi`) REFERENCES `evaluasi_kinerja` (`kode_evaluasi`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for gambar
-- ----------------------------
DROP TABLE IF EXISTS `gambar`;
CREATE TABLE `gambar`  (
  `inde` int(11) NOT NULL,
  `bpjs` longblob NOT NULL,
  `nyeri` longblob NOT NULL,
  `inhealth` longblob NOT NULL,
  PRIMARY KEY (`inde`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for gambar_radiologi
-- ----------------------------
DROP TABLE IF EXISTS `gambar_radiologi`;
CREATE TABLE `gambar_radiologi`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_periksa` date NOT NULL,
  `jam` time(0) NOT NULL,
  `lokasi_gambar` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `tgl_periksa`, `jam`, `lokasi_gambar`) USING BTREE,
  CONSTRAINT `gambar_radiologi_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for golongan_barang
-- ----------------------------
DROP TABLE IF EXISTS `golongan_barang`;
CREATE TABLE `golongan_barang`  (
  `kode` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for golongan_polri
-- ----------------------------
DROP TABLE IF EXISTS `golongan_polri`;
CREATE TABLE `golongan_polri`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_golongan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for golongan_tni
-- ----------------------------
DROP TABLE IF EXISTS `golongan_tni`;
CREATE TABLE `golongan_tni`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_golongan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for gudangbarang
-- ----------------------------
DROP TABLE IF EXISTS `gudangbarang`;
CREATE TABLE `gudangbarang`  (
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_bangsal` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `stok` double NOT NULL,
  `no_batch` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kode_brng`, `kd_bangsal`, `no_batch`, `no_faktur`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `stok`(`stok`) USING BTREE,
  INDEX `kd_bangsal`(`kd_bangsal`) USING BTREE,
  CONSTRAINT `gudangbarang_ibfk_1` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gudangbarang_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for harian_kurangi_bulanan
-- ----------------------------
DROP TABLE IF EXISTS `harian_kurangi_bulanan`;
CREATE TABLE `harian_kurangi_bulanan`  (
  `harian` int(11) NOT NULL,
  `bulanan` int(11) NOT NULL,
  INDEX `harian`(`harian`) USING BTREE,
  INDEX `bulanan`(`bulanan`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hasil_radiologi
-- ----------------------------
DROP TABLE IF EXISTS `hasil_radiologi`;
CREATE TABLE `hasil_radiologi`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_periksa` date NOT NULL,
  `jam` time(0) NOT NULL,
  `hasil` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `tgl_periksa`, `jam`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  CONSTRAINT `hasil_radiologi_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hemodialisa
-- ----------------------------
DROP TABLE IF EXISTS `hemodialisa`;
CREATE TABLE `hemodialisa`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime(0) NOT NULL,
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lama` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `akses` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dialist` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `transfusi` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penarikan` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `qb` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `qd` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ureum` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hb` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hbsag` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `creatinin` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hiv` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hcv` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lain` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_penyakit` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`, `tanggal`) USING BTREE,
  INDEX `kd_penyakit`(`kd_penyakit`) USING BTREE,
  INDEX `kd_dokter`(`kd_dokter`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  CONSTRAINT `hemodialisa_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `hemodialisa_ibfk_2` FOREIGN KEY (`kd_penyakit`) REFERENCES `penyakit` (`kd_penyakit`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `hemodialisa_ibfk_3` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hibah_obat_bhp
-- ----------------------------
DROP TABLE IF EXISTS `hibah_obat_bhp`;
CREATE TABLE `hibah_obat_bhp`  (
  `no_hibah` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_pemberi` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_hibah` date NULL DEFAULT NULL,
  `totalhibah` double NOT NULL,
  `totalnilai` double NOT NULL,
  `kd_bangsal` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_hibah`) USING BTREE,
  INDEX `kode_pemberi`(`kode_pemberi`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  INDEX `kd_bangsal`(`kd_bangsal`) USING BTREE,
  CONSTRAINT `hibah_obat_bhp_ibfk_1` FOREIGN KEY (`kode_pemberi`) REFERENCES `pemberihibah` (`kode_pemberi`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hibah_obat_bhp_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hibah_obat_bhp_ibfk_3` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for icd9
-- ----------------------------
DROP TABLE IF EXISTS `icd9`;
CREATE TABLE `icd9`  (
  `kode` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `deskripsi_panjang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `deskripsi_pendek` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inacbg_coder_nik
-- ----------------------------
DROP TABLE IF EXISTS `inacbg_coder_nik`;
CREATE TABLE `inacbg_coder_nik`  (
  `nik` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_ik` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nik`) USING BTREE,
  CONSTRAINT `inacbg_coder_nik_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `pegawai` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inacbg_data_terkirim
-- ----------------------------
DROP TABLE IF EXISTS `inacbg_data_terkirim`;
CREATE TABLE `inacbg_data_terkirim`  (
  `no_sep` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nik` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_sep`) USING BTREE,
  CONSTRAINT `inacbg_data_terkirim_ibfk_1` FOREIGN KEY (`no_sep`) REFERENCES `bridging_sep` (`no_sep`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inacbg_data_terkirim2
-- ----------------------------
DROP TABLE IF EXISTS `inacbg_data_terkirim2`;
CREATE TABLE `inacbg_data_terkirim2`  (
  `no_sep` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nik` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_sep`) USING BTREE,
  CONSTRAINT `inacbg_data_terkirim2_ibfk_1` FOREIGN KEY (`no_sep`) REFERENCES `inacbg_klaim_baru2` (`no_sep`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inacbg_grouping_stage1
-- ----------------------------
DROP TABLE IF EXISTS `inacbg_grouping_stage1`;
CREATE TABLE `inacbg_grouping_stage1`  (
  `no_sep` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `code_cbg` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `deskripsi` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tarif` double NULL DEFAULT NULL,
  PRIMARY KEY (`no_sep`) USING BTREE,
  CONSTRAINT `inacbg_grouping_stage1_ibfk_1` FOREIGN KEY (`no_sep`) REFERENCES `bridging_sep` (`no_sep`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inacbg_grouping_stage12
-- ----------------------------
DROP TABLE IF EXISTS `inacbg_grouping_stage12`;
CREATE TABLE `inacbg_grouping_stage12`  (
  `no_sep` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `code_cbg` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `deskripsi` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tarif` double NULL DEFAULT NULL,
  PRIMARY KEY (`no_sep`) USING BTREE,
  CONSTRAINT `inacbg_grouping_stage12_ibfk_1` FOREIGN KEY (`no_sep`) REFERENCES `inacbg_klaim_baru2` (`no_sep`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inacbg_klaim_baru
-- ----------------------------
DROP TABLE IF EXISTS `inacbg_klaim_baru`;
CREATE TABLE `inacbg_klaim_baru`  (
  `no_sep` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `patient_id` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `admission_id` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hospital_admission_id` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_sep`) USING BTREE,
  CONSTRAINT `inacbg_klaim_baru_ibfk_1` FOREIGN KEY (`no_sep`) REFERENCES `bridging_sep` (`no_sep`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inacbg_klaim_baru2
-- ----------------------------
DROP TABLE IF EXISTS `inacbg_klaim_baru2`;
CREATE TABLE `inacbg_klaim_baru2`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_sep` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `patient_id` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `admission_id` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hospital_admission_id` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  UNIQUE INDEX `no_sep`(`no_sep`) USING BTREE,
  CONSTRAINT `inacbg_klaim_baru2_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inacbg_noklaim_corona
-- ----------------------------
DROP TABLE IF EXISTS `inacbg_noklaim_corona`;
CREATE TABLE `inacbg_noklaim_corona`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_klaim` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  UNIQUE INDEX `no_klaim`(`no_klaim`) USING BTREE,
  CONSTRAINT `inacbg_noklaim_corona_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for indekref
-- ----------------------------
DROP TABLE IF EXISTS `indekref`;
CREATE TABLE `indekref`  (
  `kdindex` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `n` double NOT NULL,
  `ttl` double NOT NULL,
  INDEX `kdindex`(`kdindex`) USING BTREE,
  INDEX `n`(`n`) USING BTREE,
  INDEX `ttl`(`ttl`) USING BTREE,
  CONSTRAINT `indekref_ibfk_1` FOREIGN KEY (`kdindex`) REFERENCES `departemen` (`dep_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for indexins
-- ----------------------------
DROP TABLE IF EXISTS `indexins`;
CREATE TABLE `indexins`  (
  `dep_id` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `persen` double NOT NULL,
  PRIMARY KEY (`dep_id`) USING BTREE,
  INDEX `persen`(`persen`) USING BTREE,
  CONSTRAINT `indexins_ibfk_1` FOREIGN KEY (`dep_id`) REFERENCES `departemen` (`dep_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for indextotal
-- ----------------------------
DROP TABLE IF EXISTS `indextotal`;
CREATE TABLE `indextotal`  (
  `kdindex` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ttl` double NOT NULL,
  INDEX `kdindex`(`kdindex`) USING BTREE,
  INDEX `ttl`(`ttl`) USING BTREE,
  CONSTRAINT `indextotal_ibfk_1` FOREIGN KEY (`kdindex`) REFERENCES `departemen` (`dep_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for industrifarmasi
-- ----------------------------
DROP TABLE IF EXISTS `industrifarmasi`;
CREATE TABLE `industrifarmasi`  (
  `kode_industri` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nama_industri` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alamat` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kota` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_telp` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_industri`) USING BTREE,
  INDEX `nama_industri`(`nama_industri`) USING BTREE,
  INDEX `alamat`(`alamat`) USING BTREE,
  INDEX `kota`(`kota`) USING BTREE,
  INDEX `no_telp`(`no_telp`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inhealth_jenpel_ruang_rawat
-- ----------------------------
DROP TABLE IF EXISTS `inhealth_jenpel_ruang_rawat`;
CREATE TABLE `inhealth_jenpel_ruang_rawat`  (
  `kd_kamar` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_jenpel_ruang_rawat` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_jenpel_ruang_rawat` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tarif` double NOT NULL,
  PRIMARY KEY (`kd_kamar`) USING BTREE,
  CONSTRAINT `inhealth_jenpel_ruang_rawat_ibfk_1` FOREIGN KEY (`kd_kamar`) REFERENCES `kamar` (`kd_kamar`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inhealth_maping_dokter
-- ----------------------------
DROP TABLE IF EXISTS `inhealth_maping_dokter`;
CREATE TABLE `inhealth_maping_dokter`  (
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_inhealth` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kd_dokter`) USING BTREE,
  CONSTRAINT `inhealth_maping_dokter_ibfk_1` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inhealth_maping_poli
-- ----------------------------
DROP TABLE IF EXISTS `inhealth_maping_poli`;
CREATE TABLE `inhealth_maping_poli`  (
  `kd_poli_rs` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_poli_inhealth` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nm_poli_inhealth` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kd_poli_rs`) USING BTREE,
  CONSTRAINT `inhealth_maping_poli_ibfk_1` FOREIGN KEY (`kd_poli_rs`) REFERENCES `poliklinik` (`kd_poli`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inhealth_tindakan_laborat
-- ----------------------------
DROP TABLE IF EXISTS `inhealth_tindakan_laborat`;
CREATE TABLE `inhealth_tindakan_laborat`  (
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_inhealth` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kd_jenis_prw`) USING BTREE,
  CONSTRAINT `inhealth_tindakan_laborat_ibfk_1` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_lab` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inhealth_tindakan_operasi
-- ----------------------------
DROP TABLE IF EXISTS `inhealth_tindakan_operasi`;
CREATE TABLE `inhealth_tindakan_operasi`  (
  `kode_paket` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_inhealth` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_paket`) USING BTREE,
  CONSTRAINT `inhealth_tindakan_operasi_ibfk_1` FOREIGN KEY (`kode_paket`) REFERENCES `paket_operasi` (`kode_paket`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inhealth_tindakan_radiologi
-- ----------------------------
DROP TABLE IF EXISTS `inhealth_tindakan_radiologi`;
CREATE TABLE `inhealth_tindakan_radiologi`  (
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_inhealth` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kd_jenis_prw`) USING BTREE,
  CONSTRAINT `inhealth_tindakan_radiologi_ibfk_1` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_radiologi` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inhealth_tindakan_ralan
-- ----------------------------
DROP TABLE IF EXISTS `inhealth_tindakan_ralan`;
CREATE TABLE `inhealth_tindakan_ralan`  (
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_inhealth` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kd_jenis_prw`) USING BTREE,
  CONSTRAINT `inhealth_tindakan_ralan_ibfk_1` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inhealth_tindakan_ranap
-- ----------------------------
DROP TABLE IF EXISTS `inhealth_tindakan_ranap`;
CREATE TABLE `inhealth_tindakan_ranap`  (
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_inhealth` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kd_jenis_prw`) USING BTREE,
  CONSTRAINT `inhealth_tindakan_ranap_ibfk_1` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_inap` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for insiden_keselamatan
-- ----------------------------
DROP TABLE IF EXISTS `insiden_keselamatan`;
CREATE TABLE `insiden_keselamatan`  (
  `kode_insiden` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_insiden` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jenis_insiden` enum('KPC','KTC','KNC','KTD','Sentinel') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dampak` enum('1. Tidak Signifikan','2. Minor','3. Moderat','4. Mayor','5. Katastropik') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kode_insiden`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for insiden_keselamatan_pasien
-- ----------------------------
DROP TABLE IF EXISTS `insiden_keselamatan_pasien`;
CREATE TABLE `insiden_keselamatan_pasien`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_kejadian` date NOT NULL,
  `jam_kejadian` time(0) NOT NULL,
  `tgl_lapor` date NOT NULL,
  `jam_lapor` time(0) NOT NULL,
  `kode_insiden` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lokasi` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kronologis` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `unit_terkait` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `akibat` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tindakan_insiden` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `identifikasi_masalah` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rtl` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `kode_insiden`(`kode_insiden`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `insiden_keselamatan_pasien_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `insiden_keselamatan_pasien_ibfk_2` FOREIGN KEY (`kode_insiden`) REFERENCES `insiden_keselamatan` (`kode_insiden`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `insiden_keselamatan_pasien_ibfk_3` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inventaris
-- ----------------------------
DROP TABLE IF EXISTS `inventaris`;
CREATE TABLE `inventaris`  (
  `no_inventaris` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_barang` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `asal_barang` enum('Beli','Bantuan','Hibah','-') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_pengadaan` date NULL DEFAULT NULL,
  `harga` double NULL DEFAULT NULL,
  `status_barang` enum('Ada','Rusak','Hilang','Perbaikan','Dipinjam','-') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_ruang` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_rak` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_box` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_inventaris`) USING BTREE,
  INDEX `kode_barang`(`kode_barang`) USING BTREE,
  INDEX `kd_ruang`(`id_ruang`) USING BTREE,
  INDEX `asal_barang`(`asal_barang`) USING BTREE,
  INDEX `tgl_pengadaan`(`tgl_pengadaan`) USING BTREE,
  INDEX `harga`(`harga`) USING BTREE,
  INDEX `status_barang`(`status_barang`) USING BTREE,
  INDEX `no_rak`(`no_rak`) USING BTREE,
  INDEX `no_box`(`no_box`) USING BTREE,
  CONSTRAINT `inventaris_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `inventaris_barang` (`kode_barang`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `inventaris_ibfk_2` FOREIGN KEY (`id_ruang`) REFERENCES `inventaris_ruang` (`id_ruang`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inventaris_barang
-- ----------------------------
DROP TABLE IF EXISTS `inventaris_barang`;
CREATE TABLE `inventaris_barang`  (
  `kode_barang` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_barang` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jml_barang` int(11) NULL DEFAULT NULL,
  `kode_produsen` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_merk` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `thn_produksi` year NULL DEFAULT NULL,
  `isbn` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_kategori` char(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_jenis` char(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_barang`) USING BTREE,
  INDEX `kode_produsen`(`kode_produsen`) USING BTREE,
  INDEX `id_merk`(`id_merk`) USING BTREE,
  INDEX `id_kategori`(`id_kategori`) USING BTREE,
  INDEX `id_jenis`(`id_jenis`) USING BTREE,
  INDEX `nama_barang`(`nama_barang`) USING BTREE,
  INDEX `jml_barang`(`jml_barang`) USING BTREE,
  INDEX `thn_produksi`(`thn_produksi`) USING BTREE,
  INDEX `isbn`(`isbn`) USING BTREE,
  CONSTRAINT `inventaris_barang_ibfk_5` FOREIGN KEY (`kode_produsen`) REFERENCES `inventaris_produsen` (`kode_produsen`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `inventaris_barang_ibfk_6` FOREIGN KEY (`id_merk`) REFERENCES `inventaris_merk` (`id_merk`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `inventaris_barang_ibfk_7` FOREIGN KEY (`id_kategori`) REFERENCES `inventaris_kategori` (`id_kategori`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `inventaris_barang_ibfk_8` FOREIGN KEY (`id_jenis`) REFERENCES `inventaris_jenis` (`id_jenis`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inventaris_jenis
-- ----------------------------
DROP TABLE IF EXISTS `inventaris_jenis`;
CREATE TABLE `inventaris_jenis`  (
  `id_jenis` char(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_jenis` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_jenis`) USING BTREE,
  INDEX `nama_jenis`(`nama_jenis`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inventaris_kategori
-- ----------------------------
DROP TABLE IF EXISTS `inventaris_kategori`;
CREATE TABLE `inventaris_kategori`  (
  `id_kategori` char(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_kategori` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_kategori`) USING BTREE,
  INDEX `nama_kategori`(`nama_kategori`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inventaris_merk
-- ----------------------------
DROP TABLE IF EXISTS `inventaris_merk`;
CREATE TABLE `inventaris_merk`  (
  `id_merk` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_merk` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_merk`) USING BTREE,
  INDEX `nama_merk`(`nama_merk`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inventaris_peminjaman
-- ----------------------------
DROP TABLE IF EXISTS `inventaris_peminjaman`;
CREATE TABLE `inventaris_peminjaman`  (
  `peminjam` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tlp` varchar(13) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_inventaris` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tgl_pinjam` date NOT NULL DEFAULT '0000-00-00',
  `tgl_kembali` date NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `status_pinjam` enum('Masih Dipinjam','Sudah Kembali') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`peminjam`, `no_inventaris`, `tgl_pinjam`, `nip`) USING BTREE,
  INDEX `no_inventaris`(`no_inventaris`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  INDEX `tgl_kembali`(`tgl_kembali`) USING BTREE,
  INDEX `status_pinjam`(`status_pinjam`) USING BTREE,
  CONSTRAINT `inventaris_peminjaman_ibfk_1` FOREIGN KEY (`no_inventaris`) REFERENCES `inventaris` (`no_inventaris`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `inventaris_peminjaman_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inventaris_produsen
-- ----------------------------
DROP TABLE IF EXISTS `inventaris_produsen`;
CREATE TABLE `inventaris_produsen`  (
  `kode_produsen` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_produsen` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alamat_produsen` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_telp` varchar(13) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `website_produsen` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_produsen`) USING BTREE,
  INDEX `nama_produsen`(`nama_produsen`) USING BTREE,
  INDEX `alamat_produsen`(`alamat_produsen`) USING BTREE,
  INDEX `no_telp`(`no_telp`) USING BTREE,
  INDEX `email`(`email`) USING BTREE,
  INDEX `website_produsen`(`website_produsen`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inventaris_ruang
-- ----------------------------
DROP TABLE IF EXISTS `inventaris_ruang`;
CREATE TABLE `inventaris_ruang`  (
  `id_ruang` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_ruang` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_ruang`) USING BTREE,
  INDEX `nama_ruang`(`nama_ruang`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ipsrs_detail_returbeli
-- ----------------------------
DROP TABLE IF EXISTS `ipsrs_detail_returbeli`;
CREATE TABLE `ipsrs_detail_returbeli`  (
  `no_retur_beli` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `h_beli` double NULL DEFAULT NULL,
  `h_retur` double NULL DEFAULT NULL,
  `jml_retur` double NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `no_retur_beli`(`no_retur_beli`) USING BTREE,
  CONSTRAINT `ipsrs_detail_returbeli_ibfk_1` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ipsrs_detail_returbeli_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `ipsrsbarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ipsrs_detail_returbeli_ibfk_3` FOREIGN KEY (`no_retur_beli`) REFERENCES `ipsrsreturbeli` (`no_retur_beli`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ipsrs_riwayat_barang
-- ----------------------------
DROP TABLE IF EXISTS `ipsrs_riwayat_barang`;
CREATE TABLE `ipsrs_riwayat_barang`  (
  `kode_brng` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `stok_awal` double NULL DEFAULT NULL,
  `masuk` double NULL DEFAULT NULL,
  `keluar` double NULL DEFAULT NULL,
  `stok_akhir` double NOT NULL,
  `posisi` enum('Pengadaan','Penerimaan','Retur Beli','Opname','Stok Keluar','Pengambilan UTD') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `jam` time(0) NULL DEFAULT NULL,
  `petugas` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` enum('Simpan','Hapus') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  CONSTRAINT `ipsrs_riwayat_barang_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `ipsrsbarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ipsrsbarang
-- ----------------------------
DROP TABLE IF EXISTS `ipsrsbarang`;
CREATE TABLE `ipsrsbarang`  (
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_brng` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jenis` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `stok` double NOT NULL,
  `harga` double NOT NULL,
  `status` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kode_brng`) USING BTREE,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  INDEX `nama_brng`(`nama_brng`) USING BTREE,
  INDEX `jenis`(`jenis`(1)) USING BTREE,
  INDEX `stok`(`stok`) USING BTREE,
  INDEX `harga`(`harga`) USING BTREE,
  INDEX `jenis_2`(`jenis`) USING BTREE,
  CONSTRAINT `ipsrsbarang_ibfk_1` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ipsrsbarang_ibfk_2` FOREIGN KEY (`jenis`) REFERENCES `ipsrsjenisbarang` (`kd_jenis`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ipsrsdetailbeli
-- ----------------------------
DROP TABLE IF EXISTS `ipsrsdetailbeli`;
CREATE TABLE `ipsrsdetailbeli`  (
  `no_faktur` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jumlah` double NOT NULL,
  `harga` double NOT NULL,
  `subtotal` double NOT NULL,
  `dis` double NOT NULL,
  `besardis` double NOT NULL,
  `total` double NOT NULL,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `jumlah`(`jumlah`) USING BTREE,
  INDEX `harga`(`harga`) USING BTREE,
  INDEX `subtotal`(`subtotal`) USING BTREE,
  INDEX `dis`(`dis`) USING BTREE,
  INDEX `besardis`(`besardis`) USING BTREE,
  INDEX `total`(`total`) USING BTREE,
  INDEX `no_faktur`(`no_faktur`) USING BTREE,
  CONSTRAINT `ipsrsdetailbeli_ibfk_1` FOREIGN KEY (`no_faktur`) REFERENCES `ipsrspembelian` (`no_faktur`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ipsrsdetailbeli_ibfk_4` FOREIGN KEY (`kode_brng`) REFERENCES `ipsrsbarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ipsrsdetailbeli_ibfk_5` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ipsrsdetailpengeluaran
-- ----------------------------
DROP TABLE IF EXISTS `ipsrsdetailpengeluaran`;
CREATE TABLE `ipsrsdetailpengeluaran`  (
  `no_keluar` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jumlah` double NOT NULL,
  `harga` double NOT NULL,
  `total` double NOT NULL,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `jumlah`(`jumlah`) USING BTREE,
  INDEX `harga`(`harga`) USING BTREE,
  INDEX `total`(`total`) USING BTREE,
  INDEX `no_keluar`(`no_keluar`) USING BTREE,
  CONSTRAINT `ipsrsdetailpengeluaran_ibfk_1` FOREIGN KEY (`no_keluar`) REFERENCES `ipsrspengeluaran` (`no_keluar`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ipsrsdetailpengeluaran_ibfk_3` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ipsrsdetailpengeluaran_ibfk_4` FOREIGN KEY (`kode_brng`) REFERENCES `ipsrsbarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ipsrsdetailpesan
-- ----------------------------
DROP TABLE IF EXISTS `ipsrsdetailpesan`;
CREATE TABLE `ipsrsdetailpesan`  (
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jumlah` double NOT NULL,
  `harga` double NOT NULL,
  `subtotal` double NOT NULL,
  `dis` double NOT NULL,
  `besardis` double NOT NULL,
  `total` double NOT NULL,
  INDEX `no_faktur`(`no_faktur`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  CONSTRAINT `ipsrsdetailpesan_ibfk_1` FOREIGN KEY (`no_faktur`) REFERENCES `ipsrspemesanan` (`no_faktur`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ipsrsdetailpesan_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `ipsrsbarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ipsrsdetailpesan_ibfk_3` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ipsrsjenisbarang
-- ----------------------------
DROP TABLE IF EXISTS `ipsrsjenisbarang`;
CREATE TABLE `ipsrsjenisbarang`  (
  `kd_jenis` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_jenis` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kd_jenis`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ipsrsopname
-- ----------------------------
DROP TABLE IF EXISTS `ipsrsopname`;
CREATE TABLE `ipsrsopname`  (
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h_beli` double NULL DEFAULT NULL,
  `tanggal` date NOT NULL,
  `stok` int(11) NOT NULL,
  `real` int(11) NOT NULL,
  `selisih` int(11) NOT NULL,
  `nomihilang` double NOT NULL,
  `lebih` int(11) NOT NULL,
  `nomilebih` double NOT NULL,
  `keterangan` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kode_brng`, `tanggal`) USING BTREE,
  INDEX `stok`(`stok`) USING BTREE,
  INDEX `real`(`real`) USING BTREE,
  INDEX `selisih`(`selisih`) USING BTREE,
  INDEX `nomihilang`(`nomihilang`) USING BTREE,
  INDEX `keterangan`(`keterangan`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  CONSTRAINT `ipsrsopname_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `ipsrsbarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ipsrspembelian
-- ----------------------------
DROP TABLE IF EXISTS `ipsrspembelian`;
CREATE TABLE `ipsrspembelian`  (
  `no_faktur` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_suplier` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_beli` date NOT NULL,
  `subtotal` double NOT NULL,
  `potongan` double NOT NULL,
  `total` double NOT NULL,
  `ppn` double NULL DEFAULT NULL,
  `meterai` double NULL DEFAULT NULL,
  `tagihan` double NULL DEFAULT NULL,
  `kd_rek` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_faktur`) USING BTREE,
  INDEX `kode_suplier`(`kode_suplier`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  INDEX `tgl_beli`(`tgl_beli`) USING BTREE,
  INDEX `subtotal`(`subtotal`) USING BTREE,
  INDEX `potongan`(`potongan`) USING BTREE,
  INDEX `total`(`total`) USING BTREE,
  INDEX `ipsrspembelian_ibfk_5`(`kd_rek`) USING BTREE,
  CONSTRAINT `ipsrspembelian_ibfk_4` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ipsrspembelian_ibfk_5` FOREIGN KEY (`kd_rek`) REFERENCES `akun_bayar` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ipsrspembelian_ibfk_6` FOREIGN KEY (`kode_suplier`) REFERENCES `ipsrssuplier` (`kode_suplier`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ipsrspemesanan
-- ----------------------------
DROP TABLE IF EXISTS `ipsrspemesanan`;
CREATE TABLE `ipsrspemesanan`  (
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_order` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_suplier` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_pesan` date NULL DEFAULT NULL,
  `tgl_faktur` date NULL DEFAULT NULL,
  `tgl_tempo` date NULL DEFAULT NULL,
  `total1` double NOT NULL,
  `potongan` double NOT NULL,
  `total2` double NOT NULL,
  `ppn` double NOT NULL,
  `meterai` double NULL DEFAULT NULL,
  `tagihan` double NOT NULL,
  `status` enum('Sudah Dibayar','Belum Dibayar','Belum Lunas') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_faktur`) USING BTREE,
  INDEX `kode_suplier`(`kode_suplier`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `ipsrspemesanan_ibfk_1` FOREIGN KEY (`kode_suplier`) REFERENCES `ipsrssuplier` (`kode_suplier`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ipsrspemesanan_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ipsrspengeluaran
-- ----------------------------
DROP TABLE IF EXISTS `ipsrspengeluaran`;
CREATE TABLE `ipsrspengeluaran`  (
  `no_keluar` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` date NOT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_keluar`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  INDEX `tanggal`(`tanggal`) USING BTREE,
  INDEX `keterangan`(`keterangan`) USING BTREE,
  CONSTRAINT `ipsrspengeluaran_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ipsrsreturbeli
-- ----------------------------
DROP TABLE IF EXISTS `ipsrsreturbeli`;
CREATE TABLE `ipsrsreturbeli`  (
  `no_retur_beli` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_retur` date NULL DEFAULT NULL,
  `nip` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_suplier` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `catatan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`no_retur_beli`) USING BTREE,
  INDEX `kode_suplier`(`kode_suplier`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `ipsrsreturbeli_ibfk_1` FOREIGN KEY (`kode_suplier`) REFERENCES `ipsrssuplier` (`kode_suplier`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ipsrsreturbeli_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ipsrssuplier
-- ----------------------------
DROP TABLE IF EXISTS `ipsrssuplier`;
CREATE TABLE `ipsrssuplier`  (
  `kode_suplier` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_suplier` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alamat` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kota` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_telp` varchar(13) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_bank` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rekening` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_suplier`) USING BTREE,
  INDEX `nama_suplier`(`nama_suplier`) USING BTREE,
  INDEX `alamat`(`alamat`) USING BTREE,
  INDEX `kota`(`kota`) USING BTREE,
  INDEX `no_telp`(`no_telp`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jabatan
-- ----------------------------
DROP TABLE IF EXISTS `jabatan`;
CREATE TABLE `jabatan`  (
  `kd_jbtn` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nm_jbtn` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kd_jbtn`) USING BTREE,
  INDEX `nm_jbtn`(`nm_jbtn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jabatan_polri
-- ----------------------------
DROP TABLE IF EXISTS `jabatan_polri`;
CREATE TABLE `jabatan_polri`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jabatan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jabatan_tni
-- ----------------------------
DROP TABLE IF EXISTS `jabatan_tni`;
CREATE TABLE `jabatan_tni`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jabatan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jadwal
-- ----------------------------
DROP TABLE IF EXISTS `jadwal`;
CREATE TABLE `jadwal`  (
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hari_kerja` enum('SENIN','SELASA','RABU','KAMIS','JUMAT','SABTU','AKHAD') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'SENIN',
  `jam_mulai` time(0) NOT NULL DEFAULT '00:00:00',
  `jam_selesai` time(0) NULL DEFAULT NULL,
  `kd_poli` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kuota` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`kd_dokter`, `hari_kerja`, `jam_mulai`) USING BTREE,
  INDEX `kd_dokter`(`kd_dokter`) USING BTREE,
  INDEX `kd_poli`(`kd_poli`) USING BTREE,
  INDEX `jam_mulai`(`jam_mulai`) USING BTREE,
  INDEX `jam_selesai`(`jam_selesai`) USING BTREE,
  CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jadwal_ibfk_2` FOREIGN KEY (`kd_poli`) REFERENCES `poliklinik` (`kd_poli`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jadwal_pegawai
-- ----------------------------
DROP TABLE IF EXISTS `jadwal_pegawai`;
CREATE TABLE `jadwal_pegawai`  (
  `id` int(11) NOT NULL,
  `tahun` year NOT NULL,
  `bulan` enum('01','02','03','04','05','06','07','08','09','10','11','12') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h1` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h2` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h3` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h4` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h5` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h6` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h7` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h8` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h9` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h10` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h11` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h12` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h13` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h14` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h15` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h16` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h17` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h18` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h19` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h20` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h21` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h22` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h23` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h24` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h25` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h26` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h27` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h28` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h29` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h30` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h31` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`, `tahun`, `bulan`) USING BTREE,
  INDEX `h1`(`h1`) USING BTREE,
  INDEX `h2`(`h2`) USING BTREE,
  INDEX `h3`(`h3`) USING BTREE,
  INDEX `h4`(`h4`) USING BTREE,
  INDEX `h30`(`h30`) USING BTREE,
  INDEX `h31`(`h31`) USING BTREE,
  INDEX `h29`(`h29`) USING BTREE,
  INDEX `h28`(`h28`) USING BTREE,
  INDEX `h18`(`h18`) USING BTREE,
  INDEX `h9`(`h9`) USING BTREE,
  CONSTRAINT `jadwal_pegawai_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jadwal_tambahan
-- ----------------------------
DROP TABLE IF EXISTS `jadwal_tambahan`;
CREATE TABLE `jadwal_tambahan`  (
  `id` int(11) NOT NULL,
  `tahun` year NOT NULL,
  `bulan` enum('01','02','03','04','05','06','07','08','09','10','11','12') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h1` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h2` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h3` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h4` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h5` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h6` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h7` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h8` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h9` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h10` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h11` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h12` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h13` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h14` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h15` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h16` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h17` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h18` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h19` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h20` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h21` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h22` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h23` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h24` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h25` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h26` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h27` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h28` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h29` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h30` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h31` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`, `tahun`, `bulan`) USING BTREE,
  CONSTRAINT `jadwal_tambahan_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jam_diet_pasien
-- ----------------------------
DROP TABLE IF EXISTS `jam_diet_pasien`;
CREATE TABLE `jam_diet_pasien`  (
  `waktu` enum('Pagi','Pagi2','Pagi3','Siang','Siang2','Siang3','Sore','Sore2','Sore3','Malam','Malam2','Malam3') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jam` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`waktu`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jam_jaga
-- ----------------------------
DROP TABLE IF EXISTS `jam_jaga`;
CREATE TABLE `jam_jaga`  (
  `no_id` int(11) NOT NULL AUTO_INCREMENT,
  `dep_id` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `shift` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jam_masuk` time(0) NOT NULL,
  `jam_pulang` time(0) NOT NULL,
  PRIMARY KEY (`no_id`) USING BTREE,
  UNIQUE INDEX `dep_id_2`(`dep_id`, `shift`) USING BTREE,
  INDEX `dep_id`(`dep_id`) USING BTREE,
  INDEX `shift`(`shift`) USING BTREE,
  INDEX `jam_masuk`(`jam_masuk`) USING BTREE,
  INDEX `jam_pulang`(`jam_pulang`) USING BTREE,
  CONSTRAINT `jam_jaga_ibfk_1` FOREIGN KEY (`dep_id`) REFERENCES `departemen` (`dep_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jam_masuk
-- ----------------------------
DROP TABLE IF EXISTS `jam_masuk`;
CREATE TABLE `jam_masuk`  (
  `shift` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jam_masuk` time(0) NOT NULL,
  `jam_pulang` time(0) NOT NULL,
  PRIMARY KEY (`shift`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jamsostek
-- ----------------------------
DROP TABLE IF EXISTS `jamsostek`;
CREATE TABLE `jamsostek`  (
  `stts` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `biaya` double NOT NULL,
  PRIMARY KEY (`stts`) USING BTREE,
  INDEX `biaya`(`biaya`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jasa_lain
-- ----------------------------
DROP TABLE IF EXISTS `jasa_lain`;
CREATE TABLE `jasa_lain`  (
  `thn` year NOT NULL,
  `bln` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `bsr_jasa` double NOT NULL,
  `ktg` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`thn`, `bln`, `id`, `bsr_jasa`, `ktg`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  CONSTRAINT `jasa_lain_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jenis
-- ----------------------------
DROP TABLE IF EXISTS `jenis`;
CREATE TABLE `jenis`  (
  `kdjns` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kdjns`) USING BTREE,
  INDEX `nama`(`nama`) USING BTREE,
  INDEX `keterangan`(`keterangan`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jgmlm
-- ----------------------------
DROP TABLE IF EXISTS `jgmlm`;
CREATE TABLE `jgmlm`  (
  `tgl` date NOT NULL,
  `id` int(11) NOT NULL,
  `jml` int(11) NOT NULL,
  PRIMARY KEY (`tgl`, `id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `jml`(`jml`) USING BTREE,
  CONSTRAINT `jgmlm_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jnj_jabatan
-- ----------------------------
DROP TABLE IF EXISTS `jnj_jabatan`;
CREATE TABLE `jnj_jabatan`  (
  `kode` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tnj` double NOT NULL,
  `indek` tinyint(4) NOT NULL,
  PRIMARY KEY (`kode`) USING BTREE,
  INDEX `nama`(`nama`) USING BTREE,
  INDEX `tnj`(`tnj`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jns_perawatan
-- ----------------------------
DROP TABLE IF EXISTS `jns_perawatan`;
CREATE TABLE `jns_perawatan`  (
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_perawatan` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_kategori` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `material` double NULL DEFAULT NULL,
  `bhp` double NOT NULL,
  `tarif_tindakandr` double NULL DEFAULT NULL,
  `tarif_tindakanpr` double NULL DEFAULT NULL,
  `kso` double NULL DEFAULT NULL,
  `menejemen` double NULL DEFAULT NULL,
  `total_byrdr` double NULL DEFAULT NULL,
  `total_byrpr` double NULL DEFAULT NULL,
  `total_byrdrpr` double NOT NULL,
  `kd_pj` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_poli` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd_jenis_prw`) USING BTREE,
  INDEX `kd_kategori`(`kd_kategori`) USING BTREE,
  INDEX `kd_pj`(`kd_pj`) USING BTREE,
  INDEX `kd_poli`(`kd_poli`) USING BTREE,
  INDEX `nm_perawatan`(`nm_perawatan`) USING BTREE,
  INDEX `material`(`material`) USING BTREE,
  INDEX `tarif_tindakandr`(`tarif_tindakandr`) USING BTREE,
  INDEX `tarif_tindakanpr`(`tarif_tindakanpr`) USING BTREE,
  INDEX `total_byrdr`(`total_byrdr`) USING BTREE,
  INDEX `total_byrpr`(`total_byrpr`) USING BTREE,
  INDEX `kso`(`kso`) USING BTREE,
  INDEX `menejemen`(`menejemen`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `total_byrdrpr`(`total_byrdrpr`) USING BTREE,
  INDEX `bhp`(`bhp`) USING BTREE,
  CONSTRAINT `jns_perawatan_ibfk_1` FOREIGN KEY (`kd_kategori`) REFERENCES `kategori_perawatan` (`kd_kategori`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `jns_perawatan_ibfk_2` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `jns_perawatan_ibfk_3` FOREIGN KEY (`kd_poli`) REFERENCES `poliklinik` (`kd_poli`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jns_perawatan_inap
-- ----------------------------
DROP TABLE IF EXISTS `jns_perawatan_inap`;
CREATE TABLE `jns_perawatan_inap`  (
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_perawatan` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_kategori` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `material` double NULL DEFAULT NULL,
  `bhp` double NOT NULL,
  `tarif_tindakandr` double NULL DEFAULT NULL,
  `tarif_tindakanpr` double NULL DEFAULT NULL,
  `kso` double NULL DEFAULT NULL,
  `menejemen` double NULL DEFAULT NULL,
  `total_byrdr` double NULL DEFAULT NULL,
  `total_byrpr` double NULL DEFAULT NULL,
  `total_byrdrpr` double NOT NULL,
  `kd_pj` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_bangsal` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kelas` enum('-','Kelas 1','Kelas 2','Kelas 3','Kelas Utama','Kelas VIP','Kelas VVIP') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd_jenis_prw`) USING BTREE,
  INDEX `kd_pj`(`kd_pj`) USING BTREE,
  INDEX `kd_bangsal`(`kd_bangsal`) USING BTREE,
  INDEX `kd_kategori`(`kd_kategori`) USING BTREE,
  INDEX `nm_perawatan`(`nm_perawatan`) USING BTREE,
  INDEX `material`(`material`) USING BTREE,
  INDEX `tarif_tindakandr`(`tarif_tindakandr`) USING BTREE,
  INDEX `tarif_tindakanpr`(`tarif_tindakanpr`) USING BTREE,
  INDEX `total_byrdr`(`total_byrdr`) USING BTREE,
  INDEX `total_byrpr`(`total_byrpr`) USING BTREE,
  INDEX `bhp`(`bhp`) USING BTREE,
  INDEX `kso`(`kso`) USING BTREE,
  INDEX `menejemen`(`menejemen`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `total_byrdrpr`(`total_byrdrpr`) USING BTREE,
  CONSTRAINT `jns_perawatan_inap_ibfk_7` FOREIGN KEY (`kd_kategori`) REFERENCES `kategori_perawatan` (`kd_kategori`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `jns_perawatan_inap_ibfk_8` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `jns_perawatan_inap_ibfk_9` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jns_perawatan_lab
-- ----------------------------
DROP TABLE IF EXISTS `jns_perawatan_lab`;
CREATE TABLE `jns_perawatan_lab`  (
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_perawatan` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bagian_rs` double NULL DEFAULT NULL,
  `bhp` double NOT NULL,
  `tarif_perujuk` double NOT NULL,
  `tarif_tindakan_dokter` double NOT NULL,
  `tarif_tindakan_petugas` double NULL DEFAULT NULL,
  `kso` double NULL DEFAULT NULL,
  `menejemen` double NULL DEFAULT NULL,
  `total_byr` double NULL DEFAULT NULL,
  `kd_pj` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kelas` enum('-','Rawat Jalan','Kelas 1','Kelas 2','Kelas 3','Kelas Utama','Kelas VIP','Kelas VVIP') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kategori` enum('PK','PA') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd_jenis_prw`) USING BTREE,
  INDEX `kd_pj`(`kd_pj`) USING BTREE,
  INDEX `nm_perawatan`(`nm_perawatan`) USING BTREE,
  INDEX `tarif_perujuk`(`tarif_perujuk`) USING BTREE,
  INDEX `tarif_tindakan_dokter`(`tarif_tindakan_dokter`) USING BTREE,
  INDEX `tarif_tindakan_petugas`(`tarif_tindakan_petugas`) USING BTREE,
  INDEX `total_byr`(`total_byr`) USING BTREE,
  INDEX `bagian_rs`(`bagian_rs`) USING BTREE,
  INDEX `bhp`(`bhp`) USING BTREE,
  INDEX `kso`(`kso`) USING BTREE,
  INDEX `menejemen`(`menejemen`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  CONSTRAINT `jns_perawatan_lab_ibfk_1` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jns_perawatan_radiologi
-- ----------------------------
DROP TABLE IF EXISTS `jns_perawatan_radiologi`;
CREATE TABLE `jns_perawatan_radiologi`  (
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_perawatan` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bagian_rs` double NULL DEFAULT NULL,
  `bhp` double NOT NULL,
  `tarif_perujuk` double NOT NULL,
  `tarif_tindakan_dokter` double NOT NULL,
  `tarif_tindakan_petugas` double NULL DEFAULT NULL,
  `kso` double NULL DEFAULT NULL,
  `menejemen` double NULL DEFAULT NULL,
  `total_byr` double NULL DEFAULT NULL,
  `kd_pj` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kelas` enum('-','Rawat Jalan','Kelas 1','Kelas 2','Kelas 3','Kelas Utama','Kelas VIP','Kelas VVIP') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd_jenis_prw`) USING BTREE,
  INDEX `kd_pj`(`kd_pj`) USING BTREE,
  INDEX `nm_perawatan`(`nm_perawatan`) USING BTREE,
  INDEX `bagian_rs`(`bagian_rs`) USING BTREE,
  INDEX `tarif_perujuk`(`tarif_perujuk`) USING BTREE,
  INDEX `tarif_tindakan_dokter`(`tarif_tindakan_dokter`) USING BTREE,
  INDEX `tarif_tindakan_petugas`(`tarif_tindakan_petugas`) USING BTREE,
  INDEX `total_byr`(`total_byr`) USING BTREE,
  INDEX `bhp`(`bhp`) USING BTREE,
  INDEX `kso`(`kso`) USING BTREE,
  INDEX `menejemen`(`menejemen`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  CONSTRAINT `jns_perawatan_radiologi_ibfk_1` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jns_perawatan_utd
-- ----------------------------
DROP TABLE IF EXISTS `jns_perawatan_utd`;
CREATE TABLE `jns_perawatan_utd`  (
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nm_perawatan` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bagian_rs` double NULL DEFAULT NULL,
  `bhp` double NULL DEFAULT NULL,
  `tarif_perujuk` double NULL DEFAULT NULL,
  `tarif_tindakan_dokter` double NULL DEFAULT NULL,
  `tarif_tindakan_petugas` double NULL DEFAULT NULL,
  `kso` double NULL DEFAULT NULL,
  `manajemen` double NULL DEFAULT NULL,
  `total_byr` double NULL DEFAULT NULL,
  `kd_pj` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kd_jenis_prw`) USING BTREE,
  INDEX `kd_pj`(`kd_pj`) USING BTREE,
  CONSTRAINT `jns_perawatan_utd_ibfk_1` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jumpasien
-- ----------------------------
DROP TABLE IF EXISTS `jumpasien`;
CREATE TABLE `jumpasien`  (
  `thn` year NOT NULL,
  `bln` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `jml` int(11) NOT NULL,
  PRIMARY KEY (`thn`, `bln`, `id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `jml`(`jml`) USING BTREE,
  CONSTRAINT `jumpasien_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jurnal
-- ----------------------------
DROP TABLE IF EXISTS `jurnal`;
CREATE TABLE `jurnal`  (
  `no_jurnal` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_bukti` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_jurnal` date NULL DEFAULT NULL,
  `jenis` enum('U','P') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keterangan` varchar(350) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_jurnal`) USING BTREE,
  INDEX `no_bukti`(`no_bukti`) USING BTREE,
  INDEX `tgl_jurnal`(`tgl_jurnal`) USING BTREE,
  INDEX `jenis`(`jenis`) USING BTREE,
  INDEX `keterangan`(`keterangan`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for k3rs_bagian_tubuh
-- ----------------------------
DROP TABLE IF EXISTS `k3rs_bagian_tubuh`;
CREATE TABLE `k3rs_bagian_tubuh`  (
  `kode_bagian` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bagian_tubuh` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_bagian`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for k3rs_dampak_cidera
-- ----------------------------
DROP TABLE IF EXISTS `k3rs_dampak_cidera`;
CREATE TABLE `k3rs_dampak_cidera`  (
  `kode_dampak` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dampak_cidera` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_dampak`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for k3rs_jenis_cidera
-- ----------------------------
DROP TABLE IF EXISTS `k3rs_jenis_cidera`;
CREATE TABLE `k3rs_jenis_cidera`  (
  `kode_cidera` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jenis_cidera` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_cidera`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for k3rs_jenis_luka
-- ----------------------------
DROP TABLE IF EXISTS `k3rs_jenis_luka`;
CREATE TABLE `k3rs_jenis_luka`  (
  `kode_luka` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jenis_luka` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_luka`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for k3rs_jenis_pekerjaan
-- ----------------------------
DROP TABLE IF EXISTS `k3rs_jenis_pekerjaan`;
CREATE TABLE `k3rs_jenis_pekerjaan`  (
  `kode_pekerjaan` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jenis_pekerjaan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_pekerjaan`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for k3rs_lokasi_kejadian
-- ----------------------------
DROP TABLE IF EXISTS `k3rs_lokasi_kejadian`;
CREATE TABLE `k3rs_lokasi_kejadian`  (
  `kode_lokasi` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lokasi_kejadian` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_lokasi`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for k3rs_penyebab
-- ----------------------------
DROP TABLE IF EXISTS `k3rs_penyebab`;
CREATE TABLE `k3rs_penyebab`  (
  `kode_penyebab` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `penyebab_kecelakaan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_penyebab`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for k3rs_peristiwa
-- ----------------------------
DROP TABLE IF EXISTS `k3rs_peristiwa`;
CREATE TABLE `k3rs_peristiwa`  (
  `no_k3rs` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_insiden` date NOT NULL,
  `waktu_insiden` time(0) NOT NULL,
  `kode_pekerjaan` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_pelaporan` date NOT NULL,
  `waktu_pelaporan` time(0) NOT NULL,
  `kode_lokasi` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kronologi_kejadian` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_penyebab` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nik` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kategori_cidera` enum('Ringan','Sedang','Berat','Fatal') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_cidera` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_luka` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_bagian` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lt` int(11) NOT NULL,
  `penyebab_langsung_kondisi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `penyebab_langsung_tindakan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `penyebab_tidak_langsung_pribadi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `penyebab_tidak_langsung_pekerjaan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `barang_bukti` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_dampak` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nik_pelapor` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `perbaikan_jenis_tindakan` enum('Tindakan Perbaikan','Tindakan Pencegahan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `perbaikan_rencana_tindakan` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `perbaikan_target` date NOT NULL,
  `perbaikan_wewenang` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nik_timk3` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `catatan` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_k3rs`) USING BTREE,
  INDEX `kode_pekerjaan`(`kode_pekerjaan`) USING BTREE,
  INDEX `kode_lokasi`(`kode_lokasi`) USING BTREE,
  INDEX `kode_penyebab`(`kode_penyebab`) USING BTREE,
  INDEX `nik`(`nik`) USING BTREE,
  INDEX `kode_cidera`(`kode_cidera`) USING BTREE,
  INDEX `kode_luka`(`kode_luka`) USING BTREE,
  INDEX `kode_dampak`(`kode_dampak`) USING BTREE,
  INDEX `nik_timk3`(`nik_timk3`) USING BTREE,
  INDEX `nik_pelapor`(`nik_pelapor`) USING BTREE,
  INDEX `kode_bagian`(`kode_bagian`) USING BTREE,
  CONSTRAINT `k3rs_peristiwa_ibfk_1` FOREIGN KEY (`kode_cidera`) REFERENCES `k3rs_jenis_cidera` (`kode_cidera`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `k3rs_peristiwa_ibfk_10` FOREIGN KEY (`kode_bagian`) REFERENCES `k3rs_bagian_tubuh` (`kode_bagian`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `k3rs_peristiwa_ibfk_2` FOREIGN KEY (`kode_dampak`) REFERENCES `k3rs_dampak_cidera` (`kode_dampak`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `k3rs_peristiwa_ibfk_3` FOREIGN KEY (`kode_lokasi`) REFERENCES `k3rs_lokasi_kejadian` (`kode_lokasi`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `k3rs_peristiwa_ibfk_4` FOREIGN KEY (`kode_luka`) REFERENCES `k3rs_jenis_luka` (`kode_luka`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `k3rs_peristiwa_ibfk_5` FOREIGN KEY (`kode_pekerjaan`) REFERENCES `k3rs_jenis_pekerjaan` (`kode_pekerjaan`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `k3rs_peristiwa_ibfk_6` FOREIGN KEY (`kode_penyebab`) REFERENCES `k3rs_penyebab` (`kode_penyebab`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `k3rs_peristiwa_ibfk_7` FOREIGN KEY (`nik`) REFERENCES `pegawai` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `k3rs_peristiwa_ibfk_8` FOREIGN KEY (`nik_pelapor`) REFERENCES `pegawai` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `k3rs_peristiwa_ibfk_9` FOREIGN KEY (`nik_timk3`) REFERENCES `pegawai` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kabupaten
-- ----------------------------
DROP TABLE IF EXISTS `kabupaten`;
CREATE TABLE `kabupaten`  (
  `kd_kab` int(11) NOT NULL AUTO_INCREMENT,
  `nm_kab` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd_kab`) USING BTREE,
  UNIQUE INDEX `nm_kab`(`nm_kab`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 276 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kamar
-- ----------------------------
DROP TABLE IF EXISTS `kamar`;
CREATE TABLE `kamar`  (
  `kd_kamar` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_bangsal` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `trf_kamar` double NULL DEFAULT NULL,
  `status` enum('ISI','KOSONG','DIBERSIHKAN','DIBOOKING') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kelas` enum('Kelas 1','Kelas 2','Kelas 3','Kelas Utama','Kelas VIP','Kelas VVIP') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `statusdata` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kd_kamar`) USING BTREE,
  INDEX `kd_bangsal`(`kd_bangsal`) USING BTREE,
  INDEX `trf_kamar`(`trf_kamar`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `kelas`(`kelas`) USING BTREE,
  INDEX `statusdata`(`statusdata`) USING BTREE,
  CONSTRAINT `kamar_ibfk_1` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kamar_inap
-- ----------------------------
DROP TABLE IF EXISTS `kamar_inap`;
CREATE TABLE `kamar_inap`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kd_kamar` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `trf_kamar` double NULL DEFAULT NULL,
  `diagnosa_awal` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `diagnosa_akhir` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_masuk` date NOT NULL DEFAULT '0000-00-00',
  `jam_masuk` time(0) NOT NULL DEFAULT '00:00:00',
  `tgl_keluar` date NULL DEFAULT NULL,
  `jam_keluar` time(0) NULL DEFAULT NULL,
  `lama` double NULL DEFAULT NULL,
  `ttl_biaya` double NULL DEFAULT NULL,
  `stts_pulang` enum('Sehat','Rujuk','APS','+','Meninggal','Sembuh','Membaik','Pulang Paksa','-','Pindah Kamar','Status Belum Lengkap','Atas Persetujuan Dokter','Atas Permintaan Sendiri','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `tgl_masuk`, `jam_masuk`) USING BTREE,
  INDEX `kd_kamar`(`kd_kamar`) USING BTREE,
  INDEX `diagnosa_awal`(`diagnosa_awal`) USING BTREE,
  INDEX `diagnosa_akhir`(`diagnosa_akhir`) USING BTREE,
  INDEX `tgl_keluar`(`tgl_keluar`) USING BTREE,
  INDEX `jam_keluar`(`jam_keluar`) USING BTREE,
  INDEX `lama`(`lama`) USING BTREE,
  INDEX `ttl_biaya`(`ttl_biaya`) USING BTREE,
  INDEX `stts_pulang`(`stts_pulang`) USING BTREE,
  INDEX `trf_kamar`(`trf_kamar`) USING BTREE,
  CONSTRAINT `kamar_inap_ibfk_2` FOREIGN KEY (`kd_kamar`) REFERENCES `kamar` (`kd_kamar`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kamar_inap_ibfk_3` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kasift
-- ----------------------------
DROP TABLE IF EXISTS `kasift`;
CREATE TABLE `kasift`  (
  `id` int(11) NOT NULL,
  `jmlks` bigint(20) NOT NULL,
  `bsr` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jmlks`(`jmlks`) USING BTREE,
  INDEX `bsr`(`bsr`) USING BTREE,
  CONSTRAINT `kasift_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kategori_barang
-- ----------------------------
DROP TABLE IF EXISTS `kategori_barang`;
CREATE TABLE `kategori_barang`  (
  `kode` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kategori_pemasukan_lain
-- ----------------------------
DROP TABLE IF EXISTS `kategori_pemasukan_lain`;
CREATE TABLE `kategori_pemasukan_lain`  (
  `kode_kategori` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_kategori` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_rek` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_rek2` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_kategori`) USING BTREE,
  INDEX `kd_rek`(`kd_rek`) USING BTREE,
  INDEX `kd_rek2`(`kd_rek2`) USING BTREE,
  CONSTRAINT `kategori_pemasukan_lain_ibfk_1` FOREIGN KEY (`kd_rek`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `kategori_pemasukan_lain_ibfk_2` FOREIGN KEY (`kd_rek2`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kategori_pengeluaran_harian
-- ----------------------------
DROP TABLE IF EXISTS `kategori_pengeluaran_harian`;
CREATE TABLE `kategori_pengeluaran_harian`  (
  `kode_kategori` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_kategori` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_rek` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_rek2` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_kategori`) USING BTREE,
  INDEX `kd_rek`(`kd_rek`) USING BTREE,
  INDEX `kd_rek2`(`kd_rek2`) USING BTREE,
  CONSTRAINT `kategori_pengeluaran_harian_ibfk_1` FOREIGN KEY (`kd_rek`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `kategori_pengeluaran_harian_ibfk_2` FOREIGN KEY (`kd_rek2`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kategori_penyakit
-- ----------------------------
DROP TABLE IF EXISTS `kategori_penyakit`;
CREATE TABLE `kategori_penyakit`  (
  `kd_ktg` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_kategori` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ciri_umum` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kd_ktg`) USING BTREE,
  INDEX `nm_kategori`(`nm_kategori`) USING BTREE,
  INDEX `ciri_umum`(`ciri_umum`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kategori_perawatan
-- ----------------------------
DROP TABLE IF EXISTS `kategori_perawatan`;
CREATE TABLE `kategori_perawatan`  (
  `kd_kategori` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_kategori` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kd_kategori`) USING BTREE,
  INDEX `nm_kategori`(`nm_kategori`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for keanggotaan
-- ----------------------------
DROP TABLE IF EXISTS `keanggotaan`;
CREATE TABLE `keanggotaan`  (
  `id` int(11) NOT NULL,
  `koperasi` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jamsostek` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bpjs` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `koperasi`(`koperasi`) USING BTREE,
  INDEX `jamsostek`(`jamsostek`) USING BTREE,
  INDEX `bpjs`(`bpjs`) USING BTREE,
  CONSTRAINT `keanggotaan_ibfk_3` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `keanggotaan_ibfk_4` FOREIGN KEY (`koperasi`) REFERENCES `koperasi` (`stts`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `keanggotaan_ibfk_5` FOREIGN KEY (`jamsostek`) REFERENCES `jamsostek` (`stts`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `keanggotaan_ibfk_6` FOREIGN KEY (`bpjs`) REFERENCES `bpjs` (`stts`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kecamatan
-- ----------------------------
DROP TABLE IF EXISTS `kecamatan`;
CREATE TABLE `kecamatan`  (
  `kd_kec` int(11) NOT NULL AUTO_INCREMENT,
  `nm_kec` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd_kec`) USING BTREE,
  UNIQUE INDEX `nm_kec`(`nm_kec`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 544 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kelompok_jabatan
-- ----------------------------
DROP TABLE IF EXISTS `kelompok_jabatan`;
CREATE TABLE `kelompok_jabatan`  (
  `kode_kelompok` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_kelompok` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `indek` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`kode_kelompok`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kelurahan
-- ----------------------------
DROP TABLE IF EXISTS `kelurahan`;
CREATE TABLE `kelurahan`  (
  `kd_kel` int(11) NOT NULL AUTO_INCREMENT,
  `nm_kel` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd_kel`) USING BTREE,
  UNIQUE INDEX `nm_kel`(`nm_kel`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1101010041 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kesling_limbah_b3medis
-- ----------------------------
DROP TABLE IF EXISTS `kesling_limbah_b3medis`;
CREATE TABLE `kesling_limbah_b3medis`  (
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime(0) NOT NULL,
  `jmllimbah` double NULL DEFAULT NULL,
  `tujuan_penyerahan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bukti_dokumen` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sisa_di_tps` double NULL DEFAULT NULL,
  PRIMARY KEY (`nip`, `tanggal`) USING BTREE,
  CONSTRAINT `kesling_limbah_b3medis_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kesling_limbah_domestik
-- ----------------------------
DROP TABLE IF EXISTS `kesling_limbah_domestik`;
CREATE TABLE `kesling_limbah_domestik`  (
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime(0) NOT NULL,
  `jumlahlimbah` double NULL DEFAULT NULL,
  `tanggalangkut` datetime(0) NULL DEFAULT NULL,
  `keterangan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nip`, `tanggal`) USING BTREE,
  CONSTRAINT `kesling_limbah_domestik_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kesling_mutu_air_limbah
-- ----------------------------
DROP TABLE IF EXISTS `kesling_mutu_air_limbah`;
CREATE TABLE `kesling_mutu_air_limbah`  (
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime(0) NOT NULL,
  `meteran` double NULL DEFAULT NULL,
  `jumlahharian` double NULL DEFAULT NULL,
  `ph` double NULL DEFAULT NULL,
  `suhu` double NULL DEFAULT NULL,
  PRIMARY KEY (`nip`, `tanggal`) USING BTREE,
  CONSTRAINT `kesling_mutu_air_limbah_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kesling_pemakaian_air_pdam
-- ----------------------------
DROP TABLE IF EXISTS `kesling_pemakaian_air_pdam`;
CREATE TABLE `kesling_pemakaian_air_pdam`  (
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime(0) NOT NULL,
  `meteran` double NULL DEFAULT NULL,
  `jumlahharian` double NULL DEFAULT NULL,
  `keterangan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nip`, `tanggal`) USING BTREE,
  CONSTRAINT `kesling_pemakaian_air_pdam_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kesling_pemakaian_air_tanah
-- ----------------------------
DROP TABLE IF EXISTS `kesling_pemakaian_air_tanah`;
CREATE TABLE `kesling_pemakaian_air_tanah`  (
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime(0) NOT NULL,
  `meteran` double NULL DEFAULT NULL,
  `jumlahharian` double NULL DEFAULT NULL,
  `keterangan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nip`, `tanggal`) USING BTREE,
  CONSTRAINT `kesling_pemakaian_air_tanah` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kesling_pest_control
-- ----------------------------
DROP TABLE IF EXISTS `kesling_pest_control`;
CREATE TABLE `kesling_pest_control`  (
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime(0) NOT NULL,
  `rincian_kegiatan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `rekomendasi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`nip`, `tanggal`) USING BTREE,
  CONSTRAINT `kesling_pest_control_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ketidakhadiran
-- ----------------------------
DROP TABLE IF EXISTS `ketidakhadiran`;
CREATE TABLE `ketidakhadiran`  (
  `tgl` date NOT NULL,
  `id` int(11) NOT NULL,
  `jns` enum('A','S','C','I') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ktg` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jml` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`tgl`, `id`, `jns`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `ktg`(`ktg`) USING BTREE,
  INDEX `jml`(`jml`) USING BTREE,
  CONSTRAINT `ketidakhadiran_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kodesatuan
-- ----------------------------
DROP TABLE IF EXISTS `kodesatuan`;
CREATE TABLE `kodesatuan`  (
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `satuan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_sat`) USING BTREE,
  INDEX `satuan`(`satuan`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for konver_sat
-- ----------------------------
DROP TABLE IF EXISTS `konver_sat`;
CREATE TABLE `konver_sat`  (
  `nilai` double NOT NULL,
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nilai_konversi` double NOT NULL,
  `sat_konversi` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`nilai`, `kode_sat`, `nilai_konversi`, `sat_konversi`) USING BTREE,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  INDEX `nilai`(`nilai`) USING BTREE,
  INDEX `nilai_konversi`(`nilai_konversi`) USING BTREE,
  CONSTRAINT `konver_sat_ibfk_1` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for koperasi
-- ----------------------------
DROP TABLE IF EXISTS `koperasi`;
CREATE TABLE `koperasi`  (
  `stts` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `wajib` double NOT NULL,
  PRIMARY KEY (`stts`) USING BTREE,
  INDEX `wajib`(`wajib`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for laporan_operasi
-- ----------------------------
DROP TABLE IF EXISTS `laporan_operasi`;
CREATE TABLE `laporan_operasi`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime(0) NOT NULL,
  `diagnosa_preop` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `diagnosa_postop` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jaringan_dieksekusi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `selesaioperasi` datetime(0) NOT NULL,
  `permintaan_pa` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `laporan_operasi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `tanggal`) USING BTREE,
  CONSTRAINT `laporan_operasi_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_dukcapil_aceh
-- ----------------------------
DROP TABLE IF EXISTS `log_dukcapil_aceh`;
CREATE TABLE `log_dukcapil_aceh`  (
  `no_ktp` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime(0) NOT NULL,
  `user` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_ktp`, `tanggal`, `user`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for maping_dokter_dpjpvclaim
-- ----------------------------
DROP TABLE IF EXISTS `maping_dokter_dpjpvclaim`;
CREATE TABLE `maping_dokter_dpjpvclaim`  (
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_dokter_bpjs` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nm_dokter_bpjs` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kd_dokter`) USING BTREE,
  CONSTRAINT `maping_dokter_dpjpvclaim_ibfk_1` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for maping_dokter_pcare
-- ----------------------------
DROP TABLE IF EXISTS `maping_dokter_pcare`;
CREATE TABLE `maping_dokter_pcare`  (
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_dokter_pcare` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nm_dokter_pcare` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kd_dokter`) USING BTREE,
  CONSTRAINT `maping_dokter_pcare_ibfk_1` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for maping_obat_pcare
-- ----------------------------
DROP TABLE IF EXISTS `maping_obat_pcare`;
CREATE TABLE `maping_obat_pcare`  (
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng_pcare` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_brng_pcare` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_brng`) USING BTREE,
  CONSTRAINT `maping_obat_pcare_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for maping_poli_bpjs
-- ----------------------------
DROP TABLE IF EXISTS `maping_poli_bpjs`;
CREATE TABLE `maping_poli_bpjs`  (
  `kd_poli_rs` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_poli_bpjs` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_poli_bpjs` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd_poli_rs`) USING BTREE,
  UNIQUE INDEX `kd_poli_bpjs`(`kd_poli_bpjs`) USING BTREE,
  CONSTRAINT `maping_poli_bpjs_ibfk_1` FOREIGN KEY (`kd_poli_rs`) REFERENCES `poliklinik` (`kd_poli`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for maping_poliklinik_pcare
-- ----------------------------
DROP TABLE IF EXISTS `maping_poliklinik_pcare`;
CREATE TABLE `maping_poliklinik_pcare`  (
  `kd_poli_rs` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_poli_pcare` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nm_poli_pcare` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kd_poli_rs`) USING BTREE,
  CONSTRAINT `maping_poliklinik_pcare_ibfk_1` FOREIGN KEY (`kd_poli_rs`) REFERENCES `poliklinik` (`kd_poli`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for maping_tindakan_pcare
-- ----------------------------
DROP TABLE IF EXISTS `maping_tindakan_pcare`;
CREATE TABLE `maping_tindakan_pcare`  (
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_tindakan_pcare` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nm_tindakan_pcare` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kd_jenis_prw`) USING BTREE,
  CONSTRAINT `maping_tindakan_pcare_ibfk_1` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for maping_tindakan_ranap_pcare
-- ----------------------------
DROP TABLE IF EXISTS `maping_tindakan_ranap_pcare`;
CREATE TABLE `maping_tindakan_ranap_pcare`  (
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_tindakan_pcare` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nm_tindakan_pcare` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kd_jenis_prw`) USING BTREE,
  CONSTRAINT `maping_tindakan_ranap_pcare_ibfk_1` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_inap` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for master_aturan_pakai
-- ----------------------------
DROP TABLE IF EXISTS `master_aturan_pakai`;
CREATE TABLE `master_aturan_pakai`  (
  `aturan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`aturan`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for master_berkas_digital
-- ----------------------------
DROP TABLE IF EXISTS `master_berkas_digital`;
CREATE TABLE `master_berkas_digital`  (
  `kode` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for master_berkas_pegawai
-- ----------------------------
DROP TABLE IF EXISTS `master_berkas_pegawai`;
CREATE TABLE `master_berkas_pegawai`  (
  `kode` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kategori` enum('Tenaga klinis Dokter Umum','Tenaga klinis Dokter Spesialis','Tenaga klinis Perawat dan Bidan','Tenaga klinis Profesi Lain','Tenaga Non Klinis') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_berkas` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_urut` tinyint(4) NOT NULL,
  PRIMARY KEY (`kode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for master_imunisasi
-- ----------------------------
DROP TABLE IF EXISTS `master_imunisasi`;
CREATE TABLE `master_imunisasi`  (
  `kode_imunisasi` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_imunisasi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_imunisasi`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for master_masalah_keperawatan
-- ----------------------------
DROP TABLE IF EXISTS `master_masalah_keperawatan`;
CREATE TABLE `master_masalah_keperawatan`  (
  `kode_masalah` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_masalah` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_masalah`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for master_masalah_keperawatan_anak
-- ----------------------------
DROP TABLE IF EXISTS `master_masalah_keperawatan_anak`;
CREATE TABLE `master_masalah_keperawatan_anak`  (
  `kode_masalah` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_masalah` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_masalah`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for master_masalah_keperawatan_gigi
-- ----------------------------
DROP TABLE IF EXISTS `master_masalah_keperawatan_gigi`;
CREATE TABLE `master_masalah_keperawatan_gigi`  (
  `kode_masalah` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_masalah` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_masalah`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for master_tindakan
-- ----------------------------
DROP TABLE IF EXISTS `master_tindakan`;
CREATE TABLE `master_tindakan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jm` double NOT NULL,
  `jns` enum('Karyawan','dr Umum','dr Spesialis') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `nama`(`nama`) USING BTREE,
  INDEX `jm`(`jm`) USING BTREE,
  INDEX `jns`(`jns`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for master_triase_macam_kasus
-- ----------------------------
DROP TABLE IF EXISTS `master_triase_macam_kasus`;
CREATE TABLE `master_triase_macam_kasus`  (
  `kode_kasus` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `macam_kasus` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kode_kasus`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for master_triase_pemeriksaan
-- ----------------------------
DROP TABLE IF EXISTS `master_triase_pemeriksaan`;
CREATE TABLE `master_triase_pemeriksaan`  (
  `kode_pemeriksaan` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_pemeriksaan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_pemeriksaan`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for master_triase_skala1
-- ----------------------------
DROP TABLE IF EXISTS `master_triase_skala1`;
CREATE TABLE `master_triase_skala1`  (
  `kode_pemeriksaan` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_skala1` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pengkajian_skala1` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kode_skala1`) USING BTREE,
  INDEX `kode_pemeriksaan`(`kode_pemeriksaan`) USING BTREE,
  CONSTRAINT `master_triase_skala1_ibfk_1` FOREIGN KEY (`kode_pemeriksaan`) REFERENCES `master_triase_pemeriksaan` (`kode_pemeriksaan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for master_triase_skala2
-- ----------------------------
DROP TABLE IF EXISTS `master_triase_skala2`;
CREATE TABLE `master_triase_skala2`  (
  `kode_pemeriksaan` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_skala2` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pengkajian_skala2` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kode_skala2`) USING BTREE,
  INDEX `kode_pemeriksaan`(`kode_pemeriksaan`) USING BTREE,
  CONSTRAINT `master_triase_skala2_ibfk_1` FOREIGN KEY (`kode_pemeriksaan`) REFERENCES `master_triase_pemeriksaan` (`kode_pemeriksaan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for master_triase_skala3
-- ----------------------------
DROP TABLE IF EXISTS `master_triase_skala3`;
CREATE TABLE `master_triase_skala3`  (
  `kode_pemeriksaan` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_skala3` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pengkajian_skala3` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kode_skala3`) USING BTREE,
  INDEX `kode_pemeriksaan`(`kode_pemeriksaan`) USING BTREE,
  CONSTRAINT `master_triase_skala3_ibfk_1` FOREIGN KEY (`kode_pemeriksaan`) REFERENCES `master_triase_pemeriksaan` (`kode_pemeriksaan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for master_triase_skala4
-- ----------------------------
DROP TABLE IF EXISTS `master_triase_skala4`;
CREATE TABLE `master_triase_skala4`  (
  `kode_pemeriksaan` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_skala4` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pengkajian_skala4` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kode_skala4`) USING BTREE,
  INDEX `kode_pemeriksaan`(`kode_pemeriksaan`) USING BTREE,
  CONSTRAINT `master_triase_skala1_ibfk_4` FOREIGN KEY (`kode_pemeriksaan`) REFERENCES `master_triase_pemeriksaan` (`kode_pemeriksaan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for master_triase_skala5
-- ----------------------------
DROP TABLE IF EXISTS `master_triase_skala5`;
CREATE TABLE `master_triase_skala5`  (
  `kode_pemeriksaan` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_skala5` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pengkajian_skala5` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kode_skala5`) USING BTREE,
  INDEX `kode_pemeriksaan`(`kode_pemeriksaan`) USING BTREE,
  CONSTRAINT `master_triase_skala1_ibfk_5` FOREIGN KEY (`kode_pemeriksaan`) REFERENCES `master_triase_pemeriksaan` (`kode_pemeriksaan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for master_tunjangan_bulanan
-- ----------------------------
DROP TABLE IF EXISTS `master_tunjangan_bulanan`;
CREATE TABLE `master_tunjangan_bulanan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tnj` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `nama`(`nama`) USING BTREE,
  INDEX `tnj`(`tnj`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for master_tunjangan_harian
-- ----------------------------
DROP TABLE IF EXISTS `master_tunjangan_harian`;
CREATE TABLE `master_tunjangan_harian`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tnj` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `nama`(`nama`) USING BTREE,
  INDEX `tnj`(`tnj`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for matrik_akun_jns_perawatan
-- ----------------------------
DROP TABLE IF EXISTS `matrik_akun_jns_perawatan`;
CREATE TABLE `matrik_akun_jns_perawatan`  (
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pendapatan_tindakan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `beban_jasa_dokter` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `utang_jasa_dokter` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `beban_jasa_paramedis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `utang_jasa_paramedis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `beban_kso` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `utang_kso` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hpp_persediaan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `persediaan_bhp` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `beban_jasa_sarana` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `utang_jasa_sarana` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `beban_menejemen` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `utang_menejemen` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kd_jenis_prw`) USING BTREE,
  INDEX `beban_jasa_dokter`(`beban_jasa_dokter`) USING BTREE,
  INDEX `beban_jasa_paramedis`(`beban_jasa_paramedis`) USING BTREE,
  INDEX `beban_jasa_sarana`(`beban_jasa_sarana`) USING BTREE,
  INDEX `beban_kso`(`beban_kso`) USING BTREE,
  INDEX `beban_menejemen`(`beban_menejemen`) USING BTREE,
  INDEX `hpp_persediaan`(`hpp_persediaan`) USING BTREE,
  INDEX `pendapatan_tindakan`(`pendapatan_tindakan`) USING BTREE,
  INDEX `persediaan_bhp`(`persediaan_bhp`) USING BTREE,
  INDEX `utang_jasa_dokter`(`utang_jasa_dokter`) USING BTREE,
  INDEX `utang_jasa_paramedis`(`utang_jasa_paramedis`) USING BTREE,
  INDEX `utang_jasa_sarana`(`utang_jasa_sarana`) USING BTREE,
  INDEX `utang_kso`(`utang_kso`) USING BTREE,
  INDEX `utang_menejemen`(`utang_menejemen`) USING BTREE,
  CONSTRAINT `matrik_akun_jns_perawatan_ibfk_1` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matrik_akun_jns_perawatan_ibfk_10` FOREIGN KEY (`utang_jasa_dokter`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matrik_akun_jns_perawatan_ibfk_11` FOREIGN KEY (`utang_jasa_paramedis`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matrik_akun_jns_perawatan_ibfk_12` FOREIGN KEY (`utang_jasa_sarana`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matrik_akun_jns_perawatan_ibfk_13` FOREIGN KEY (`utang_kso`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matrik_akun_jns_perawatan_ibfk_14` FOREIGN KEY (`utang_menejemen`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matrik_akun_jns_perawatan_ibfk_2` FOREIGN KEY (`beban_jasa_dokter`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matrik_akun_jns_perawatan_ibfk_3` FOREIGN KEY (`beban_jasa_paramedis`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matrik_akun_jns_perawatan_ibfk_4` FOREIGN KEY (`beban_jasa_sarana`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matrik_akun_jns_perawatan_ibfk_5` FOREIGN KEY (`beban_kso`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matrik_akun_jns_perawatan_ibfk_6` FOREIGN KEY (`beban_menejemen`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matrik_akun_jns_perawatan_ibfk_7` FOREIGN KEY (`hpp_persediaan`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matrik_akun_jns_perawatan_ibfk_8` FOREIGN KEY (`pendapatan_tindakan`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matrik_akun_jns_perawatan_ibfk_9` FOREIGN KEY (`persediaan_bhp`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for matrik_akun_jns_perawatan_inap
-- ----------------------------
DROP TABLE IF EXISTS `matrik_akun_jns_perawatan_inap`;
CREATE TABLE `matrik_akun_jns_perawatan_inap`  (
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pendapatan_tindakan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `beban_jasa_dokter` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `utang_jasa_dokter` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `beban_jasa_paramedis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `utang_jasa_paramedis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `beban_kso` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `utang_kso` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hpp_persediaan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `persediaan_bhp` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `beban_jasa_sarana` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `utang_jasa_sarana` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `beban_menejemen` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `utang_menejemen` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kd_jenis_prw`) USING BTREE,
  INDEX `beban_jasa_dokter`(`beban_jasa_dokter`) USING BTREE,
  INDEX `beban_jasa_paramedis`(`beban_jasa_paramedis`) USING BTREE,
  INDEX `beban_jasa_sarana`(`beban_jasa_sarana`) USING BTREE,
  INDEX `beban_kso`(`beban_kso`) USING BTREE,
  INDEX `beban_menejemen`(`beban_menejemen`) USING BTREE,
  INDEX `hpp_persediaan`(`hpp_persediaan`) USING BTREE,
  INDEX `pendapatan_tindakan`(`pendapatan_tindakan`) USING BTREE,
  INDEX `persediaan_bhp`(`persediaan_bhp`) USING BTREE,
  INDEX `utang_jasa_dokter`(`utang_jasa_dokter`) USING BTREE,
  INDEX `utang_jasa_paramedis`(`utang_jasa_paramedis`) USING BTREE,
  INDEX `utang_jasa_sarana`(`utang_jasa_sarana`) USING BTREE,
  INDEX `utang_kso`(`utang_kso`) USING BTREE,
  INDEX `utang_menejemen`(`utang_menejemen`) USING BTREE,
  CONSTRAINT `matrik_akun_jns_perawatan_inap_ibfk_1` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_inap` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matrik_akun_jns_perawatan_inap_ibfk_10` FOREIGN KEY (`beban_kso`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matrik_akun_jns_perawatan_inap_ibfk_11` FOREIGN KEY (`beban_menejemen`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matrik_akun_jns_perawatan_inap_ibfk_12` FOREIGN KEY (`hpp_persediaan`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matrik_akun_jns_perawatan_inap_ibfk_13` FOREIGN KEY (`pendapatan_tindakan`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matrik_akun_jns_perawatan_inap_ibfk_14` FOREIGN KEY (`persediaan_bhp`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matrik_akun_jns_perawatan_inap_ibfk_2` FOREIGN KEY (`utang_jasa_dokter`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matrik_akun_jns_perawatan_inap_ibfk_3` FOREIGN KEY (`utang_jasa_paramedis`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matrik_akun_jns_perawatan_inap_ibfk_4` FOREIGN KEY (`utang_jasa_sarana`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matrik_akun_jns_perawatan_inap_ibfk_5` FOREIGN KEY (`utang_kso`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matrik_akun_jns_perawatan_inap_ibfk_6` FOREIGN KEY (`utang_menejemen`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matrik_akun_jns_perawatan_inap_ibfk_7` FOREIGN KEY (`beban_jasa_dokter`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matrik_akun_jns_perawatan_inap_ibfk_8` FOREIGN KEY (`beban_jasa_paramedis`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matrik_akun_jns_perawatan_inap_ibfk_9` FOREIGN KEY (`beban_jasa_sarana`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for metode_racik
-- ----------------------------
DROP TABLE IF EXISTS `metode_racik`;
CREATE TABLE `metode_racik`  (
  `kd_racik` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_racik` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd_racik`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for monitoring_asuhan_gizi
-- ----------------------------
DROP TABLE IF EXISTS `monitoring_asuhan_gizi`;
CREATE TABLE `monitoring_asuhan_gizi`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime(0) NOT NULL,
  `monitoring` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `evaluasi` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`, `tanggal`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `monitoring_asuhan_gizi_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `monitoring_asuhan_gizi_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mutasi_berkas
-- ----------------------------
DROP TABLE IF EXISTS `mutasi_berkas`;
CREATE TABLE `mutasi_berkas`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('Sudah Dikirim','Sudah Diterima','Sudah Kembali','Tidak Ada','Masuk Ranap') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dikirim` datetime(0) NULL DEFAULT NULL,
  `diterima` datetime(0) NULL DEFAULT NULL,
  `kembali` datetime(0) NULL DEFAULT NULL,
  `tidakada` datetime(0) NULL DEFAULT NULL,
  `ranap` datetime(0) NOT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  CONSTRAINT `mutasi_berkas_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mutasibarang
-- ----------------------------
DROP TABLE IF EXISTS `mutasibarang`;
CREATE TABLE `mutasibarang`  (
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jml` double NOT NULL,
  `harga` double NOT NULL,
  `kd_bangsaldari` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_bangsalke` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime(0) NOT NULL,
  `keterangan` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_batch` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kode_brng`, `kd_bangsaldari`, `kd_bangsalke`, `tanggal`, `no_batch`, `no_faktur`) USING BTREE,
  INDEX `kd_bangsaldari`(`kd_bangsaldari`) USING BTREE,
  INDEX `kd_bangsalke`(`kd_bangsalke`) USING BTREE,
  INDEX `jml`(`jml`) USING BTREE,
  INDEX `keterangan`(`keterangan`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  CONSTRAINT `mutasibarang_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mutasibarang_ibfk_2` FOREIGN KEY (`kd_bangsaldari`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mutasibarang_ibfk_3` FOREIGN KEY (`kd_bangsalke`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for nota_inap
-- ----------------------------
DROP TABLE IF EXISTS `nota_inap`;
CREATE TABLE `nota_inap`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `no_nota` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `jam` time(0) NULL DEFAULT NULL,
  `Uang_Muka` double NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  UNIQUE INDEX `no_nota`(`no_nota`) USING BTREE,
  INDEX `tanggal`(`tanggal`) USING BTREE,
  INDEX `jam`(`jam`) USING BTREE,
  INDEX `Uang_Muka`(`Uang_Muka`) USING BTREE,
  CONSTRAINT `nota_inap_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for nota_jalan
-- ----------------------------
DROP TABLE IF EXISTS `nota_jalan`;
CREATE TABLE `nota_jalan`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `no_nota` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `jam` time(0) NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  UNIQUE INDEX `no_nota`(`no_nota`) USING BTREE,
  INDEX `tanggal`(`tanggal`) USING BTREE,
  INDEX `jam`(`jam`) USING BTREE,
  CONSTRAINT `nota_jalan_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for obat_penyakit
-- ----------------------------
DROP TABLE IF EXISTS `obat_penyakit`;
CREATE TABLE `obat_penyakit`  (
  `kd_penyakit` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `referensi` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kd_penyakit`, `kode_brng`) USING BTREE,
  INDEX `kd_penyakit`(`kd_penyakit`) USING BTREE,
  INDEX `kd_obat`(`kode_brng`) USING BTREE,
  CONSTRAINT `obat_penyakit_ibfk_1` FOREIGN KEY (`kd_penyakit`) REFERENCES `penyakit` (`kd_penyakit`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `obat_penyakit_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for obat_racikan
-- ----------------------------
DROP TABLE IF EXISTS `obat_racikan`;
CREATE TABLE `obat_racikan`  (
  `tgl_perawatan` date NOT NULL,
  `jam` time(0) NOT NULL,
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_racik` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_racik` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_racik` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jml_dr` int(11) NOT NULL,
  `aturan_pakai` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`tgl_perawatan`, `jam`, `no_rawat`, `no_racik`) USING BTREE,
  INDEX `kd_racik`(`kd_racik`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `no_racik`(`no_racik`) USING BTREE,
  CONSTRAINT `obat_racikan_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `obat_racikan_ibfk_2` FOREIGN KEY (`kd_racik`) REFERENCES `metode_racik` (`kd_racik`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for obat_racikan_jual
-- ----------------------------
DROP TABLE IF EXISTS `obat_racikan_jual`;
CREATE TABLE `obat_racikan_jual`  (
  `nota_jual` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_racik` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_racik` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_racik` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jml_dr` int(11) NOT NULL,
  `aturan_pakai` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`nota_jual`, `no_racik`) USING BTREE,
  INDEX `kd_racik`(`kd_racik`) USING BTREE,
  CONSTRAINT `obat_racikan_jual_ibfk_1` FOREIGN KEY (`nota_jual`) REFERENCES `penjualan` (`nota_jual`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `obat_racikan_jual_ibfk_2` FOREIGN KEY (`kd_racik`) REFERENCES `metode_racik` (`kd_racik`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for obatbhp_ok
-- ----------------------------
DROP TABLE IF EXISTS `obatbhp_ok`;
CREATE TABLE `obatbhp_ok`  (
  `kd_obat` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_obat` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hargasatuan` double NOT NULL,
  PRIMARY KEY (`kd_obat`) USING BTREE,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  INDEX `nm_obat`(`nm_obat`) USING BTREE,
  INDEX `hargasatuan`(`hargasatuan`) USING BTREE,
  CONSTRAINT `obatbhp_ok_ibfk_1` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for operasi
-- ----------------------------
DROP TABLE IF EXISTS `operasi`;
CREATE TABLE `operasi`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_operasi` datetime(0) NOT NULL,
  `jenis_anasthesi` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kategori` enum('-','Khusus','Besar','Sedang','Kecil','Elektive','Emergency') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `operator1` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `operator2` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `operator3` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `asisten_operator1` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `asisten_operator2` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `asisten_operator3` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `instrumen` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dokter_anak` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `perawaat_resusitas` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dokter_anestesi` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `asisten_anestesi` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `asisten_anestesi2` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bidan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bidan2` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bidan3` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `perawat_luar` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `omloop` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `omloop2` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `omloop3` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `omloop4` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `omloop5` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dokter_pjanak` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dokter_umum` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_paket` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `biayaoperator1` double NOT NULL,
  `biayaoperator2` double NOT NULL,
  `biayaoperator3` double NOT NULL,
  `biayaasisten_operator1` double NOT NULL,
  `biayaasisten_operator2` double NOT NULL,
  `biayaasisten_operator3` double NULL DEFAULT NULL,
  `biayainstrumen` double NULL DEFAULT NULL,
  `biayadokter_anak` double NOT NULL,
  `biayaperawaat_resusitas` double NOT NULL,
  `biayadokter_anestesi` double NOT NULL,
  `biayaasisten_anestesi` double NOT NULL,
  `biayaasisten_anestesi2` double NULL DEFAULT NULL,
  `biayabidan` double NOT NULL,
  `biayabidan2` double NULL DEFAULT NULL,
  `biayabidan3` double NULL DEFAULT NULL,
  `biayaperawat_luar` double NOT NULL,
  `biayaalat` double NOT NULL,
  `biayasewaok` double NOT NULL,
  `akomodasi` double NULL DEFAULT NULL,
  `bagian_rs` double NOT NULL,
  `biaya_omloop` double NULL DEFAULT NULL,
  `biaya_omloop2` double NULL DEFAULT NULL,
  `biaya_omloop3` double NULL DEFAULT NULL,
  `biaya_omloop4` double NULL DEFAULT NULL,
  `biaya_omloop5` double NULL DEFAULT NULL,
  `biayasarpras` double NULL DEFAULT NULL,
  `biaya_dokter_pjanak` double NULL DEFAULT NULL,
  `biaya_dokter_umum` double NULL DEFAULT NULL,
  `status` enum('Ranap','Ralan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`, `tgl_operasi`, `kode_paket`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `operator1`(`operator1`) USING BTREE,
  INDEX `operator2`(`operator2`) USING BTREE,
  INDEX `operator3`(`operator3`) USING BTREE,
  INDEX `asisten_operator1`(`asisten_operator1`) USING BTREE,
  INDEX `asisten_operator2`(`asisten_operator2`) USING BTREE,
  INDEX `asisten_operator3`(`instrumen`) USING BTREE,
  INDEX `dokter_anak`(`dokter_anak`) USING BTREE,
  INDEX `perawaat_resusitas`(`perawaat_resusitas`) USING BTREE,
  INDEX `dokter_anestesi`(`dokter_anestesi`) USING BTREE,
  INDEX `asisten_anestesi`(`asisten_anestesi`) USING BTREE,
  INDEX `bidan`(`bidan`) USING BTREE,
  INDEX `perawat_luar`(`perawat_luar`) USING BTREE,
  INDEX `kode_paket`(`kode_paket`) USING BTREE,
  INDEX `operasi_ibfk_45`(`bidan2`) USING BTREE,
  INDEX `operasi_ibfk_46`(`bidan3`) USING BTREE,
  INDEX `operasi_ibfk_47`(`omloop`) USING BTREE,
  INDEX `operasi_ibfk_48`(`omloop2`) USING BTREE,
  INDEX `operasi_ibfk_49`(`omloop3`) USING BTREE,
  INDEX `dokter_pjanak`(`dokter_pjanak`) USING BTREE,
  INDEX `dokter_umum`(`dokter_umum`) USING BTREE,
  INDEX `asisten_operator3_2`(`asisten_operator3`) USING BTREE,
  INDEX `asisten_anestesi2`(`asisten_anestesi2`) USING BTREE,
  INDEX `omloop4`(`omloop4`) USING BTREE,
  INDEX `omloop5`(`omloop5`) USING BTREE,
  CONSTRAINT `operasi_ibfk_31` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `operasi_ibfk_32` FOREIGN KEY (`operator1`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operasi_ibfk_33` FOREIGN KEY (`operator2`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operasi_ibfk_34` FOREIGN KEY (`operator3`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operasi_ibfk_35` FOREIGN KEY (`asisten_operator1`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operasi_ibfk_36` FOREIGN KEY (`asisten_operator2`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operasi_ibfk_37` FOREIGN KEY (`instrumen`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operasi_ibfk_38` FOREIGN KEY (`dokter_anak`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operasi_ibfk_39` FOREIGN KEY (`perawaat_resusitas`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operasi_ibfk_40` FOREIGN KEY (`dokter_anestesi`) REFERENCES `dokter` (`kd_dokter`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `operasi_ibfk_41` FOREIGN KEY (`asisten_anestesi`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operasi_ibfk_42` FOREIGN KEY (`bidan`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operasi_ibfk_43` FOREIGN KEY (`perawat_luar`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operasi_ibfk_44` FOREIGN KEY (`kode_paket`) REFERENCES `paket_operasi` (`kode_paket`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operasi_ibfk_45` FOREIGN KEY (`bidan2`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operasi_ibfk_46` FOREIGN KEY (`bidan3`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operasi_ibfk_47` FOREIGN KEY (`omloop`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operasi_ibfk_48` FOREIGN KEY (`omloop2`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operasi_ibfk_49` FOREIGN KEY (`omloop3`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operasi_ibfk_50` FOREIGN KEY (`dokter_pjanak`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operasi_ibfk_51` FOREIGN KEY (`dokter_umum`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operasi_ibfk_52` FOREIGN KEY (`asisten_operator3`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operasi_ibfk_53` FOREIGN KEY (`asisten_anestesi2`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operasi_ibfk_54` FOREIGN KEY (`omloop4`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operasi_ibfk_55` FOREIGN KEY (`omloop5`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for opname
-- ----------------------------
DROP TABLE IF EXISTS `opname`;
CREATE TABLE `opname`  (
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `h_beli` double NULL DEFAULT NULL,
  `tanggal` date NOT NULL,
  `stok` double NOT NULL,
  `real` double NOT NULL,
  `selisih` double NOT NULL,
  `nomihilang` double NOT NULL,
  `lebih` double NOT NULL,
  `nomilebih` double NOT NULL,
  `keterangan` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_bangsal` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_batch` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kode_brng`, `tanggal`, `kd_bangsal`, `no_batch`, `no_faktur`) USING BTREE,
  INDEX `kd_bangsal`(`kd_bangsal`) USING BTREE,
  INDEX `stok`(`stok`) USING BTREE,
  INDEX `real`(`real`) USING BTREE,
  INDEX `selisih`(`selisih`) USING BTREE,
  INDEX `nomihilang`(`nomihilang`) USING BTREE,
  INDEX `keterangan`(`keterangan`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  CONSTRAINT `opname_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `opname_ibfk_2` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for paket_operasi
-- ----------------------------
DROP TABLE IF EXISTS `paket_operasi`;
CREATE TABLE `paket_operasi`  (
  `kode_paket` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_perawatan` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kategori` enum('Kebidanan','Operasi') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `operator1` double NOT NULL,
  `operator2` double NOT NULL,
  `operator3` double NOT NULL,
  `asisten_operator1` double NULL DEFAULT NULL,
  `asisten_operator2` double NOT NULL,
  `asisten_operator3` double NULL DEFAULT NULL,
  `instrumen` double NULL DEFAULT NULL,
  `dokter_anak` double NOT NULL,
  `perawaat_resusitas` double NOT NULL,
  `dokter_anestesi` double NOT NULL,
  `asisten_anestesi` double NOT NULL,
  `asisten_anestesi2` double NULL DEFAULT NULL,
  `bidan` double NOT NULL,
  `bidan2` double NULL DEFAULT NULL,
  `bidan3` double NULL DEFAULT NULL,
  `perawat_luar` double NOT NULL,
  `sewa_ok` double NOT NULL,
  `alat` double NOT NULL,
  `akomodasi` double NULL DEFAULT NULL,
  `bagian_rs` double NOT NULL,
  `omloop` double NOT NULL,
  `omloop2` double NULL DEFAULT NULL,
  `omloop3` double NULL DEFAULT NULL,
  `omloop4` double NULL DEFAULT NULL,
  `omloop5` double NULL DEFAULT NULL,
  `sarpras` double NULL DEFAULT NULL,
  `dokter_pjanak` double NULL DEFAULT NULL,
  `dokter_umum` double NULL DEFAULT NULL,
  `kd_pj` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kelas` enum('-','Rawat Jalan','Kelas 1','Kelas 2','Kelas 3','Kelas Utama','Kelas VIP','Kelas VVIP') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_paket`) USING BTREE,
  INDEX `nm_perawatan`(`nm_perawatan`) USING BTREE,
  INDEX `operator1`(`operator1`) USING BTREE,
  INDEX `operator2`(`operator2`) USING BTREE,
  INDEX `operator3`(`operator3`) USING BTREE,
  INDEX `asisten_operator1`(`asisten_operator1`) USING BTREE,
  INDEX `asisten_operator2`(`asisten_operator2`) USING BTREE,
  INDEX `asisten_operator3`(`instrumen`) USING BTREE,
  INDEX `dokter_anak`(`dokter_anak`) USING BTREE,
  INDEX `perawat_resusitas`(`perawaat_resusitas`) USING BTREE,
  INDEX `dokter_anestasi`(`dokter_anestesi`) USING BTREE,
  INDEX `asisten_anastesi`(`asisten_anestesi`) USING BTREE,
  INDEX `bidan`(`bidan`) USING BTREE,
  INDEX `perawat_luar`(`perawat_luar`) USING BTREE,
  INDEX `sewa_ok`(`sewa_ok`) USING BTREE,
  INDEX `alat`(`alat`) USING BTREE,
  INDEX `sewa_vk`(`akomodasi`) USING BTREE,
  INDEX `bagian_rs`(`bagian_rs`) USING BTREE,
  INDEX `omloop`(`omloop`) USING BTREE,
  INDEX `kd_pj`(`kd_pj`) USING BTREE,
  INDEX `asisten_anestesi2`(`asisten_anestesi2`) USING BTREE,
  INDEX `omloop2`(`omloop2`) USING BTREE,
  INDEX `omloop3`(`omloop3`) USING BTREE,
  INDEX `omloop4`(`omloop4`) USING BTREE,
  INDEX `omloop5`(`omloop5`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `kategori`(`kategori`) USING BTREE,
  INDEX `bidan2`(`bidan2`) USING BTREE,
  INDEX `bidan3`(`bidan3`) USING BTREE,
  INDEX `asisten_operator3_2`(`asisten_operator3`) USING BTREE,
  CONSTRAINT `paket_operasi_ibfk_1` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pangkat_polri
-- ----------------------------
DROP TABLE IF EXISTS `pangkat_polri`;
CREATE TABLE `pangkat_polri`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pangkat` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pangkat_tni
-- ----------------------------
DROP TABLE IF EXISTS `pangkat_tni`;
CREATE TABLE `pangkat_tni`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pangkat` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for parkir
-- ----------------------------
DROP TABLE IF EXISTS `parkir`;
CREATE TABLE `parkir`  (
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nomer_kartu` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_parkir` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_kendaraan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tgl_masuk` date NOT NULL DEFAULT '0000-00-00',
  `jam_masuk` time(0) NOT NULL DEFAULT '00:00:00',
  `tgl_keluar` date NULL DEFAULT NULL,
  `jam_keluar` time(0) NULL DEFAULT NULL,
  `lama_parkir` int(11) NULL DEFAULT NULL,
  `ttl_biaya` double NULL DEFAULT NULL,
  PRIMARY KEY (`no_kendaraan`, `tgl_masuk`, `jam_masuk`) USING BTREE,
  INDEX `kd_barcode`(`nomer_kartu`) USING BTREE,
  INDEX `kd_petugas`(`nip`) USING BTREE,
  INDEX `kd_parkir`(`kd_parkir`) USING BTREE,
  CONSTRAINT `parkir_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `parkir_ibfk_2` FOREIGN KEY (`kd_parkir`) REFERENCES `parkir_jenis` (`kd_parkir`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for parkir_barcode
-- ----------------------------
DROP TABLE IF EXISTS `parkir_barcode`;
CREATE TABLE `parkir_barcode`  (
  `kode_barcode` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nomer_kartu` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kode_barcode`) USING BTREE,
  UNIQUE INDEX `no_card`(`nomer_kartu`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for parkir_jenis
-- ----------------------------
DROP TABLE IF EXISTS `parkir_jenis`;
CREATE TABLE `parkir_jenis`  (
  `kd_parkir` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jns_parkir` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `biaya` double NOT NULL,
  `jenis` enum('Harian','Jam') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd_parkir`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pasien
-- ----------------------------
DROP TABLE IF EXISTS `pasien`;
CREATE TABLE `pasien`  (
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_pasien` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_ktp` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jk` enum('L','P') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tmp_lahir` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_lahir` date NULL DEFAULT NULL,
  `nm_ibu` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alamat` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `gol_darah` enum('A','B','O','AB','-') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pekerjaan` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `stts_nikah` enum('BELUM MENIKAH','MENIKAH','JANDA','DUDHA','JOMBLO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `agama` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_daftar` date NULL DEFAULT NULL,
  `no_tlp` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `umur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pnd` enum('TS','TK','SD','SMP','SMA','SLTA/SEDERAJAT','D1','D2','D3','D4','S1','S2','S3','-') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keluarga` enum('AYAH','IBU','ISTRI','SUAMI','SAUDARA','ANAK') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `namakeluarga` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_pj` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_peserta` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_kel` int(11) NOT NULL,
  `kd_kec` int(11) NOT NULL,
  `kd_kab` int(11) NOT NULL,
  `pekerjaanpj` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alamatpj` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kelurahanpj` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kecamatanpj` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kabupatenpj` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `perusahaan_pasien` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `suku_bangsa` int(11) NOT NULL,
  `bahasa_pasien` int(11) NOT NULL,
  `cacat_fisik` int(11) NOT NULL,
  `email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nip` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_prop` int(11) NOT NULL,
  `propinsipj` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rkm_medis`) USING BTREE,
  INDEX `kd_pj`(`kd_pj`) USING BTREE,
  INDEX `kd_kec`(`kd_kec`) USING BTREE,
  INDEX `kd_kab`(`kd_kab`) USING BTREE,
  INDEX `nm_pasien`(`nm_pasien`) USING BTREE,
  INDEX `alamat`(`alamat`) USING BTREE,
  INDEX `kd_kel_2`(`kd_kel`) USING BTREE,
  INDEX `no_ktp`(`no_ktp`) USING BTREE,
  INDEX `no_peserta`(`no_peserta`) USING BTREE,
  INDEX `perusahaan_pasien`(`perusahaan_pasien`) USING BTREE,
  INDEX `suku_bangsa`(`suku_bangsa`) USING BTREE,
  INDEX `bahasa_pasien`(`bahasa_pasien`) USING BTREE,
  INDEX `cacat_fisik`(`cacat_fisik`) USING BTREE,
  INDEX `kd_prop`(`kd_prop`) USING BTREE,
  CONSTRAINT `pasien_ibfk_1` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pasien_ibfk_2` FOREIGN KEY (`kd_kel`) REFERENCES `kelurahan` (`kd_kel`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pasien_ibfk_3` FOREIGN KEY (`kd_kec`) REFERENCES `kecamatan` (`kd_kec`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pasien_ibfk_4` FOREIGN KEY (`kd_kab`) REFERENCES `kabupaten` (`kd_kab`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pasien_ibfk_5` FOREIGN KEY (`perusahaan_pasien`) REFERENCES `perusahaan_pasien` (`kode_perusahaan`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pasien_ibfk_6` FOREIGN KEY (`suku_bangsa`) REFERENCES `suku_bangsa` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pasien_ibfk_7` FOREIGN KEY (`bahasa_pasien`) REFERENCES `bahasa_pasien` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pasien_ibfk_8` FOREIGN KEY (`cacat_fisik`) REFERENCES `cacat_fisik` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pasien_ibfk_9` FOREIGN KEY (`kd_prop`) REFERENCES `propinsi` (`kd_prop`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pasien_bayi
-- ----------------------------
DROP TABLE IF EXISTS `pasien_bayi`;
CREATE TABLE `pasien_bayi`  (
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `umur_ibu` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_ayah` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `umur_ayah` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `berat_badan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `panjang_badan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lingkar_kepala` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `proses_lahir` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `anakke` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jam_lahir` time(0) NOT NULL,
  `keterangan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `diagnosa` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penyulit_kehamilan` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ketuban` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lingkar_perut` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lingkar_dada` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penolong` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_skl` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ktp_ayah` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ktp_ibu` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_bayi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rkm_medis`) USING BTREE,
  UNIQUE INDEX `no_skl`(`no_skl`) USING BTREE,
  INDEX `umur_ibu`(`umur_ibu`) USING BTREE,
  INDEX `umur_ayah`(`umur_ayah`) USING BTREE,
  INDEX `berat_badan`(`berat_badan`) USING BTREE,
  INDEX `panjang_badan`(`panjang_badan`) USING BTREE,
  INDEX `lingkar_kepala`(`lingkar_kepala`) USING BTREE,
  INDEX `proses_lahir`(`proses_lahir`) USING BTREE,
  INDEX `anakke`(`anakke`) USING BTREE,
  INDEX `jam_lahir`(`jam_lahir`) USING BTREE,
  INDEX `keterangan`(`keterangan`) USING BTREE,
  INDEX `penolong`(`penolong`) USING BTREE,
  CONSTRAINT `pasien_bayi_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pasien_bayi_ibfk_2` FOREIGN KEY (`penolong`) REFERENCES `pegawai` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pasien_corona
-- ----------------------------
DROP TABLE IF EXISTS `pasien_corona`;
CREATE TABLE `pasien_corona`  (
  `no_pengenal` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `inisial` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_lengkap` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_masuk` date NULL DEFAULT NULL,
  `kode_jk` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_jk` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_lahir` date NULL DEFAULT NULL,
  `kode_kewarganegaraan` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_kewarganegaraan` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_penularan` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sumber_penularan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_kelurahan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nm_kelurahan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_kecamatan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nm_kecamatan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_kabupaten` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nm_kabupaten` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_propinsi` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nm_propinsi` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_keluar` date NULL DEFAULT NULL,
  `kode_statuskeluar` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_statuskeluar` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_lapor` datetime(0) NULL DEFAULT NULL,
  `kode_statusrawat` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_statusrawat` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_statusisolasi` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_statusisolasi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `notelp` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sebab_kematian` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_jenis_pasien` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_jenis_pasien` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rkm_medis`) USING BTREE,
  CONSTRAINT `pasien_corona_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pasien_mati
-- ----------------------------
DROP TABLE IF EXISTS `pasien_mati`;
CREATE TABLE `pasien_mati`  (
  `tanggal` date NULL DEFAULT NULL,
  `jam` time(0) NULL DEFAULT NULL,
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `keterangan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `temp_meninggal` enum('-','Rumah Sakit','Puskesmas','Rumah Bersalin','Rumah Tempat Tinggal','Lain-lain (Termasuk Doa)','Tidak tahu') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `icd1` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `icd2` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `icd3` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `icd4` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rkm_medis`) USING BTREE,
  CONSTRAINT `pasien_mati_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pasien_polri
-- ----------------------------
DROP TABLE IF EXISTS `pasien_polri`;
CREATE TABLE `pasien_polri`  (
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `golongan_polri` int(11) NOT NULL,
  `pangkat_polri` int(11) NOT NULL,
  `satuan_polri` int(11) NOT NULL,
  `jabatan_polri` int(11) NOT NULL,
  PRIMARY KEY (`no_rkm_medis`) USING BTREE,
  INDEX `golongan_polri`(`golongan_polri`) USING BTREE,
  INDEX `pangkat_polri`(`pangkat_polri`) USING BTREE,
  INDEX `satuan_polri`(`satuan_polri`) USING BTREE,
  INDEX `jabatan`(`jabatan_polri`) USING BTREE,
  CONSTRAINT `pasien_polri_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pasien_polri_ibfk_2` FOREIGN KEY (`golongan_polri`) REFERENCES `golongan_polri` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pasien_polri_ibfk_3` FOREIGN KEY (`pangkat_polri`) REFERENCES `pangkat_polri` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pasien_polri_ibfk_4` FOREIGN KEY (`satuan_polri`) REFERENCES `satuan_polri` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pasien_polri_ibfk_5` FOREIGN KEY (`jabatan_polri`) REFERENCES `jabatan_polri` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pasien_tni
-- ----------------------------
DROP TABLE IF EXISTS `pasien_tni`;
CREATE TABLE `pasien_tni`  (
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `golongan_tni` int(11) NOT NULL,
  `pangkat_tni` int(11) NOT NULL,
  `satuan_tni` int(11) NOT NULL,
  `jabatan_tni` int(11) NOT NULL,
  PRIMARY KEY (`no_rkm_medis`) USING BTREE,
  INDEX `golongan_tni`(`golongan_tni`) USING BTREE,
  INDEX `pangkat_tni`(`pangkat_tni`) USING BTREE,
  INDEX `satuan_tni`(`satuan_tni`) USING BTREE,
  INDEX `jabatan`(`jabatan_tni`) USING BTREE,
  CONSTRAINT `pasien_tni_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pasien_tni_ibfk_2` FOREIGN KEY (`golongan_tni`) REFERENCES `golongan_tni` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pasien_tni_ibfk_3` FOREIGN KEY (`pangkat_tni`) REFERENCES `pangkat_tni` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pasien_tni_ibfk_4` FOREIGN KEY (`satuan_tni`) REFERENCES `satuan_tni` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pasien_tni_ibfk_5` FOREIGN KEY (`jabatan_tni`) REFERENCES `jabatan_tni` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for password_asuransi
-- ----------------------------
DROP TABLE IF EXISTS `password_asuransi`;
CREATE TABLE `password_asuransi`  (
  `kd_pj` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `usere` varchar(700) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `passworde` varchar(700) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kd_pj`) USING BTREE,
  UNIQUE INDEX `usere`(`usere`, `passworde`) USING BTREE,
  CONSTRAINT `password_asuransi_ibfk_1` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pcare_kegiatan_kelompok
-- ----------------------------
DROP TABLE IF EXISTS `pcare_kegiatan_kelompok`;
CREATE TABLE `pcare_kegiatan_kelompok`  (
  `eduId` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `clubId` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `namaClub` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tglPelayanan` date NULL DEFAULT NULL,
  `nmKegiatan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nmKelompok` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `materi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pembicara` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lokasi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keterangan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `biaya` double NULL DEFAULT NULL,
  PRIMARY KEY (`eduId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pcare_kunjungan_umum
-- ----------------------------
DROP TABLE IF EXISTS `pcare_kunjungan_umum`;
CREATE TABLE `pcare_kunjungan_umum`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `noKunjungan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tglDaftar` date NULL DEFAULT NULL,
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nm_pasien` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `noKartu` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kdPoli` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nmPoli` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keluhan` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kdSadar` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nmSadar` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sistole` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `diastole` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `beratBadan` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tinggiBadan` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `respRate` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `heartRate` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `terapi` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kdStatusPulang` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nmStatusPulang` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tglPulang` date NULL DEFAULT NULL,
  `kdDokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nmDokter` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kdDiag1` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nmDiag1` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kdDiag2` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nmDiag2` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kdDiag3` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nmDiag3` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` enum('Terkirim','Gagal') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  CONSTRAINT `pcare_kunjungan_umum_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pcare_obat_diberikan
-- ----------------------------
DROP TABLE IF EXISTS `pcare_obat_diberikan`;
CREATE TABLE `pcare_obat_diberikan`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `noKunjungan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kdObatSK` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_perawatan` date NOT NULL,
  `jam` time(0) NOT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_batch` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `noKunjungan`, `tgl_perawatan`, `jam`, `kode_brng`, `no_batch`, `no_faktur`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  CONSTRAINT `pcare_obat_diberikan_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pcare_obat_diberikan_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `maping_obat_pcare` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pcare_pendaftaran
-- ----------------------------
DROP TABLE IF EXISTS `pcare_pendaftaran`;
CREATE TABLE `pcare_pendaftaran`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tglDaftar` date NOT NULL,
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_pasien` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kdProviderPeserta` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `noKartu` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kdPoli` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nmPoli` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keluhan` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kunjSakit` enum('Kunjungan Sakit','Kunjungan Sehat') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sistole` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `diastole` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `beratBadan` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tinggiBadan` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `respRate` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `heartRate` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rujukBalik` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kdTkp` enum('10 Rawat Jalan','20 Rawat Inap','50 Promotif Preventif') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `noUrut` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('Terkirim','Gagal') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  CONSTRAINT `pcare_pendaftaran_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pcare_peserta_kegiatan_kelompok
-- ----------------------------
DROP TABLE IF EXISTS `pcare_peserta_kegiatan_kelompok`;
CREATE TABLE `pcare_peserta_kegiatan_kelompok`  (
  `eduId` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`eduId`, `no_rkm_medis`) USING BTREE,
  INDEX `no_rkm_medis`(`no_rkm_medis`) USING BTREE,
  CONSTRAINT `pcare_peserta_kegiatan_kelompok_ibfk_1` FOREIGN KEY (`eduId`) REFERENCES `pcare_kegiatan_kelompok` (`eduId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pcare_peserta_kegiatan_kelompok_ibfk_2` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pcare_tindakan_ralan_diberikan
-- ----------------------------
DROP TABLE IF EXISTS `pcare_tindakan_ralan_diberikan`;
CREATE TABLE `pcare_tindakan_ralan_diberikan`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `noKunjungan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kdTindakanSK` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_perawatan` date NOT NULL,
  `jam` time(0) NOT NULL,
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `material` double NOT NULL,
  `bhp` double NOT NULL,
  `tarif_tindakandr` double NOT NULL,
  `tarif_tindakanpr` double NOT NULL,
  `kso` double NOT NULL,
  `menejemen` double NOT NULL,
  `biaya_rawat` double NOT NULL,
  PRIMARY KEY (`no_rawat`, `noKunjungan`, `tgl_perawatan`, `jam`, `kd_jenis_prw`) USING BTREE,
  INDEX `kd_jenis_prw`(`kd_jenis_prw`) USING BTREE,
  CONSTRAINT `pcare_tindakan_ralan_diberikan_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pcare_tindakan_ralan_diberikan_ibfk_2` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `maping_tindakan_pcare` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pcare_tindakan_ranap_diberikan
-- ----------------------------
DROP TABLE IF EXISTS `pcare_tindakan_ranap_diberikan`;
CREATE TABLE `pcare_tindakan_ranap_diberikan`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `noKunjungan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kdTindakanSK` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_perawatan` date NOT NULL,
  `jam` time(0) NOT NULL,
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `material` double NOT NULL,
  `bhp` double NOT NULL,
  `tarif_tindakandr` double NOT NULL,
  `tarif_tindakanpr` double NOT NULL,
  `kso` double NOT NULL,
  `menejemen` double NOT NULL,
  `biaya_rawat` double NOT NULL,
  PRIMARY KEY (`no_rawat`, `noKunjungan`, `tgl_perawatan`, `jam`, `kd_jenis_prw`) USING BTREE,
  INDEX `kd_jenis_prw`(`kd_jenis_prw`) USING BTREE,
  CONSTRAINT `pcare_tindakan_ranap_diberikan_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pcare_tindakan_ranap_diberikan_ibfk_2` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `maping_tindakan_ranap_pcare` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pegawai
-- ----------------------------
DROP TABLE IF EXISTS `pegawai`;
CREATE TABLE `pegawai`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nik` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jk` enum('Pria','Wanita') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jbtn` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jnj_jabatan` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_kelompok` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_resiko` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_emergency` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `departemen` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bidang` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `stts_wp` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `stts_kerja` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `npwp` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pendidikan` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `gapok` double NOT NULL,
  `tmp_lahir` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kota` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mulai_kerja` date NOT NULL,
  `ms_kerja` enum('<1','PT','FT>1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `indexins` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bpd` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rekening` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `stts_aktif` enum('AKTIF','CUTI','KELUAR','TENAGA LUAR') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `wajibmasuk` tinyint(2) NOT NULL,
  `pengurang` double NOT NULL,
  `indek` tinyint(4) NOT NULL,
  `mulai_kontrak` date NULL DEFAULT NULL,
  `cuti_diambil` int(11) NOT NULL,
  `dankes` double NOT NULL,
  `photo` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_ktp` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `nik_2`(`nik`) USING BTREE,
  INDEX `departemen`(`departemen`) USING BTREE,
  INDEX `bidang`(`bidang`) USING BTREE,
  INDEX `stts_wp`(`stts_wp`) USING BTREE,
  INDEX `stts_kerja`(`stts_kerja`) USING BTREE,
  INDEX `pendidikan`(`pendidikan`) USING BTREE,
  INDEX `indexins`(`indexins`) USING BTREE,
  INDEX `jnj_jabatan`(`jnj_jabatan`) USING BTREE,
  INDEX `bpd`(`bpd`) USING BTREE,
  INDEX `nama`(`nama`) USING BTREE,
  INDEX `jbtn`(`jbtn`) USING BTREE,
  INDEX `npwp`(`npwp`) USING BTREE,
  INDEX `dankes`(`dankes`) USING BTREE,
  INDEX `cuti_diambil`(`cuti_diambil`) USING BTREE,
  INDEX `mulai_kontrak`(`mulai_kontrak`) USING BTREE,
  INDEX `stts_aktif`(`stts_aktif`) USING BTREE,
  INDEX `tmp_lahir`(`tmp_lahir`) USING BTREE,
  INDEX `alamat`(`alamat`) USING BTREE,
  INDEX `mulai_kerja`(`mulai_kerja`) USING BTREE,
  INDEX `gapok`(`gapok`) USING BTREE,
  INDEX `kota`(`kota`) USING BTREE,
  INDEX `pengurang`(`pengurang`) USING BTREE,
  INDEX `indek`(`indek`) USING BTREE,
  INDEX `jk`(`jk`) USING BTREE,
  INDEX `ms_kerja`(`ms_kerja`) USING BTREE,
  INDEX `tgl_lahir`(`tgl_lahir`) USING BTREE,
  INDEX `rekening`(`rekening`) USING BTREE,
  INDEX `wajibmasuk`(`wajibmasuk`) USING BTREE,
  INDEX `kode_emergency`(`kode_emergency`) USING BTREE,
  INDEX `kode_kelompok`(`kode_kelompok`) USING BTREE,
  INDEX `kode_resiko`(`kode_resiko`) USING BTREE,
  CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`jnj_jabatan`) REFERENCES `jnj_jabatan` (`kode`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pegawai_ibfk_10` FOREIGN KEY (`kode_kelompok`) REFERENCES `kelompok_jabatan` (`kode_kelompok`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pegawai_ibfk_11` FOREIGN KEY (`kode_resiko`) REFERENCES `resiko_kerja` (`kode_resiko`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pegawai_ibfk_2` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`dep_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pegawai_ibfk_3` FOREIGN KEY (`bidang`) REFERENCES `bidang` (`nama`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pegawai_ibfk_4` FOREIGN KEY (`stts_wp`) REFERENCES `stts_wp` (`stts`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pegawai_ibfk_5` FOREIGN KEY (`stts_kerja`) REFERENCES `stts_kerja` (`stts`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pegawai_ibfk_6` FOREIGN KEY (`pendidikan`) REFERENCES `pendidikan` (`tingkat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pegawai_ibfk_7` FOREIGN KEY (`indexins`) REFERENCES `departemen` (`dep_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pegawai_ibfk_8` FOREIGN KEY (`bpd`) REFERENCES `bank` (`namabank`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pegawai_ibfk_9` FOREIGN KEY (`kode_emergency`) REFERENCES `emergency_index` (`kode_emergency`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pemasukan_lain
-- ----------------------------
DROP TABLE IF EXISTS `pemasukan_lain`;
CREATE TABLE `pemasukan_lain`  (
  `no_masuk` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `kode_kategori` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `besar` double NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keterangan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keperluan` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_masuk`) USING BTREE,
  INDEX `pemasukan_lain_ibfk_2`(`kode_kategori`) USING BTREE,
  INDEX `pemasukan_lain_ibfk_1`(`nip`) USING BTREE,
  CONSTRAINT `pemasukan_lain_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pemasukan_lain_ibfk_2` FOREIGN KEY (`kode_kategori`) REFERENCES `kategori_pemasukan_lain` (`kode_kategori`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pembagian_akte
-- ----------------------------
DROP TABLE IF EXISTS `pembagian_akte`;
CREATE TABLE `pembagian_akte`  (
  `id` int(11) NOT NULL,
  `persen` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `pembagian_akte_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pembagian_resume
-- ----------------------------
DROP TABLE IF EXISTS `pembagian_resume`;
CREATE TABLE `pembagian_resume`  (
  `id` int(11) NOT NULL,
  `persen` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `pembagian_resume_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pembagian_tuslah
-- ----------------------------
DROP TABLE IF EXISTS `pembagian_tuslah`;
CREATE TABLE `pembagian_tuslah`  (
  `id` int(11) NOT NULL,
  `persen` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `pembagian_tuslah_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pembagian_warung
-- ----------------------------
DROP TABLE IF EXISTS `pembagian_warung`;
CREATE TABLE `pembagian_warung`  (
  `id` int(11) NOT NULL,
  `persen` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `pembagian_warung_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pembelian
-- ----------------------------
DROP TABLE IF EXISTS `pembelian`;
CREATE TABLE `pembelian`  (
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_suplier` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_beli` date NULL DEFAULT NULL,
  `total1` double NOT NULL,
  `potongan` double NOT NULL,
  `total2` double NOT NULL,
  `ppn` double NOT NULL,
  `tagihan` double NOT NULL,
  `kd_bangsal` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_rek` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_faktur`) USING BTREE,
  INDEX `kode_suplier`(`kode_suplier`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  INDEX `kd_bangsal`(`kd_bangsal`) USING BTREE,
  INDEX `pembelian_ibfk_4`(`kd_rek`) USING BTREE,
  CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`kode_suplier`) REFERENCES `datasuplier` (`kode_suplier`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pembelian_ibfk_3` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pembelian_ibfk_4` FOREIGN KEY (`kd_rek`) REFERENCES `akun_bayar` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pemberihibah
-- ----------------------------
DROP TABLE IF EXISTS `pemberihibah`;
CREATE TABLE `pemberihibah`  (
  `kode_pemberi` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_pemberi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alamat` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kota` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_telp` varchar(13) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_pemberi`) USING BTREE,
  INDEX `nama_suplier`(`nama_pemberi`) USING BTREE,
  INDEX `alamat`(`alamat`) USING BTREE,
  INDEX `kota`(`kota`) USING BTREE,
  INDEX `no_telp`(`no_telp`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pemeliharaan_inventaris
-- ----------------------------
DROP TABLE IF EXISTS `pemeliharaan_inventaris`;
CREATE TABLE `pemeliharaan_inventaris`  (
  `no_inventaris` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` date NOT NULL,
  `uraian_kegiatan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pelaksana` enum('Teknisi Rumah Sakit','Teknisi Rujukan','Pihak ke III') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `biaya` double NOT NULL,
  `jenis_pemeliharaan` enum('Running Maintenance','Shut Down Maintenance','Emergency Maintenance') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_inventaris`, `tanggal`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `pemeliharaan_inventaris_ibfk_1` FOREIGN KEY (`no_inventaris`) REFERENCES `inventaris` (`no_inventaris`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pemeliharaan_inventaris_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pemeriksaan_ginekologi_ralan
-- ----------------------------
DROP TABLE IF EXISTS `pemeriksaan_ginekologi_ralan`;
CREATE TABLE `pemeriksaan_ginekologi_ralan`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_perawatan` date NOT NULL,
  `jam_rawat` time(0) NOT NULL,
  `inspeksi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `inspeksi_vulva` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `inspekulo_gine` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fluxus_gine` enum('+','-') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fluor_gine` enum('+','-') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `vulva_inspekulo` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `portio_inspekulo` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sondage` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `portio_dalam` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bentuk` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cavum_uteri` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mobilitas` enum('+','-') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ukuran` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nyeri_tekan` enum('+','-') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `adnexa_kanan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `adnexa_kiri` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cavum_douglas` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `tgl_perawatan`, `jam_rawat`) USING BTREE,
  CONSTRAINT `pemeriksaan_ginekologi_ralan_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pemeriksaan_ginekologi_ranap
-- ----------------------------
DROP TABLE IF EXISTS `pemeriksaan_ginekologi_ranap`;
CREATE TABLE `pemeriksaan_ginekologi_ranap`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_perawatan` date NOT NULL,
  `jam_rawat` time(0) NOT NULL,
  `inspeksi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `inspeksi_vulva` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `inspekulo_gine` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fluxus_gine` enum('+','-') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fluor_gine` enum('+','-') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `vulva_inspekulo` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `portio_inspekulo` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sondage` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `portio_dalam` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bentuk` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cavum_uteri` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mobilitas` enum('+','-') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ukuran` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nyeri_tekan` enum('+','-') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `adnexa_kanan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `adnexa_kiri` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cavum_douglas` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `tgl_perawatan`, `jam_rawat`) USING BTREE,
  CONSTRAINT `pemeriksaan_ginekologi_ranap_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pemeriksaan_obstetri_ralan
-- ----------------------------
DROP TABLE IF EXISTS `pemeriksaan_obstetri_ralan`;
CREATE TABLE `pemeriksaan_obstetri_ralan`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_perawatan` date NOT NULL,
  `jam_rawat` time(0) NOT NULL,
  `tinggi_uteri` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `janin` enum('Tunggal','Gemelli','-') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `letak` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `panggul` enum('-','5/5','4/5','3/5','2/5','1/5') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `denyut` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kontraksi` enum('+','-') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kualitas_mnt` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kualitas_dtk` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fluksus` enum('+','-') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `albus` enum('+','-') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `vulva` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `portio` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dalam` enum('Kenyal','Lunak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tebal` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `arah` enum('depan','axial','belakang') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pembukaan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penurunan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `denominator` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ketuban` enum('-','+') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `feto` enum('Normal','Susp.CPD-FPD','CPD-FPD') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`, `tgl_perawatan`, `jam_rawat`) USING BTREE,
  CONSTRAINT `pemeriksaan_obstetri_ralan_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pemeriksaan_obstetri_ranap
-- ----------------------------
DROP TABLE IF EXISTS `pemeriksaan_obstetri_ranap`;
CREATE TABLE `pemeriksaan_obstetri_ranap`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_perawatan` date NOT NULL,
  `jam_rawat` time(0) NOT NULL,
  `tinggi_uteri` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `janin` enum('Tunggal','Gemelli','-') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `letak` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `panggul` enum('-','5/5','4/5','3/5','2/5','1/5') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `denyut` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kontraksi` enum('+','-') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kualitas_mnt` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kualitas_dtk` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fluksus` enum('+','-') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `albus` enum('+','-') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `vulva` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `portio` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dalam` enum('Kenyal','Lunak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tebal` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `arah` enum('depan','axial','belakang') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pembukaan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penurunan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `denominator` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ketuban` enum('-','+') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `feto` enum('Normal','Susp.CPD-FPD','CPD-FPD') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`, `tgl_perawatan`, `jam_rawat`) USING BTREE,
  CONSTRAINT `pemeriksaan_obstetri_ranap_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pemeriksaan_ralan
-- ----------------------------
DROP TABLE IF EXISTS `pemeriksaan_ralan`;
CREATE TABLE `pemeriksaan_ralan`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_perawatan` date NOT NULL,
  `jam_rawat` time(0) NOT NULL,
  `suhu_tubuh` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tensi` char(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nadi` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `respirasi` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tinggi` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `berat` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `gcs` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kesadaran` enum('Compos Mentis','Somnolence','Sopor','Coma') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keluhan` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pemeriksaan` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alergi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `imun_ke` enum('-','1','2','3','4','5','6','7','8','10','11','12','13') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rtl` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `penilaian` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `instruksi` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `tgl_perawatan`, `jam_rawat`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `pemeriksaan_ralan_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pemeriksaan_ralan_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pemeriksaan_ranap
-- ----------------------------
DROP TABLE IF EXISTS `pemeriksaan_ranap`;
CREATE TABLE `pemeriksaan_ranap`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_perawatan` date NOT NULL,
  `jam_rawat` time(0) NOT NULL,
  `suhu_tubuh` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tensi` char(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nadi` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `respirasi` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tinggi` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `berat` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `gcs` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kesadaran` enum('Compos Mentis','Somnolence','Sopor','Coma') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keluhan` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pemeriksaan` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alergi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penilaian` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rtl` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `instruksi` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `tgl_perawatan`, `jam_rawat`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `pemeriksaan_ranap_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pemeriksaan_ranap_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pemesanan
-- ----------------------------
DROP TABLE IF EXISTS `pemesanan`;
CREATE TABLE `pemesanan`  (
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_order` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_suplier` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_pesan` date NULL DEFAULT NULL,
  `tgl_faktur` date NULL DEFAULT NULL,
  `tgl_tempo` date NULL DEFAULT NULL,
  `total1` double NOT NULL,
  `potongan` double NOT NULL,
  `total2` double NOT NULL,
  `ppn` double NOT NULL,
  `meterai` double NULL DEFAULT NULL,
  `tagihan` double NOT NULL,
  `kd_bangsal` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('Sudah Dibayar','Belum Dibayar','Belum Lunas') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_faktur`) USING BTREE,
  INDEX `kode_suplier`(`kode_suplier`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  INDEX `kd_bangsal`(`kd_bangsal`) USING BTREE,
  CONSTRAINT `pemesanan_ibfk_1` FOREIGN KEY (`kode_suplier`) REFERENCES `datasuplier` (`kode_suplier`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pemesanan_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pemesanan_ibfk_3` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for peminjaman_berkas
-- ----------------------------
DROP TABLE IF EXISTS `peminjaman_berkas`;
CREATE TABLE `peminjaman_berkas`  (
  `peminjam` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_ruang` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status_pinjam` enum('Masih Dipinjam','Sudah Kembali') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`peminjam`, `id_ruang`, `no_rkm_medis`, `tgl_pinjam`, `nip`) USING BTREE,
  INDEX `no_rkm_medis`(`no_rkm_medis`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  INDEX `id_ruang`(`id_ruang`) USING BTREE,
  CONSTRAINT `peminjaman_berkas_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `peminjaman_berkas_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `peminjaman_berkas_ibfk_3` FOREIGN KEY (`id_ruang`) REFERENCES `inventaris_ruang` (`id_ruang`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for peminjaman_koperasi
-- ----------------------------
DROP TABLE IF EXISTS `peminjaman_koperasi`;
CREATE TABLE `peminjaman_koperasi`  (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `pinjaman` double NOT NULL,
  `banyak_angsur` int(11) NOT NULL,
  `pokok` double NOT NULL,
  `jasa` double NOT NULL,
  `status` enum('Lunas','Belum Lunas') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`, `tanggal`) USING BTREE,
  CONSTRAINT `peminjaman_koperasi_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for penagihan_piutang
-- ----------------------------
DROP TABLE IF EXISTS `penagihan_piutang`;
CREATE TABLE `penagihan_piutang`  (
  `no_tagihan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` date NOT NULL,
  `tanggaltempo` date NOT NULL,
  `tempo` int(11) NOT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nip_menyetujui` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_pj` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `catatan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_rek` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('Proses Penagihan','Sudah Dibayar') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_tagihan`) USING BTREE,
  INDEX `kd_pj`(`kd_pj`) USING BTREE,
  INDEX `kd_rek`(`kd_rek`) USING BTREE,
  INDEX `penagihan_piutang_ibfk_1`(`nip`) USING BTREE,
  INDEX `nip_menyetujui`(`nip_menyetujui`) USING BTREE,
  CONSTRAINT `penagihan_piutang_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `penagihan_piutang_ibfk_2` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `penagihan_piutang_ibfk_3` FOREIGN KEY (`kd_rek`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `penagihan_piutang_ibfk_4` FOREIGN KEY (`nip_menyetujui`) REFERENCES `pegawai` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pencapaian_kinerja
-- ----------------------------
DROP TABLE IF EXISTS `pencapaian_kinerja`;
CREATE TABLE `pencapaian_kinerja`  (
  `kode_pencapaian` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_pencapaian` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `indek` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`kode_pencapaian`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pencapaian_kinerja_pegawai
-- ----------------------------
DROP TABLE IF EXISTS `pencapaian_kinerja_pegawai`;
CREATE TABLE `pencapaian_kinerja_pegawai`  (
  `id` int(11) NOT NULL,
  `kode_pencapaian` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tahun` year NOT NULL,
  `bulan` tinyint(4) NOT NULL,
  `keterangan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `kode_pencapaian`, `tahun`, `bulan`) USING BTREE,
  INDEX `kode_pencapaian`(`kode_pencapaian`) USING BTREE,
  CONSTRAINT `pencapaian_kinerja_pegawai_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pencapaian_kinerja_pegawai_ibfk_2` FOREIGN KEY (`kode_pencapaian`) REFERENCES `pencapaian_kinerja` (`kode_pencapaian`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pendidikan
-- ----------------------------
DROP TABLE IF EXISTS `pendidikan`;
CREATE TABLE `pendidikan`  (
  `tingkat` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `indek` tinyint(4) NOT NULL,
  `gapok1` double NOT NULL,
  `kenaikan` double NOT NULL,
  `maksimal` int(11) NOT NULL,
  PRIMARY KEY (`tingkat`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pengaduan
-- ----------------------------
DROP TABLE IF EXISTS `pengaduan`;
CREATE TABLE `pengaduan`  (
  `id` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime(0) NOT NULL,
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pesan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `no_rkm_medis`(`no_rkm_medis`) USING BTREE,
  CONSTRAINT `pengaduan_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pengajuan_barang_medis
-- ----------------------------
DROP TABLE IF EXISTS `pengajuan_barang_medis`;
CREATE TABLE `pengajuan_barang_medis`  (
  `no_pengajuan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `status` enum('Proses Pengajuan','Disetujui','Ditolak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keterangan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_pengajuan`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `pengajuan_barang_medis_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pengajuan_barang_nonmedis
-- ----------------------------
DROP TABLE IF EXISTS `pengajuan_barang_nonmedis`;
CREATE TABLE `pengajuan_barang_nonmedis`  (
  `no_pengajuan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `status` enum('Proses Pengajuan','Disetujui','Ditolak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keterangan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_pengajuan`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `pengajuan_barang_nonmedis_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pengajuan_cuti
-- ----------------------------
DROP TABLE IF EXISTS `pengajuan_cuti`;
CREATE TABLE `pengajuan_cuti`  (
  `no_pengajuan` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` date NOT NULL,
  `tanggal_awal` date NOT NULL,
  `tanggal_akhir` date NOT NULL,
  `nik` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `urgensi` enum('Tahunan','Besar','Sakit','Bersalin','Alasan Penting','Keterangan Lainnya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alamat` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jumlah` int(11) NOT NULL,
  `kepentingan` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nik_pj` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('Proses Pengajuan','Disetujui','Ditolak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_pengajuan`) USING BTREE,
  INDEX `nik`(`nik`) USING BTREE,
  INDEX `nik_pj`(`nik_pj`) USING BTREE,
  CONSTRAINT `pengajuan_cuti_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `pegawai` (`nik`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pengajuan_cuti_ibfk_2` FOREIGN KEY (`nik_pj`) REFERENCES `pegawai` (`nik`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pengajuan_inventaris
-- ----------------------------
DROP TABLE IF EXISTS `pengajuan_inventaris`;
CREATE TABLE `pengajuan_inventaris`  (
  `no_pengajuan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` date NOT NULL,
  `nik` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `urgensi` enum('Cito','Emergensi','Biasa') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `latar_belakang` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_barang` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `spesifikasi` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jumlah` double NOT NULL,
  `harga` double NOT NULL,
  `total` double NOT NULL,
  `keterangan` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nik_pj` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('Proses Pengajuan','Disetujui','Ditolak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_pengajuan`) USING BTREE,
  INDEX `nik`(`nik`) USING BTREE,
  INDEX `nik_pj`(`nik_pj`) USING BTREE,
  CONSTRAINT `pengajuan_inventaris_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `pegawai` (`nik`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pengajuan_inventaris_ibfk_2` FOREIGN KEY (`nik_pj`) REFERENCES `pegawai` (`nik`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pengeluaran_harian
-- ----------------------------
DROP TABLE IF EXISTS `pengeluaran_harian`;
CREATE TABLE `pengeluaran_harian`  (
  `no_keluar` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `kode_kategori` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `biaya` double NOT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keterangan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`no_keluar`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  INDEX `pengeluaran_harian_ibfk_2`(`kode_kategori`) USING BTREE,
  CONSTRAINT `pengeluaran_harian_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pengeluaran_harian_ibfk_2` FOREIGN KEY (`kode_kategori`) REFERENCES `kategori_pengeluaran_harian` (`kode_kategori`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pengeluaran_obat_bhp
-- ----------------------------
DROP TABLE IF EXISTS `pengeluaran_obat_bhp`;
CREATE TABLE `pengeluaran_obat_bhp`  (
  `no_keluar` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` date NOT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_bangsal` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_keluar`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  INDEX `tanggal`(`tanggal`) USING BTREE,
  INDEX `keterangan`(`keterangan`) USING BTREE,
  INDEX `kd_bangsal`(`kd_bangsal`) USING BTREE,
  CONSTRAINT `pengeluaran_obat_bhp_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pengeluaran_obat_bhp_ibfk_2` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pengembalian_deposit
-- ----------------------------
DROP TABLE IF EXISTS `pengembalian_deposit`;
CREATE TABLE `pengembalian_deposit`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime(0) NOT NULL,
  `petugas` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `besar_pengembalian` double NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  CONSTRAINT `pengembalian_deposit_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pengumuman_epasien
-- ----------------------------
DROP TABLE IF EXISTS `pengumuman_epasien`;
CREATE TABLE `pengumuman_epasien`  (
  `nik` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime(0) NOT NULL,
  `pengumuman` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nik`, `tanggal`) USING BTREE,
  CONSTRAINT `pengumuman_epasien_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `pegawai` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pengurangan_biaya
-- ----------------------------
DROP TABLE IF EXISTS `pengurangan_biaya`;
CREATE TABLE `pengurangan_biaya`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nama_pengurangan` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `besar_pengurangan` double NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`, `nama_pengurangan`) USING BTREE,
  CONSTRAINT `pengurangan_biaya_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for penilaian_awal_keperawatan_gigi
-- ----------------------------
DROP TABLE IF EXISTS `penilaian_awal_keperawatan_gigi`;
CREATE TABLE `penilaian_awal_keperawatan_gigi`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime(0) NOT NULL,
  `informasi` enum('Autoanamnesis','Alloanamnesis') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `td` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nadi` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `rr` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `suhu` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `bb` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tb` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `bmi` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keluhan_utama` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `riwayat_penyakit` enum('Tidak Ada','Diabetes Melitus','Hipertensi','Penyakit Jantung','HIV','Hepatitis','Haemophilia','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ket_riwayat_penyakit` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alergi` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `riwayat_perawatan_gigi` enum('Tidak','Ya, Kapan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_riwayat_perawatan_gigi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kebiasaan_sikat_gigi` enum('1x','2x','3x','Mandi','Setelah Makan','Sebelum Tidur') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kebiasaan_lain` enum('Tidak ada','Minum kopi/teh','Minum alkohol','Bruxism','Menggigit pensil','Mengunyah 1 sisi rahang','Merokok','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ket_kebiasaan_lain` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `obat_yang_diminum_saatini` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alat_bantu` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_alat_bantu` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `prothesa` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_pro` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status_psiko` enum('Tenang','Takut','Cemas','Depresi','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_psiko` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hub_keluarga` enum('Baik','Tidak Baik') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tinggal_dengan` enum('Sendiri','Orang Tua','Suami / Istri','Lainnya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_tinggal` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ekonomi` enum('Baik','Cukup','Kurang') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `budaya` enum('Tidak Ada','Ada') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_budaya` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `edukasi` enum('Pasien','Keluarga') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_edukasi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `berjalan_a` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `berjalan_b` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `berjalan_c` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hasil` enum('Tidak beresiko (tidak ditemukan a dan b)','Resiko rendah (ditemukan a/b)','Resiko tinggi (ditemukan a dan b)') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lapor` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_lapor` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nyeri` enum('Tidak Ada Nyeri','Nyeri Akut','Nyeri Kronis') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lokasi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `skala_nyeri` enum('0','1','2','3','4','5','6','7','8','9','10') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `durasi` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `frekuensi` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nyeri_hilang` enum('Istirahat','Medengar Musik','Minum Obat','Tidak ada nyeri','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_nyeri` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pada_dokter` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_dokter` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kebersihan_mulut` enum('Baik','Cukup','Kurang') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mukosa_mulut` enum('Normal','Pigmentasi','Radang') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `karies` enum('Ada','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `karang_gigi` enum('Ada','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `gingiva` enum('Normal','Radang') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `palatum` enum('Normal','Radang') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rencana` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `penilaian_awal_keperawatan_gigi_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `penilaian_awal_keperawatan_gigi_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for penilaian_awal_keperawatan_gigi_masalah
-- ----------------------------
DROP TABLE IF EXISTS `penilaian_awal_keperawatan_gigi_masalah`;
CREATE TABLE `penilaian_awal_keperawatan_gigi_masalah`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_masalah` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `kode_masalah`) USING BTREE,
  INDEX `kode_masalah`(`kode_masalah`) USING BTREE,
  CONSTRAINT `penilaian_awal_keperawatan_gigi_masalah_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `penilaian_awal_keperawatan_gigi_masalah_ibfk_2` FOREIGN KEY (`kode_masalah`) REFERENCES `master_masalah_keperawatan_gigi` (`kode_masalah`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for penilaian_awal_keperawatan_kebidanan
-- ----------------------------
DROP TABLE IF EXISTS `penilaian_awal_keperawatan_kebidanan`;
CREATE TABLE `penilaian_awal_keperawatan_kebidanan`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime(0) NOT NULL,
  `informasi` enum('Autoanamnesis','Alloanamnesis') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `td` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nadi` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `rr` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `suhu` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `gcs` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bb` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tb` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `lila` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bmi` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tfu` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tbj` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `letak` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `presentasi` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `penurunan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `his` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kekuatan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lamanya` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bjj` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_bjj` enum('Teratur','Tidak Teratur') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `portio` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `serviks` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ketuban` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hodge` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `inspekulo` enum('Dilakukan','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_inspekulo` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ctg` enum('Dilakukan','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_ctg` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `usg` enum('Dilakukan','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_usg` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lab` enum('Dilakukan','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_lab` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lakmus` enum('Dilakukan','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_lakmus` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `panggul` enum('Luas','Sedang','Sempit','Tidak Dilakukan Pemeriksaan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keluhan_utama` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `umur` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lama` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `banyaknya` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `haid` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `siklus` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_siklus` enum('Teratur','Tidak Teratur') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_siklus1` enum('Tidak Ada Masalah','Dismenorhea','Spotting','Menorhagia','PMS') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('Menikah','Tidak / Belum Menikah') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kali` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `usia1` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket1` enum('-','Masih Menikah','Cerai','Meninggal') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `usia2` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ket2` enum('-','Masih Menikah','Cerai','Meninggal') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `usia3` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ket3` enum('-','Masih Menikah','Cerai','Meninggal') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hpht` date NULL DEFAULT NULL,
  `usia_kehamilan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tp` date NULL DEFAULT NULL,
  `imunisasi` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_imunisasi` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `g` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `p` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `a` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hidup` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ginekologi` enum('Tidak Ada','Infertilitas','Infeksi Virus','PMS','Cervisitis Kronis','Endometriosis','Mioma','Polip Cervix','Kanker Kandungan','Operasi Kandungan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kebiasaan` enum('-','Obat Obatan','Vitamin','Jamu Jamuan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_kebiasaan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kebiasaan1` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_kebiasaan1` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kebiasaan2` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_kebiasaan2` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kebiasaan3` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kb` enum('Belum Pernah','Suntik','Pil','AKDR','MOW') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_kb` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `komplikasi` enum('Tidak Ada','Ada') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_komplikasi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `berhenti` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alasan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alat_bantu` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_bantu` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `prothesa` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_pro` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `adl` enum('Mandiri','Dibantu') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status_psiko` enum('Tenang','Takut','Cemas','Depresi','Lain-Lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_psiko` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hub_keluarga` enum('Baik','Tidak Baik') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tinggal_dengan` enum('Sendiri','Orang Tua','Suami / Istri','Lainnya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_tinggal` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ekonomi` enum('Baik','Cukup','Kurang') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `budaya` enum('Tidak Ada','Ada') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_budaya` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `edukasi` enum('Pasien','Keluarga') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_edukasi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `berjalan_a` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `berjalan_b` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `berjalan_c` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hasil` enum('Tidak Beresiko (Tidak Ditemukan A Dan B)','Resiko Rendah (Ditemukan A/B)','Resiko Tinggi (Ditemukan A Dan B)') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lapor` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_lapor` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sg1` enum('Tidak','Tidak Yakin','Ya(1-5 Kg)','Ya(6-10Kg)','Ya(11-15Kg)','Ya(>15Kg)') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nilai1` enum('0','1','2','3','4') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sg2` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nilai2` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `total_hasil` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nyeri` enum('Tidak Ada Nyeri','Nyeri Akut','Nyeri Kronis') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `provokes` enum('Proses Penyakit','Benturan','Lain-Lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_provokes` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `quality` enum('Seperti Tertusuk','Berdenyut','Teriris','Tertindih','Tertiban','Lain-Lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_quality` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lokasi` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `menyebar` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `skala_nyeri` enum('0','1','2','3','4','5','6','7','8','9','10') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `durasi` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nyeri_hilang` enum('Istirahat','Mendengar Musik','Minum Obat') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_nyeri` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pada_dokter` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_dokter` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `masalah` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tindakan` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `penilaian_awal_keperawatan_kebidanan_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `penilaian_awal_keperawatan_kebidanan_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for penilaian_awal_keperawatan_kebidanan_ranap
-- ----------------------------
DROP TABLE IF EXISTS `penilaian_awal_keperawatan_kebidanan_ranap`;
CREATE TABLE `penilaian_awal_keperawatan_kebidanan_ranap`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime(0) NOT NULL,
  `informasi` enum('Autoanamnesis','Alloanamnesis') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tiba_diruang_rawat` enum('Jalan Tanpa Bantuan','Kursi Roda','Brankar') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cara_masuk` enum('Poli','IGD','VK','OK','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keluhan` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rpk` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `psk` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rp` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alergi` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `komplikasi_sebelumnya` enum('Tidak','HAP','HPP','PEB/PER/Eklamsi','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan_komplikasi_sebelumnya` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_mens_umur` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_mens_lamanya` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_mens_banyaknya` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_mens_siklus` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_mens_ket_siklus` enum('Teratur','Tidak Teratur') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_mens_dirasakan` enum('Tidak Ada Masalah','Dismenorhea','Spotting','Menorhagia','PMS') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_perkawinan_status` enum('Menikah','Tidak / Belum Menikah') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_perkawinan_ket_status` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_perkawinan_usia1` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_perkawinan_ket_usia1` enum('-','Masih Menikah','Cerai','Meninggal') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_perkawinan_usia2` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_perkawinan_ket_usia2` enum('-','Masih Menikah','Cerai','Meninggal') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_perkawinan_usia3` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_perkawinan_ket_usia3` enum('-','Masih Menikah','Cerai','Meninggal') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_persalinan_g` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_persalinan_p` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_persalinan_a` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_persalinan_hidup` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_hamil_hpht` date NOT NULL,
  `riwayat_hamil_usiahamil` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_hamil_tp` date NOT NULL,
  `riwayat_hamil_imunisasi` enum('Tidak Pernah','T I','TT II','TT III','TT IV') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_hamil_anc` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_hamil_ancke` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_hamil_ket_ancke` enum('Teratur','Tidak Teratur') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_hamil_keluhan_hamil_muda` enum('Tidak Ada','Mual','Muntah','Perdarahan','Lain–lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_hamil_keluhan_hamil_tua` enum('Tidak Ada','Mual','Muntah','Perdarahan','Lain–lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_kb` enum('Belum Pernah','Suntik','Pil','AKDR','MOW') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_kb_lamanya` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_kb_komplikasi` enum('Tidak Ada','Ada') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_kb_ket_komplikasi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_kb_kapaberhenti` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_kb_alasanberhenti` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_genekologi` enum('Tidak Ada','Infertilitas','Infeksi Virus','PMS','Cervisitis Kronis','Endometriosis','Mioma','Polip Cervix','Kanker Kandungan','Operasi Kandungan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_kebiasaan_obat` enum('-','Obat Obatan','Vitamin','Jamu Jamuan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_kebiasaan_ket_obat` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_kebiasaan_merokok` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_kebiasaan_ket_merokok` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_kebiasaan_alkohol` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_kebiasaan_ket_alkohol` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riwayat_kebiasaan_narkoba` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_mental` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_keadaan_umum` enum('Baik','Sedang','Buruk') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_gcs` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_td` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_nadi` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_rr` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_suhu` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_spo2` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_bb` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_tb` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_lila` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_tfu` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_tbj` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_letak` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_presentasi` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_penurunan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_his` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_kekuatan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_lamanya` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_djj` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_ket_djj` enum('Teratur','Tidak Teratur') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_portio` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_pembukaan` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_ketuban` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_hodge` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_panggul` enum('Luas','Sedang','Sempit','Tidak Dilakukan Pemeriksaan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_inspekulo` enum('Dilakukan','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_ket_inspekulo` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_lakmus` enum('Dilakukan','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_ket_lakmus` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_ctg` enum('Dilakukan','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_kebidanan_ket_ctg` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_umum_kepala` enum('Normocephale','Hydrocephalus','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_umum_muka` enum('Normal','Pucat','Oedem','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_umum_mata` enum('Conjungtiva Merah Muda','Conjungtiva Pucat','Sklera Ikterik','Pandangan Kabur','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_umum_hidung` enum('Normal','Sekret','Polip','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_umum_telinga` enum('Bersih','Serumen','Polip','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_umum_mulut` enum('Bersih','Kotor','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_umum_leher` enum('Normal','Pembesaran KGB','Pembesaran Kelenjar Tiroid','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_umum_dada` enum('Mamae Simetris','Mamae Asimetris','Aerola Hiperpigmentasi','Kolustrum (+)','Tumor','Puting Susu Menonjol') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_umum_perut` enum('Luka Bekas Operasi','Nyeri Tekan (Ya)','Nyeri Tekan (Tidak)','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_umum_genitalia` enum('Bersih','Kotor','Varises','Oedem','Hematoma','Hemoroid','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_umum_ekstrimitas` enum('Normal','Oedem','Refleks Patella Ada','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pengkajian_fungsi_kemampuan_aktifitas` enum('Mandiri','Bantuan minimal','Bantuan Sebagian','Ketergantungan Total') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pengkajian_fungsi_berjalan` enum('TAK','Penurunan Kekuatan/ROM','Paralisis','Sering Jatuh','Deformitas','Hilang keseimbangan','Riwayat Patah Tulang','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pengkajian_fungsi_ket_berjalan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pengkajian_fungsi_aktivitas` enum('Tirah Baring','Duduk','Berjalan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pengkajian_fungsi_ambulasi` enum('Walker','Tongkat','Kursi Roda','Tidak Menggunakan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pengkajian_fungsi_ekstrimitas_atas` enum('TAK','Lemah','Oedema','Tidak Simetris','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pengkajian_fungsi_ket_ekstrimitas_atas` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pengkajian_fungsi_ekstrimitas_bawah` enum('TAK','Varises','Oedema','Tidak Simetris','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pengkajian_fungsi_ket_ekstrimitas_bawah` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pengkajian_fungsi_kemampuan_menggenggam` enum('Tidak Ada Kesulitan','Terakhir','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pengkajian_fungsi_ket_kemampuan_menggenggam` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pengkajian_fungsi_koordinasi` enum('Tidak Ada Kesulitan','Ada Masalah') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pengkajian_fungsi_ket_koordinasi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pengkajian_fungsi_gangguan_fungsi` enum('Tidak (Tidak Perlu Co DPJP)','Ya (Co DPJP)') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  CONSTRAINT `penilaian_awal_keperawatan_kebidanan_ranap_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for penilaian_awal_keperawatan_ralan
-- ----------------------------
DROP TABLE IF EXISTS `penilaian_awal_keperawatan_ralan`;
CREATE TABLE `penilaian_awal_keperawatan_ralan`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime(0) NOT NULL,
  `informasi` enum('Autoanamnesis','Alloanamnesis') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `td` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nadi` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `rr` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `suhu` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `gcs` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bb` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tb` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `bmi` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keluhan_utama` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `rpd` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `rpk` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rpo` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alergi` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `alat_bantu` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_bantu` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `prothesa` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_pro` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `adl` enum('Mandiri','Dibantu') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status_psiko` enum('Tenang','Takut','Cemas','Depresi','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_psiko` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hub_keluarga` enum('Baik','Tidak Baik') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tinggal_dengan` enum('Sendiri','Orang Tua','Suami / Istri','Lainnya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_tinggal` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ekonomi` enum('Baik','Cukup','Kurang') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `budaya` enum('Tidak Ada','Ada') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_budaya` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `edukasi` enum('Pasien','Keluarga') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_edukasi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `berjalan_a` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `berjalan_b` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `berjalan_c` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hasil` enum('Tidak beresiko (tidak ditemukan a dan b)','Resiko rendah (ditemukan a/b)','Resiko tinggi (ditemukan a dan b)') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lapor` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_lapor` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sg1` enum('Tidak','Tidak Yakin','Ya, 1-5 Kg','Ya, 6-10 Kg','Ya, 11-15 Kg','Ya, >15 Kg') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nilai1` enum('0','1','2','3','4') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sg2` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nilai2` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `total_hasil` tinyint(4) NOT NULL,
  `nyeri` enum('Tidak Ada Nyeri','Nyeri Akut','Nyeri Kronis') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `provokes` enum('Proses Penyakit','Benturan','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_provokes` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `quality` enum('Seperti Tertusuk','Berdenyut','Teriris','Tertindih','Tertiban','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_quality` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lokasi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `menyebar` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `skala_nyeri` enum('0','1','2','3','4','5','6','7','8','9','10') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `durasi` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nyeri_hilang` enum('Istirahat','Medengar Musik','Minum Obat') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_nyeri` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pada_dokter` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_dokter` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rencana` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `penilaian_awal_keperawatan_ralan_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `penilaian_awal_keperawatan_ralan_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for penilaian_awal_keperawatan_ralan_bayi
-- ----------------------------
DROP TABLE IF EXISTS `penilaian_awal_keperawatan_ralan_bayi`;
CREATE TABLE `penilaian_awal_keperawatan_ralan_bayi`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime(0) NOT NULL,
  `informasi` enum('Autoanamnesis','Alloanamnesis') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `td` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nadi` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `rr` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `suhu` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `gcs` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bb` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tb` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `lp` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `lk` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `ld` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `keluhan_utama` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `rpd` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `rpk` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rpo` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alergi` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `anakke` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `darisaudara` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `caralahir` enum('Spontan','Sectio Caesaria','Lain-Lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_caralahir` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `umurkelahiran` enum('Cukup Bulan','Kurang Bulan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kelainanbawaan` enum('Tidak Ada','Ada') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_kelainan_bawaan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `usiatengkurap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `usiaduduk` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `usiaberdiri` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `usiagigipertama` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `usiaberjalan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `usiabicara` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `usiamembaca` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `usiamenulis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `gangguanemosi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alat_bantu` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_bantu` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `prothesa` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_pro` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `adl` enum('Mandiri','Dibantu') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status_psiko` enum('Tenang','Takut','Tempertantrum','Cemas','Depresi','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_psiko` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hub_keluarga` enum('Baik','Tidak Baik') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pengasuh` enum('Orang Tua','Kakek/Nenek','Keluarga Lainnya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_pengasuh` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ekonomi` enum('Baik','Cukup','Kurang') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `budaya` enum('Tidak Ada','Ada') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_budaya` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `edukasi` enum('Orang Tua','Keluarga') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_edukasi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `berjalan_a` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `berjalan_b` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `berjalan_c` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hasil` enum('Tidak beresiko (tidak ditemukan a dan b)','Resiko rendah (ditemukan a/b)','Resiko tinggi (ditemukan a dan b)') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lapor` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_lapor` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sg1` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nilai1` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sg2` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nilai2` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sg3` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nilai3` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sg4` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nilai4` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `total_hasil` tinyint(4) NOT NULL,
  `wajah` enum('Tersenyum/tidak ada ekspresi khusus','Terkadang meringis/menarik diri','Sering menggetarkan dagu dan mengatupkan rahang') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nilaiwajah` enum('0','1','2') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kaki` enum('Gerakan normal/relaksasi','Tidak tenang/tegang','Kaki dibuat menendang/menarik') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nilaikaki` enum('0','1','2') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `aktifitas` enum('Tidur posisi normal, mudah bergerak','Gerakan menggeliat/berguling, kaku','Melengkungkan punggung/kaku menghentak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nilaiaktifitas` enum('0','1','2') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `menangis` enum('Tidak menangis (mudah bergerak)','Mengerang/merengek','Menangis terus menerus, terisak, menjerit') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nilaimenangis` enum('0','1','2') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bersuara` enum('Bersuara normal/tenang','Tenang bila dipeluk, digendong/diajak bicara','Sulit untuk menenangkan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nilaibersuara` enum('0','1','2') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hasilnyeri` tinyint(4) NOT NULL,
  `nyeri` enum('Tidak Ada Nyeri','Nyeri Akut','Nyeri Kronis') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lokasi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `durasi` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `frekuensi` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nyeri_hilang` enum('Minum Obat','Istirahat','Mendengar Music','Berubah Posisi/Tidur','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_nyeri` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pada_dokter` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_dokter` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rencana` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `penilaian_awal_keperawatan_ralan_bayi_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `penilaian_awal_keperawatan_ralan_bayi_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for penilaian_awal_keperawatan_ralan_bayi_masalah
-- ----------------------------
DROP TABLE IF EXISTS `penilaian_awal_keperawatan_ralan_bayi_masalah`;
CREATE TABLE `penilaian_awal_keperawatan_ralan_bayi_masalah`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_masalah` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `kode_masalah`) USING BTREE,
  INDEX `kode_masalah`(`kode_masalah`) USING BTREE,
  CONSTRAINT `penilaian_awal_keperawatan_ralan_bayi_masalah_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `penilaian_awal_keperawatan_ralan_bayi_masalah_ibfk_2` FOREIGN KEY (`kode_masalah`) REFERENCES `master_masalah_keperawatan_anak` (`kode_masalah`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for penilaian_awal_keperawatan_ralan_masalah
-- ----------------------------
DROP TABLE IF EXISTS `penilaian_awal_keperawatan_ralan_masalah`;
CREATE TABLE `penilaian_awal_keperawatan_ralan_masalah`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_masalah` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `kode_masalah`) USING BTREE,
  INDEX `kode_masalah`(`kode_masalah`) USING BTREE,
  CONSTRAINT `penilaian_awal_keperawatan_ralan_masalah_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `penilaian_awal_keperawatan_ralan_masalah_ibfk_2` FOREIGN KEY (`kode_masalah`) REFERENCES `master_masalah_keperawatan` (`kode_masalah`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for penjab
-- ----------------------------
DROP TABLE IF EXISTS `penjab`;
CREATE TABLE `penjab`  (
  `kd_pj` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `png_jawab` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_perusahaan` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alamat_asuransi` varchar(130) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_telp` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `attn` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd_pj`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for penjualan
-- ----------------------------
DROP TABLE IF EXISTS `penjualan`;
CREATE TABLE `penjualan`  (
  `nota_jual` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_jual` date NULL DEFAULT NULL,
  `nip` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nm_pasien` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keterangan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jns_jual` enum('Jual Bebas','Karyawan','Beli Luar','Rawat Jalan','Kelas 1','Kelas 2','Kelas 3','Utama/BPJS','VIP','VVIP') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ongkir` double NULL DEFAULT NULL,
  `status` enum('Belum Dibayar','Sudah Dibayar') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_bangsal` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_rek` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_bayar` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nota_jual`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  INDEX `no_rkm_medis`(`no_rkm_medis`) USING BTREE,
  INDEX `kd_bangsal`(`kd_bangsal`) USING BTREE,
  INDEX `penjualan_ibfk_12`(`kd_rek`) USING BTREE,
  INDEX `nama_bayar`(`nama_bayar`) USING BTREE,
  CONSTRAINT `penjualan_ibfk_10` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `penjualan_ibfk_11` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `penjualan_ibfk_12` FOREIGN KEY (`kd_rek`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `penjualan_ibfk_13` FOREIGN KEY (`nama_bayar`) REFERENCES `akun_bayar` (`nama_bayar`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `penjualan_ibfk_9` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for penyakit
-- ----------------------------
DROP TABLE IF EXISTS `penyakit`;
CREATE TABLE `penyakit`  (
  `kd_penyakit` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_penyakit` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ciri_ciri` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `keterangan` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_ktg` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` enum('Menular','Tidak Menular') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd_penyakit`) USING BTREE,
  INDEX `kd_ktg`(`kd_ktg`) USING BTREE,
  INDEX `nm_penyakit`(`nm_penyakit`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  CONSTRAINT `penyakit_ibfk_1` FOREIGN KEY (`kd_ktg`) REFERENCES `kategori_penyakit` (`kd_ktg`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for penyakit_pd3i
-- ----------------------------
DROP TABLE IF EXISTS `penyakit_pd3i`;
CREATE TABLE `penyakit_pd3i`  (
  `kd_penyakit` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd_penyakit`) USING BTREE,
  CONSTRAINT `penyakit_pd3i_ibfk_1` FOREIGN KEY (`kd_penyakit`) REFERENCES `penyakit` (`kd_penyakit`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for perawatan_corona
-- ----------------------------
DROP TABLE IF EXISTS `perawatan_corona`;
CREATE TABLE `perawatan_corona`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemulasaraan_jenazah` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kantong_jenazah` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `peti_jenazah` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `plastik_erat` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `desinfektan_jenazah` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mobil_jenazah` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `desinfektan_mobil_jenazah` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `covid19_status_cd` enum('ODP','PDP','Positif') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nomor_kartu_t` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `episodes1` int(11) NULL DEFAULT NULL,
  `episodes2` int(11) NULL DEFAULT NULL,
  `episodes3` int(11) NULL DEFAULT NULL,
  `episodes4` int(11) NULL DEFAULT NULL,
  `episodes5` int(11) NULL DEFAULT NULL,
  `episodes6` int(11) NULL DEFAULT NULL,
  `covid19_cc_ind` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  CONSTRAINT `perawatan_corona_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for perbaikan_inventaris
-- ----------------------------
DROP TABLE IF EXISTS `perbaikan_inventaris`;
CREATE TABLE `perbaikan_inventaris`  (
  `no_permintaan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` date NOT NULL,
  `uraian_kegiatan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pelaksana` enum('Teknisi Rumah Sakit','Teknisi Rujukan','Pihak ke III') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `biaya` double NOT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('Bisa Diperbaiki','Tidak Bisa Diperbaiki') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_permintaan`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `perbaikan_inventaris_ibfk_1` FOREIGN KEY (`no_permintaan`) REFERENCES `permintaan_perbaikan_inventaris` (`no_permintaan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `perbaikan_inventaris_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for periksa_lab
-- ----------------------------
DROP TABLE IF EXISTS `periksa_lab`;
CREATE TABLE `periksa_lab`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_periksa` date NOT NULL,
  `jam` time(0) NOT NULL,
  `dokter_perujuk` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bagian_rs` double NOT NULL,
  `bhp` double NOT NULL,
  `tarif_perujuk` double NOT NULL,
  `tarif_tindakan_dokter` double NOT NULL,
  `tarif_tindakan_petugas` double NOT NULL,
  `kso` double NULL DEFAULT NULL,
  `menejemen` double NULL DEFAULT NULL,
  `biaya` double NOT NULL,
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('Ralan','Ranap') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kategori` enum('PA','PK') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `kd_jenis_prw`, `tgl_periksa`, `jam`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  INDEX `kd_jenis_prw`(`kd_jenis_prw`) USING BTREE,
  INDEX `kd_dokter`(`kd_dokter`) USING BTREE,
  INDEX `dokter_perujuk`(`dokter_perujuk`) USING BTREE,
  CONSTRAINT `periksa_lab_ibfk_10` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `periksa_lab_ibfk_11` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_lab` (`kd_jenis_prw`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `periksa_lab_ibfk_12` FOREIGN KEY (`dokter_perujuk`) REFERENCES `dokter` (`kd_dokter`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `periksa_lab_ibfk_13` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `periksa_lab_ibfk_9` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for periksa_radiologi
-- ----------------------------
DROP TABLE IF EXISTS `periksa_radiologi`;
CREATE TABLE `periksa_radiologi`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_periksa` date NOT NULL,
  `jam` time(0) NOT NULL,
  `dokter_perujuk` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bagian_rs` double NOT NULL,
  `bhp` double NOT NULL,
  `tarif_perujuk` double NOT NULL,
  `tarif_tindakan_dokter` double NOT NULL,
  `tarif_tindakan_petugas` double NOT NULL,
  `kso` double NULL DEFAULT NULL,
  `menejemen` double NULL DEFAULT NULL,
  `biaya` double NOT NULL,
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('Ranap','Ralan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `proyeksi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kV` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mAS` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `FFD` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `BSF` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `inak` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jml_penyinaran` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dosis` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `kd_jenis_prw`, `tgl_periksa`, `jam`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  INDEX `kd_jenis_prw`(`kd_jenis_prw`) USING BTREE,
  INDEX `kd_dokter`(`kd_dokter`) USING BTREE,
  INDEX `dokter_perujuk`(`dokter_perujuk`) USING BTREE,
  CONSTRAINT `periksa_radiologi_ibfk_4` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `periksa_radiologi_ibfk_5` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `periksa_radiologi_ibfk_6` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_radiologi` (`kd_jenis_prw`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `periksa_radiologi_ibfk_7` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `periksa_radiologi_ibfk_8` FOREIGN KEY (`dokter_perujuk`) REFERENCES `dokter` (`kd_dokter`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for perkiraan_biaya_ranap
-- ----------------------------
DROP TABLE IF EXISTS `perkiraan_biaya_ranap`;
CREATE TABLE `perkiraan_biaya_ranap`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_penyakit` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tarif` double NOT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  INDEX `kd_penyakit`(`kd_penyakit`) USING BTREE,
  CONSTRAINT `perkiraan_biaya_ranap_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `perkiraan_biaya_ranap_ibfk_2` FOREIGN KEY (`kd_penyakit`) REFERENCES `penyakit` (`kd_penyakit`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for permintaan_detail_permintaan_lab
-- ----------------------------
DROP TABLE IF EXISTS `permintaan_detail_permintaan_lab`;
CREATE TABLE `permintaan_detail_permintaan_lab`  (
  `noorder` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_template` int(11) NOT NULL,
  `stts_bayar` enum('Sudah','Belum') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`noorder`, `kd_jenis_prw`, `id_template`) USING BTREE,
  INDEX `id_template`(`id_template`) USING BTREE,
  INDEX `kd_jenis_prw`(`kd_jenis_prw`) USING BTREE,
  CONSTRAINT `permintaan_detail_permintaan_lab_ibfk_2` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_lab` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permintaan_detail_permintaan_lab_ibfk_3` FOREIGN KEY (`id_template`) REFERENCES `template_laboratorium` (`id_template`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permintaan_detail_permintaan_lab_ibfk_4` FOREIGN KEY (`noorder`) REFERENCES `permintaan_lab` (`noorder`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for permintaan_lab
-- ----------------------------
DROP TABLE IF EXISTS `permintaan_lab`;
CREATE TABLE `permintaan_lab`  (
  `noorder` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_permintaan` date NOT NULL,
  `jam_permintaan` time(0) NOT NULL,
  `tgl_sampel` date NOT NULL,
  `jam_sampel` time(0) NOT NULL,
  `tgl_hasil` date NOT NULL,
  `jam_hasil` time(0) NOT NULL,
  `dokter_perujuk` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('ralan','ranap') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `informasi_tambahan` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `diagnosa_klinis` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`noorder`) USING BTREE,
  INDEX `dokter_perujuk`(`dokter_perujuk`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  CONSTRAINT `permintaan_lab_ibfk_2` FOREIGN KEY (`dokter_perujuk`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permintaan_lab_ibfk_3` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for permintaan_labpa
-- ----------------------------
DROP TABLE IF EXISTS `permintaan_labpa`;
CREATE TABLE `permintaan_labpa`  (
  `noorder` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_permintaan` date NOT NULL,
  `jam_permintaan` time(0) NOT NULL,
  `tgl_sampel` date NOT NULL,
  `jam_sampel` time(0) NOT NULL,
  `tgl_hasil` date NOT NULL,
  `jam_hasil` time(0) NOT NULL,
  `dokter_perujuk` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('ralan','ranap') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `informasi_tambahan` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `diagnosa_klinis` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pengambilan_bahan` date NULL DEFAULT NULL,
  `diperoleh_dengan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lokasi_jaringan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `diawetkan_dengan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pernah_dilakukan_di` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal_pa_sebelumnya` date NULL DEFAULT NULL,
  `nomor_pa_sebelumnya` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `diagnosa_pa_sebelumnya` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`noorder`) USING BTREE,
  INDEX `dokter_perujuk`(`dokter_perujuk`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  CONSTRAINT `permintaan_labpa_ibfk_1` FOREIGN KEY (`dokter_perujuk`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permintaan_labpa_ibfk_2` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for permintaan_medis
-- ----------------------------
DROP TABLE IF EXISTS `permintaan_medis`;
CREATE TABLE `permintaan_medis`  (
  `no_permintaan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_bangsal` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `status` enum('Baru','Disetujui','Tidak Disetujui') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_bangsaltujuan` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_permintaan`) USING BTREE,
  INDEX `kd_bangsal`(`kd_bangsal`) USING BTREE,
  INDEX `permintaan_medis_ibfk_2`(`nip`) USING BTREE,
  INDEX `kd_bangsaltujuan`(`kd_bangsaltujuan`) USING BTREE,
  CONSTRAINT `permintaan_medis_ibfk_1` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permintaan_medis_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permintaan_medis_ibfk_3` FOREIGN KEY (`kd_bangsaltujuan`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for permintaan_non_medis
-- ----------------------------
DROP TABLE IF EXISTS `permintaan_non_medis`;
CREATE TABLE `permintaan_non_medis`  (
  `no_permintaan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ruang` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `status` enum('Baru','Disetujui','Tidak Disetujui') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_permintaan`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `permintaan_non_medis_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for permintaan_obat
-- ----------------------------
DROP TABLE IF EXISTS `permintaan_obat`;
CREATE TABLE `permintaan_obat`  (
  `tanggal` date NOT NULL,
  `jam` time(0) NOT NULL,
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`tanggal`, `jam`, `no_rawat`, `kode_brng`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  CONSTRAINT `permintaan_obat_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permintaan_obat_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for permintaan_pemeriksaan_lab
-- ----------------------------
DROP TABLE IF EXISTS `permintaan_pemeriksaan_lab`;
CREATE TABLE `permintaan_pemeriksaan_lab`  (
  `noorder` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `stts_bayar` enum('Sudah','Belum') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`noorder`, `kd_jenis_prw`) USING BTREE,
  INDEX `kd_jenis_prw`(`kd_jenis_prw`) USING BTREE,
  CONSTRAINT `permintaan_pemeriksaan_lab_ibfk_1` FOREIGN KEY (`noorder`) REFERENCES `permintaan_lab` (`noorder`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permintaan_pemeriksaan_lab_ibfk_2` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_lab` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for permintaan_pemeriksaan_labpa
-- ----------------------------
DROP TABLE IF EXISTS `permintaan_pemeriksaan_labpa`;
CREATE TABLE `permintaan_pemeriksaan_labpa`  (
  `noorder` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `stts_bayar` enum('Sudah','Belum') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`noorder`, `kd_jenis_prw`) USING BTREE,
  INDEX `kd_jenis_prw`(`kd_jenis_prw`) USING BTREE,
  CONSTRAINT `permintaan_pemeriksaan_labpa_ibfk_1` FOREIGN KEY (`noorder`) REFERENCES `permintaan_labpa` (`noorder`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permintaan_pemeriksaan_labpa_ibfk_2` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_lab` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for permintaan_pemeriksaan_radiologi
-- ----------------------------
DROP TABLE IF EXISTS `permintaan_pemeriksaan_radiologi`;
CREATE TABLE `permintaan_pemeriksaan_radiologi`  (
  `noorder` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `stts_bayar` enum('Sudah','Belum') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`noorder`, `kd_jenis_prw`) USING BTREE,
  INDEX `kd_jenis_prw`(`kd_jenis_prw`) USING BTREE,
  CONSTRAINT `permintaan_pemeriksaan_radiologi_ibfk_1` FOREIGN KEY (`noorder`) REFERENCES `permintaan_radiologi` (`noorder`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permintaan_pemeriksaan_radiologi_ibfk_2` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_radiologi` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for permintaan_perbaikan_inventaris
-- ----------------------------
DROP TABLE IF EXISTS `permintaan_perbaikan_inventaris`;
CREATE TABLE `permintaan_perbaikan_inventaris`  (
  `no_permintaan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_inventaris` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nik` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal` datetime(0) NULL DEFAULT NULL,
  `deskripsi_kerusakan` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_permintaan`) USING BTREE,
  INDEX `no_inventaris`(`no_inventaris`) USING BTREE,
  INDEX `nik`(`nik`) USING BTREE,
  CONSTRAINT `permintaan_perbaikan_inventaris_ibfk_1` FOREIGN KEY (`no_inventaris`) REFERENCES `inventaris` (`no_inventaris`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permintaan_perbaikan_inventaris_ibfk_2` FOREIGN KEY (`nik`) REFERENCES `pegawai` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for permintaan_radiologi
-- ----------------------------
DROP TABLE IF EXISTS `permintaan_radiologi`;
CREATE TABLE `permintaan_radiologi`  (
  `noorder` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_permintaan` date NOT NULL,
  `jam_permintaan` time(0) NOT NULL,
  `tgl_sampel` date NOT NULL,
  `jam_sampel` time(0) NOT NULL,
  `tgl_hasil` date NOT NULL,
  `jam_hasil` time(0) NOT NULL,
  `dokter_perujuk` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('ralan','ranap') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `informasi_tambahan` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `diagnosa_klinis` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`noorder`) USING BTREE,
  INDEX `dokter_perujuk`(`dokter_perujuk`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  CONSTRAINT `permintaan_radiologi_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permintaan_radiologi_ibfk_3` FOREIGN KEY (`dokter_perujuk`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for permintaan_ranap
-- ----------------------------
DROP TABLE IF EXISTS `permintaan_ranap`;
CREATE TABLE `permintaan_ranap`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` date NOT NULL,
  `kd_kamar` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `diagnosa` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `catatan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  INDEX `kd_kamar`(`kd_kamar`) USING BTREE,
  CONSTRAINT `permintaan_ranap_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permintaan_ranap_ibfk_2` FOREIGN KEY (`kd_kamar`) REFERENCES `kamar` (`kd_kamar`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for permintaan_registrasi
-- ----------------------------
DROP TABLE IF EXISTS `permintaan_registrasi`;
CREATE TABLE `permintaan_registrasi`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `biaya` double NOT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  CONSTRAINT `permintaan_registrasi_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for permintaan_stok_obat_pasien
-- ----------------------------
DROP TABLE IF EXISTS `permintaan_stok_obat_pasien`;
CREATE TABLE `permintaan_stok_obat_pasien`  (
  `no_permintaan` varchar(14) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tgl_permintaan` date NULL DEFAULT NULL,
  `jam` time(0) NOT NULL,
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('Sudah','Belum') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_validasi` date NOT NULL,
  `jam_validasi` time(0) NOT NULL,
  PRIMARY KEY (`no_permintaan`) USING BTREE,
  UNIQUE INDEX `tgl_permintaan`(`tgl_permintaan`, `jam`, `no_rawat`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `kd_dokter`(`kd_dokter`) USING BTREE,
  CONSTRAINT `permintaan_stok_obat_pasien_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `permintaan_stok_obat_pasien_ibfk_2` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for perpustakaan_anggota
-- ----------------------------
DROP TABLE IF EXISTS `perpustakaan_anggota`;
CREATE TABLE `perpustakaan_anggota`  (
  `no_anggota` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_anggota` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tmp_lahir` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_lahir` date NULL DEFAULT NULL,
  `j_kel` enum('L','P') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alamat` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_telp` varchar(13) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_gabung` date NULL DEFAULT NULL,
  `masa_berlaku` date NULL DEFAULT NULL,
  `jenis_anggota` enum('Pasien','Pegawai','Umum') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nomer_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_anggota`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for perpustakaan_bayar_denda
-- ----------------------------
DROP TABLE IF EXISTS `perpustakaan_bayar_denda`;
CREATE TABLE `perpustakaan_bayar_denda`  (
  `tgl_denda` date NOT NULL DEFAULT '0000-00-00',
  `no_anggota` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `no_inventaris` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kode_denda` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `besar_denda` double NULL DEFAULT NULL,
  `keterangan_denda` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tgl_denda`, `no_anggota`, `no_inventaris`, `kode_denda`) USING BTREE,
  INDEX `kode_denda`(`kode_denda`) USING BTREE,
  INDEX `no_anggota`(`no_anggota`) USING BTREE,
  INDEX `no_inventaris`(`no_inventaris`) USING BTREE,
  CONSTRAINT `perpustakaan_bayar_denda_ibfk_1` FOREIGN KEY (`no_anggota`) REFERENCES `perpustakaan_anggota` (`no_anggota`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `perpustakaan_bayar_denda_ibfk_2` FOREIGN KEY (`no_inventaris`) REFERENCES `perpustakaan_inventaris` (`no_inventaris`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `perpustakaan_bayar_denda_ibfk_3` FOREIGN KEY (`kode_denda`) REFERENCES `perpustakaan_denda` (`kode_denda`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for perpustakaan_bayar_denda_harian
-- ----------------------------
DROP TABLE IF EXISTS `perpustakaan_bayar_denda_harian`;
CREATE TABLE `perpustakaan_bayar_denda_harian`  (
  `tgl_denda` date NOT NULL DEFAULT '0000-00-00',
  `no_anggota` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `no_inventaris` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `keterlambatan` int(4) NULL DEFAULT NULL,
  `besar_denda` double NULL DEFAULT NULL,
  PRIMARY KEY (`tgl_denda`, `no_anggota`, `no_inventaris`) USING BTREE,
  INDEX `no_anggota`(`no_anggota`) USING BTREE,
  INDEX `no_inventaris`(`no_inventaris`) USING BTREE,
  CONSTRAINT `perpustakaan_bayar_denda_harian_ibfk_1` FOREIGN KEY (`no_anggota`) REFERENCES `perpustakaan_anggota` (`no_anggota`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `perpustakaan_bayar_denda_harian_ibfk_2` FOREIGN KEY (`no_inventaris`) REFERENCES `perpustakaan_inventaris` (`no_inventaris`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for perpustakaan_buku
-- ----------------------------
DROP TABLE IF EXISTS `perpustakaan_buku`;
CREATE TABLE `perpustakaan_buku`  (
  `kode_buku` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `judul_buku` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jml_halaman` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_penerbit` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_pengarang` varchar(7) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `thn_terbit` year NULL DEFAULT NULL,
  `isbn` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_kategori` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_jenis` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_buku`) USING BTREE,
  INDEX `kode_penerbit`(`kode_penerbit`) USING BTREE,
  INDEX `kode_pengarang`(`kode_pengarang`) USING BTREE,
  INDEX `id_kategori`(`id_kategori`) USING BTREE,
  INDEX `id_jenis`(`id_jenis`) USING BTREE,
  CONSTRAINT `perpustakaan_buku_ibfk_1` FOREIGN KEY (`kode_penerbit`) REFERENCES `perpustakaan_penerbit` (`kode_penerbit`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `perpustakaan_buku_ibfk_2` FOREIGN KEY (`kode_pengarang`) REFERENCES `perpustakaan_pengarang` (`kode_pengarang`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `perpustakaan_buku_ibfk_3` FOREIGN KEY (`id_kategori`) REFERENCES `perpustakaan_kategori` (`id_kategori`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `perpustakaan_buku_ibfk_4` FOREIGN KEY (`id_jenis`) REFERENCES `perpustakaan_jenis_buku` (`id_jenis`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for perpustakaan_denda
-- ----------------------------
DROP TABLE IF EXISTS `perpustakaan_denda`;
CREATE TABLE `perpustakaan_denda`  (
  `kode_denda` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jenis_denda` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `besar_denda` double NULL DEFAULT NULL,
  PRIMARY KEY (`kode_denda`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for perpustakaan_ebook
-- ----------------------------
DROP TABLE IF EXISTS `perpustakaan_ebook`;
CREATE TABLE `perpustakaan_ebook`  (
  `kode_ebook` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `judul_ebook` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jml_halaman` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_penerbit` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_pengarang` varchar(7) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `thn_terbit` year NULL DEFAULT NULL,
  `id_kategori` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_jenis` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `berkas` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kode_ebook`) USING BTREE,
  INDEX `kode_penerbit`(`kode_penerbit`) USING BTREE,
  INDEX `kode_pengarang`(`kode_pengarang`) USING BTREE,
  INDEX `id_kategori`(`id_kategori`) USING BTREE,
  INDEX `id_jenis`(`id_jenis`) USING BTREE,
  CONSTRAINT `perpustakaan_ebook_ibfk_1` FOREIGN KEY (`kode_penerbit`) REFERENCES `perpustakaan_penerbit` (`kode_penerbit`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `perpustakaan_ebook_ibfk_2` FOREIGN KEY (`kode_pengarang`) REFERENCES `perpustakaan_pengarang` (`kode_pengarang`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `perpustakaan_ebook_ibfk_3` FOREIGN KEY (`id_kategori`) REFERENCES `perpustakaan_kategori` (`id_kategori`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `perpustakaan_ebook_ibfk_4` FOREIGN KEY (`id_jenis`) REFERENCES `perpustakaan_jenis_buku` (`id_jenis`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for perpustakaan_inventaris
-- ----------------------------
DROP TABLE IF EXISTS `perpustakaan_inventaris`;
CREATE TABLE `perpustakaan_inventaris`  (
  `no_inventaris` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kode_buku` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `asal_buku` enum('Beli','Bantuan','Hibah','-') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_pengadaan` date NULL DEFAULT NULL,
  `harga` double NULL DEFAULT NULL,
  `status_buku` enum('Ada','Rusak','Hilang','Dipinjam','-') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_ruang` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_rak` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_box` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_inventaris`) USING BTREE,
  INDEX `kode_buku`(`kode_buku`) USING BTREE,
  INDEX `kd_ruang`(`kd_ruang`) USING BTREE,
  CONSTRAINT `perpustakaan_inventaris_ibfk_1` FOREIGN KEY (`kode_buku`) REFERENCES `perpustakaan_buku` (`kode_buku`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `perpustakaan_inventaris_ibfk_2` FOREIGN KEY (`kd_ruang`) REFERENCES `perpustakaan_ruang` (`kd_ruang`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for perpustakaan_jenis_buku
-- ----------------------------
DROP TABLE IF EXISTS `perpustakaan_jenis_buku`;
CREATE TABLE `perpustakaan_jenis_buku`  (
  `id_jenis` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_jenis` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_jenis`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for perpustakaan_kategori
-- ----------------------------
DROP TABLE IF EXISTS `perpustakaan_kategori`;
CREATE TABLE `perpustakaan_kategori`  (
  `id_kategori` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_kategori` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_kategori`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for perpustakaan_peminjaman
-- ----------------------------
DROP TABLE IF EXISTS `perpustakaan_peminjaman`;
CREATE TABLE `perpustakaan_peminjaman`  (
  `no_anggota` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_inventaris` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_pinjam` date NULL DEFAULT NULL,
  `tgl_kembali` date NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status_pinjam` enum('Masih Dipinjam','Sudah Kembali') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  INDEX `no_anggota`(`no_anggota`) USING BTREE,
  INDEX `no_inventaris`(`no_inventaris`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `perpustakaan_peminjaman_ibfk_1` FOREIGN KEY (`no_anggota`) REFERENCES `perpustakaan_anggota` (`no_anggota`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `perpustakaan_peminjaman_ibfk_2` FOREIGN KEY (`no_inventaris`) REFERENCES `perpustakaan_inventaris` (`no_inventaris`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `perpustakaan_peminjaman_ibfk_3` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for perpustakaan_penerbit
-- ----------------------------
DROP TABLE IF EXISTS `perpustakaan_penerbit`;
CREATE TABLE `perpustakaan_penerbit`  (
  `kode_penerbit` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_penerbit` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alamat_penerbit` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_telp` varchar(13) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `website_penerbit` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_penerbit`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for perpustakaan_pengarang
-- ----------------------------
DROP TABLE IF EXISTS `perpustakaan_pengarang`;
CREATE TABLE `perpustakaan_pengarang`  (
  `kode_pengarang` varchar(7) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_pengarang` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_pengarang`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for perpustakaan_ruang
-- ----------------------------
DROP TABLE IF EXISTS `perpustakaan_ruang`;
CREATE TABLE `perpustakaan_ruang`  (
  `kd_ruang` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nm_ruang` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kd_ruang`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for perpustakaan_set_peminjaman
-- ----------------------------
DROP TABLE IF EXISTS `perpustakaan_set_peminjaman`;
CREATE TABLE `perpustakaan_set_peminjaman`  (
  `max_pinjam` int(11) NULL DEFAULT NULL,
  `lama_pinjam` int(11) NULL DEFAULT NULL,
  `denda_perhari` double NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for personal_pasien
-- ----------------------------
DROP TABLE IF EXISTS `personal_pasien`;
CREATE TABLE `personal_pasien`  (
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `gambar` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rkm_medis`) USING BTREE,
  CONSTRAINT `personal_pasien_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for perusahaan_pasien
-- ----------------------------
DROP TABLE IF EXISTS `perusahaan_pasien`;
CREATE TABLE `perusahaan_pasien`  (
  `kode_perusahaan` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_perusahaan` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alamat` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kota` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_telp` varchar(27) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_perusahaan`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for petugas
-- ----------------------------
DROP TABLE IF EXISTS `petugas`;
CREATE TABLE `petugas`  (
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jk` enum('L','P') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tmp_lahir` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_lahir` date NULL DEFAULT NULL,
  `gol_darah` enum('A','B','O','AB','-') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `agama` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `stts_nikah` enum('BELUM MENIKAH','MENIKAH','JANDA','DUDHA','JOMBLO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alamat` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_jbtn` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_telp` varchar(13) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nip`) USING BTREE,
  INDEX `kd_jbtn`(`kd_jbtn`) USING BTREE,
  INDEX `nama`(`nama`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  INDEX `tmp_lahir`(`tmp_lahir`) USING BTREE,
  INDEX `tgl_lahir`(`tgl_lahir`) USING BTREE,
  INDEX `agama`(`agama`) USING BTREE,
  INDEX `stts_nikah`(`stts_nikah`) USING BTREE,
  INDEX `alamat`(`alamat`) USING BTREE,
  CONSTRAINT `petugas_ibfk_4` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nik`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `petugas_ibfk_5` FOREIGN KEY (`kd_jbtn`) REFERENCES `jabatan` (`kd_jbtn`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for piutang
-- ----------------------------
DROP TABLE IF EXISTS `piutang`;
CREATE TABLE `piutang`  (
  `nota_piutang` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_piutang` date NULL DEFAULT NULL,
  `nip` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nm_pasien` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `catatan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jns_jual` enum('Jual Bebas','Karyawan','Beli Luar','Rawat Jalan','Kelas 1','Kelas 2','Kelas 3','Utama','VIP','VVIP') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ongkir` double NULL DEFAULT NULL,
  `uangmuka` double NULL DEFAULT NULL,
  `sisapiutang` double NOT NULL,
  `status` enum('UMUM','PAJAK') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgltempo` date NOT NULL,
  `kd_bangsal` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`nota_piutang`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  INDEX `no_rkm_medis`(`no_rkm_medis`) USING BTREE,
  INDEX `kd_bangsal`(`kd_bangsal`) USING BTREE,
  CONSTRAINT `piutang_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `piutang_ibfk_2` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `piutang_ibfk_3` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for piutang_pasien
-- ----------------------------
DROP TABLE IF EXISTS `piutang_pasien`;
CREATE TABLE `piutang_pasien`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_piutang` date NULL DEFAULT NULL,
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` enum('Lunas','Belum Lunas') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `totalpiutang` double NULL DEFAULT NULL,
  `uangmuka` double NULL DEFAULT NULL,
  `sisapiutang` double NOT NULL,
  `tgltempo` date NOT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  INDEX `no_rkm_medis`(`no_rkm_medis`) USING BTREE,
  CONSTRAINT `piutang_pasien_ibfk_2` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `piutang_pasien_ibfk_3` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pnm_tnj_bulanan
-- ----------------------------
DROP TABLE IF EXISTS `pnm_tnj_bulanan`;
CREATE TABLE `pnm_tnj_bulanan`  (
  `id` int(11) NOT NULL,
  `id_tnj` int(11) NOT NULL,
  PRIMARY KEY (`id`, `id_tnj`) USING BTREE,
  INDEX `id_tnj`(`id_tnj`) USING BTREE,
  CONSTRAINT `pnm_tnj_bulanan_ibfk_5` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pnm_tnj_bulanan_ibfk_6` FOREIGN KEY (`id_tnj`) REFERENCES `master_tunjangan_bulanan` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pnm_tnj_harian
-- ----------------------------
DROP TABLE IF EXISTS `pnm_tnj_harian`;
CREATE TABLE `pnm_tnj_harian`  (
  `id` int(11) NOT NULL,
  `id_tnj` int(11) NOT NULL,
  PRIMARY KEY (`id`, `id_tnj`) USING BTREE,
  INDEX `id_tnj`(`id_tnj`) USING BTREE,
  CONSTRAINT `pnm_tnj_harian_ibfk_5` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pnm_tnj_harian_ibfk_6` FOREIGN KEY (`id_tnj`) REFERENCES `master_tunjangan_harian` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for poliklinik
-- ----------------------------
DROP TABLE IF EXISTS `poliklinik`;
CREATE TABLE `poliklinik`  (
  `kd_poli` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nm_poli` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `registrasi` double NOT NULL,
  `registrasilama` double NOT NULL,
  `status` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd_poli`) USING BTREE,
  INDEX `nm_poli`(`nm_poli`) USING BTREE,
  INDEX `registrasi`(`registrasi`) USING BTREE,
  INDEX `registrasilama`(`registrasilama`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for potongan
-- ----------------------------
DROP TABLE IF EXISTS `potongan`;
CREATE TABLE `potongan`  (
  `tahun` year NOT NULL,
  `bulan` tinyint(4) NOT NULL,
  `id` int(11) NOT NULL,
  `bpjs` double NOT NULL,
  `jamsostek` double NOT NULL,
  `dansos` double NOT NULL,
  `simwajib` double NOT NULL,
  `angkop` double NOT NULL,
  `angla` double NOT NULL,
  `telpri` double NOT NULL,
  `pajak` double NOT NULL,
  `pribadi` double NOT NULL,
  `lain` double NOT NULL,
  `ktg` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`tahun`, `bulan`, `id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  CONSTRAINT `potongan_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for presensi
-- ----------------------------
DROP TABLE IF EXISTS `presensi`;
CREATE TABLE `presensi`  (
  `tgl` date NOT NULL,
  `id` int(11) NOT NULL,
  `jns` enum('HR','HB') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lembur` int(11) NOT NULL,
  PRIMARY KEY (`tgl`, `id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  CONSTRAINT `presensi_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for propinsi
-- ----------------------------
DROP TABLE IF EXISTS `propinsi`;
CREATE TABLE `propinsi`  (
  `kd_prop` int(11) NOT NULL AUTO_INCREMENT,
  `nm_prop` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd_prop`) USING BTREE,
  UNIQUE INDEX `nm_prop`(`nm_prop`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 360 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for prosedur_pasien
-- ----------------------------
DROP TABLE IF EXISTS `prosedur_pasien`;
CREATE TABLE `prosedur_pasien`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('Ralan','Ranap') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `prioritas` tinyint(4) NOT NULL,
  PRIMARY KEY (`no_rawat`, `kode`, `status`) USING BTREE,
  INDEX `kode`(`kode`) USING BTREE,
  CONSTRAINT `prosedur_pasien_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prosedur_pasien_ibfk_2` FOREIGN KEY (`kode`) REFERENCES `icd9` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ranap_gabung
-- ----------------------------
DROP TABLE IF EXISTS `ranap_gabung`;
CREATE TABLE `ranap_gabung`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_rawat2` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `no_rawat2`) USING BTREE,
  INDEX `no_rawat2`(`no_rawat2`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  CONSTRAINT `ranap_gabung_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ranap_gabung_ibfk_2` FOREIGN KEY (`no_rawat2`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rawat_inap_dr
-- ----------------------------
DROP TABLE IF EXISTS `rawat_inap_dr`;
CREATE TABLE `rawat_inap_dr`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_perawatan` date NOT NULL DEFAULT '0000-00-00',
  `jam_rawat` time(0) NOT NULL DEFAULT '00:00:00',
  `material` double NOT NULL,
  `bhp` double NOT NULL,
  `tarif_tindakandr` double NOT NULL,
  `kso` double NULL DEFAULT NULL,
  `menejemen` double NULL DEFAULT NULL,
  `biaya_rawat` double NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`, `kd_jenis_prw`, `kd_dokter`, `tgl_perawatan`, `jam_rawat`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `kd_jenis_prw`(`kd_jenis_prw`) USING BTREE,
  INDEX `kd_dokter`(`kd_dokter`) USING BTREE,
  INDEX `tgl_perawatan`(`tgl_perawatan`) USING BTREE,
  INDEX `biaya_rawat`(`biaya_rawat`) USING BTREE,
  INDEX `jam_rawat`(`jam_rawat`) USING BTREE,
  CONSTRAINT `rawat_inap_dr_ibfk_3` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rawat_inap_dr_ibfk_6` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_inap` (`kd_jenis_prw`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rawat_inap_dr_ibfk_7` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rawat_inap_drpr
-- ----------------------------
DROP TABLE IF EXISTS `rawat_inap_drpr`;
CREATE TABLE `rawat_inap_drpr`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tgl_perawatan` date NOT NULL DEFAULT '0000-00-00',
  `jam_rawat` time(0) NOT NULL DEFAULT '00:00:00',
  `material` double NOT NULL,
  `bhp` double NOT NULL,
  `tarif_tindakandr` double NULL DEFAULT NULL,
  `tarif_tindakanpr` double NULL DEFAULT NULL,
  `kso` double NULL DEFAULT NULL,
  `menejemen` double NULL DEFAULT NULL,
  `biaya_rawat` double NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`, `kd_jenis_prw`, `kd_dokter`, `nip`, `tgl_perawatan`, `jam_rawat`) USING BTREE,
  INDEX `rawat_inap_drpr_ibfk_2`(`kd_jenis_prw`) USING BTREE,
  INDEX `rawat_inap_drpr_ibfk_3`(`kd_dokter`) USING BTREE,
  INDEX `rawat_inap_drpr_ibfk_4`(`nip`) USING BTREE,
  CONSTRAINT `rawat_inap_drpr_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rawat_inap_drpr_ibfk_2` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_inap` (`kd_jenis_prw`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rawat_inap_drpr_ibfk_3` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rawat_inap_drpr_ibfk_4` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rawat_inap_pr
-- ----------------------------
DROP TABLE IF EXISTS `rawat_inap_pr`;
CREATE TABLE `rawat_inap_pr`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tgl_perawatan` date NOT NULL DEFAULT '0000-00-00',
  `jam_rawat` time(0) NOT NULL DEFAULT '00:00:00',
  `material` double NOT NULL,
  `bhp` double NOT NULL,
  `tarif_tindakanpr` double NOT NULL,
  `kso` double NULL DEFAULT NULL,
  `menejemen` double NULL DEFAULT NULL,
  `biaya_rawat` double NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`, `kd_jenis_prw`, `nip`, `tgl_perawatan`, `jam_rawat`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `kd_jenis_prw`(`kd_jenis_prw`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  INDEX `biaya_rawat`(`biaya_rawat`) USING BTREE,
  CONSTRAINT `rawat_inap_pr_ibfk_3` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rawat_inap_pr_ibfk_6` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_inap` (`kd_jenis_prw`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rawat_inap_pr_ibfk_7` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rawat_jl_dr
-- ----------------------------
DROP TABLE IF EXISTS `rawat_jl_dr`;
CREATE TABLE `rawat_jl_dr`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_perawatan` date NOT NULL,
  `jam_rawat` time(0) NOT NULL,
  `material` double NOT NULL,
  `bhp` double NOT NULL,
  `tarif_tindakandr` double NOT NULL,
  `kso` double NULL DEFAULT NULL,
  `menejemen` double NULL DEFAULT NULL,
  `biaya_rawat` double NULL DEFAULT NULL,
  `stts_bayar` enum('Sudah','Belum','Suspen') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`, `kd_jenis_prw`, `kd_dokter`, `tgl_perawatan`, `jam_rawat`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `kd_jenis_prw`(`kd_jenis_prw`) USING BTREE,
  INDEX `kd_dokter`(`kd_dokter`) USING BTREE,
  INDEX `biaya_rawat`(`biaya_rawat`) USING BTREE,
  CONSTRAINT `rawat_jl_dr_ibfk_2` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan` (`kd_jenis_prw`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rawat_jl_dr_ibfk_3` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rawat_jl_dr_ibfk_5` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rawat_jl_drpr
-- ----------------------------
DROP TABLE IF EXISTS `rawat_jl_drpr`;
CREATE TABLE `rawat_jl_drpr`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_perawatan` date NOT NULL,
  `jam_rawat` time(0) NOT NULL,
  `material` double NULL DEFAULT NULL,
  `bhp` double NOT NULL,
  `tarif_tindakandr` double NULL DEFAULT NULL,
  `tarif_tindakanpr` double NULL DEFAULT NULL,
  `kso` double NULL DEFAULT NULL,
  `menejemen` double NULL DEFAULT NULL,
  `biaya_rawat` double NULL DEFAULT NULL,
  `stts_bayar` enum('Sudah','Belum','Suspen') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`, `kd_jenis_prw`, `kd_dokter`, `nip`, `tgl_perawatan`, `jam_rawat`) USING BTREE,
  INDEX `rawat_jl_drpr_ibfk_2`(`kd_jenis_prw`) USING BTREE,
  INDEX `rawat_jl_drpr_ibfk_3`(`kd_dokter`) USING BTREE,
  INDEX `rawat_jl_drpr_ibfk_4`(`nip`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  CONSTRAINT `rawat_jl_drpr_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rawat_jl_drpr_ibfk_2` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan` (`kd_jenis_prw`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rawat_jl_drpr_ibfk_3` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rawat_jl_drpr_ibfk_4` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rawat_jl_pr
-- ----------------------------
DROP TABLE IF EXISTS `rawat_jl_pr`;
CREATE TABLE `rawat_jl_pr`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tgl_perawatan` date NOT NULL,
  `jam_rawat` time(0) NOT NULL,
  `material` double NOT NULL,
  `bhp` double NOT NULL,
  `tarif_tindakanpr` double NOT NULL,
  `kso` double NULL DEFAULT NULL,
  `menejemen` double NULL DEFAULT NULL,
  `biaya_rawat` double NULL DEFAULT NULL,
  `stts_bayar` enum('Sudah','Belum','Suspen') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`, `kd_jenis_prw`, `nip`, `tgl_perawatan`, `jam_rawat`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `kd_jenis_prw`(`kd_jenis_prw`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  INDEX `biaya_rawat`(`biaya_rawat`) USING BTREE,
  CONSTRAINT `rawat_jl_pr_ibfk_10` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rawat_jl_pr_ibfk_8` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rawat_jl_pr_ibfk_9` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan` (`kd_jenis_prw`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rawatjalan
-- ----------------------------
DROP TABLE IF EXISTS `rawatjalan`;
CREATE TABLE `rawatjalan`  (
  `tgl` datetime(0) NOT NULL,
  `id` int(11) NOT NULL,
  `tnd` int(11) NOT NULL,
  `jm` double NOT NULL,
  `nm_pasien` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kamar` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `diagnosa` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jmlh` int(11) NOT NULL,
  PRIMARY KEY (`tgl`, `id`, `tnd`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `tnd`(`tnd`) USING BTREE,
  CONSTRAINT `rawatjalan_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for referensi_mobilejkn_bpjs
-- ----------------------------
DROP TABLE IF EXISTS `referensi_mobilejkn_bpjs`;
CREATE TABLE `referensi_mobilejkn_bpjs`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nomorkartu` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nik` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nohp` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kodepoli` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `norm` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggalperiksa` date NULL DEFAULT NULL,
  `kodedokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jampraktek` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jeniskunjungan` enum('1 (Rujukan FKTP)','2 (Rujukan Internal)','3 (Kontrol)','4 (Rujukan Antar RS)') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nomorreferensi` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('Belum','Checkin') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `validasi` datetime(0) NOT NULL,
  PRIMARY KEY (`nomorreferensi`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  CONSTRAINT `referensi_mobilejkn_bpjs_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for referensi_mobilejkn_bpjs_batal
-- ----------------------------
DROP TABLE IF EXISTS `referensi_mobilejkn_bpjs_batal`;
CREATE TABLE `referensi_mobilejkn_bpjs_batal`  (
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_rawat_batal` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nomorreferensi` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggalbatal` datetime(0) NULL DEFAULT NULL,
  `keterangan` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nomorreferensi`) USING BTREE,
  INDEX `no_rkm_medis`(`no_rkm_medis`) USING BTREE,
  CONSTRAINT `referensi_mobilejkn_bpjs_batal_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for reg_periksa
-- ----------------------------
DROP TABLE IF EXISTS `reg_periksa`;
CREATE TABLE `reg_periksa`  (
  `no_reg` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_registrasi` date NULL DEFAULT NULL,
  `jam_reg` time(0) NULL DEFAULT NULL,
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_poli` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `p_jawab` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `almt_pj` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hubunganpj` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `biaya_reg` double NULL DEFAULT NULL,
  `stts` enum('Belum','Sudah','Batal','Berkas Diterima','Dirujuk','Meninggal','Dirawat','Pulang Paksa') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `stts_daftar` enum('-','Lama','Baru') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status_lanjut` enum('Ralan','Ranap') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_pj` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `umurdaftar` int(11) NULL DEFAULT NULL,
  `sttsumur` enum('Th','Bl','Hr') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status_bayar` enum('Sudah Bayar','Belum Bayar') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status_poli` enum('Lama','Baru') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  INDEX `no_rkm_medis`(`no_rkm_medis`) USING BTREE,
  INDEX `kd_poli`(`kd_poli`) USING BTREE,
  INDEX `kd_pj`(`kd_pj`) USING BTREE,
  INDEX `status_lanjut`(`status_lanjut`) USING BTREE,
  INDEX `kd_dokter`(`kd_dokter`) USING BTREE,
  INDEX `status_bayar`(`status_bayar`) USING BTREE,
  CONSTRAINT `reg_periksa_ibfk_3` FOREIGN KEY (`kd_poli`) REFERENCES `poliklinik` (`kd_poli`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reg_periksa_ibfk_4` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reg_periksa_ibfk_6` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `reg_periksa_ibfk_7` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rekap_presensi
-- ----------------------------
DROP TABLE IF EXISTS `rekap_presensi`;
CREATE TABLE `rekap_presensi`  (
  `id` int(10) NOT NULL,
  `shift` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jam_datang` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `jam_pulang` datetime(0) NULL DEFAULT NULL,
  `status` enum('Tepat Waktu','Terlambat Toleransi','Terlambat I','Terlambat II','Tepat Waktu & PSW','Terlambat Toleransi & PSW','Terlambat I & PSW','Terlambat II & PSW') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterlambatan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `durasi` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keterangan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `photo` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`, `jam_datang`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  CONSTRAINT `rekap_presensi_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rekening
-- ----------------------------
DROP TABLE IF EXISTS `rekening`;
CREATE TABLE `rekening`  (
  `kd_rek` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nm_rek` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tipe` enum('N','M','R') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `balance` enum('D','K') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `level` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kd_rek`) USING BTREE,
  INDEX `nm_rek`(`nm_rek`) USING BTREE,
  INDEX `tipe`(`tipe`) USING BTREE,
  INDEX `balance`(`balance`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rekeningtahun
-- ----------------------------
DROP TABLE IF EXISTS `rekeningtahun`;
CREATE TABLE `rekeningtahun`  (
  `thn` year NOT NULL,
  `kd_rek` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `saldo_awal` double NOT NULL,
  PRIMARY KEY (`thn`, `kd_rek`) USING BTREE,
  INDEX `kd_rek`(`kd_rek`) USING BTREE,
  INDEX `saldo_awal`(`saldo_awal`) USING BTREE,
  CONSTRAINT `rekeningtahun_ibfk_1` FOREIGN KEY (`kd_rek`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for resep_dokter
-- ----------------------------
DROP TABLE IF EXISTS `resep_dokter`;
CREATE TABLE `resep_dokter`  (
  `no_resep` varchar(14) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jml` double NULL DEFAULT NULL,
  `aturan_pakai` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  INDEX `no_resep`(`no_resep`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  CONSTRAINT `resep_dokter_ibfk_1` FOREIGN KEY (`no_resep`) REFERENCES `resep_obat` (`no_resep`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `resep_dokter_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for resep_dokter_racikan
-- ----------------------------
DROP TABLE IF EXISTS `resep_dokter_racikan`;
CREATE TABLE `resep_dokter_racikan`  (
  `no_resep` varchar(14) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_racik` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_racik` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_racik` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jml_dr` int(11) NOT NULL,
  `aturan_pakai` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_resep`, `no_racik`) USING BTREE,
  INDEX `kd_racik`(`kd_racik`) USING BTREE,
  CONSTRAINT `resep_dokter_racikan_ibfk_1` FOREIGN KEY (`no_resep`) REFERENCES `resep_obat` (`no_resep`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `resep_dokter_racikan_ibfk_2` FOREIGN KEY (`kd_racik`) REFERENCES `metode_racik` (`kd_racik`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for resep_dokter_racikan_detail
-- ----------------------------
DROP TABLE IF EXISTS `resep_dokter_racikan_detail`;
CREATE TABLE `resep_dokter_racikan_detail`  (
  `no_resep` varchar(14) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_racik` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `p1` double NULL DEFAULT NULL,
  `p2` double NULL DEFAULT NULL,
  `kandungan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jml` double NULL DEFAULT NULL,
  PRIMARY KEY (`no_resep`, `no_racik`, `kode_brng`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  CONSTRAINT `resep_dokter_racikan_detail_ibfk_1` FOREIGN KEY (`no_resep`) REFERENCES `resep_obat` (`no_resep`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `resep_dokter_racikan_detail_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for resep_obat
-- ----------------------------
DROP TABLE IF EXISTS `resep_obat`;
CREATE TABLE `resep_obat`  (
  `no_resep` varchar(14) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tgl_perawatan` date NULL DEFAULT NULL,
  `jam` time(0) NOT NULL,
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_peresepan` date NULL DEFAULT NULL,
  `jam_peresepan` time(0) NULL DEFAULT NULL,
  `status` enum('ralan','ranap') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_resep`) USING BTREE,
  UNIQUE INDEX `tgl_perawatan`(`tgl_perawatan`, `jam`, `no_rawat`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `kd_dokter`(`kd_dokter`) USING BTREE,
  CONSTRAINT `resep_obat_ibfk_3` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `resep_obat_ibfk_4` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for resep_pulang
-- ----------------------------
DROP TABLE IF EXISTS `resep_pulang`;
CREATE TABLE `resep_pulang`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jml_barang` double NOT NULL,
  `harga` double NOT NULL,
  `total` double NOT NULL,
  `dosis` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time(0) NOT NULL,
  `kd_bangsal` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_batch` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `kode_brng`, `tanggal`, `jam`, `no_batch`, `no_faktur`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `kd_bangsal`(`kd_bangsal`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  CONSTRAINT `resep_pulang_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `resep_pulang_ibfk_3` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `resep_pulang_ibfk_4` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for resiko_kerja
-- ----------------------------
DROP TABLE IF EXISTS `resiko_kerja`;
CREATE TABLE `resiko_kerja`  (
  `kode_resiko` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_resiko` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `indek` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`kode_resiko`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for resume_pasien
-- ----------------------------
DROP TABLE IF EXISTS `resume_pasien`;
CREATE TABLE `resume_pasien`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keluhan_utama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jalannya_penyakit` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan_penunjang` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hasil_laborat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `diagnosa_utama` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_diagnosa_utama` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `diagnosa_sekunder` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_diagnosa_sekunder` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `diagnosa_sekunder2` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_diagnosa_sekunder2` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `diagnosa_sekunder3` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_diagnosa_sekunder3` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `diagnosa_sekunder4` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_diagnosa_sekunder4` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `prosedur_utama` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_prosedur_utama` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `prosedur_sekunder` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_prosedur_sekunder` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `prosedur_sekunder2` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_prosedur_sekunder2` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `prosedur_sekunder3` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_prosedur_sekunder3` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kondisi_pulang` enum('Hidup','Meninggal') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `obat_pulang` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  INDEX `kd_dokter`(`kd_dokter`) USING BTREE,
  CONSTRAINT `resume_pasien_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `resume_pasien_ibfk_2` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for retensi_pasien
-- ----------------------------
DROP TABLE IF EXISTS `retensi_pasien`;
CREATE TABLE `retensi_pasien`  (
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `terakhir_daftar` date NULL DEFAULT NULL,
  `tgl_retensi` date NULL DEFAULT NULL,
  `lokasi_pdf` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  INDEX `no_rkm_medis`(`no_rkm_medis`) USING BTREE,
  CONSTRAINT `retensi_pasien_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for returbeli
-- ----------------------------
DROP TABLE IF EXISTS `returbeli`;
CREATE TABLE `returbeli`  (
  `no_retur_beli` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_retur` date NULL DEFAULT NULL,
  `nip` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_suplier` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_bangsal` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_retur_beli`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  INDEX `kode_suplier`(`kode_suplier`) USING BTREE,
  INDEX `kd_bangsal`(`kd_bangsal`) USING BTREE,
  CONSTRAINT `returbeli_ibfk_2` FOREIGN KEY (`kode_suplier`) REFERENCES `datasuplier` (`kode_suplier`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `returbeli_ibfk_3` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `returbeli_ibfk_4` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for returjual
-- ----------------------------
DROP TABLE IF EXISTS `returjual`;
CREATE TABLE `returjual`  (
  `no_retur_jual` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_retur` date NULL DEFAULT NULL,
  `nip` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_bangsal` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_retur_jual`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  INDEX `no_rkm_medis`(`no_rkm_medis`) USING BTREE,
  INDEX `kd_bangsal`(`kd_bangsal`) USING BTREE,
  INDEX `tgl_retur`(`tgl_retur`) USING BTREE,
  CONSTRAINT `returjual_ibfk_6` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `returjual_ibfk_7` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `returjual_ibfk_8` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for returpasien
-- ----------------------------
DROP TABLE IF EXISTS `returpasien`;
CREATE TABLE `returpasien`  (
  `tanggal` date NOT NULL,
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jml` double NOT NULL,
  `no_batch` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`tanggal`, `no_rawat`, `kode_brng`, `no_batch`, `no_faktur`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  CONSTRAINT `returpasien_ibfk_3` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `returpasien_ibfk_4` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for returpiutang
-- ----------------------------
DROP TABLE IF EXISTS `returpiutang`;
CREATE TABLE `returpiutang`  (
  `no_retur_piutang` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_retur` date NULL DEFAULT NULL,
  `nip` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_bangsal` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_retur_piutang`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  INDEX `no_rkm_medis`(`no_rkm_medis`) USING BTREE,
  INDEX `kd_bangsal`(`kd_bangsal`) USING BTREE,
  CONSTRAINT `returpiutang_ibfk_3` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `returpiutang_ibfk_4` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `returpiutang_ibfk_5` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for riwayat_barang_medis
-- ----------------------------
DROP TABLE IF EXISTS `riwayat_barang_medis`;
CREATE TABLE `riwayat_barang_medis`  (
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `stok_awal` double NULL DEFAULT NULL,
  `masuk` double NULL DEFAULT NULL,
  `keluar` double NULL DEFAULT NULL,
  `stok_akhir` double NOT NULL,
  `posisi` enum('Pemberian Obat','Pengadaan','Penerimaan','Piutang','Retur Beli','Retur Jual','Retur Piutang','Mutasi','Opname','Resep Pulang','Retur Pasien','Stok Pasien Ranap','Pengambilan Medis','Penjualan','Stok Keluar','Hibah') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `jam` time(0) NULL DEFAULT NULL,
  `petugas` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_bangsal` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` enum('Simpan','Hapus') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_batch` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  INDEX `riwayat_barang_medis_ibfk_1`(`kode_brng`) USING BTREE,
  INDEX `kd_bangsal`(`kd_bangsal`) USING BTREE,
  CONSTRAINT `riwayat_barang_medis_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `riwayat_barang_medis_ibfk_2` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for riwayat_imunisasi
-- ----------------------------
DROP TABLE IF EXISTS `riwayat_imunisasi`;
CREATE TABLE `riwayat_imunisasi`  (
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_imunisasi` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_imunisasi` tinyint(4) NOT NULL,
  PRIMARY KEY (`no_rkm_medis`, `kode_imunisasi`, `no_imunisasi`) USING BTREE,
  INDEX `kode_imunisasi`(`kode_imunisasi`) USING BTREE,
  CONSTRAINT `riwayat_imunisasi_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `riwayat_imunisasi_ibfk_2` FOREIGN KEY (`kode_imunisasi`) REFERENCES `master_imunisasi` (`kode_imunisasi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for riwayat_jabatan
-- ----------------------------
DROP TABLE IF EXISTS `riwayat_jabatan`;
CREATE TABLE `riwayat_jabatan`  (
  `id` int(11) NOT NULL,
  `jabatan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tmt_pangkat` date NOT NULL,
  `tmt_pangkat_yad` date NOT NULL,
  `pejabat_penetap` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nomor_sk` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_sk` date NOT NULL,
  `dasar_peraturan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `masa_kerja` int(11) NOT NULL,
  `bln_kerja` int(11) NOT NULL,
  `berkas` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`, `jabatan`) USING BTREE,
  INDEX `jnj_jabatan`(`jabatan`) USING BTREE,
  CONSTRAINT `riwayat_jabatan_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for riwayat_naik_gaji
-- ----------------------------
DROP TABLE IF EXISTS `riwayat_naik_gaji`;
CREATE TABLE `riwayat_naik_gaji`  (
  `id` int(11) NOT NULL,
  `pangkatjabatan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `gapok` double NOT NULL,
  `tmt_berkala` date NOT NULL,
  `tmt_berkala_yad` date NOT NULL,
  `no_sk` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_sk` date NOT NULL,
  `masa_kerja` int(11) NOT NULL,
  `bulan_kerja` int(11) NOT NULL,
  `berkas` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`, `pangkatjabatan`, `gapok`) USING BTREE,
  CONSTRAINT `riwayat_naik_gaji_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for riwayat_pendidikan
-- ----------------------------
DROP TABLE IF EXISTS `riwayat_pendidikan`;
CREATE TABLE `riwayat_pendidikan`  (
  `id` int(11) NOT NULL,
  `pendidikan` enum('SD','SMP','SMA','SMK','D I','D II','D III','D IV','S1','S2','S3','Post Doctor') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sekolah` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jurusan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `thn_lulus` year NOT NULL,
  `kepala` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pendanaan` enum('Biaya Sendiri','Biaya Instansi Sendiri','Lembaga Swasta Kerjasama','Lembaga Swasta Kompetisi','Lembaga Pemerintah Kerjasama','Lembaga Pemerintah Kompetisi','Lembaga Internasional') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `berkas` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`, `pendidikan`, `sekolah`) USING BTREE,
  CONSTRAINT `riwayat_pendidikan_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for riwayat_penelitian
-- ----------------------------
DROP TABLE IF EXISTS `riwayat_penelitian`;
CREATE TABLE `riwayat_penelitian`  (
  `id` int(11) NOT NULL,
  `jenis_penelitian` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `peranan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `judul_penelitian` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `judul_jurnal` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tahun` year NOT NULL,
  `biaya_penelitian` double NULL DEFAULT NULL,
  `asal_dana` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `berkas` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`, `judul_penelitian`, `tahun`) USING BTREE,
  CONSTRAINT `riwayat_penelitian_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for riwayat_penghargaan
-- ----------------------------
DROP TABLE IF EXISTS `riwayat_penghargaan`;
CREATE TABLE `riwayat_penghargaan`  (
  `id` int(11) NOT NULL,
  `jenis` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_penghargaan` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` date NOT NULL,
  `instansi` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pejabat_pemberi` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `berkas` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `nama_penghargaan`, `tanggal`) USING BTREE,
  CONSTRAINT `riwayat_penghargaan_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for riwayat_persalinan_pasien
-- ----------------------------
DROP TABLE IF EXISTS `riwayat_persalinan_pasien`;
CREATE TABLE `riwayat_persalinan_pasien`  (
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_thn` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tempat_persalinan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `usia_hamil` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jenis_persalinan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penolong` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penyulit` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jk` enum('L','P') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bbpb` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keadaan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rkm_medis`, `tgl_thn`) USING BTREE,
  CONSTRAINT `riwayat_persalinan_pasien_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for riwayat_seminar
-- ----------------------------
DROP TABLE IF EXISTS `riwayat_seminar`;
CREATE TABLE `riwayat_seminar`  (
  `id` int(11) NOT NULL,
  `tingkat` enum('Local','Regional','Nasional','Internasional') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jenis` enum('WORKSHOP','SIMPOSIUM','SEMINAR','FGD','PELATIHAN','LAINNYA') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_seminar` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `peranan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mulai` date NOT NULL,
  `selesai` date NOT NULL,
  `penyelengara` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tempat` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `berkas` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`, `nama_seminar`, `mulai`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  CONSTRAINT `riwayat_seminar_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rujuk
-- ----------------------------
DROP TABLE IF EXISTS `rujuk`;
CREATE TABLE `rujuk`  (
  `no_rujuk` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rujuk_ke` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_rujuk` date NULL DEFAULT NULL,
  `keterangan_diagnosa` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kat_rujuk` enum('-','Bedah','Non Bedah','Kebidanan','Anak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ambulance` enum('-','AGD','SENDIRI','SWASTA') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `jam` time(0) NULL DEFAULT NULL,
  INDEX `kd_dokter`(`kd_dokter`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `rujuk_ke`(`rujuk_ke`) USING BTREE,
  CONSTRAINT `rujuk_ibfk_1` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rujuk_ibfk_2` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rujuk_masuk
-- ----------------------------
DROP TABLE IF EXISTS `rujuk_masuk`;
CREATE TABLE `rujuk_masuk`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `perujuk` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alamat` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_rujuk` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jm_perujuk` double NOT NULL,
  `dokter_perujuk` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_penyakit` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kategori_rujuk` enum('-','Bedah','Non-Bedah','Kebidanan','Anak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keterangan` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_balasan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `kd_dokter`(`perujuk`) USING BTREE,
  INDEX `perujuk`(`perujuk`) USING BTREE,
  INDEX `alamat`(`alamat`) USING BTREE,
  INDEX `jm_perujuk`(`jm_perujuk`) USING BTREE,
  INDEX `kd_penyakit`(`kd_penyakit`) USING BTREE,
  INDEX `dokter_perujuk`(`dokter_perujuk`) USING BTREE,
  CONSTRAINT `rujuk_masuk_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rujuk_masuk_ibfk_2` FOREIGN KEY (`kd_penyakit`) REFERENCES `penyakit` (`kd_penyakit`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rujukan_internal_poli
-- ----------------------------
DROP TABLE IF EXISTS `rujukan_internal_poli`;
CREATE TABLE `rujukan_internal_poli`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_poli` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`, `kd_dokter`) USING BTREE,
  INDEX `kd_dokter`(`kd_dokter`) USING BTREE,
  INDEX `kd_poli`(`kd_poli`) USING BTREE,
  CONSTRAINT `rujukan_internal_poli_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rujukan_internal_poli_ibfk_2` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rujukan_internal_poli_ibfk_3` FOREIGN KEY (`kd_poli`) REFERENCES `poliklinik` (`kd_poli`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rujukanranap_dokter_rs
-- ----------------------------
DROP TABLE IF EXISTS `rujukanranap_dokter_rs`;
CREATE TABLE `rujukanranap_dokter_rs`  (
  `tanggal` date NOT NULL,
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_kamar` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jasarujuk` double NOT NULL,
  PRIMARY KEY (`tanggal`, `kd_dokter`, `no_rkm_medis`, `kd_kamar`) USING BTREE,
  INDEX `no_rkm_medis`(`no_rkm_medis`) USING BTREE,
  INDEX `kd_kamar`(`kd_kamar`) USING BTREE,
  INDEX `rujukanranap_dokter_rs_ibfk_1`(`kd_dokter`) USING BTREE,
  CONSTRAINT `rujukanranap_dokter_rs_ibfk_1` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rujukanranap_dokter_rs_ibfk_2` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rujukanranap_dokter_rs_ibfk_3` FOREIGN KEY (`kd_kamar`) REFERENCES `kamar` (`kd_kamar`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for runtext
-- ----------------------------
DROP TABLE IF EXISTS `runtext`;
CREATE TABLE `runtext`  (
  `teks` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `aktifkan` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `gambar` longblob NOT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for runtextapotek
-- ----------------------------
DROP TABLE IF EXISTS `runtextapotek`;
CREATE TABLE `runtextapotek`  (
  `teks` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `aktifkan` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `gambar` longblob NOT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rvp_klaim_bpjs
-- ----------------------------
DROP TABLE IF EXISTS `rvp_klaim_bpjs`;
CREATE TABLE `rvp_klaim_bpjs`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal_rvp` date NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `totalpiutang` double NULL DEFAULT NULL,
  `uangmuka` double NULL DEFAULT NULL,
  `sudahdibayar` double NULL DEFAULT NULL,
  `sisapiutang` double NULL DEFAULT NULL,
  `tarifinacbg` double NULL DEFAULT NULL,
  `dibayarbpjs` double NULL DEFAULT NULL,
  `persenbayar` double NULL DEFAULT NULL,
  `rugi` double NULL DEFAULT NULL,
  `lebih` double NULL DEFAULT NULL,
  `materialralan` double NULL DEFAULT NULL,
  `bhpralan` double NULL DEFAULT NULL,
  `tarif_tindakandrralan` double NULL DEFAULT NULL,
  `tarif_tindakanprralan` double NULL DEFAULT NULL,
  `ksoralan` double NULL DEFAULT NULL,
  `menejemenralan` double NULL DEFAULT NULL,
  `biaya_rawatralan` double NULL DEFAULT NULL,
  `materialranap` double NULL DEFAULT NULL,
  `bhpranap` double NULL DEFAULT NULL,
  `tarif_tindakandrranap` double NULL DEFAULT NULL,
  `tarif_tindakanprranap` double NULL DEFAULT NULL,
  `ksoranap` double NULL DEFAULT NULL,
  `menejemenranap` double NULL DEFAULT NULL,
  `biaya_rawatranap` double NULL DEFAULT NULL,
  `bagian_rslabralan` double NULL DEFAULT NULL,
  `bhplabralan` double NULL DEFAULT NULL,
  `tarif_perujuklabralan` double NULL DEFAULT NULL,
  `tarif_tindakan_dokterlabralan` double NULL DEFAULT NULL,
  `tarif_tindakan_petugaslabralan` double NULL DEFAULT NULL,
  `ksolabralan` double NULL DEFAULT NULL,
  `menejemenlabralan` double NULL DEFAULT NULL,
  `biayalabralan` double NULL DEFAULT NULL,
  `bagian_rslabranap` double NULL DEFAULT NULL,
  `bhplabranap` double NULL DEFAULT NULL,
  `tarif_perujuklabranap` double NULL DEFAULT NULL,
  `tarif_tindakan_dokterlabranap` double NULL DEFAULT NULL,
  `tarif_tindakan_petugaslabranap` double NULL DEFAULT NULL,
  `ksolabranap` double NULL DEFAULT NULL,
  `menejemenlabranap` double NULL DEFAULT NULL,
  `biayalabranap` double NULL DEFAULT NULL,
  `bagian_rsradiologiralan` double NULL DEFAULT NULL,
  `bhpradiologiralan` double NULL DEFAULT NULL,
  `tarif_perujukradiologiralan` double NULL DEFAULT NULL,
  `tarif_tindakan_dokterradiologiralan` double NULL DEFAULT NULL,
  `tarif_tindakan_petugasradiologiralan` double NULL DEFAULT NULL,
  `ksoradiologiralan` double NULL DEFAULT NULL,
  `menejemenradiologiralan` double NULL DEFAULT NULL,
  `biayaradiologiralan` double NULL DEFAULT NULL,
  `bagian_rsradiologiranap` double NULL DEFAULT NULL,
  `bhpradiologiranap` double NULL DEFAULT NULL,
  `tarif_perujukradiologiranap` double NULL DEFAULT NULL,
  `tarif_tindakan_dokterradiologiranap` double NULL DEFAULT NULL,
  `tarif_tindakan_petugasradiologiranap` double NULL DEFAULT NULL,
  `ksoradiologiranap` double NULL DEFAULT NULL,
  `menejemenradiologiranap` double NULL DEFAULT NULL,
  `biayaradiologiranap` double NULL DEFAULT NULL,
  `jmdokteroperasiralan` double NULL DEFAULT NULL,
  `jmparamedisoperasiralan` double NULL DEFAULT NULL,
  `bhpoperasiralan` double NULL DEFAULT NULL,
  `pendapatanoperasiralan` double NULL DEFAULT NULL,
  `jmdokteroperasiranap` double NULL DEFAULT NULL,
  `jmparamedisoperasiranap` double NULL DEFAULT NULL,
  `bhpoperasiranap` double NULL DEFAULT NULL,
  `pendapatanoperasiranap` double NULL DEFAULT NULL,
  `obatlangsung` double NULL DEFAULT NULL,
  `obatralan` double NULL DEFAULT NULL,
  `hppobatralan` double NULL DEFAULT NULL,
  `obatranap` double NULL DEFAULT NULL,
  `hppobatranap` double NULL DEFAULT NULL,
  `returobat` double NULL DEFAULT NULL,
  `tambahanbiaya` double NULL DEFAULT NULL,
  `potonganbiaya` double NULL DEFAULT NULL,
  `kamar` double NULL DEFAULT NULL,
  `reseppulang` double NULL DEFAULT NULL,
  `harianranap` double NULL DEFAULT NULL,
  `registrasi` double NULL DEFAULT NULL,
  `no_sep` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_rek` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_rek_kontra` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `service` double NOT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  INDEX `kd_rek`(`kd_rek`) USING BTREE,
  INDEX `kd_rek_kontra`(`kd_rek_kontra`) USING BTREE,
  CONSTRAINT `rvp_klaim_bpjs_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rvp_klaim_bpjs_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rvp_klaim_bpjs_ibfk_3` FOREIGN KEY (`kd_rek`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rvp_klaim_bpjs_ibfk_4` FOREIGN KEY (`kd_rek_kontra`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for saran_kesan_lab
-- ----------------------------
DROP TABLE IF EXISTS `saran_kesan_lab`;
CREATE TABLE `saran_kesan_lab`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_periksa` date NOT NULL,
  `jam` time(0) NOT NULL,
  `saran` varchar(700) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kesan` varchar(700) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`, `tgl_periksa`, `jam`) USING BTREE,
  CONSTRAINT `saran_kesan_lab_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for satuan_polri
-- ----------------------------
DROP TABLE IF EXISTS `satuan_polri`;
CREATE TABLE `satuan_polri`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_satuan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for satuan_tni
-- ----------------------------
DROP TABLE IF EXISTS `satuan_tni`;
CREATE TABLE `satuan_tni`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_satuan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_akte
-- ----------------------------
DROP TABLE IF EXISTS `set_akte`;
CREATE TABLE `set_akte`  (
  `tahun` year NOT NULL,
  `bulan` tinyint(4) NOT NULL,
  `pendapatan_akte` double NOT NULL,
  `persen_rs` double NOT NULL,
  `bagian_rs` double NOT NULL,
  `persen_kry` double NOT NULL,
  `bagian_kry` double NOT NULL,
  PRIMARY KEY (`tahun`, `bulan`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_akun
-- ----------------------------
DROP TABLE IF EXISTS `set_akun`;
CREATE TABLE `set_akun`  (
  `Pengadaan_Obat` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Pemesanan_Obat` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Kontra_Pemesanan_Obat` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Bayar_Pemesanan_Obat` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Penjualan_Obat` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Piutang_Obat` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Kontra_Piutang_Obat` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Retur_Ke_Suplayer` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Kontra_Retur_Ke_Suplayer` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Retur_Dari_pembeli` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Kontra_Retur_Dari_Pembeli` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Retur_Piutang_Obat` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Kontra_Retur_Piutang_Obat` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Pengadaan_Ipsrs` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Stok_Keluar_Ipsrs` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Kontra_Stok_Keluar_Ipsrs` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Bayar_Piutang_Pasien` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Pengambilan_Utd` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Kontra_Pengambilan_Utd` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Pengambilan_Penunjang_Utd` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Kontra_Pengambilan_Penunjang_Utd` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Penyerahan_Darah` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Stok_Keluar_Medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Kontra_Stok_Keluar_Medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `HPP_Obat_Jual_Bebas` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Persediaan_Obat_Jual_Bebas` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Penerimaan_NonMedis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Kontra_Penerimaan_NonMedis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Bayar_Pemesanan_Non_Medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Hibah_Obat` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Kontra_Hibah_Obat` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Penerimaan_Toko` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Kontra_Penerimaan_Toko` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Pengadaan_Toko` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Bayar_Pemesanan_Toko` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Penjualan_Toko` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `HPP_Barang_Toko` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Persediaan_Barang_Toko` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Piutang_Toko` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Kontra_Piutang_Toko` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Retur_Beli_Toko` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Kontra_Retur_Beli_Toko` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Retur_Beli_Non_Medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Kontra_Retur_Beli_Non_Medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Retur_Jual_Toko` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Kontra_Retur_Jual_Toko` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Retur_Piutang_Toko` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Kontra_Retur_Piutang_Toko` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Kerugian_Klaim_BPJS_RVP` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Lebih_Bayar_Klaim_BPJS_RVP` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Piutang_BPJS_RVP` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  INDEX `Pengadaan_Obat`(`Pengadaan_Obat`) USING BTREE,
  INDEX `Pemesanan_Obat`(`Pemesanan_Obat`) USING BTREE,
  INDEX `Kontra_Pemesanan_Obat`(`Kontra_Pemesanan_Obat`) USING BTREE,
  INDEX `Bayar_Pemesanan_Obat`(`Bayar_Pemesanan_Obat`) USING BTREE,
  INDEX `Penjualan_Obat`(`Penjualan_Obat`) USING BTREE,
  INDEX `Piutang_Obat`(`Piutang_Obat`) USING BTREE,
  INDEX `Kontra_Piutang_Obat`(`Kontra_Piutang_Obat`) USING BTREE,
  INDEX `Retur_Ke_Suplayer`(`Retur_Ke_Suplayer`) USING BTREE,
  INDEX `Kontra_Retur_Ke_Suplayer`(`Kontra_Retur_Ke_Suplayer`) USING BTREE,
  INDEX `Retur_Dari_pembeli`(`Retur_Dari_pembeli`) USING BTREE,
  INDEX `Kontra_Retur_Dari_Pembeli`(`Kontra_Retur_Dari_Pembeli`) USING BTREE,
  INDEX `Retur_Piutang_Obat`(`Retur_Piutang_Obat`) USING BTREE,
  INDEX `Kontra_Retur_Piutang_Obat`(`Kontra_Retur_Piutang_Obat`) USING BTREE,
  INDEX `Pengadaan_Ipsrs`(`Pengadaan_Ipsrs`) USING BTREE,
  INDEX `Stok_Keluar_Ipsrs`(`Stok_Keluar_Ipsrs`) USING BTREE,
  INDEX `Kontra_Stok_Keluar_Ipsrs`(`Kontra_Stok_Keluar_Ipsrs`) USING BTREE,
  INDEX `Bayar_Piutang_Pasien`(`Bayar_Piutang_Pasien`) USING BTREE,
  INDEX `Pengambilan_Utd`(`Pengambilan_Utd`) USING BTREE,
  INDEX `Kontra_Pengambilan_Utd`(`Kontra_Pengambilan_Utd`) USING BTREE,
  INDEX `Pengambilan_Penunjang_Utd`(`Pengambilan_Penunjang_Utd`) USING BTREE,
  INDEX `Kontra_Pengambilan_Penunjang_Utd`(`Kontra_Pengambilan_Penunjang_Utd`) USING BTREE,
  INDEX `Penyerahan_Darah`(`Penyerahan_Darah`) USING BTREE,
  INDEX `Stok_Keluar_Medis`(`Stok_Keluar_Medis`) USING BTREE,
  INDEX `Kontra_Stok_Keluar_Medis`(`Kontra_Stok_Keluar_Medis`) USING BTREE,
  INDEX `HPP_Obat_Jual_Bebas`(`HPP_Obat_Jual_Bebas`) USING BTREE,
  INDEX `Persediaan_Obat_Jual_Bebas`(`Persediaan_Obat_Jual_Bebas`) USING BTREE,
  INDEX `Penerimaan_NonMedis`(`Penerimaan_NonMedis`) USING BTREE,
  INDEX `Kontra_Penerimaan_NonMedis`(`Kontra_Penerimaan_NonMedis`) USING BTREE,
  INDEX `Bayar_Pemesanan_Non_Medis`(`Bayar_Pemesanan_Non_Medis`) USING BTREE,
  INDEX `Hibah_Obat`(`Hibah_Obat`) USING BTREE,
  INDEX `Kontra_Hibah_Obat`(`Kontra_Hibah_Obat`) USING BTREE,
  INDEX `Penerimaan_Toko`(`Penerimaan_Toko`) USING BTREE,
  INDEX `Kontra_Penerimaan_Toko`(`Kontra_Penerimaan_Toko`) USING BTREE,
  INDEX `Pengadaan_Toko`(`Pengadaan_Toko`) USING BTREE,
  INDEX `Bayar_Pemesanan_Toko`(`Bayar_Pemesanan_Toko`) USING BTREE,
  INDEX `Penjualan_Toko`(`Penjualan_Toko`) USING BTREE,
  INDEX `HPP_Barang_Toko`(`HPP_Barang_Toko`) USING BTREE,
  INDEX `Persediaan_Barang_Toko`(`Persediaan_Barang_Toko`) USING BTREE,
  INDEX `Piutang_Toko`(`Piutang_Toko`) USING BTREE,
  INDEX `Kontra_Piutang_Toko`(`Kontra_Piutang_Toko`) USING BTREE,
  INDEX `Retur_Beli_Toko`(`Retur_Beli_Toko`) USING BTREE,
  INDEX `Kontra_Retur_Beli_Toko`(`Kontra_Retur_Beli_Toko`) USING BTREE,
  INDEX `Retur_Beli_Non_Medis`(`Retur_Beli_Non_Medis`) USING BTREE,
  INDEX `Kontra_Retur_Beli_Non_Medis`(`Kontra_Retur_Beli_Non_Medis`) USING BTREE,
  INDEX `Retur_Jual_Toko`(`Retur_Jual_Toko`) USING BTREE,
  INDEX `Kontra_Retur_Jual_Toko`(`Kontra_Retur_Jual_Toko`) USING BTREE,
  INDEX `Retur_Piutang_Toko`(`Retur_Piutang_Toko`) USING BTREE,
  INDEX `Kontra_Retur_Piutang_Toko`(`Kontra_Retur_Piutang_Toko`) USING BTREE,
  INDEX `Kerugian_Klaim_BPJS`(`Kerugian_Klaim_BPJS_RVP`) USING BTREE,
  INDEX `Lebih_Bayar_Klaim_BPJS`(`Lebih_Bayar_Klaim_BPJS_RVP`) USING BTREE,
  INDEX `Piutang_BPJS_RVP`(`Piutang_BPJS_RVP`) USING BTREE,
  CONSTRAINT `set_akun_ibfk_1` FOREIGN KEY (`Pengadaan_Obat`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_10` FOREIGN KEY (`Retur_Dari_pembeli`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_11` FOREIGN KEY (`Kontra_Retur_Dari_Pembeli`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_12` FOREIGN KEY (`Retur_Piutang_Obat`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_13` FOREIGN KEY (`Kontra_Retur_Piutang_Obat`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_14` FOREIGN KEY (`Pengadaan_Ipsrs`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_15` FOREIGN KEY (`Stok_Keluar_Ipsrs`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_16` FOREIGN KEY (`Kontra_Stok_Keluar_Ipsrs`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_17` FOREIGN KEY (`Bayar_Piutang_Pasien`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_18` FOREIGN KEY (`Pengambilan_Utd`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_19` FOREIGN KEY (`Kontra_Pengambilan_Utd`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_2` FOREIGN KEY (`Pemesanan_Obat`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_20` FOREIGN KEY (`Pengambilan_Penunjang_Utd`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_21` FOREIGN KEY (`Kontra_Pengambilan_Penunjang_Utd`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_22` FOREIGN KEY (`Penyerahan_Darah`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_23` FOREIGN KEY (`Stok_Keluar_Medis`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_24` FOREIGN KEY (`Kontra_Stok_Keluar_Medis`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_25` FOREIGN KEY (`HPP_Obat_Jual_Bebas`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_26` FOREIGN KEY (`Persediaan_Obat_Jual_Bebas`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_27` FOREIGN KEY (`Penerimaan_NonMedis`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_28` FOREIGN KEY (`Kontra_Penerimaan_NonMedis`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_29` FOREIGN KEY (`Bayar_Pemesanan_Non_Medis`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_3` FOREIGN KEY (`Kontra_Pemesanan_Obat`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_30` FOREIGN KEY (`Hibah_Obat`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_31` FOREIGN KEY (`Kontra_Hibah_Obat`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_32` FOREIGN KEY (`Penerimaan_Toko`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_33` FOREIGN KEY (`Kontra_Penerimaan_Toko`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_34` FOREIGN KEY (`Pengadaan_Toko`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_35` FOREIGN KEY (`Bayar_Pemesanan_Toko`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_36` FOREIGN KEY (`Penjualan_Toko`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_37` FOREIGN KEY (`HPP_Barang_Toko`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_38` FOREIGN KEY (`Persediaan_Barang_Toko`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_39` FOREIGN KEY (`Piutang_Toko`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_4` FOREIGN KEY (`Bayar_Pemesanan_Obat`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_40` FOREIGN KEY (`Kontra_Piutang_Toko`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_41` FOREIGN KEY (`Retur_Beli_Toko`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_42` FOREIGN KEY (`Kontra_Retur_Beli_Toko`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_43` FOREIGN KEY (`Retur_Beli_Non_Medis`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_44` FOREIGN KEY (`Kontra_Retur_Beli_Non_Medis`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_45` FOREIGN KEY (`Retur_Jual_Toko`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_46` FOREIGN KEY (`Kontra_Retur_Jual_Toko`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_47` FOREIGN KEY (`Retur_Piutang_Toko`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_48` FOREIGN KEY (`Kontra_Retur_Piutang_Toko`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_49` FOREIGN KEY (`Kerugian_Klaim_BPJS_RVP`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_5` FOREIGN KEY (`Penjualan_Obat`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_50` FOREIGN KEY (`Lebih_Bayar_Klaim_BPJS_RVP`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_51` FOREIGN KEY (`Piutang_BPJS_RVP`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_6` FOREIGN KEY (`Piutang_Obat`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_7` FOREIGN KEY (`Kontra_Piutang_Obat`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_8` FOREIGN KEY (`Retur_Ke_Suplayer`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ibfk_9` FOREIGN KEY (`Kontra_Retur_Ke_Suplayer`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_akun_bankbri
-- ----------------------------
DROP TABLE IF EXISTS `set_akun_bankbri`;
CREATE TABLE `set_akun_bankbri`  (
  `kd_rek` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `consumer_key` varchar(700) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `consumer_secret` varchar(700) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `institution_code` varchar(700) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `briva_no` varchar(700) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `urlapi` varchar(700) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd_rek`) USING BTREE,
  CONSTRAINT `set_akun_bankbri_ibfk_1` FOREIGN KEY (`kd_rek`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_akun_bankjateng
-- ----------------------------
DROP TABLE IF EXISTS `set_akun_bankjateng`;
CREATE TABLE `set_akun_bankjateng`  (
  `kd_rek` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `usere` varchar(700) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `passworde` varchar(700) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kd_rek`) USING BTREE,
  UNIQUE INDEX `usere`(`usere`, `passworde`) USING BTREE,
  CONSTRAINT `set_akun_bankjateng_ibfk_1` FOREIGN KEY (`kd_rek`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_akun_ralan
-- ----------------------------
DROP TABLE IF EXISTS `set_akun_ralan`;
CREATE TABLE `set_akun_ralan`  (
  `Suspen_Piutang_Tindakan_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Tindakan_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Beban_Jasa_Medik_Dokter_Tindakan_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Utang_Jasa_Medik_Dokter_Tindakan_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Beban_Jasa_Medik_Paramedis_Tindakan_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Utang_Jasa_Medik_Paramedis_Tindakan_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Beban_KSO_Tindakan_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_KSO_Tindakan_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Beban_Jasa_Sarana_Tindakan_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Utang_Jasa_Sarana_Tindakan_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `HPP_BHP_Tindakan_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Persediaan_BHP_Tindakan_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Beban_Jasa_Menejemen_Tindakan_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Utang_Jasa_Menejemen_Tindakan_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Suspen_Piutang_Laborat_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Laborat_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Beban_Jasa_Medik_Dokter_Laborat_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Utang_Jasa_Medik_Dokter_Laborat_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Beban_Jasa_Medik_Petugas_Laborat_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Utang_Jasa_Medik_Petugas_Laborat_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Beban_Kso_Laborat_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Utang_Kso_Laborat_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `HPP_Persediaan_Laborat_Rawat_Jalan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Persediaan_BHP_Laborat_Rawat_Jalan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Beban_Jasa_Sarana_Laborat_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_Jasa_Sarana_Laborat_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Beban_Jasa_Perujuk_Laborat_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_Jasa_Perujuk_Laborat_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Beban_Jasa_Menejemen_Laborat_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_Jasa_Menejemen_Laborat_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Suspen_Piutang_Radiologi_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Radiologi_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Beban_Jasa_Medik_Dokter_Radiologi_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_Jasa_Medik_Dokter_Radiologi_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Beban_Jasa_Medik_Petugas_Radiologi_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_Jasa_Medik_Petugas_Radiologi_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Beban_Kso_Radiologi_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_Kso_Radiologi_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `HPP_Persediaan_Radiologi_Rawat_Jalan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Persediaan_BHP_Radiologi_Rawat_Jalan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Beban_Jasa_Sarana_Radiologi_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_Jasa_Sarana_Radiologi_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Beban_Jasa_Perujuk_Radiologi_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_Jasa_Perujuk_Radiologi_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Beban_Jasa_Menejemen_Radiologi_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_Jasa_Menejemen_Radiologi_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Suspen_Piutang_Obat_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Obat_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `HPP_Obat_Rawat_Jalan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Persediaan_Obat_Rawat_Jalan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Registrasi_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Suspen_Piutang_Operasi_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Operasi_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Beban_Jasa_Medik_Dokter_Operasi_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_Jasa_Medik_Dokter_Operasi_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Beban_Jasa_Medik_Paramedis_Operasi_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_Jasa_Medik_Paramedis_Operasi_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `HPP_Obat_Operasi_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Persediaan_Obat_Kamar_Operasi_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Tambahan_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Potongan_Ralan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  INDEX `Tindakan_Ralan`(`Tindakan_Ralan`) USING BTREE,
  INDEX `Beban_Jasa_Medik_Dokter_Tindakan_Ralan`(`Beban_Jasa_Medik_Dokter_Tindakan_Ralan`) USING BTREE,
  INDEX `Utang_Jasa_Medik_Dokter_Tindakan_Ralan`(`Utang_Jasa_Medik_Dokter_Tindakan_Ralan`) USING BTREE,
  INDEX `Beban_Jasa_Medik_Paramedis_Tindakan_Ralan`(`Beban_Jasa_Medik_Paramedis_Tindakan_Ralan`) USING BTREE,
  INDEX `Utang_Jasa_Medik_Paramedis_Tindakan_Ralan`(`Utang_Jasa_Medik_Paramedis_Tindakan_Ralan`) USING BTREE,
  INDEX `Beban_KSO_Tindakan_Ralan`(`Beban_KSO_Tindakan_Ralan`) USING BTREE,
  INDEX `Utang_KSO_Tindakan_Ralan`(`Utang_KSO_Tindakan_Ralan`) USING BTREE,
  INDEX `Laborat_Ralan`(`Laborat_Ralan`) USING BTREE,
  INDEX `Beban_Jasa_Medik_Dokter_Laborat_Ralan`(`Beban_Jasa_Medik_Dokter_Laborat_Ralan`) USING BTREE,
  INDEX `Utang_Jasa_Medik_Dokter_Laborat_Ralan`(`Utang_Jasa_Medik_Dokter_Laborat_Ralan`) USING BTREE,
  INDEX `Beban_Jasa_Medik_Petugas_Laborat_Ralan`(`Beban_Jasa_Medik_Petugas_Laborat_Ralan`) USING BTREE,
  INDEX `Utang_Jasa_Medik_Petugas_Laborat_Ralan`(`Utang_Jasa_Medik_Petugas_Laborat_Ralan`) USING BTREE,
  INDEX `Beban_Kso_Laborat_Ralan`(`Beban_Kso_Laborat_Ralan`) USING BTREE,
  INDEX `Utang_Kso_Laborat_Ralan`(`Utang_Kso_Laborat_Ralan`) USING BTREE,
  INDEX `HPP_Persediaan_Laborat_Rawat_Jalan`(`HPP_Persediaan_Laborat_Rawat_Jalan`) USING BTREE,
  INDEX `Persediaan_BHP_Laborat_Rawat_Jalan`(`Persediaan_BHP_Laborat_Rawat_Jalan`) USING BTREE,
  INDEX `Radiologi_Ralan`(`Radiologi_Ralan`) USING BTREE,
  INDEX `Beban_Jasa_Medik_Dokter_Radiologi_Ralan`(`Beban_Jasa_Medik_Dokter_Radiologi_Ralan`) USING BTREE,
  INDEX `Utang_Jasa_Medik_Dokter_Radiologi_Ralan`(`Utang_Jasa_Medik_Dokter_Radiologi_Ralan`) USING BTREE,
  INDEX `Beban_Jasa_Medik_Petugas_Radiologi_Ralan`(`Beban_Jasa_Medik_Petugas_Radiologi_Ralan`) USING BTREE,
  INDEX `Utang_Jasa_Medik_Petugas_Radiologi_Ralan`(`Utang_Jasa_Medik_Petugas_Radiologi_Ralan`) USING BTREE,
  INDEX `Beban_Kso_Radiologi_Ralan`(`Beban_Kso_Radiologi_Ralan`) USING BTREE,
  INDEX `Utang_Kso_Radiologi_Ralan`(`Utang_Kso_Radiologi_Ralan`) USING BTREE,
  INDEX `HPP_Persediaan_Radiologi_Rawat_Jalan`(`HPP_Persediaan_Radiologi_Rawat_Jalan`) USING BTREE,
  INDEX `Persediaan_BHP_Radiologi_Rawat_Jalan`(`Persediaan_BHP_Radiologi_Rawat_Jalan`) USING BTREE,
  INDEX `Obat_Ralan`(`Obat_Ralan`) USING BTREE,
  INDEX `HPP_Obat_Rawat_Jalan`(`HPP_Obat_Rawat_Jalan`) USING BTREE,
  INDEX `Persediaan_Obat_Rawat_Jalan`(`Persediaan_Obat_Rawat_Jalan`) USING BTREE,
  INDEX `Registrasi_Ralan`(`Registrasi_Ralan`) USING BTREE,
  INDEX `Operasi_Ralan`(`Operasi_Ralan`) USING BTREE,
  INDEX `Beban_Jasa_Medik_Dokter_Operasi_Ralan`(`Beban_Jasa_Medik_Dokter_Operasi_Ralan`) USING BTREE,
  INDEX `Utang_Jasa_Medik_Dokter_Operasi_Ralan`(`Utang_Jasa_Medik_Dokter_Operasi_Ralan`) USING BTREE,
  INDEX `Beban_Jasa_Medik_Paramedis_Operasi_Ralan`(`Beban_Jasa_Medik_Paramedis_Operasi_Ralan`) USING BTREE,
  INDEX `Utang_Jasa_Medik_Paramedis_Operasi_Ralan`(`Utang_Jasa_Medik_Paramedis_Operasi_Ralan`) USING BTREE,
  INDEX `HPP_Obat_Operasi_Ralan`(`HPP_Obat_Operasi_Ralan`) USING BTREE,
  INDEX `Persediaan_Obat_Kamar_Operasi_Ralan`(`Persediaan_Obat_Kamar_Operasi_Ralan`) USING BTREE,
  INDEX `Tambahan_Ralan`(`Tambahan_Ralan`) USING BTREE,
  INDEX `Potongan_Ralan`(`Potongan_Ralan`) USING BTREE,
  INDEX `Beban_Jasa_Menejemen_Tindakan_Ralan`(`Beban_Jasa_Menejemen_Tindakan_Ralan`) USING BTREE,
  INDEX `Beban_Jasa_Sarana_Tindakan_Ralan`(`Beban_Jasa_Sarana_Tindakan_Ralan`) USING BTREE,
  INDEX `HPP_BHP_Tindakan_Ralan`(`HPP_BHP_Tindakan_Ralan`) USING BTREE,
  INDEX `Utang_Jasa_Menejemen_Tindakan_Ralan`(`Utang_Jasa_Menejemen_Tindakan_Ralan`) USING BTREE,
  INDEX `Utang_Jasa_Sarana_Tindakan_Ralan`(`Utang_Jasa_Sarana_Tindakan_Ralan`) USING BTREE,
  INDEX `Persediaan_BHP_Tindakan_Ralan`(`Persediaan_BHP_Tindakan_Ralan`) USING BTREE,
  INDEX `Suspen_Piutang_Tindakan_Ralan`(`Suspen_Piutang_Tindakan_Ralan`) USING BTREE,
  INDEX `Suspen_Piutang_Laborat_Ralan`(`Suspen_Piutang_Laborat_Ralan`) USING BTREE,
  INDEX `Suspen_Piutang_Radiologi_Ralan`(`Suspen_Piutang_Radiologi_Ralan`) USING BTREE,
  INDEX `Suspen_Piutang_Obat_Ralan`(`Suspen_Piutang_Obat_Ralan`) USING BTREE,
  INDEX `Suspen_Piutang_Operasi_Ralan`(`Suspen_Piutang_Operasi_Ralan`) USING BTREE,
  INDEX `Beban_Jasa_Sarana_Laborat_Ralan`(`Beban_Jasa_Sarana_Laborat_Ralan`) USING BTREE,
  INDEX `Utang_Jasa_Sarana_Laborat_Ralan`(`Utang_Jasa_Sarana_Laborat_Ralan`) USING BTREE,
  INDEX `Beban_Jasa_Perujuk_Laborat_Ralan`(`Beban_Jasa_Perujuk_Laborat_Ralan`) USING BTREE,
  INDEX `Utang_Jasa_Perujuk_Laborat_Ralan`(`Utang_Jasa_Perujuk_Laborat_Ralan`) USING BTREE,
  INDEX `Beban_Jasa_Menejemen_Laborat_Ralan`(`Beban_Jasa_Menejemen_Laborat_Ralan`) USING BTREE,
  INDEX `Utang_Jasa_Menejemen_Laborat_Ralan`(`Utang_Jasa_Menejemen_Laborat_Ralan`) USING BTREE,
  INDEX `Beban_Jasa_Sarana_Radiologi_Ralan`(`Beban_Jasa_Sarana_Radiologi_Ralan`) USING BTREE,
  INDEX `Utang_Jasa_Sarana_Radiologi_Ralan`(`Utang_Jasa_Sarana_Radiologi_Ralan`) USING BTREE,
  INDEX `Beban_Jasa_Perujuk_Radiologi_Ralan`(`Beban_Jasa_Perujuk_Radiologi_Ralan`) USING BTREE,
  INDEX `Utang_Jasa_Perujuk_Radiologi_Ralan`(`Utang_Jasa_Perujuk_Radiologi_Ralan`) USING BTREE,
  INDEX `Beban_Jasa_Menejemen_Radiologi_Ralan`(`Beban_Jasa_Menejemen_Radiologi_Ralan`) USING BTREE,
  INDEX `Utang_Jasa_Menejemen_Radiologi_Ralan`(`Utang_Jasa_Menejemen_Radiologi_Ralan`) USING BTREE,
  CONSTRAINT `set_akun_ralan_ibfk_1` FOREIGN KEY (`Tindakan_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_10` FOREIGN KEY (`Utang_Jasa_Medik_Dokter_Laborat_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_11` FOREIGN KEY (`Beban_Jasa_Medik_Petugas_Laborat_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_12` FOREIGN KEY (`Utang_Jasa_Medik_Petugas_Laborat_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_13` FOREIGN KEY (`Beban_Kso_Laborat_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_14` FOREIGN KEY (`Utang_Kso_Laborat_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_15` FOREIGN KEY (`HPP_Persediaan_Laborat_Rawat_Jalan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_16` FOREIGN KEY (`Persediaan_BHP_Laborat_Rawat_Jalan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_17` FOREIGN KEY (`Radiologi_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_18` FOREIGN KEY (`Beban_Jasa_Medik_Dokter_Radiologi_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_19` FOREIGN KEY (`Utang_Jasa_Medik_Dokter_Radiologi_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_2` FOREIGN KEY (`Beban_Jasa_Medik_Dokter_Tindakan_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_20` FOREIGN KEY (`Beban_Jasa_Medik_Petugas_Radiologi_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_21` FOREIGN KEY (`Utang_Jasa_Medik_Petugas_Radiologi_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_22` FOREIGN KEY (`Beban_Kso_Radiologi_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_23` FOREIGN KEY (`Utang_Kso_Radiologi_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_24` FOREIGN KEY (`HPP_Persediaan_Radiologi_Rawat_Jalan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_25` FOREIGN KEY (`Persediaan_BHP_Radiologi_Rawat_Jalan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_26` FOREIGN KEY (`Obat_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_27` FOREIGN KEY (`HPP_Obat_Rawat_Jalan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_28` FOREIGN KEY (`Persediaan_Obat_Rawat_Jalan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_29` FOREIGN KEY (`Registrasi_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_3` FOREIGN KEY (`Utang_Jasa_Medik_Dokter_Tindakan_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_30` FOREIGN KEY (`Operasi_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_31` FOREIGN KEY (`Beban_Jasa_Medik_Dokter_Operasi_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_32` FOREIGN KEY (`Utang_Jasa_Medik_Dokter_Operasi_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_33` FOREIGN KEY (`Beban_Jasa_Medik_Paramedis_Operasi_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_34` FOREIGN KEY (`Utang_Jasa_Medik_Paramedis_Operasi_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_35` FOREIGN KEY (`HPP_Obat_Operasi_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_36` FOREIGN KEY (`Persediaan_Obat_Kamar_Operasi_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_37` FOREIGN KEY (`Tambahan_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_38` FOREIGN KEY (`Potongan_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_39` FOREIGN KEY (`Beban_Jasa_Menejemen_Tindakan_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_4` FOREIGN KEY (`Beban_Jasa_Medik_Paramedis_Tindakan_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_40` FOREIGN KEY (`Beban_Jasa_Sarana_Tindakan_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_41` FOREIGN KEY (`HPP_BHP_Tindakan_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_42` FOREIGN KEY (`Utang_Jasa_Menejemen_Tindakan_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_43` FOREIGN KEY (`Utang_Jasa_Sarana_Tindakan_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_44` FOREIGN KEY (`Persediaan_BHP_Tindakan_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_45` FOREIGN KEY (`Suspen_Piutang_Tindakan_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_46` FOREIGN KEY (`Suspen_Piutang_Laborat_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_47` FOREIGN KEY (`Suspen_Piutang_Radiologi_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_48` FOREIGN KEY (`Suspen_Piutang_Obat_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_49` FOREIGN KEY (`Suspen_Piutang_Operasi_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_5` FOREIGN KEY (`Utang_Jasa_Medik_Paramedis_Tindakan_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_50` FOREIGN KEY (`Beban_Jasa_Sarana_Laborat_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_51` FOREIGN KEY (`Utang_Jasa_Sarana_Laborat_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_52` FOREIGN KEY (`Beban_Jasa_Perujuk_Laborat_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_53` FOREIGN KEY (`Utang_Jasa_Perujuk_Laborat_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_54` FOREIGN KEY (`Beban_Jasa_Menejemen_Laborat_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_55` FOREIGN KEY (`Utang_Jasa_Menejemen_Laborat_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_56` FOREIGN KEY (`Beban_Jasa_Sarana_Radiologi_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_57` FOREIGN KEY (`Utang_Jasa_Sarana_Radiologi_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_58` FOREIGN KEY (`Beban_Jasa_Perujuk_Radiologi_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_59` FOREIGN KEY (`Utang_Jasa_Perujuk_Radiologi_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_6` FOREIGN KEY (`Beban_KSO_Tindakan_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_60` FOREIGN KEY (`Beban_Jasa_Menejemen_Radiologi_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_61` FOREIGN KEY (`Utang_Jasa_Menejemen_Radiologi_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_7` FOREIGN KEY (`Utang_KSO_Tindakan_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_8` FOREIGN KEY (`Laborat_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ralan_ibfk_9` FOREIGN KEY (`Beban_Jasa_Medik_Dokter_Laborat_Ralan`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_akun_ranap
-- ----------------------------
DROP TABLE IF EXISTS `set_akun_ranap`;
CREATE TABLE `set_akun_ranap`  (
  `Suspen_Piutang_Tindakan_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Tindakan_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Beban_Jasa_Medik_Dokter_Tindakan_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_Jasa_Medik_Dokter_Tindakan_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Beban_Jasa_Medik_Paramedis_Tindakan_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_Jasa_Medik_Paramedis_Tindakan_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Beban_KSO_Tindakan_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_KSO_Tindakan_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Beban_Jasa_Sarana_Tindakan_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_Jasa_Sarana_Tindakan_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Beban_Jasa_Menejemen_Tindakan_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_Jasa_Menejemen_Tindakan_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `HPP_BHP_Tindakan_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Persediaan_BHP_Tindakan_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Suspen_Piutang_Laborat_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Laborat_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Beban_Jasa_Medik_Dokter_Laborat_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_Jasa_Medik_Dokter_Laborat_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Beban_Jasa_Medik_Petugas_Laborat_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_Jasa_Medik_Petugas_Laborat_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Beban_Kso_Laborat_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_Kso_Laborat_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `HPP_Persediaan_Laborat_Rawat_inap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Persediaan_BHP_Laborat_Rawat_Inap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Beban_Jasa_Sarana_Laborat_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_Jasa_Sarana_Laborat_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Beban_Jasa_Perujuk_Laborat_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_Jasa_Perujuk_Laborat_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Beban_Jasa_Menejemen_Laborat_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_Jasa_Menejemen_Laborat_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Suspen_Piutang_Radiologi_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Radiologi_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Beban_Jasa_Medik_Dokter_Radiologi_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_Jasa_Medik_Dokter_Radiologi_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Beban_Jasa_Medik_Petugas_Radiologi_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_Jasa_Medik_Petugas_Radiologi_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Beban_Kso_Radiologi_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_Kso_Radiologi_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `HPP_Persediaan_Radiologi_Rawat_Inap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Persediaan_BHP_Radiologi_Rawat_Inap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Beban_Jasa_Sarana_Radiologi_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_Jasa_Sarana_Radiologi_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Beban_Jasa_Perujuk_Radiologi_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_Jasa_Perujuk_Radiologi_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Beban_Jasa_Menejemen_Radiologi_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_Jasa_Menejemen_Radiologi_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Suspen_Piutang_Obat_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Obat_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `HPP_Obat_Rawat_Inap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Persediaan_Obat_Rawat_Inap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Registrasi_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Service_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Tambahan_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Potongan_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Retur_Obat_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Resep_Pulang_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Kamar_Inap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Suspen_Piutang_Operasi_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Operasi_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Beban_Jasa_Medik_Dokter_Operasi_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_Jasa_Medik_Dokter_Operasi_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Beban_Jasa_Medik_Paramedis_Operasi_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Utang_Jasa_Medik_Paramedis_Operasi_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `HPP_Obat_Operasi_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  INDEX `Suspen_Piutang_Tindakan_Ranap`(`Suspen_Piutang_Tindakan_Ranap`) USING BTREE,
  INDEX `Tindakan_Ranap`(`Tindakan_Ranap`) USING BTREE,
  INDEX `Beban_Jasa_Medik_Dokter_Tindakan_Ranap`(`Beban_Jasa_Medik_Dokter_Tindakan_Ranap`) USING BTREE,
  INDEX `Utang_Jasa_Medik_Dokter_Tindakan_Ranap`(`Utang_Jasa_Medik_Dokter_Tindakan_Ranap`) USING BTREE,
  INDEX `Beban_Jasa_Medik_Paramedis_Tindakan_Ranap`(`Beban_Jasa_Medik_Paramedis_Tindakan_Ranap`) USING BTREE,
  INDEX `Utang_Jasa_Medik_Paramedis_Tindakan_Ranap`(`Utang_Jasa_Medik_Paramedis_Tindakan_Ranap`) USING BTREE,
  INDEX `Beban_KSO_Tindakan_Ranap`(`Beban_KSO_Tindakan_Ranap`) USING BTREE,
  INDEX `Utang_KSO_Tindakan_Ranap`(`Utang_KSO_Tindakan_Ranap`) USING BTREE,
  INDEX `Suspen_Piutang_Laborat_Ranap`(`Suspen_Piutang_Laborat_Ranap`) USING BTREE,
  INDEX `Laborat_Ranap`(`Laborat_Ranap`) USING BTREE,
  INDEX `Beban_Jasa_Medik_Dokter_Laborat_Ranap`(`Beban_Jasa_Medik_Dokter_Laborat_Ranap`) USING BTREE,
  INDEX `Utang_Jasa_Medik_Dokter_Laborat_Ranap`(`Utang_Jasa_Medik_Dokter_Laborat_Ranap`) USING BTREE,
  INDEX `Beban_Jasa_Medik_Petugas_Laborat_Ranap`(`Beban_Jasa_Medik_Petugas_Laborat_Ranap`) USING BTREE,
  INDEX `Utang_Jasa_Medik_Petugas_Laborat_Ranap`(`Utang_Jasa_Medik_Petugas_Laborat_Ranap`) USING BTREE,
  INDEX `Beban_Kso_Laborat_Ranap`(`Beban_Kso_Laborat_Ranap`) USING BTREE,
  INDEX `Utang_Kso_Laborat_Ranap`(`Utang_Kso_Laborat_Ranap`) USING BTREE,
  INDEX `HPP_Persediaan_Laborat_Rawat_inap`(`HPP_Persediaan_Laborat_Rawat_inap`) USING BTREE,
  INDEX `Persediaan_BHP_Laborat_Rawat_Inap`(`Persediaan_BHP_Laborat_Rawat_Inap`) USING BTREE,
  INDEX `Suspen_Piutang_Radiologi_Ranap`(`Suspen_Piutang_Radiologi_Ranap`) USING BTREE,
  INDEX `Radiologi_Ranap`(`Radiologi_Ranap`) USING BTREE,
  INDEX `Beban_Jasa_Medik_Dokter_Radiologi_Ranap`(`Beban_Jasa_Medik_Dokter_Radiologi_Ranap`) USING BTREE,
  INDEX `Utang_Jasa_Medik_Dokter_Radiologi_Ranap`(`Utang_Jasa_Medik_Dokter_Radiologi_Ranap`) USING BTREE,
  INDEX `Beban_Jasa_Medik_Petugas_Radiologi_Ranap`(`Beban_Jasa_Medik_Petugas_Radiologi_Ranap`) USING BTREE,
  INDEX `Utang_Jasa_Medik_Petugas_Radiologi_Ranap`(`Utang_Jasa_Medik_Petugas_Radiologi_Ranap`) USING BTREE,
  INDEX `Beban_Kso_Radiologi_Ranap`(`Beban_Kso_Radiologi_Ranap`) USING BTREE,
  INDEX `Utang_Kso_Radiologi_Ranap`(`Utang_Kso_Radiologi_Ranap`) USING BTREE,
  INDEX `HPP_Persediaan_Radiologi_Rawat_Inap`(`HPP_Persediaan_Radiologi_Rawat_Inap`) USING BTREE,
  INDEX `Persediaan_BHP_Radiologi_Rawat_Inap`(`Persediaan_BHP_Radiologi_Rawat_Inap`) USING BTREE,
  INDEX `Obat_Ranap`(`Obat_Ranap`) USING BTREE,
  INDEX `Registrasi_Ranap`(`Registrasi_Ranap`) USING BTREE,
  INDEX `Service_Ranap`(`Service_Ranap`) USING BTREE,
  INDEX `Tambahan_Ranap`(`Tambahan_Ranap`) USING BTREE,
  INDEX `Potongan_Ranap`(`Potongan_Ranap`) USING BTREE,
  INDEX `Retur_Obat_Ranap`(`Retur_Obat_Ranap`) USING BTREE,
  INDEX `Resep_Pulang_Ranap`(`Resep_Pulang_Ranap`) USING BTREE,
  INDEX `Kamar_Inap`(`Kamar_Inap`) USING BTREE,
  INDEX `Operasi_Ranap`(`Operasi_Ranap`) USING BTREE,
  INDEX `Suspen_Piutang_Obat_Ranap`(`Suspen_Piutang_Obat_Ranap`) USING BTREE,
  INDEX `HPP_Obat_Rawat_Inap`(`HPP_Obat_Rawat_Inap`) USING BTREE,
  INDEX `Persediaan_Obat_Rawat_Inap`(`Persediaan_Obat_Rawat_Inap`) USING BTREE,
  INDEX `Suspen_Piutang_Operasi_Ranap`(`Suspen_Piutang_Operasi_Ranap`) USING BTREE,
  INDEX `Beban_Jasa_Medik_Dokter_Operasi_Ranap`(`Beban_Jasa_Medik_Dokter_Operasi_Ranap`) USING BTREE,
  INDEX `Utang_Jasa_Medik_Dokter_Operasi_Ranap`(`Utang_Jasa_Medik_Dokter_Operasi_Ranap`) USING BTREE,
  INDEX `Beban_Jasa_Medik_Paramedis_Operasi_Ranap`(`Beban_Jasa_Medik_Paramedis_Operasi_Ranap`) USING BTREE,
  INDEX `Utang_Jasa_Medik_Paramedis_Operasi_Ranap`(`Utang_Jasa_Medik_Paramedis_Operasi_Ranap`) USING BTREE,
  INDEX `HPP_Obat_Operasi_Ranap`(`HPP_Obat_Operasi_Ranap`) USING BTREE,
  INDEX `Beban_Jasa_Menejemen_Tindakan_Ranap`(`Beban_Jasa_Menejemen_Tindakan_Ranap`) USING BTREE,
  INDEX `Beban_Jasa_Sarana_Tindakan_Ranap`(`Beban_Jasa_Sarana_Tindakan_Ranap`) USING BTREE,
  INDEX `HPP_BHP_Tindakan_Ranap`(`HPP_BHP_Tindakan_Ranap`) USING BTREE,
  INDEX `Utang_Jasa_Menejemen_Tindakan_Ranap`(`Utang_Jasa_Menejemen_Tindakan_Ranap`) USING BTREE,
  INDEX `Utang_Jasa_Sarana_Tindakan_Ranap`(`Utang_Jasa_Sarana_Tindakan_Ranap`) USING BTREE,
  INDEX `Persediaan_BHP_Tindakan_Ranap`(`Persediaan_BHP_Tindakan_Ranap`) USING BTREE,
  INDEX `Beban_Jasa_Sarana_Laborat_Ranap`(`Beban_Jasa_Sarana_Laborat_Ranap`) USING BTREE,
  INDEX `Utang_Jasa_Sarana_Laborat_Ranap`(`Utang_Jasa_Sarana_Laborat_Ranap`) USING BTREE,
  INDEX `Beban_Jasa_Perujuk_Laborat_Ranap`(`Beban_Jasa_Perujuk_Laborat_Ranap`) USING BTREE,
  INDEX `Utang_Jasa_Perujuk_Laborat_Ranap`(`Utang_Jasa_Perujuk_Laborat_Ranap`) USING BTREE,
  INDEX `Beban_Jasa_Menejemen_Laborat_Ranap`(`Beban_Jasa_Menejemen_Laborat_Ranap`) USING BTREE,
  INDEX `Utang_Jasa_Menejemen_Laborat_Ranap`(`Utang_Jasa_Menejemen_Laborat_Ranap`) USING BTREE,
  INDEX `Beban_Jasa_Sarana_Radiologi_Ranap`(`Beban_Jasa_Sarana_Radiologi_Ranap`) USING BTREE,
  INDEX `Utang_Jasa_Sarana_Radiologi_Ranap`(`Utang_Jasa_Sarana_Radiologi_Ranap`) USING BTREE,
  INDEX `Beban_Jasa_Perujuk_Radiologi_Ranap`(`Beban_Jasa_Perujuk_Radiologi_Ranap`) USING BTREE,
  INDEX `Utang_Jasa_Perujuk_Radiologi_Ranap`(`Utang_Jasa_Perujuk_Radiologi_Ranap`) USING BTREE,
  INDEX `Beban_Jasa_Menejemen_Radiologi_Ranap`(`Beban_Jasa_Menejemen_Radiologi_Ranap`) USING BTREE,
  INDEX `Utang_Jasa_Menejemen_Radiologi_Ranap`(`Utang_Jasa_Menejemen_Radiologi_Ranap`) USING BTREE,
  CONSTRAINT `set_akun_ranap_ibfk_1` FOREIGN KEY (`Suspen_Piutang_Tindakan_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_10` FOREIGN KEY (`Laborat_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_11` FOREIGN KEY (`Beban_Jasa_Medik_Dokter_Laborat_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_12` FOREIGN KEY (`Utang_Jasa_Medik_Dokter_Laborat_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_13` FOREIGN KEY (`Beban_Jasa_Medik_Petugas_Laborat_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_14` FOREIGN KEY (`Utang_Jasa_Medik_Petugas_Laborat_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_15` FOREIGN KEY (`Beban_Kso_Laborat_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_16` FOREIGN KEY (`Utang_Kso_Laborat_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_17` FOREIGN KEY (`HPP_Persediaan_Laborat_Rawat_inap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_18` FOREIGN KEY (`Persediaan_BHP_Laborat_Rawat_Inap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_19` FOREIGN KEY (`Suspen_Piutang_Radiologi_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_2` FOREIGN KEY (`Tindakan_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_20` FOREIGN KEY (`Radiologi_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_21` FOREIGN KEY (`Beban_Jasa_Medik_Dokter_Radiologi_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_22` FOREIGN KEY (`Utang_Jasa_Medik_Dokter_Radiologi_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_23` FOREIGN KEY (`Beban_Jasa_Medik_Petugas_Radiologi_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_24` FOREIGN KEY (`Utang_Jasa_Medik_Petugas_Radiologi_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_25` FOREIGN KEY (`Beban_Kso_Radiologi_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_26` FOREIGN KEY (`Utang_Kso_Radiologi_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_27` FOREIGN KEY (`HPP_Persediaan_Radiologi_Rawat_Inap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_28` FOREIGN KEY (`Persediaan_BHP_Radiologi_Rawat_Inap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_29` FOREIGN KEY (`Obat_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_3` FOREIGN KEY (`Beban_Jasa_Medik_Dokter_Tindakan_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_30` FOREIGN KEY (`Registrasi_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_31` FOREIGN KEY (`Service_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_32` FOREIGN KEY (`Tambahan_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_33` FOREIGN KEY (`Potongan_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_34` FOREIGN KEY (`Retur_Obat_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_35` FOREIGN KEY (`Resep_Pulang_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_36` FOREIGN KEY (`Kamar_Inap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_37` FOREIGN KEY (`Operasi_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_4` FOREIGN KEY (`Utang_Jasa_Medik_Dokter_Tindakan_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_41` FOREIGN KEY (`Suspen_Piutang_Obat_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_42` FOREIGN KEY (`HPP_Obat_Rawat_Inap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_43` FOREIGN KEY (`Persediaan_Obat_Rawat_Inap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_44` FOREIGN KEY (`Suspen_Piutang_Operasi_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_45` FOREIGN KEY (`Beban_Jasa_Medik_Dokter_Operasi_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_46` FOREIGN KEY (`Utang_Jasa_Medik_Dokter_Operasi_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_47` FOREIGN KEY (`Beban_Jasa_Medik_Paramedis_Operasi_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_48` FOREIGN KEY (`Utang_Jasa_Medik_Paramedis_Operasi_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_49` FOREIGN KEY (`HPP_Obat_Operasi_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_5` FOREIGN KEY (`Beban_Jasa_Medik_Paramedis_Tindakan_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_50` FOREIGN KEY (`Beban_Jasa_Menejemen_Tindakan_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_51` FOREIGN KEY (`Beban_Jasa_Sarana_Tindakan_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_52` FOREIGN KEY (`HPP_BHP_Tindakan_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_53` FOREIGN KEY (`Utang_Jasa_Menejemen_Tindakan_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_54` FOREIGN KEY (`Utang_Jasa_Sarana_Tindakan_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_55` FOREIGN KEY (`Persediaan_BHP_Tindakan_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_56` FOREIGN KEY (`Beban_Jasa_Sarana_Laborat_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_57` FOREIGN KEY (`Utang_Jasa_Sarana_Laborat_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_58` FOREIGN KEY (`Beban_Jasa_Perujuk_Laborat_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_59` FOREIGN KEY (`Utang_Jasa_Perujuk_Laborat_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_6` FOREIGN KEY (`Utang_Jasa_Medik_Paramedis_Tindakan_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_60` FOREIGN KEY (`Beban_Jasa_Menejemen_Laborat_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_61` FOREIGN KEY (`Utang_Jasa_Menejemen_Laborat_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_62` FOREIGN KEY (`Beban_Jasa_Sarana_Radiologi_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_63` FOREIGN KEY (`Utang_Jasa_Sarana_Radiologi_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_64` FOREIGN KEY (`Beban_Jasa_Perujuk_Radiologi_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_65` FOREIGN KEY (`Utang_Jasa_Perujuk_Radiologi_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_66` FOREIGN KEY (`Beban_Jasa_Menejemen_Radiologi_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_67` FOREIGN KEY (`Utang_Jasa_Menejemen_Radiologi_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_7` FOREIGN KEY (`Beban_KSO_Tindakan_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_8` FOREIGN KEY (`Utang_KSO_Tindakan_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap_ibfk_9` FOREIGN KEY (`Suspen_Piutang_Laborat_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_akun_ranap2
-- ----------------------------
DROP TABLE IF EXISTS `set_akun_ranap2`;
CREATE TABLE `set_akun_ranap2`  (
  `Persediaan_Obat_Kamar_Operasi_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Harian_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Uang_Muka_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Piutang_Pasien_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Sisa_Uang_Muka_Ranap` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  INDEX `Persediaan_Obat_Kamar_Operasi_Ranap`(`Persediaan_Obat_Kamar_Operasi_Ranap`) USING BTREE,
  INDEX `Harian_Ranap`(`Harian_Ranap`) USING BTREE,
  INDEX `Uang_Muka_Ranap`(`Uang_Muka_Ranap`) USING BTREE,
  INDEX `Piutang_Pasien_Ranap`(`Piutang_Pasien_Ranap`) USING BTREE,
  INDEX `Sisa_Uang_Muka_Ranap`(`Sisa_Uang_Muka_Ranap`) USING BTREE,
  CONSTRAINT `set_akun_ranap2_ibfk_1` FOREIGN KEY (`Persediaan_Obat_Kamar_Operasi_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap2_ibfk_2` FOREIGN KEY (`Harian_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap2_ibfk_3` FOREIGN KEY (`Uang_Muka_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap2_ibfk_4` FOREIGN KEY (`Piutang_Pasien_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `set_akun_ranap2_ibfk_5` FOREIGN KEY (`Sisa_Uang_Muka_Ranap`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_alamat_pasien
-- ----------------------------
DROP TABLE IF EXISTS `set_alamat_pasien`;
CREATE TABLE `set_alamat_pasien`  (
  `kelurahan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kecamatan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kabupaten` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `propinsi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for set_depo_ralan
-- ----------------------------
DROP TABLE IF EXISTS `set_depo_ralan`;
CREATE TABLE `set_depo_ralan`  (
  `kd_poli` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_bangsal` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd_poli`, `kd_bangsal`) USING BTREE,
  INDEX `kd_bangsal`(`kd_bangsal`) USING BTREE,
  CONSTRAINT `set_depo_ralan_ibfk_1` FOREIGN KEY (`kd_poli`) REFERENCES `poliklinik` (`kd_poli`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `set_depo_ralan_ibfk_2` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_depo_ranap
-- ----------------------------
DROP TABLE IF EXISTS `set_depo_ranap`;
CREATE TABLE `set_depo_ranap`  (
  `kd_bangsal` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_depo` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd_bangsal`, `kd_depo`) USING BTREE,
  INDEX `kd_depo`(`kd_depo`) USING BTREE,
  CONSTRAINT `set_depo_ranap_ibfk_1` FOREIGN KEY (`kd_depo`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `set_depo_ranap_ibfk_2` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_embalase
-- ----------------------------
DROP TABLE IF EXISTS `set_embalase`;
CREATE TABLE `set_embalase`  (
  `embalase_per_obat` double NOT NULL,
  `tuslah_per_obat` double NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_hadir
-- ----------------------------
DROP TABLE IF EXISTS `set_hadir`;
CREATE TABLE `set_hadir`  (
  `tnj` double NOT NULL,
  PRIMARY KEY (`tnj`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_harga_kamar
-- ----------------------------
DROP TABLE IF EXISTS `set_harga_kamar`;
CREATE TABLE `set_harga_kamar`  (
  `kd_kamar` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_pj` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tarif` double NOT NULL,
  PRIMARY KEY (`kd_kamar`, `kd_pj`) USING BTREE,
  INDEX `kd_pj`(`kd_pj`) USING BTREE,
  INDEX `tarif`(`tarif`) USING BTREE,
  CONSTRAINT `set_harga_kamar_ibfk_1` FOREIGN KEY (`kd_kamar`) REFERENCES `kamar` (`kd_kamar`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `set_harga_kamar_ibfk_2` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_harga_obat
-- ----------------------------
DROP TABLE IF EXISTS `set_harga_obat`;
CREATE TABLE `set_harga_obat`  (
  `setharga` enum('Umum','Per Jenis','Per Barang') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hargadasar` enum('Harga Beli','Harga Diskon') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_harga_obat_ralan
-- ----------------------------
DROP TABLE IF EXISTS `set_harga_obat_ralan`;
CREATE TABLE `set_harga_obat_ralan`  (
  `kd_pj` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hargajual` double NOT NULL,
  PRIMARY KEY (`kd_pj`) USING BTREE,
  CONSTRAINT `set_harga_obat_ralan_ibfk_1` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_harga_obat_ranap
-- ----------------------------
DROP TABLE IF EXISTS `set_harga_obat_ranap`;
CREATE TABLE `set_harga_obat_ranap`  (
  `kd_pj` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kelas` enum('Kelas 1','Kelas 2','Kelas 3','Kelas Utama','Kelas VIP','Kelas VVIP') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Kelas 1',
  `hargajual` double NOT NULL,
  PRIMARY KEY (`kd_pj`, `kelas`) USING BTREE,
  CONSTRAINT `set_harga_obat_ranap_ibfk_1` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_hari_libur
-- ----------------------------
DROP TABLE IF EXISTS `set_hari_libur`;
CREATE TABLE `set_hari_libur`  (
  `tanggal` date NOT NULL,
  `ktg` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`tanggal`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_input_parsial
-- ----------------------------
DROP TABLE IF EXISTS `set_input_parsial`;
CREATE TABLE `set_input_parsial`  (
  `kd_pj` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd_pj`) USING BTREE,
  CONSTRAINT `set_input_parsial_ibfk_1` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_insentif
-- ----------------------------
DROP TABLE IF EXISTS `set_insentif`;
CREATE TABLE `set_insentif`  (
  `tahun` year NOT NULL,
  `bulan` tinyint(4) NOT NULL,
  `pendapatan` double NOT NULL,
  `persen` double NOT NULL,
  `total_insentif` double NOT NULL,
  PRIMARY KEY (`tahun`, `bulan`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_jam_minimal
-- ----------------------------
DROP TABLE IF EXISTS `set_jam_minimal`;
CREATE TABLE `set_jam_minimal`  (
  `lamajam` int(11) NOT NULL,
  `hariawal` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `feeperujuk` double NOT NULL,
  `diagnosaakhir` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bayi` int(11) NULL DEFAULT NULL,
  `aktifkan_hapus_data_salah` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kamar_inap_kasir_ralan` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ubah_status_kamar` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for set_jgmlm
-- ----------------------------
DROP TABLE IF EXISTS `set_jgmlm`;
CREATE TABLE `set_jgmlm`  (
  `tnj` double NOT NULL,
  PRIMARY KEY (`tnj`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_jgtambah
-- ----------------------------
DROP TABLE IF EXISTS `set_jgtambah`;
CREATE TABLE `set_jgtambah`  (
  `tnj` double NOT NULL,
  `pendidikan` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`pendidikan`) USING BTREE,
  CONSTRAINT `set_jgtambah_ibfk_1` FOREIGN KEY (`pendidikan`) REFERENCES `pendidikan` (`tingkat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_kelengkapan_data_pasien
-- ----------------------------
DROP TABLE IF EXISTS `set_kelengkapan_data_pasien`;
CREATE TABLE `set_kelengkapan_data_pasien`  (
  `no_ktp` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `p_no_ktp` tinyint(4) NULL DEFAULT NULL,
  `tmp_lahir` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `p_tmp_lahir` tinyint(4) NULL DEFAULT NULL,
  `nm_ibu` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `p_nm_ibu` tinyint(4) NULL DEFAULT NULL,
  `alamat` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `p_alamat` tinyint(4) NULL DEFAULT NULL,
  `pekerjaan` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `p_pekerjaan` tinyint(4) NULL DEFAULT NULL,
  `no_tlp` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `p_no_tlp` tinyint(4) NULL DEFAULT NULL,
  `umur` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `p_umur` tinyint(4) NULL DEFAULT NULL,
  `namakeluarga` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `p_namakeluarga` tinyint(4) NULL DEFAULT NULL,
  `no_peserta` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `p_no_peserta` tinyint(4) NULL DEFAULT NULL,
  `kelurahan` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `p_kelurahan` tinyint(4) NULL DEFAULT NULL,
  `kecamatan` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `p_kecamatan` tinyint(4) NULL DEFAULT NULL,
  `kabupaten` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `p_kabupaten` tinyint(4) NULL DEFAULT NULL,
  `pekerjaanpj` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `p_pekerjaanpj` tinyint(4) NULL DEFAULT NULL,
  `alamatpj` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `p_alamatpj` tinyint(4) NULL DEFAULT NULL,
  `kelurahanpj` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `p_kelurahanpj` tinyint(4) NULL DEFAULT NULL,
  `kecamatanpj` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `p_kecamatanpj` tinyint(4) NULL DEFAULT NULL,
  `kabupatenpj` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `p_kabupatenpj` tinyint(4) NULL DEFAULT NULL,
  `propinsi` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `p_propinsi` tinyint(4) NOT NULL,
  `propinsipj` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `p_propinsipj` tinyint(4) NOT NULL
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for set_keterlambatan
-- ----------------------------
DROP TABLE IF EXISTS `set_keterlambatan`;
CREATE TABLE `set_keterlambatan`  (
  `toleransi` int(11) NULL DEFAULT NULL,
  `terlambat1` int(11) NULL DEFAULT NULL,
  `terlambat2` int(11) NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for set_lemburhb
-- ----------------------------
DROP TABLE IF EXISTS `set_lemburhb`;
CREATE TABLE `set_lemburhb`  (
  `tnj` double NOT NULL,
  PRIMARY KEY (`tnj`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_lemburhr
-- ----------------------------
DROP TABLE IF EXISTS `set_lemburhr`;
CREATE TABLE `set_lemburhr`  (
  `tnj` double NOT NULL,
  PRIMARY KEY (`tnj`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_lokasi
-- ----------------------------
DROP TABLE IF EXISTS `set_lokasi`;
CREATE TABLE `set_lokasi`  (
  `kd_bangsal` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `asal_stok` enum('Gunakan Stok Utama Obat','Gunakan Stok Bangsal') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  INDEX `kd_bangsal`(`kd_bangsal`) USING BTREE,
  CONSTRAINT `set_lokasi_ibfk_1` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_modal_payment
-- ----------------------------
DROP TABLE IF EXISTS `set_modal_payment`;
CREATE TABLE `set_modal_payment`  (
  `modal_awal` double NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for set_no_rkm_medis
-- ----------------------------
DROP TABLE IF EXISTS `set_no_rkm_medis`;
CREATE TABLE `set_no_rkm_medis`  (
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_nota
-- ----------------------------
DROP TABLE IF EXISTS `set_nota`;
CREATE TABLE `set_nota`  (
  `notaralan` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kwitansiralan` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nota1ranap` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nota2ranap` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kwitansiranap` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `notaapotek` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `notalabrad` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `notatoko` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cetaknotasimpanralan` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cetaknotasimpanranap` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rinciandokterralan` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rinciandokterranap` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `centangdokterralan` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `centangdokterranap` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tampilkan_administrasi_di_billingranap` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rincianoperasi` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tampilkan_ppnobat_ralan` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tampilkan_ppnobat_ranap` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tampilkan_tombol_nota_ralan` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tampilkan_tombol_nota_ranap` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `verifikasi_penjualan_di_kasir` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `verifikasi_penyerahan_darah_di_kasir` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cetaknotasimpanpenjualan` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tampilkan_tombol_nota_penjualan` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `centangobatralan` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `centangobatranap` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cetaknotasimpantoko` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tampilkan_tombol_nota_toko` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for set_otomatis_tindakan_ralan
-- ----------------------------
DROP TABLE IF EXISTS `set_otomatis_tindakan_ralan`;
CREATE TABLE `set_otomatis_tindakan_ralan`  (
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_pj` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`kd_dokter`, `kd_jenis_prw`, `kd_pj`) USING BTREE,
  INDEX `kd_jenis_prw`(`kd_jenis_prw`) USING BTREE,
  INDEX `kd_pj`(`kd_pj`) USING BTREE,
  INDEX `kd_dokter`(`kd_dokter`) USING BTREE,
  CONSTRAINT `set_otomatis_tindakan_ralan_ibfk_1` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `set_otomatis_tindakan_ralan_ibfk_2` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `set_otomatis_tindakan_ralan_ibfk_3` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_otomatis_tindakan_ralan_dokterpetugas
-- ----------------------------
DROP TABLE IF EXISTS `set_otomatis_tindakan_ralan_dokterpetugas`;
CREATE TABLE `set_otomatis_tindakan_ralan_dokterpetugas`  (
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_pj` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`kd_dokter`, `kd_jenis_prw`, `kd_pj`) USING BTREE,
  INDEX `kd_jenis_prw`(`kd_jenis_prw`) USING BTREE,
  INDEX `kd_pj`(`kd_pj`) USING BTREE,
  CONSTRAINT `set_otomatis_tindakan_ralan_dokterpetugas_ibfk_1` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `set_otomatis_tindakan_ralan_dokterpetugas_ibfk_2` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `set_otomatis_tindakan_ralan_dokterpetugas_ibfk_3` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_otomatis_tindakan_ralan_petugas
-- ----------------------------
DROP TABLE IF EXISTS `set_otomatis_tindakan_ralan_petugas`;
CREATE TABLE `set_otomatis_tindakan_ralan_petugas`  (
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_pj` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd_jenis_prw`, `kd_pj`) USING BTREE,
  INDEX `kd_pj`(`kd_pj`) USING BTREE,
  CONSTRAINT `set_otomatis_tindakan_ralan_petugas_ibfk_1` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `set_otomatis_tindakan_ralan_petugas_ibfk_2` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_pjlab
-- ----------------------------
DROP TABLE IF EXISTS `set_pjlab`;
CREATE TABLE `set_pjlab`  (
  `kd_dokterlab` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_dokterrad` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_dokterhemodialisa` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_dokterutd` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_dokterlabpa` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd_dokterlab`, `kd_dokterrad`, `kd_dokterhemodialisa`) USING BTREE,
  INDEX `kd_dokterrad`(`kd_dokterrad`) USING BTREE,
  INDEX `kd_dokterhemodialisa`(`kd_dokterhemodialisa`) USING BTREE,
  INDEX `kd_dokterutd`(`kd_dokterutd`) USING BTREE,
  INDEX `kd_dokterlab`(`kd_dokterlab`) USING BTREE,
  INDEX `kd_dokterlabpa`(`kd_dokterlabpa`) USING BTREE,
  CONSTRAINT `set_pjlab_ibfk_1` FOREIGN KEY (`kd_dokterlab`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `set_pjlab_ibfk_2` FOREIGN KEY (`kd_dokterrad`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `set_pjlab_ibfk_3` FOREIGN KEY (`kd_dokterhemodialisa`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `set_pjlab_ibfk_4` FOREIGN KEY (`kd_dokterutd`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `set_pjlab_ibfk_5` FOREIGN KEY (`kd_dokterlabpa`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_resume
-- ----------------------------
DROP TABLE IF EXISTS `set_resume`;
CREATE TABLE `set_resume`  (
  `tahun` year NOT NULL,
  `bulan` tinyint(4) NOT NULL,
  `pendapatan_resume` double NOT NULL,
  `persen_rs` double NOT NULL,
  `bagian_rs` double NOT NULL,
  `persen_kry` double NOT NULL,
  `bagian_kry` double NOT NULL,
  PRIMARY KEY (`tahun`, `bulan`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_service_ranap
-- ----------------------------
DROP TABLE IF EXISTS `set_service_ranap`;
CREATE TABLE `set_service_ranap`  (
  `nama_service` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `besar` double NULL DEFAULT NULL,
  `laborat` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `radiologi` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `operasi` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `obat` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ranap_dokter` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ranap_paramedis` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ralan_dokter` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ralan_paramedis` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tambahan` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `potongan` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kamar` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `registrasi` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `harian` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `retur_Obat` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `resep_Pulang` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nama_service`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_service_ranap_piutang
-- ----------------------------
DROP TABLE IF EXISTS `set_service_ranap_piutang`;
CREATE TABLE `set_service_ranap_piutang`  (
  `nama_service` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `besar` double NULL DEFAULT NULL,
  `laborat` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `radiologi` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `operasi` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `obat` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ranap_dokter` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ranap_paramedis` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ralan_dokter` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ralan_paramedis` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tambahan` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `potongan` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kamar` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `registrasi` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `harian` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `retur_Obat` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `resep_Pulang` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nama_service`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_tahun
-- ----------------------------
DROP TABLE IF EXISTS `set_tahun`;
CREATE TABLE `set_tahun`  (
  `tahun` year NOT NULL,
  `bulan` tinyint(2) NOT NULL,
  `jmlhr` int(11) NOT NULL,
  `jmllbr` int(11) NOT NULL,
  `normal` int(11) NOT NULL,
  PRIMARY KEY (`tahun`, `bulan`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_tarif
-- ----------------------------
DROP TABLE IF EXISTS `set_tarif`;
CREATE TABLE `set_tarif`  (
  `poli_ralan` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cara_bayar_ralan` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ruang_ranap` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cara_bayar_ranap` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cara_bayar_lab` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cara_bayar_radiologi` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cara_bayar_operasi` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kelas_ranap` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kelas_lab` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kelas_radiologi` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kelas_operasi` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  INDEX `poli_ralan`(`poli_ralan`, `cara_bayar_ralan`, `ruang_ranap`, `cara_bayar_ranap`, `cara_bayar_lab`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_tarif_online
-- ----------------------------
DROP TABLE IF EXISTS `set_tarif_online`;
CREATE TABLE `set_tarif_online`  (
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd_jenis_prw`) USING BTREE,
  CONSTRAINT `set_tarif_online_ibfk_1` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_tni_polri
-- ----------------------------
DROP TABLE IF EXISTS `set_tni_polri`;
CREATE TABLE `set_tni_polri`  (
  `tampilkan_tni_polri` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for set_tnjanak
-- ----------------------------
DROP TABLE IF EXISTS `set_tnjanak`;
CREATE TABLE `set_tnjanak`  (
  `tnj` double NOT NULL,
  PRIMARY KEY (`tnj`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_tnjnikah
-- ----------------------------
DROP TABLE IF EXISTS `set_tnjnikah`;
CREATE TABLE `set_tnjnikah`  (
  `tnj` double NOT NULL,
  PRIMARY KEY (`tnj`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_tuslah
-- ----------------------------
DROP TABLE IF EXISTS `set_tuslah`;
CREATE TABLE `set_tuslah`  (
  `tahun` year NOT NULL,
  `bulan` tinyint(4) NOT NULL,
  `pendapatan_tuslah` double NOT NULL,
  `persen_rs` double NOT NULL,
  `bagian_rs` double NOT NULL,
  `persen_kry` double NOT NULL,
  `bagian_kry` double NOT NULL,
  PRIMARY KEY (`tahun`, `bulan`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for set_urut_no_rkm_medis
-- ----------------------------
DROP TABLE IF EXISTS `set_urut_no_rkm_medis`;
CREATE TABLE `set_urut_no_rkm_medis`  (
  `urutan` enum('Straight','Middle','Terminal') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tahun` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bulan` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `posisi_tahun_bulan` enum('Depan','Belakang') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`urutan`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for set_validasi_catatan
-- ----------------------------
DROP TABLE IF EXISTS `set_validasi_catatan`;
CREATE TABLE `set_validasi_catatan`  (
  `tampilkan_catatan` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for set_validasi_registrasi
-- ----------------------------
DROP TABLE IF EXISTS `set_validasi_registrasi`;
CREATE TABLE `set_validasi_registrasi`  (
  `wajib_closing_kasir` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for set_warung
-- ----------------------------
DROP TABLE IF EXISTS `set_warung`;
CREATE TABLE `set_warung`  (
  `tahun` year NOT NULL,
  `bulan` tinyint(4) NOT NULL,
  `pendapatan_warung` double NOT NULL,
  `persen_rs` double NOT NULL,
  `bagian_rs` double NOT NULL,
  `persen_kry` double NOT NULL,
  `bagian_kry` double NOT NULL,
  PRIMARY KEY (`tahun`, `bulan`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for setpenjualan
-- ----------------------------
DROP TABLE IF EXISTS `setpenjualan`;
CREATE TABLE `setpenjualan`  (
  `ralan` double NULL DEFAULT NULL,
  `kelas1` double NULL DEFAULT NULL,
  `kelas2` double NULL DEFAULT NULL,
  `kelas3` double NULL DEFAULT NULL,
  `utama` double NULL DEFAULT NULL,
  `vip` double NULL DEFAULT NULL,
  `vvip` double NULL DEFAULT NULL,
  `beliluar` double NULL DEFAULT NULL,
  `jualbebas` double NULL DEFAULT NULL,
  `karyawan` double NULL DEFAULT NULL,
  `kdjns` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kdjns`) USING BTREE,
  INDEX `kdjns`(`kdjns`) USING BTREE,
  CONSTRAINT `setpenjualan_ibfk_1` FOREIGN KEY (`kdjns`) REFERENCES `jenis` (`kdjns`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for setpenjualanperbarang
-- ----------------------------
DROP TABLE IF EXISTS `setpenjualanperbarang`;
CREATE TABLE `setpenjualanperbarang`  (
  `ralan` double NULL DEFAULT NULL,
  `kelas1` double NULL DEFAULT NULL,
  `kelas2` double NULL DEFAULT NULL,
  `kelas3` double NULL DEFAULT NULL,
  `utama` double NULL DEFAULT NULL,
  `vip` double NULL DEFAULT NULL,
  `vvip` double NULL DEFAULT NULL,
  `beliluar` double NULL DEFAULT NULL,
  `jualbebas` double NULL DEFAULT NULL,
  `karyawan` double NULL DEFAULT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kode_brng`) USING BTREE,
  CONSTRAINT `setpenjualanperbarang_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for setpenjualanumum
-- ----------------------------
DROP TABLE IF EXISTS `setpenjualanumum`;
CREATE TABLE `setpenjualanumum`  (
  `ralan` double NULL DEFAULT NULL,
  `kelas1` double NULL DEFAULT NULL,
  `kelas2` double NULL DEFAULT NULL,
  `kelas3` double NULL DEFAULT NULL,
  `utama` double NULL DEFAULT NULL,
  `vip` double NULL DEFAULT NULL,
  `vvip` double NULL DEFAULT NULL,
  `beliluar` double NULL DEFAULT NULL,
  `jualbebas` double NULL DEFAULT NULL,
  `karyawan` double NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for setsms
-- ----------------------------
DROP TABLE IF EXISTS `setsms`;
CREATE TABLE `setsms`  (
  `kode_sms` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `sintax_balasan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`kode_sms`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting`  (
  `nama_instansi` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `alamat_instansi` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kabupaten` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `propinsi` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kontak` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `aktifkan` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_ppk` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_ppkinhealth` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_ppkkemenkes` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `wallpaper` longblob NULL,
  `logo` longblob NOT NULL,
  PRIMARY KEY (`nama_instansi`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sidikjari
-- ----------------------------
DROP TABLE IF EXISTS `sidikjari`;
CREATE TABLE `sidikjari`  (
  `id` int(11) NOT NULL,
  `sidikjari` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `sidikjari_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sidikjaripasien
-- ----------------------------
DROP TABLE IF EXISTS `sidikjaripasien`;
CREATE TABLE `sidikjaripasien`  (
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sidikjari` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rkm_medis`) USING BTREE,
  CONSTRAINT `sidikjaripasien_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for siranap_ketersediaan_kamar
-- ----------------------------
DROP TABLE IF EXISTS `siranap_ketersediaan_kamar`;
CREATE TABLE `siranap_ketersediaan_kamar`  (
  `kode_ruang_siranap` enum('0000 Umum','0001 Anak','0002 Anak (Luka Bakar)','0003 Penyakit Dalam','0004 Kebidanan','0005 Kandungan','0006 Bedah','0007 Kanker','0008 Mata','0009 THT','0010 Paru','0011 Jantung','0012 Orthopedi','0013 Kulit dan Kelamin','0014 Saraf','0015 Jiwa','0016 Infeksi','0017 Luka Bakar','0018 NAPZA','0019 Isolasi Air Borne','0020 Isolasi TB MDR','0021 Kulit dan Kelamin','0022 Isolasi Imunitas menurun','0023 Isolasi Radioaktif','0024 ICU/RICU','0025 NICU','0026 PICU','0027 CVCU/ICCU','0029 HCU','0030 Kedokteran Nuklir') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kelas_ruang_siranap` enum('0001 Super VIP','0002 VIP','0003 Kelas 1','0004 Kelas 2','0005 Kelas 3','0006 Intermediate','0007 Isolasi','0008 Rawat Khusus','0009 Stroke Care Unit') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_bangsal` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kelas` enum('Kelas 1','Kelas 2','Kelas 3','Kelas Utama','Kelas VIP','Kelas VVIP') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Kelas 1',
  `kapasitas` int(11) NULL DEFAULT NULL,
  `tersedia` int(11) NULL DEFAULT NULL,
  `tersediapria` int(11) NULL DEFAULT NULL,
  `tersediawanita` int(11) NULL DEFAULT NULL,
  `menunggu` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`kode_ruang_siranap`, `kelas_ruang_siranap`, `kd_bangsal`, `kelas`) USING BTREE,
  INDEX `kd_bangsal`(`kd_bangsal`) USING BTREE,
  INDEX `kapasitas`(`kapasitas`) USING BTREE,
  INDEX `tersedia`(`tersedia`) USING BTREE,
  INDEX `tersediapria`(`tersediapria`) USING BTREE,
  INDEX `tersediawanita`(`tersediawanita`) USING BTREE,
  INDEX `tersediapriawanita`(`menunggu`) USING BTREE,
  CONSTRAINT `siranap_ketersediaan_kamar_ibfk_1` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sisrute_rujukan_keluar
-- ----------------------------
DROP TABLE IF EXISTS `sisrute_rujukan_keluar`;
CREATE TABLE `sisrute_rujukan_keluar`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_rujuk` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_pasien` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_ktp` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_peserta` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jk` enum('L','P') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_lahir` date NOT NULL,
  `tmp_lahir` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alamat` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_tlp` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jns_rujukan` enum('1. Rawat Jalan','2. Rawat Darurat/Inap','3. Parsial') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_rujuk` datetime(0) NOT NULL,
  `kd_faskes_tujuan` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_faskes_tujuan` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_alasan` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alasan_rujuk` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alasan_lainnya` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_diagnosa` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `diagnosa_rujuk` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nik_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dokter_perujuk` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nik_petugas` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `petugas_entry` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `anamnesis_pemeriksaan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kesadaran` enum('1. Sadar','2. Tidak Sadar') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tekanan_darah` varchar(7) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nadi` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `suhu` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `respirasi` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keadaan_umum` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tingkat_nyeri` enum('0. Tidak Nyeri','1. Ringan','2. Sedang','3. Berat') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alergi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `laboratorium` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `radiologi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `terapitindakan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  CONSTRAINT `sisrute_rujukan_keluar_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for skdp_bpjs
-- ----------------------------
DROP TABLE IF EXISTS `skdp_bpjs`;
CREATE TABLE `skdp_bpjs`  (
  `tahun` year NOT NULL,
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `diagnosa` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `terapi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alasan1` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alasan2` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rtl1` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rtl2` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal_datang` date NULL DEFAULT NULL,
  `tanggal_rujukan` date NOT NULL,
  `no_antrian` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` enum('Menunggu','Sudah Periksa','Batal Periksa') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`tahun`, `no_antrian`) USING BTREE,
  INDEX `no_rkm_medis`(`no_rkm_medis`) USING BTREE,
  INDEX `kd_dokter`(`kd_dokter`) USING BTREE,
  CONSTRAINT `skdp_bpjs_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `skdp_bpjs_ibfk_2` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for skrining_gizi
-- ----------------------------
DROP TABLE IF EXISTS `skrining_gizi`;
CREATE TABLE `skrining_gizi`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime(0) NOT NULL,
  `skrining_bb` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `skrining_tb` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alergi` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `parameter_imt` enum('IMT > 20/z score > 2','IMT 18,5-20/-2 =< z score =< 2','IMT < 18,5/z score < -2') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `skor_imt` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `parameter_bb` enum('BB Hilang < 5%','BB Hilang 5 - 10 %','BB Hilang > 10 %') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `skor_bb` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `parameter_penyakit` enum('Ada asupan nutrisi > 5 hari','Tidak ada asupan nutrisi > 5 hari') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `skor_penyakit` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `skor_total` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `parameter_total` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`, `tanggal`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `skrining_gizi_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `skrining_gizi_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for skrining_rawat_jalan
-- ----------------------------
DROP TABLE IF EXISTS `skrining_rawat_jalan`;
CREATE TABLE `skrining_rawat_jalan`  (
  `tanggal` date NOT NULL,
  `jam` time(0) NOT NULL,
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `geriatri` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kesadaran` enum('Sadar penuh','Tampak mengantuk/gelisah bicara tidak jelas','Tidak sadar','Batuk > 2 minggu') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pernapasan` enum('Nafas normal','Tampak sesak','Tidak bernafas') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nyeri_dada` enum('Tidak ada','Ada (Tingkat sedang)','Nyeri dada kiri tembus punggung') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `skala_nyeri` enum('Tidak sakit','Sedikit sakit','Agak mengganggu','Mengganggu aktivitas','Sangat mengganggu','Tak tertahankan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keputusan` enum('Sesuai antrian','IGD') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tanggal`, `jam`, `no_rkm_medis`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  INDEX `no_rkm_medis`(`no_rkm_medis`) USING BTREE,
  CONSTRAINT `skrining_rawat_jalan_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `skrining_rawat_jalan_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sms
-- ----------------------------
DROP TABLE IF EXISTS `sms`;
CREATE TABLE `sms`  (
  `id_pesan` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sms_masuk` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_hp` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pdu_pesan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `encoding` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_gateway` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_sms` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_pesan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for spesialis
-- ----------------------------
DROP TABLE IF EXISTS `spesialis`;
CREATE TABLE `spesialis`  (
  `kd_sps` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nm_sps` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kd_sps`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stok_obat_pasien
-- ----------------------------
DROP TABLE IF EXISTS `stok_obat_pasien`;
CREATE TABLE `stok_obat_pasien`  (
  `tanggal` date NOT NULL,
  `jam` time(0) NOT NULL,
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jumlah` double NOT NULL,
  `kd_bangsal` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_batch` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `aturan_pakai` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`tanggal`, `jam`, `no_rawat`, `kode_brng`, `no_batch`, `no_faktur`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `kd_bangsal`(`kd_bangsal`) USING BTREE,
  CONSTRAINT `stok_obat_pasien_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stok_obat_pasien_ibfk_3` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `stok_obat_pasien_ibfk_4` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stts_kerja
-- ----------------------------
DROP TABLE IF EXISTS `stts_kerja`;
CREATE TABLE `stts_kerja`  (
  `stts` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ktg` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `indek` tinyint(4) NOT NULL,
  PRIMARY KEY (`stts`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stts_wp
-- ----------------------------
DROP TABLE IF EXISTS `stts_wp`;
CREATE TABLE `stts_wp`  (
  `stts` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ktg` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`stts`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for subrekening
-- ----------------------------
DROP TABLE IF EXISTS `subrekening`;
CREATE TABLE `subrekening`  (
  `kd_rek` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_rek2` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd_rek2`) USING BTREE,
  INDEX `kd_rek`(`kd_rek`) USING BTREE,
  CONSTRAINT `subrekening_ibfk_1` FOREIGN KEY (`kd_rek`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `subrekening_ibfk_2` FOREIGN KEY (`kd_rek2`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for suku_bangsa
-- ----------------------------
DROP TABLE IF EXISTS `suku_bangsa`;
CREATE TABLE `suku_bangsa`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_suku_bangsa` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `nama_suku_bangsa`(`nama_suku_bangsa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for surat_balas
-- ----------------------------
DROP TABLE IF EXISTS `surat_balas`;
CREATE TABLE `surat_balas`  (
  `kd` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `balas` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for surat_cuti_hamil
-- ----------------------------
DROP TABLE IF EXISTS `surat_cuti_hamil`;
CREATE TABLE `surat_cuti_hamil`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan_hamil` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `terhitung_mulai` date NULL DEFAULT NULL,
  `perkiraan_lahir` date NULL DEFAULT NULL,
  `no_surat` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  UNIQUE INDEX `no_surat`(`no_surat`) USING BTREE,
  CONSTRAINT `surat_cuti_hamil_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for surat_hamil
-- ----------------------------
DROP TABLE IF EXISTS `surat_hamil`;
CREATE TABLE `surat_hamil`  (
  `no_surat` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggalperiksa` date NOT NULL,
  `hasilperiksa` enum('tidak ditemukan tanda-tanda kehamilan','ditemukan tanda-tanda kehamilan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_surat`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  CONSTRAINT `surat_hamil_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for surat_indeks
-- ----------------------------
DROP TABLE IF EXISTS `surat_indeks`;
CREATE TABLE `surat_indeks`  (
  `kd` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `indeks` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for surat_keluar
-- ----------------------------
DROP TABLE IF EXISTS `surat_keluar`;
CREATE TABLE `surat_keluar`  (
  `no_urut` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_surat` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tujuan` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_surat` date NOT NULL,
  `perihal` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_kirim` date NOT NULL,
  `kd_lemari` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_rak` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_map` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_ruang` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_sifat` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lampiran` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tembusan` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_deadline_balas` date NOT NULL,
  `kd_balas` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_status` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_klasifikasi` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `file_url` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_urut`) USING BTREE,
  INDEX `kd_lemari`(`kd_lemari`) USING BTREE,
  INDEX `kd_rak`(`kd_rak`) USING BTREE,
  INDEX `kd_map`(`kd_map`) USING BTREE,
  INDEX `kd_ruang`(`kd_ruang`) USING BTREE,
  INDEX `kd_sifat`(`kd_sifat`) USING BTREE,
  INDEX `kd_balas`(`kd_balas`) USING BTREE,
  INDEX `kd_status`(`kd_status`) USING BTREE,
  INDEX `kd_klasifikasi`(`kd_klasifikasi`) USING BTREE,
  CONSTRAINT `surat_keluar_ibfk_1` FOREIGN KEY (`kd_lemari`) REFERENCES `surat_lemari` (`kd`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `surat_keluar_ibfk_10` FOREIGN KEY (`kd_rak`) REFERENCES `surat_rak` (`kd`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `surat_keluar_ibfk_11` FOREIGN KEY (`kd_map`) REFERENCES `surat_map` (`kd`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `surat_keluar_ibfk_12` FOREIGN KEY (`kd_ruang`) REFERENCES `surat_ruang` (`kd`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `surat_keluar_ibfk_13` FOREIGN KEY (`kd_sifat`) REFERENCES `surat_sifat` (`kd`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `surat_keluar_ibfk_14` FOREIGN KEY (`kd_balas`) REFERENCES `surat_balas` (`kd`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `surat_keluar_ibfk_15` FOREIGN KEY (`kd_status`) REFERENCES `surat_status` (`kd`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `surat_keluar_ibfk_16` FOREIGN KEY (`kd_klasifikasi`) REFERENCES `surat_klasifikasi` (`kd`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `surat_keluar_ibfk_2` FOREIGN KEY (`kd_rak`) REFERENCES `surat_rak` (`kd`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `surat_keluar_ibfk_3` FOREIGN KEY (`kd_map`) REFERENCES `surat_map` (`kd`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `surat_keluar_ibfk_4` FOREIGN KEY (`kd_ruang`) REFERENCES `surat_ruang` (`kd`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `surat_keluar_ibfk_5` FOREIGN KEY (`kd_sifat`) REFERENCES `surat_sifat` (`kd`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `surat_keluar_ibfk_6` FOREIGN KEY (`kd_balas`) REFERENCES `surat_balas` (`kd`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `surat_keluar_ibfk_7` FOREIGN KEY (`kd_status`) REFERENCES `surat_status` (`kd`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `surat_keluar_ibfk_8` FOREIGN KEY (`kd_klasifikasi`) REFERENCES `surat_klasifikasi` (`kd`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `surat_keluar_ibfk_9` FOREIGN KEY (`kd_lemari`) REFERENCES `surat_lemari` (`kd`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for surat_keluar_disposisi
-- ----------------------------
DROP TABLE IF EXISTS `surat_keluar_disposisi`;
CREATE TABLE `surat_keluar_disposisi`  (
  `no_disposisi` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_indeks` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_urut` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_selesai` date NOT NULL,
  `isi` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `diteruskan` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_kembali` date NOT NULL,
  `kepada` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pengesahan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `harap` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `catatan` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_disposisi`) USING BTREE,
  INDEX `kd_indeks`(`kd_indeks`) USING BTREE,
  INDEX `no_urut`(`no_urut`) USING BTREE,
  CONSTRAINT `surat_keluar_disposisi_ibfk_1` FOREIGN KEY (`kd_indeks`) REFERENCES `surat_indeks` (`kd`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `surat_keluar_disposisi_ibfk_2` FOREIGN KEY (`no_urut`) REFERENCES `surat_keluar` (`no_urut`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for surat_keluar_kendali
-- ----------------------------
DROP TABLE IF EXISTS `surat_keluar_kendali`;
CREATE TABLE `surat_keluar_kendali`  (
  `no_kendali` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_indeks` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_urut` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_selesai` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `kepada` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_kendali`) USING BTREE,
  INDEX `no_surat`(`no_urut`) USING BTREE,
  INDEX `kd_indeks`(`kd_indeks`) USING BTREE,
  CONSTRAINT `surat_keluar_kendali_ibfk_1` FOREIGN KEY (`kd_indeks`) REFERENCES `surat_indeks` (`kd`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `surat_keluar_kendali_ibfk_2` FOREIGN KEY (`no_urut`) REFERENCES `surat_keluar` (`no_urut`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for surat_keluar_set_nomor
-- ----------------------------
DROP TABLE IF EXISTS `surat_keluar_set_nomor`;
CREATE TABLE `surat_keluar_set_nomor`  (
  `id_no_surat` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_surat` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `digit_1` enum('No Urut Bulanan','No Urut Tahunan','Kode Klasifikasi Surat','Kode Sub Klasifikasi Surat','Tanggal Angka','Tanggal Romawi','Bulan Angka','Bulan Romawi','Tahun','Pemisah (-)','Pemisah (/)','Pemisah (.)','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `digit_2` enum('No Urut Bulanan','No Urut Tahunan','Kode Klasifikasi Surat','Kode Sub Klasifikasi Surat','Tanggal Angka','Tanggal Romawi','Bulan Angka','Bulan Romawi','Tahun','Pemisah (-)','Pemisah (/)','Pemisah (.)','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `digit_3` enum('No Urut Bulanan','No Urut Tahunan','Kode Klasifikasi Surat','Kode Sub Klasifikasi Surat','Tanggal Angka','Tanggal Romawi','Bulan Angka','Bulan Romawi','Tahun','Pemisah (-)','Pemisah (/)','Pemisah (.)','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `digit_4` enum('No Urut Bulanan','No Urut Tahunan','Kode Klasifikasi Surat','Kode Sub Klasifikasi Surat','Tanggal Angka','Tanggal Romawi','Bulan Angka','Bulan Romawi','Tahun','Pemisah (-)','Pemisah (/)','Pemisah (.)','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `digit_5` enum('No Urut Bulanan','No Urut Tahunan','Kode Klasifikasi Surat','Kode Sub Klasifikasi Surat','Tanggal Angka','Tanggal Romawi','Bulan Angka','Bulan Romawi','Tahun','Pemisah (-)','Pemisah (/)','Pemisah (.)','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `digit_6` enum('No Urut Bulanan','No Urut Tahunan','Kode Klasifikasi Surat','Kode Sub Klasifikasi Surat','Tanggal Angka','Tanggal Romawi','Bulan Angka','Bulan Romawi','Tahun','Pemisah (-)','Pemisah (/)','Pemisah (.)','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `digit_7` enum('No Urut Bulanan','No Urut Tahunan','Kode Klasifikasi Surat','Kode Sub Klasifikasi Surat','Tanggal Angka','Tanggal Romawi','Bulan Angka','Bulan Romawi','Tahun','Pemisah (-)','Pemisah (/)','Pemisah (.)','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `digit_8` enum('No Urut Bulanan','No Urut Tahunan','Kode Klasifikasi Surat','Kode Sub Klasifikasi Surat','Tanggal Angka','Tanggal Romawi','Bulan Angka','Bulan Romawi','Tahun','Pemisah (-)','Pemisah (/)','Pemisah (.)','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `digit_9` enum('No Urut Bulanan','No Urut Tahunan','Kode Klasifikasi Surat','Kode Sub Klasifikasi Surat','Tanggal Angka','Tanggal Romawi','Bulan Angka','Bulan Romawi','Tahun','Pemisah (-)','Pemisah (/)','Pemisah (.)','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `digit_10` enum('No Urut Bulanan','No Urut Tahunan','Kode Klasifikasi Surat','Kode Sub Klasifikasi Surat','Tanggal Angka','Tanggal Romawi','Bulan Angka','Bulan Romawi','Tahun','Pemisah (-)','Pemisah (/)','Pemisah (.)','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `digit_11` enum('No Urut Bulanan','No Urut Tahunan','Kode Klasifikasi Surat','Kode Sub Klasifikasi Surat','Tanggal Angka','Tanggal Romawi','Bulan Angka','Bulan Romawi','Tahun','Pemisah (-)','Pemisah (/)','Pemisah (.)','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `digit_12` enum('No Urut Bulanan','No Urut Tahunan','Kode Klasifikasi Surat','Kode Sub Klasifikasi Surat','Tanggal Angka','Tanggal Romawi','Bulan Angka','Bulan Romawi','Tahun','Pemisah (-)','Pemisah (/)','Pemisah (.)','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `digit_13` enum('No Urut Bulanan','No Urut Tahunan','Kode Klasifikasi Surat','Kode Sub Klasifikasi Surat','Tanggal Angka','Tanggal Romawi','Bulan Angka','Bulan Romawi','Tahun','Pemisah (-)','Pemisah (/)','Pemisah (.)','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `digit_14` enum('No Urut Bulanan','No Urut Tahunan','Kode Klasifikasi Surat','Kode Sub Klasifikasi Surat','Tanggal Angka','Tanggal Romawi','Bulan Angka','Bulan Romawi','Tahun','Pemisah (-)','Pemisah (/)','Pemisah (.)','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `digit_15` enum('No Urut Bulanan','No Urut Tahunan','Kode Klasifikasi Surat','Kode Sub Klasifikasi Surat','Tanggal Angka','Tanggal Romawi','Bulan Angka','Bulan Romawi','Tahun','Pemisah (-)','Pemisah (/)','Pemisah (.)','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_no_surat`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for surat_keterangan_antigen
-- ----------------------------
DROP TABLE IF EXISTS `surat_keterangan_antigen`;
CREATE TABLE `surat_keterangan_antigen`  (
  `no_surat` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_surat` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hasil_rapid` enum('NEGATIF','POSITIF') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal_hasil` date NULL DEFAULT NULL,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `kd_dokter`(`kd_dokter`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `surat_keterangan_antigen_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `surat_keterangan_antigen_ibfk_2` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `surat_keterangan_antigen_ibfk_3` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for surat_keterangan_covid
-- ----------------------------
DROP TABLE IF EXISTS `surat_keterangan_covid`;
CREATE TABLE `surat_keterangan_covid`  (
  `no_surat` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_surat` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `igm` enum('REAKTIF','NON REAKTIF') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `igg` enum('REAKTIF','NON REAKTIF') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `kd_dokter`(`kd_dokter`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `surat_keterangan_covid_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `surat_keterangan_covid_ibfk_2` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `surat_keterangan_covid_ibfk_3` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for surat_keterangan_isolasi
-- ----------------------------
DROP TABLE IF EXISTS `surat_keterangan_isolasi`;
CREATE TABLE `surat_keterangan_isolasi`  (
  `no_surat` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_surat` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` enum('NEGATIF COVID-19','SELESAI ISOLASI') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `telepon` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal_surat` date NULL DEFAULT NULL,
  `ket` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `kd_dokter`(`kd_dokter`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `surat_keterangan_isolasi_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `surat_keterangan_isolasi_ibfk_2` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `surat_keterangan_isolasi_ibfk_3` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for surat_keterangan_rawat_inap
-- ----------------------------
DROP TABLE IF EXISTS `surat_keterangan_rawat_inap`;
CREATE TABLE `surat_keterangan_rawat_inap`  (
  `no_surat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggalawal` date NULL DEFAULT NULL,
  `tanggalakhir` date NULL DEFAULT NULL,
  PRIMARY KEY (`no_surat`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  CONSTRAINT `surat_keterangan_rawat_inap_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for surat_keterangan_sehat
-- ----------------------------
DROP TABLE IF EXISTS `surat_keterangan_sehat`;
CREATE TABLE `surat_keterangan_sehat`  (
  `no_surat` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_surat` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggalsurat` date NOT NULL,
  `berat` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tinggi` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tensi` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `suhu` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `butawarna` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keperluan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kesimpulan` enum('Sehat','Tidak Sehat') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nadi` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nafas` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  CONSTRAINT `surat_keterangan_sehat_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for surat_klasifikasi
-- ----------------------------
DROP TABLE IF EXISTS `surat_klasifikasi`;
CREATE TABLE `surat_klasifikasi`  (
  `kd` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `klasifikasi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for surat_lemari
-- ----------------------------
DROP TABLE IF EXISTS `surat_lemari`;
CREATE TABLE `surat_lemari`  (
  `kd` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lemari` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for surat_map
-- ----------------------------
DROP TABLE IF EXISTS `surat_map`;
CREATE TABLE `surat_map`  (
  `kd` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `map` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for surat_masuk
-- ----------------------------
DROP TABLE IF EXISTS `surat_masuk`;
CREATE TABLE `surat_masuk`  (
  `no_urut` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_surat` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `asal` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tujuan` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_surat` date NOT NULL,
  `perihal` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_terima` date NOT NULL,
  `kd_lemari` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_rak` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_map` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_ruang` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_sifat` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lampiran` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tembusan` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_deadline_balas` date NOT NULL,
  `kd_balas` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_status` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_klasifikasi` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `file_url` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_urut`) USING BTREE,
  INDEX `kd_lemari`(`kd_lemari`) USING BTREE,
  INDEX `kd_rak`(`kd_rak`) USING BTREE,
  INDEX `kd_map`(`kd_map`) USING BTREE,
  INDEX `kd_ruang`(`kd_ruang`) USING BTREE,
  INDEX `kd_sifat`(`kd_sifat`) USING BTREE,
  INDEX `kd_balas`(`kd_balas`) USING BTREE,
  INDEX `kd_status`(`kd_status`) USING BTREE,
  INDEX `kd_klasifikasi`(`kd_klasifikasi`) USING BTREE,
  CONSTRAINT `surat_masuk_ibfk_1` FOREIGN KEY (`kd_lemari`) REFERENCES `surat_lemari` (`kd`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `surat_masuk_ibfk_2` FOREIGN KEY (`kd_rak`) REFERENCES `surat_rak` (`kd`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `surat_masuk_ibfk_3` FOREIGN KEY (`kd_map`) REFERENCES `surat_map` (`kd`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `surat_masuk_ibfk_4` FOREIGN KEY (`kd_ruang`) REFERENCES `surat_ruang` (`kd`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `surat_masuk_ibfk_5` FOREIGN KEY (`kd_sifat`) REFERENCES `surat_sifat` (`kd`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `surat_masuk_ibfk_6` FOREIGN KEY (`kd_balas`) REFERENCES `surat_balas` (`kd`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `surat_masuk_ibfk_7` FOREIGN KEY (`kd_status`) REFERENCES `surat_status` (`kd`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `surat_masuk_ibfk_8` FOREIGN KEY (`kd_klasifikasi`) REFERENCES `surat_klasifikasi` (`kd`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for surat_masuk_disposisi
-- ----------------------------
DROP TABLE IF EXISTS `surat_masuk_disposisi`;
CREATE TABLE `surat_masuk_disposisi`  (
  `no_disposisi` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_indeks` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_urut` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_selesai` date NOT NULL,
  `isi` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `diteruskan` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_kembali` date NOT NULL,
  `kepada` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pengesahan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `harap` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `catatan` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_disposisi`) USING BTREE,
  INDEX `kd_indeks`(`kd_indeks`) USING BTREE,
  INDEX `no_urut`(`no_urut`) USING BTREE,
  CONSTRAINT `surat_masuk_disposisi_ibfk_1` FOREIGN KEY (`kd_indeks`) REFERENCES `surat_indeks` (`kd`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `surat_masuk_disposisi_ibfk_2` FOREIGN KEY (`no_urut`) REFERENCES `surat_masuk` (`no_urut`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for surat_masuk_kendali
-- ----------------------------
DROP TABLE IF EXISTS `surat_masuk_kendali`;
CREATE TABLE `surat_masuk_kendali`  (
  `no_kendali` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_indeks` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_urut` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_selesai` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `kepada` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pengesahan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_kendali`) USING BTREE,
  INDEX `no_surat`(`no_urut`) USING BTREE,
  INDEX `kd_indeks`(`kd_indeks`) USING BTREE,
  CONSTRAINT `surat_masuk_kendali_ibfk_1` FOREIGN KEY (`kd_indeks`) REFERENCES `surat_indeks` (`kd`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `surat_masuk_kendali_ibfk_2` FOREIGN KEY (`no_urut`) REFERENCES `surat_masuk` (`no_urut`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for surat_pemesanan_medis
-- ----------------------------
DROP TABLE IF EXISTS `surat_pemesanan_medis`;
CREATE TABLE `surat_pemesanan_medis`  (
  `no_pemesanan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_suplier` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `total1` double NOT NULL,
  `potongan` double NOT NULL,
  `total2` double NOT NULL,
  `ppn` double NULL DEFAULT NULL,
  `meterai` double NULL DEFAULT NULL,
  `tagihan` double NULL DEFAULT NULL,
  `status` enum('Proses Pesan','Sudah Datang') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_pemesanan`) USING BTREE,
  INDEX `kode_suplier`(`kode_suplier`) USING BTREE,
  INDEX `surat_pemesanan_medis_ibfk_2`(`nip`) USING BTREE,
  CONSTRAINT `surat_pemesanan_medis_ibfk_1` FOREIGN KEY (`kode_suplier`) REFERENCES `datasuplier` (`kode_suplier`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `surat_pemesanan_medis_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nik`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for surat_pemesanan_non_medis
-- ----------------------------
DROP TABLE IF EXISTS `surat_pemesanan_non_medis`;
CREATE TABLE `surat_pemesanan_non_medis`  (
  `no_pemesanan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_suplier` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `subtotal` double NOT NULL,
  `potongan` double NOT NULL,
  `total` double NOT NULL,
  `ppn` double NULL DEFAULT NULL,
  `meterai` double NULL DEFAULT NULL,
  `tagihan` double NULL DEFAULT NULL,
  `status` enum('Proses Pesan','Sudah Datang') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_pemesanan`) USING BTREE,
  INDEX `kode_suplier`(`kode_suplier`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `surat_pemesanan_non_medis_ibfk_1` FOREIGN KEY (`kode_suplier`) REFERENCES `ipsrssuplier` (`kode_suplier`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `surat_pemesanan_non_medis_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nik`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for surat_rak
-- ----------------------------
DROP TABLE IF EXISTS `surat_rak`;
CREATE TABLE `surat_rak`  (
  `kd` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rak` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for surat_ruang
-- ----------------------------
DROP TABLE IF EXISTS `surat_ruang`;
CREATE TABLE `surat_ruang`  (
  `kd` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ruang` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for surat_sifat
-- ----------------------------
DROP TABLE IF EXISTS `surat_sifat`;
CREATE TABLE `surat_sifat`  (
  `kd` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sifat` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for surat_skbn
-- ----------------------------
DROP TABLE IF EXISTS `surat_skbn`;
CREATE TABLE `surat_skbn`  (
  `no_surat` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `tanggalsurat` date NULL DEFAULT NULL,
  `kategori` enum('UMUM','POLRI','TNI') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'UMUM',
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `keperluan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `opiat` enum('NEGATIF','POSITIF') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'NEGATIF',
  `ganja` enum('NEGATIF','POSITIF') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'NEGATIF',
  `amphetamin` enum('NEGATIF','POSITIF') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'NEGATIF',
  `methamphetamin` enum('NEGATIF','POSITIF') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'NEGATIF',
  `benzodiazepin` enum('NEGATIF','POSITIF') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'NEGATIF',
  `cocain` enum('NEGATIF','POSITIF') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'NEGATIF',
  PRIMARY KEY (`no_surat`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `kd_dokter`(`kd_dokter`) USING BTREE,
  CONSTRAINT `surat_skbn_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `surat_skbn_ibfk_2` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for surat_status
-- ----------------------------
DROP TABLE IF EXISTS `surat_status`;
CREATE TABLE `surat_status`  (
  `kd` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for surat_sub_klasifikasi
-- ----------------------------
DROP TABLE IF EXISTS `surat_sub_klasifikasi`;
CREATE TABLE `surat_sub_klasifikasi`  (
  `kd` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_klasifikasi` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sub_klasifikasi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_bulanan` int(11) NULL DEFAULT NULL,
  `no_tahunan` int(11) NULL DEFAULT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  PRIMARY KEY (`kd`) USING BTREE,
  INDEX `surat_sub_klasifikasi_ibfk_1`(`kd_klasifikasi`) USING BTREE,
  CONSTRAINT `surat_sub_klasifikasi_ibfk_1` FOREIGN KEY (`kd_klasifikasi`) REFERENCES `surat_klasifikasi` (`kd`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for suratsakit
-- ----------------------------
DROP TABLE IF EXISTS `suratsakit`;
CREATE TABLE `suratsakit`  (
  `no_surat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggalawal` date NULL DEFAULT NULL,
  `tanggalakhir` date NULL DEFAULT NULL,
  `lamasakit` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_surat`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  CONSTRAINT `suratsakit_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for suratsakitpihak2
-- ----------------------------
DROP TABLE IF EXISTS `suratsakitpihak2`;
CREATE TABLE `suratsakitpihak2`  (
  `no_surat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggalawal` date NULL DEFAULT NULL,
  `tanggalakhir` date NULL DEFAULT NULL,
  `lamasakit` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama2` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_lahir` date NOT NULL,
  `umur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jk` enum('Laki-laki','Perempuan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alamat` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hubungan` enum('Suami','Istri','Anak','Ayah','Saudara','Keponakan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pekerjaan` enum('Karyawan Swasta','PNS','Wiraswasta','Pelajar','Mahasiswa','Buruh','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `instansi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  CONSTRAINT `suratsakitpihak2_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tagihan_bpd_jateng
-- ----------------------------
DROP TABLE IF EXISTS `tagihan_bpd_jateng`;
CREATE TABLE `tagihan_bpd_jateng`  (
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nm_pasien` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alamat` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jk` enum('L','P') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_lahir` date NOT NULL,
  `umurdaftar` varchar(7) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_registrasi` date NULL DEFAULT NULL,
  `no_nota` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `besar_bayar` double NULL DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status_lanjut` enum('Ranap','Ralan','Jual Bebas','Deposit','Bayar Piutang') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_closing` date NULL DEFAULT NULL,
  `status_bayar` enum('Sudah','Pending') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kasir` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `diupdatebank` datetime(0) NULL DEFAULT NULL,
  `referensi` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_nota`) USING BTREE,
  INDEX `no_rkm_medis`(`no_rkm_medis`) USING BTREE,
  CONSTRAINT `tagihan_bpd_jateng_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tagihan_obat_langsung
-- ----------------------------
DROP TABLE IF EXISTS `tagihan_obat_langsung`;
CREATE TABLE `tagihan_obat_langsung`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `besar_tagihan` double NOT NULL,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  CONSTRAINT `tagihan_obat_langsung_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tagihan_sadewa
-- ----------------------------
DROP TABLE IF EXISTS `tagihan_sadewa`;
CREATE TABLE `tagihan_sadewa`  (
  `no_nota` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_pasien` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alamat` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_bayar` datetime(0) NOT NULL,
  `jenis_bayar` enum('Pelunasan','Deposit','Cicilan','Uang Muka') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jumlah_tagihan` double NOT NULL,
  `jumlah_bayar` double NOT NULL,
  `status` enum('Sudah','Belum') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `petugas` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_nota`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tambahan_biaya
-- ----------------------------
DROP TABLE IF EXISTS `tambahan_biaya`;
CREATE TABLE `tambahan_biaya`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_biaya` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `besar_biaya` double NOT NULL,
  PRIMARY KEY (`no_rawat`, `nama_biaya`) USING BTREE,
  CONSTRAINT `tambahan_biaya_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tambahanpotongan
-- ----------------------------
DROP TABLE IF EXISTS `tambahanpotongan`;
CREATE TABLE `tambahanpotongan`  (
  `indexins` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `potongan` double NOT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tambahjaga
-- ----------------------------
DROP TABLE IF EXISTS `tambahjaga`;
CREATE TABLE `tambahjaga`  (
  `tgl` date NOT NULL,
  `id` int(11) NOT NULL,
  `jml` int(11) NOT NULL,
  PRIMARY KEY (`tgl`, `id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  CONSTRAINT `tambahjaga_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tampbeli1
-- ----------------------------
DROP TABLE IF EXISTS `tampbeli1`;
CREATE TABLE `tampbeli1`  (
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nama_brng` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `satuan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `satuan_stok` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `h_beli` double NULL DEFAULT NULL,
  `jumlah` double NULL DEFAULT NULL,
  `jumlah_stok` double NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  PRIMARY KEY (`kode_brng`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  CONSTRAINT `tampbeli1_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tampjual1
-- ----------------------------
DROP TABLE IF EXISTS `tampjual1`;
CREATE TABLE `tampjual1`  (
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nama_brng` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `satuan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `h_jual` double NULL DEFAULT NULL,
  `h_beli` double NOT NULL,
  `jumlah` double NULL DEFAULT NULL,
  `subtotal` double NULL DEFAULT NULL,
  `dis` double NULL DEFAULT NULL,
  `bsr_dis` double NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  PRIMARY KEY (`kode_brng`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  CONSTRAINT `tampjual1_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tampjurnal
-- ----------------------------
DROP TABLE IF EXISTS `tampjurnal`;
CREATE TABLE `tampjurnal`  (
  `kd_rek` char(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_rek` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `debet` double NULL DEFAULT NULL,
  `kredit` double NULL DEFAULT NULL,
  PRIMARY KEY (`kd_rek`) USING HASH,
  INDEX `nm_rek`(`nm_rek`) USING HASH,
  INDEX `debet`(`debet`) USING HASH,
  INDEX `kredit`(`kredit`) USING HASH
) ENGINE = MEMORY CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for tampjurnal2
-- ----------------------------
DROP TABLE IF EXISTS `tampjurnal2`;
CREATE TABLE `tampjurnal2`  (
  `kd_rek` char(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_rek` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `debet` double NULL DEFAULT NULL,
  `kredit` double NULL DEFAULT NULL,
  PRIMARY KEY (`kd_rek`) USING HASH,
  INDEX `nm_rek`(`nm_rek`) USING HASH,
  INDEX `debet`(`debet`) USING HASH,
  INDEX `kredit`(`kredit`) USING HASH
) ENGINE = MEMORY CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for tamppiutang
-- ----------------------------
DROP TABLE IF EXISTS `tamppiutang`;
CREATE TABLE `tamppiutang`  (
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nama_brng` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `satuan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `h_jual` double NULL DEFAULT NULL,
  `h_beli` double NULL DEFAULT NULL,
  `jumlah` double NULL DEFAULT NULL,
  `subtotal` double NULL DEFAULT NULL,
  `dis` double NULL DEFAULT NULL,
  `bsr_dis` double NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  `no_batch` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `petugas` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `aturan_pakai` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kode_brng`, `no_batch`, `no_faktur`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  CONSTRAINT `tamppiutang_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tampreturbeli
-- ----------------------------
DROP TABLE IF EXISTS `tampreturbeli`;
CREATE TABLE `tampreturbeli`  (
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nama_brng` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `satuan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `h_beli` double NULL DEFAULT NULL,
  `jml_beli` double NULL DEFAULT NULL,
  `h_retur` double NULL DEFAULT NULL,
  `jml_retur` double NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  `no_batch` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jml_retur2` double NULL DEFAULT NULL,
  `kadaluarsa` varchar(14) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `petugas` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_faktur`, `kode_brng`) USING BTREE,
  INDEX `no_faktur`(`no_faktur`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  CONSTRAINT `tampreturbeli_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tampreturjual
-- ----------------------------
DROP TABLE IF EXISTS `tampreturjual`;
CREATE TABLE `tampreturjual`  (
  `nota_jual` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nama_brng` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jml_jual` double NULL DEFAULT NULL,
  `h_jual` double NULL DEFAULT NULL,
  `jml_retur` double NULL DEFAULT NULL,
  `h_retur` double NULL DEFAULT NULL,
  `satuan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `subtotal` double NULL DEFAULT NULL,
  `no_batch` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `petugas` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`nota_jual`, `kode_brng`, `no_batch`, `no_faktur`) USING BTREE,
  INDEX `nota_jual`(`nota_jual`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  CONSTRAINT `tampreturjual_ibfk_3` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tampreturpiutang
-- ----------------------------
DROP TABLE IF EXISTS `tampreturpiutang`;
CREATE TABLE `tampreturpiutang`  (
  `nota_piutang` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nama_brng` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jml_piutang` double NULL DEFAULT NULL,
  `h_piutang` double NULL DEFAULT NULL,
  `jml_retur` double NULL DEFAULT NULL,
  `h_retur` double NULL DEFAULT NULL,
  `satuan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `subtotal` double NULL DEFAULT NULL,
  `no_batch` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `petugas` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`nota_piutang`, `kode_brng`, `no_batch`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  CONSTRAINT `tampreturpiutang_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for template_laboratorium
-- ----------------------------
DROP TABLE IF EXISTS `template_laboratorium`;
CREATE TABLE `template_laboratorium`  (
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_template` int(11) NOT NULL AUTO_INCREMENT,
  `Pemeriksaan` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `satuan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nilai_rujukan_ld` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nilai_rujukan_la` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nilai_rujukan_pd` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nilai_rujukan_pa` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bagian_rs` double NOT NULL,
  `bhp` double NOT NULL,
  `bagian_perujuk` double NOT NULL,
  `bagian_dokter` double NOT NULL,
  `bagian_laborat` double NOT NULL,
  `kso` double NULL DEFAULT NULL,
  `menejemen` double NULL DEFAULT NULL,
  `biaya_item` double NOT NULL,
  `urut` int(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id_template`) USING BTREE,
  INDEX `kd_jenis_prw`(`kd_jenis_prw`) USING BTREE,
  INDEX `Pemeriksaan`(`Pemeriksaan`) USING BTREE,
  INDEX `satuan`(`satuan`) USING BTREE,
  INDEX `nilai_rujukan_ld`(`nilai_rujukan_ld`) USING BTREE,
  INDEX `nilai_rujukan_la`(`nilai_rujukan_la`) USING BTREE,
  INDEX `nilai_rujukan_pd`(`nilai_rujukan_pd`) USING BTREE,
  INDEX `nilai_rujukan_pa`(`nilai_rujukan_pa`) USING BTREE,
  INDEX `bagian_rs`(`bagian_rs`) USING BTREE,
  INDEX `bhp`(`bhp`) USING BTREE,
  INDEX `bagian_perujuk`(`bagian_perujuk`) USING BTREE,
  INDEX `bagian_dokter`(`bagian_dokter`) USING BTREE,
  INDEX `bagian_laborat`(`bagian_laborat`) USING BTREE,
  INDEX `kso`(`kso`) USING BTREE,
  INDEX `menejemen`(`menejemen`) USING BTREE,
  INDEX `biaya_item`(`biaya_item`) USING BTREE,
  INDEX `urut`(`urut`) USING BTREE,
  CONSTRAINT `template_laboratorium_ibfk_1` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_lab` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3260 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for template_utd
-- ----------------------------
DROP TABLE IF EXISTS `template_utd`;
CREATE TABLE `template_utd`  (
  `kd_jenis_prw` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_template` int(11) NOT NULL AUTO_INCREMENT,
  `pemeriksaan` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nilai_rujukan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bagian_rs` double NULL DEFAULT NULL,
  `bhp` double NULL DEFAULT NULL,
  `bagian_perujuk` double NULL DEFAULT NULL,
  `bagian_dokter` double NULL DEFAULT NULL,
  `petugas_utd` double NULL DEFAULT NULL,
  `kso` double NULL DEFAULT NULL,
  `menejemen` double NULL DEFAULT NULL,
  `biaya_item` double NULL DEFAULT NULL,
  `urut` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id_template`) USING BTREE,
  INDEX `kd_jenis_prw`(`kd_jenis_prw`) USING BTREE,
  CONSTRAINT `template_utd_ibfk_1` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_utd` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for temporary
-- ----------------------------
DROP TABLE IF EXISTS `temporary`;
CREATE TABLE `temporary`  (
  `no` int(100) NOT NULL AUTO_INCREMENT,
  `temp1` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp2` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp3` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp4` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp5` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp6` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp7` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp8` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp9` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp10` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp11` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp12` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp13` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp14` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp15` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp16` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp17` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp18` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp19` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp20` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp21` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp22` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp23` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp24` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp25` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp26` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp27` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp28` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp29` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp30` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp31` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp32` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp33` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp34` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp35` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp36` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp37` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for temporary2
-- ----------------------------
DROP TABLE IF EXISTS `temporary2`;
CREATE TABLE `temporary2`  (
  `no` int(100) NOT NULL AUTO_INCREMENT,
  `temp1` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp2` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp3` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp4` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp5` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp6` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp7` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp8` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp9` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp10` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp11` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp12` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp13` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp14` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp15` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp16` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp17` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp18` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp19` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp20` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp21` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp22` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp23` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp24` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp25` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp26` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp27` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp28` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp29` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp30` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp31` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp32` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp33` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp34` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp35` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp36` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp37` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp38` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp39` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp40` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp41` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp42` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp43` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp44` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp45` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp46` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp47` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp48` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp49` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp50` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp51` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp52` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp53` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp54` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp55` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp56` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp57` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp58` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp59` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp60` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp61` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp62` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp63` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp64` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp65` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp66` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp67` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp68` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp69` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp70` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp71` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp72` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp73` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp74` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp75` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp76` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp77` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp78` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp79` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp80` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp81` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp82` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp83` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp84` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp85` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp86` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp87` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp88` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp89` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp90` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp91` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp92` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp93` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp94` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp95` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp96` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp97` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp98` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp99` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp100` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for temporary_bayar_ralan
-- ----------------------------
DROP TABLE IF EXISTS `temporary_bayar_ralan`;
CREATE TABLE `temporary_bayar_ralan`  (
  `no` int(100) NOT NULL AUTO_INCREMENT,
  `temp1` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp2` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp3` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp4` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp5` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp6` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp7` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp8` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp9` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp10` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp11` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp12` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp13` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp14` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp15` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp16` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp17` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11160 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for temporary_bayar_ranap
-- ----------------------------
DROP TABLE IF EXISTS `temporary_bayar_ranap`;
CREATE TABLE `temporary_bayar_ranap`  (
  `no` int(100) NOT NULL AUTO_INCREMENT,
  `temp1` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp2` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp3` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp4` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp5` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp6` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp7` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp8` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp9` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp10` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp11` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp12` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp13` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp14` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp15` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp16` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp17` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 33 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for temporary_booking_registrasi
-- ----------------------------
DROP TABLE IF EXISTS `temporary_booking_registrasi`;
CREATE TABLE `temporary_booking_registrasi`  (
  `no` int(100) NOT NULL AUTO_INCREMENT,
  `temp1` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp2` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp3` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp4` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp5` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp6` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp7` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp8` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp9` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp10` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp11` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp12` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp13` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp14` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp15` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp16` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp17` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp18` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp19` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp20` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp21` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp22` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp23` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp24` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp25` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp26` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp27` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp28` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp29` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp30` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp31` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp32` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp33` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp34` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp35` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp36` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp37` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for temporary_gizi
-- ----------------------------
DROP TABLE IF EXISTS `temporary_gizi`;
CREATE TABLE `temporary_gizi`  (
  `no` int(100) NOT NULL AUTO_INCREMENT,
  `temp1` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp2` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp3` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp4` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp5` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp6` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp7` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp8` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp9` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp10` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp11` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp12` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp13` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp14` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp15` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp16` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp17` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp18` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp19` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp20` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp21` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp22` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp23` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp24` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp25` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp26` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp27` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp28` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp29` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp30` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp31` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp32` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp33` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp34` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp35` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp36` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp37` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 50 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for temporary_grafik
-- ----------------------------
DROP TABLE IF EXISTS `temporary_grafik`;
CREATE TABLE `temporary_grafik`  (
  `no` int(100) NOT NULL AUTO_INCREMENT,
  `temp1` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp2` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp3` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp4` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp5` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp6` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp7` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp8` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp9` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp10` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp11` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp12` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp13` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp14` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp15` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp16` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp17` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp18` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp19` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp20` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp21` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp22` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp23` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp24` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp25` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp26` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp27` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp28` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp29` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp30` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp31` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp32` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp33` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp34` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp35` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp36` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp37` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for temporary_lab
-- ----------------------------
DROP TABLE IF EXISTS `temporary_lab`;
CREATE TABLE `temporary_lab`  (
  `no` int(100) NOT NULL AUTO_INCREMENT,
  `temp1` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp2` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp3` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp4` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp5` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp6` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp7` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp8` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp9` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp10` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp11` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp12` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp13` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp14` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp15` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp16` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp17` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp18` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp19` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp20` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp21` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp22` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp23` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp24` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp25` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp26` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp27` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp28` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp29` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp30` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp31` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp32` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp33` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp34` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp35` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp36` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp37` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for temporary_lama_pelayanan_radiologi
-- ----------------------------
DROP TABLE IF EXISTS `temporary_lama_pelayanan_radiologi`;
CREATE TABLE `temporary_lama_pelayanan_radiologi`  (
  `no` int(100) NOT NULL AUTO_INCREMENT,
  `temp1` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp2` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp3` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp4` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp5` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp6` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp7` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp8` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp9` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp10` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp11` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp12` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp13` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp14` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp15` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp16` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp17` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp18` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp19` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp20` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp21` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp22` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp23` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp24` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp25` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp26` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp27` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp28` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp29` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp30` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp31` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp32` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp33` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp34` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp35` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp36` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp37` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 40 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for temporary_payment
-- ----------------------------
DROP TABLE IF EXISTS `temporary_payment`;
CREATE TABLE `temporary_payment`  (
  `no` int(100) NOT NULL AUTO_INCREMENT,
  `temp1` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp2` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp3` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp4` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp5` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp6` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp7` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp8` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp9` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp10` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp11` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp12` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp13` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp14` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp15` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp16` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp17` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp18` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp19` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp20` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp21` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp22` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp23` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp24` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp25` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp26` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp27` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp28` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp29` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp30` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp31` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp32` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp33` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp34` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp35` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp36` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp37` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for temporary_permintaan_lab
-- ----------------------------
DROP TABLE IF EXISTS `temporary_permintaan_lab`;
CREATE TABLE `temporary_permintaan_lab`  (
  `no` int(100) NOT NULL AUTO_INCREMENT,
  `temp1` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp2` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp3` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp4` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp5` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp6` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp7` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp8` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp9` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp10` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp11` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp12` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp13` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp14` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp15` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp16` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp17` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp18` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp19` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp20` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp21` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp22` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp23` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp24` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp25` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp26` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp27` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp28` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp29` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp30` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp31` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp32` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp33` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp34` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp35` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp36` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp37` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for temporary_permintaan_radiologi
-- ----------------------------
DROP TABLE IF EXISTS `temporary_permintaan_radiologi`;
CREATE TABLE `temporary_permintaan_radiologi`  (
  `no` int(100) NOT NULL AUTO_INCREMENT,
  `temp1` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp2` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp3` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp4` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp5` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp6` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp7` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp8` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp9` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp10` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp11` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp12` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp13` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp14` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp15` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp16` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp17` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp18` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp19` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp20` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp21` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp22` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp23` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp24` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp25` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp26` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp27` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp28` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp29` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp30` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp31` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp32` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp33` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp34` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp35` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp36` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp37` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for temporary_presensi
-- ----------------------------
DROP TABLE IF EXISTS `temporary_presensi`;
CREATE TABLE `temporary_presensi`  (
  `id` int(11) NOT NULL,
  `shift` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jam_datang` datetime(0) NULL DEFAULT NULL,
  `jam_pulang` datetime(0) NULL DEFAULT NULL,
  `status` enum('Tepat Waktu','Terlambat Toleransi','Terlambat I','Terlambat II','Tepat Waktu & PSW','Terlambat Toleransi & PSW','Terlambat I & PSW','Terlambat II & PSW') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterlambatan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `durasi` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `photo` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `temporary_presensi_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for temporary_radiologi
-- ----------------------------
DROP TABLE IF EXISTS `temporary_radiologi`;
CREATE TABLE `temporary_radiologi`  (
  `no` int(100) NOT NULL AUTO_INCREMENT,
  `temp1` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp2` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp3` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp4` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp5` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp6` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp7` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp8` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp9` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp10` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp11` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp12` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp13` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp14` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp15` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp16` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp17` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp18` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp19` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp20` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp21` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp22` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp23` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp24` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp25` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp26` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp27` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp28` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp29` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp30` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp31` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp32` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp33` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp34` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp35` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp36` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp37` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for temporary_resep
-- ----------------------------
DROP TABLE IF EXISTS `temporary_resep`;
CREATE TABLE `temporary_resep`  (
  `no` int(100) NOT NULL AUTO_INCREMENT,
  `temp1` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp2` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp3` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp4` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp5` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp6` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp7` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp8` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp9` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp10` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp11` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp12` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp13` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp14` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp15` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp16` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp17` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp18` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp19` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp20` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp21` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp22` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp23` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp24` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp25` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp26` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp27` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp28` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp29` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp30` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp31` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp32` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp33` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp34` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp35` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp36` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp37` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for temporary_resume
-- ----------------------------
DROP TABLE IF EXISTS `temporary_resume`;
CREATE TABLE `temporary_resume`  (
  `no` int(100) NOT NULL AUTO_INCREMENT,
  `temp1` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp2` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp3` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp4` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp5` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp6` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp7` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp8` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp9` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp10` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp11` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp12` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp13` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp14` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp15` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp16` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp17` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp18` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp19` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp20` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp21` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp22` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp23` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp24` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp25` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp26` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp27` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp28` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp29` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp30` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp31` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp32` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp33` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp34` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp35` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp36` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp37` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for temporary_sensus_harian
-- ----------------------------
DROP TABLE IF EXISTS `temporary_sensus_harian`;
CREATE TABLE `temporary_sensus_harian`  (
  `no` int(100) NOT NULL AUTO_INCREMENT,
  `temp1` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp2` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp3` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp4` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp5` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp6` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp7` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp8` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp9` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp10` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp11` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp12` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp13` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp14` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp15` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp16` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp17` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp18` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp19` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp20` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp21` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp22` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp23` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp24` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp25` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp26` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp27` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp28` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp29` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp30` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp31` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp32` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp33` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp34` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp35` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp36` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp37` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for temporary_surveilens_penyakit
-- ----------------------------
DROP TABLE IF EXISTS `temporary_surveilens_penyakit`;
CREATE TABLE `temporary_surveilens_penyakit`  (
  `kd_penyakit` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_penyakit2` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  INDEX `kd_penyakit`(`kd_penyakit`) USING BTREE,
  INDEX `kd_penyakit2`(`kd_penyakit2`) USING BTREE,
  CONSTRAINT `temporary_surveilens_penyakit_ibfk_1` FOREIGN KEY (`kd_penyakit`) REFERENCES `penyakit` (`kd_penyakit`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `temporary_surveilens_penyakit_ibfk_2` FOREIGN KEY (`kd_penyakit2`) REFERENCES `penyakit` (`kd_penyakit`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for temporary_tambahan_potongan
-- ----------------------------
DROP TABLE IF EXISTS `temporary_tambahan_potongan`;
CREATE TABLE `temporary_tambahan_potongan`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_tambahan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `biaya` double NOT NULL,
  `status` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `nama_tambahan`, `status`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for temporary_toko
-- ----------------------------
DROP TABLE IF EXISTS `temporary_toko`;
CREATE TABLE `temporary_toko`  (
  `no` int(100) NOT NULL AUTO_INCREMENT,
  `temp1` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp2` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp3` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp4` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp5` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp6` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp7` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp8` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp9` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp10` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp11` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp12` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp13` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp14` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp15` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp16` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp17` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp18` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp19` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp20` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp21` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp22` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp23` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp24` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp25` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp26` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp27` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp28` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp29` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp30` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp31` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp32` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp33` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp34` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp35` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp36` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `temp37` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for temppanggilnorawat
-- ----------------------------
DROP TABLE IF EXISTS `temppanggilnorawat`;
CREATE TABLE `temppanggilnorawat`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for temppanggilrm
-- ----------------------------
DROP TABLE IF EXISTS `temppanggilrm`;
CREATE TABLE `temppanggilrm`  (
  `no_rkm_medis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rkm_medis`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tindakan
-- ----------------------------
DROP TABLE IF EXISTS `tindakan`;
CREATE TABLE `tindakan`  (
  `tgl` datetime(0) NOT NULL,
  `id` int(11) NOT NULL,
  `tnd` int(11) NOT NULL,
  `jm` double NOT NULL,
  `nm_pasien` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kamar` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `diagnosa` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jmlh` int(11) NOT NULL,
  PRIMARY KEY (`tgl`, `id`, `tnd`, `nm_pasien`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `tnd`(`tnd`) USING BTREE,
  CONSTRAINT `tindakan_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for titip_faktur
-- ----------------------------
DROP TABLE IF EXISTS `titip_faktur`;
CREATE TABLE `titip_faktur`  (
  `no_tagihan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keterangan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` enum('Ditagihkan','Dibayar') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_tagihan`) USING BTREE,
  INDEX `titip_faktur_ibfk_1`(`nip`) USING BTREE,
  CONSTRAINT `titip_faktur_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for toko_bayar_pemesanan
-- ----------------------------
DROP TABLE IF EXISTS `toko_bayar_pemesanan`;
CREATE TABLE `toko_bayar_pemesanan`  (
  `tgl_bayar` date NULL DEFAULT NULL,
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `besar_bayar` double NULL DEFAULT NULL,
  `keterangan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_bayar` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_bukti` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  INDEX `tgl_bayar`(`tgl_bayar`) USING BTREE,
  INDEX `no_faktur`(`no_faktur`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  INDEX `nama_bayar`(`nama_bayar`) USING BTREE,
  CONSTRAINT `toko_bayar_pemesanan_ibfk_1` FOREIGN KEY (`no_faktur`) REFERENCES `tokopemesanan` (`no_faktur`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `toko_bayar_pemesanan_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `toko_bayar_pemesanan_ibfk_3` FOREIGN KEY (`nama_bayar`) REFERENCES `akun_bayar` (`nama_bayar`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for toko_bayar_piutang
-- ----------------------------
DROP TABLE IF EXISTS `toko_bayar_piutang`;
CREATE TABLE `toko_bayar_piutang`  (
  `tgl_bayar` date NOT NULL,
  `no_member` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `besar_cicilan` double NOT NULL,
  `catatan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nota_piutang` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_rek` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_rek_kontra` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`tgl_bayar`, `no_member`, `nota_piutang`, `kd_rek`, `kd_rek_kontra`) USING BTREE,
  INDEX `no_member`(`no_member`) USING BTREE,
  INDEX `kd_rek`(`kd_rek`) USING BTREE,
  INDEX `kd_rek_kontra`(`kd_rek_kontra`) USING BTREE,
  INDEX `nota_piutang`(`nota_piutang`) USING BTREE,
  CONSTRAINT `toko_bayar_piutang_ibfk_1` FOREIGN KEY (`no_member`) REFERENCES `tokomember` (`no_member`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `toko_bayar_piutang_ibfk_2` FOREIGN KEY (`kd_rek`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `toko_bayar_piutang_ibfk_3` FOREIGN KEY (`kd_rek_kontra`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `toko_bayar_piutang_ibfk_4` FOREIGN KEY (`nota_piutang`) REFERENCES `tokopiutang` (`nota_piutang`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for toko_detail_beli
-- ----------------------------
DROP TABLE IF EXISTS `toko_detail_beli`;
CREATE TABLE `toko_detail_beli`  (
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jumlah` double NOT NULL,
  `harga` double NOT NULL,
  `subtotal` double NOT NULL,
  `dis` double NOT NULL,
  `besardis` double NOT NULL,
  `total` double NOT NULL,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `jumlah`(`jumlah`) USING BTREE,
  INDEX `harga`(`harga`) USING BTREE,
  INDEX `subtotal`(`subtotal`) USING BTREE,
  INDEX `dis`(`dis`) USING BTREE,
  INDEX `besardis`(`besardis`) USING BTREE,
  INDEX `total`(`total`) USING BTREE,
  INDEX `no_faktur`(`no_faktur`) USING BTREE,
  CONSTRAINT `toko_detail_beli_ibfk_1` FOREIGN KEY (`no_faktur`) REFERENCES `tokopembelian` (`no_faktur`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `toko_detail_beli_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `tokobarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `toko_detail_beli_ibfk_3` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for toko_detail_jual
-- ----------------------------
DROP TABLE IF EXISTS `toko_detail_jual`;
CREATE TABLE `toko_detail_jual`  (
  `nota_jual` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `h_jual` double NULL DEFAULT NULL,
  `h_beli` double NULL DEFAULT NULL,
  `jumlah` double NULL DEFAULT NULL,
  `subtotal` double NULL DEFAULT NULL,
  `dis` double NULL DEFAULT NULL,
  `bsr_dis` double NULL DEFAULT NULL,
  `tambahan` double NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  INDEX `nota_jual`(`nota_jual`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  CONSTRAINT `toko_detail_jual_ibfk_1` FOREIGN KEY (`nota_jual`) REFERENCES `tokopenjualan` (`nota_jual`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `toko_detail_jual_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `tokobarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `toko_detail_jual_ibfk_3` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for toko_detail_pengajuan_barang
-- ----------------------------
DROP TABLE IF EXISTS `toko_detail_pengajuan_barang`;
CREATE TABLE `toko_detail_pengajuan_barang`  (
  `no_pengajuan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jumlah` double NULL DEFAULT NULL,
  `h_pengajuan` double NULL DEFAULT NULL,
  `total` double NOT NULL,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  INDEX `no_pengajuan`(`no_pengajuan`) USING BTREE,
  CONSTRAINT `toko_detail_pengajuan_barang_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `tokobarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `toko_detail_pengajuan_barang_ibfk_2` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `toko_detail_pengajuan_barang_ibfk_3` FOREIGN KEY (`no_pengajuan`) REFERENCES `toko_pengajuan_barang` (`no_pengajuan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for toko_detail_pesan
-- ----------------------------
DROP TABLE IF EXISTS `toko_detail_pesan`;
CREATE TABLE `toko_detail_pesan`  (
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jumlah` double NOT NULL,
  `harga` double NOT NULL,
  `subtotal` double NOT NULL,
  `dis` double NOT NULL,
  `besardis` double NOT NULL,
  `total` double NOT NULL,
  INDEX `no_faktur`(`no_faktur`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  CONSTRAINT `toko_detail_pesan_ibfk_1` FOREIGN KEY (`no_faktur`) REFERENCES `tokopemesanan` (`no_faktur`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `toko_detail_pesan_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `tokobarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `toko_detail_pesan_ibfk_3` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for toko_detail_piutang
-- ----------------------------
DROP TABLE IF EXISTS `toko_detail_piutang`;
CREATE TABLE `toko_detail_piutang`  (
  `nota_piutang` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_brng` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `h_jual` double NULL DEFAULT NULL,
  `h_beli` double NULL DEFAULT NULL,
  `jumlah` double NULL DEFAULT NULL,
  `subtotal` double NULL DEFAULT NULL,
  `dis` double NULL DEFAULT NULL,
  `bsr_dis` double NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  INDEX `nota_piutang`(`nota_piutang`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  CONSTRAINT `toko_detail_piutang_ibfk_1` FOREIGN KEY (`nota_piutang`) REFERENCES `tokopiutang` (`nota_piutang`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `toko_detail_piutang_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `tokobarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `toko_detail_piutang_ibfk_3` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for toko_detail_returbeli
-- ----------------------------
DROP TABLE IF EXISTS `toko_detail_returbeli`;
CREATE TABLE `toko_detail_returbeli`  (
  `no_retur_beli` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `h_beli` double NULL DEFAULT NULL,
  `h_retur` double NULL DEFAULT NULL,
  `jml_retur` double NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `no_retur_beli`(`no_retur_beli`) USING BTREE,
  CONSTRAINT `toko_detail_returbeli_ibfk_1` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `toko_detail_returbeli_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `tokobarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `toko_detail_returbeli_ibfk_3` FOREIGN KEY (`no_retur_beli`) REFERENCES `tokoreturbeli` (`no_retur_beli`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for toko_detail_returjual
-- ----------------------------
DROP TABLE IF EXISTS `toko_detail_returjual`;
CREATE TABLE `toko_detail_returjual`  (
  `no_retur_jual` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nota_jual` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `h_jual` double NULL DEFAULT NULL,
  `h_retur` double NULL DEFAULT NULL,
  `jml_retur` double NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `no_retur_jual`(`no_retur_jual`) USING BTREE,
  CONSTRAINT `toko_detail_returjual_ibfk_1` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `toko_detail_returjual_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `tokobarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `toko_detail_returjual_ibfk_3` FOREIGN KEY (`no_retur_jual`) REFERENCES `tokoreturjual` (`no_retur_jual`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for toko_detail_returpiutang
-- ----------------------------
DROP TABLE IF EXISTS `toko_detail_returpiutang`;
CREATE TABLE `toko_detail_returpiutang`  (
  `no_retur_piutang` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nota_piutang` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `h_piutang` double NULL DEFAULT NULL,
  `h_retur` double NULL DEFAULT NULL,
  `jml_retur` double NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `no_retur_piutang`(`no_retur_piutang`) USING BTREE,
  CONSTRAINT `toko_detail_returpiutang_ibfk_1` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `toko_detail_returpiutang_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `tokobarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `toko_detail_returpiutang_ibfk_3` FOREIGN KEY (`no_retur_piutang`) REFERENCES `tokoreturpiutang` (`no_retur_piutang`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for toko_detail_surat_pemesanan
-- ----------------------------
DROP TABLE IF EXISTS `toko_detail_surat_pemesanan`;
CREATE TABLE `toko_detail_surat_pemesanan`  (
  `no_pemesanan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jumlah` double NULL DEFAULT NULL,
  `h_pesan` double NULL DEFAULT NULL,
  `subtotal` double NULL DEFAULT NULL,
  `dis` double NOT NULL,
  `besardis` double NOT NULL,
  `total` double NOT NULL,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  INDEX `jumlah`(`jumlah`) USING BTREE,
  INDEX `h_pesan`(`h_pesan`) USING BTREE,
  INDEX `subtotal`(`subtotal`) USING BTREE,
  INDEX `dis`(`dis`) USING BTREE,
  INDEX `besardis`(`besardis`) USING BTREE,
  INDEX `total`(`total`) USING BTREE,
  INDEX `no_pemesanan`(`no_pemesanan`) USING BTREE,
  CONSTRAINT `toko_detail_surat_pemesanan_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `tokobarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `toko_detail_surat_pemesanan_ibfk_2` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `toko_detail_surat_pemesanan_ibfk_3` FOREIGN KEY (`no_pemesanan`) REFERENCES `toko_surat_pemesanan` (`no_pemesanan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for toko_pengajuan_barang
-- ----------------------------
DROP TABLE IF EXISTS `toko_pengajuan_barang`;
CREATE TABLE `toko_pengajuan_barang`  (
  `no_pengajuan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `status` enum('Proses Pengajuan','Disetujui','Ditolak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keterangan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_pengajuan`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `toko_pengajuan_barang_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for toko_riwayat_barang
-- ----------------------------
DROP TABLE IF EXISTS `toko_riwayat_barang`;
CREATE TABLE `toko_riwayat_barang`  (
  `kode_brng` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `stok_awal` double NULL DEFAULT NULL,
  `masuk` double NULL DEFAULT NULL,
  `keluar` double NULL DEFAULT NULL,
  `stok_akhir` double NOT NULL,
  `posisi` enum('Pengadaan','Penerimaan','Piutang','Retur Beli','Retur Jual','Retur Piutang','Opname','Penjualan','Stok Keluar') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `jam` time(0) NULL DEFAULT NULL,
  `petugas` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` enum('Simpan','Hapus') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  CONSTRAINT `toko_riwayat_barang_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `tokobarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for toko_surat_pemesanan
-- ----------------------------
DROP TABLE IF EXISTS `toko_surat_pemesanan`;
CREATE TABLE `toko_surat_pemesanan`  (
  `no_pemesanan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_suplier` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `subtotal` double NOT NULL,
  `potongan` double NOT NULL,
  `total` double NOT NULL,
  `ppn` double NULL DEFAULT NULL,
  `meterai` double NULL DEFAULT NULL,
  `tagihan` double NULL DEFAULT NULL,
  `status` enum('Proses Pesan','Sudah Datang') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_pemesanan`) USING BTREE,
  INDEX `kode_suplier`(`kode_suplier`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `toko_surat_pemesanan_ibfk_1` FOREIGN KEY (`kode_suplier`) REFERENCES `tokosuplier` (`kode_suplier`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `toko_surat_pemesanan_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nik`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tokobarang
-- ----------------------------
DROP TABLE IF EXISTS `tokobarang`;
CREATE TABLE `tokobarang`  (
  `kode_brng` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_brng` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_sat` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jenis` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `stok` double NOT NULL,
  `dasar` double NOT NULL,
  `h_beli` double NOT NULL,
  `distributor` double NOT NULL,
  `grosir` double NOT NULL,
  `retail` double NOT NULL,
  `status` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kode_brng`) USING BTREE,
  INDEX `kode_sat`(`kode_sat`) USING BTREE,
  INDEX `nama_brng`(`nama_brng`) USING BTREE,
  INDEX `jenis`(`jenis`) USING BTREE,
  CONSTRAINT `tokobarang_ibfk_1` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `tokobarang_ibfk_2` FOREIGN KEY (`jenis`) REFERENCES `tokojenisbarang` (`kd_jenis`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tokojenisbarang
-- ----------------------------
DROP TABLE IF EXISTS `tokojenisbarang`;
CREATE TABLE `tokojenisbarang`  (
  `kd_jenis` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_jenis` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kd_jenis`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tokomember
-- ----------------------------
DROP TABLE IF EXISTS `tokomember`;
CREATE TABLE `tokomember`  (
  `no_member` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jk` enum('L','P') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tmp_lahir` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_lahir` date NULL DEFAULT NULL,
  `alamat` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_telp` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_member`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tokoopname
-- ----------------------------
DROP TABLE IF EXISTS `tokoopname`;
CREATE TABLE `tokoopname`  (
  `kode_brng` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dasar` double NULL DEFAULT NULL,
  `tanggal` date NOT NULL,
  `stok` int(11) NOT NULL,
  `real` int(11) NOT NULL,
  `selisih` int(11) NOT NULL,
  `nomihilang` double NOT NULL,
  `keterangan` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kode_brng`, `tanggal`) USING BTREE,
  INDEX `stok`(`stok`) USING BTREE,
  INDEX `real`(`real`) USING BTREE,
  INDEX `selisih`(`selisih`) USING BTREE,
  INDEX `nomihilang`(`nomihilang`) USING BTREE,
  INDEX `keterangan`(`keterangan`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  CONSTRAINT `tokoopname_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `tokobarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tokopembelian
-- ----------------------------
DROP TABLE IF EXISTS `tokopembelian`;
CREATE TABLE `tokopembelian`  (
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_suplier` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_beli` date NOT NULL,
  `subtotal` double NOT NULL,
  `potongan` double NOT NULL,
  `total` double NOT NULL,
  `ppn` double NULL DEFAULT NULL,
  `meterai` double NULL DEFAULT NULL,
  `tagihan` double NULL DEFAULT NULL,
  `kd_rek` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_faktur`) USING BTREE,
  INDEX `kode_suplier`(`kode_suplier`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  INDEX `tgl_beli`(`tgl_beli`) USING BTREE,
  INDEX `subtotal`(`subtotal`) USING BTREE,
  INDEX `potongan`(`potongan`) USING BTREE,
  INDEX `total`(`total`) USING BTREE,
  INDEX `kd_rek`(`kd_rek`) USING BTREE,
  CONSTRAINT `tokopembelian_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tokopembelian_ibfk_2` FOREIGN KEY (`kd_rek`) REFERENCES `akun_bayar` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tokopembelian_ibfk_3` FOREIGN KEY (`kode_suplier`) REFERENCES `tokosuplier` (`kode_suplier`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tokopemesanan
-- ----------------------------
DROP TABLE IF EXISTS `tokopemesanan`;
CREATE TABLE `tokopemesanan`  (
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_order` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_suplier` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_pesan` date NULL DEFAULT NULL,
  `tgl_faktur` date NULL DEFAULT NULL,
  `tgl_tempo` date NULL DEFAULT NULL,
  `total1` double NOT NULL,
  `potongan` double NOT NULL,
  `total2` double NOT NULL,
  `ppn` double NOT NULL,
  `meterai` double NULL DEFAULT NULL,
  `tagihan` double NOT NULL,
  `status` enum('Sudah Dibayar','Belum Dibayar','Belum Lunas') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_faktur`) USING BTREE,
  INDEX `kode_suplier`(`kode_suplier`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `tokopemesanan_ibfk_1` FOREIGN KEY (`kode_suplier`) REFERENCES `tokosuplier` (`kode_suplier`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `tokopemesanan_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tokopenjualan
-- ----------------------------
DROP TABLE IF EXISTS `tokopenjualan`;
CREATE TABLE `tokopenjualan`  (
  `nota_jual` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_jual` date NULL DEFAULT NULL,
  `nip` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_member` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nm_member` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keterangan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jns_jual` enum('Distributor','Grosir','Retail') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ongkir` double NULL DEFAULT NULL,
  `ppn` double NOT NULL,
  `kd_rek` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `total` double NOT NULL,
  `nama_bayar` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`nota_jual`) USING BTREE,
  INDEX `no_member`(`no_member`) USING BTREE,
  INDEX `kd_rek`(`kd_rek`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  INDEX `nama_bayar`(`nama_bayar`) USING BTREE,
  CONSTRAINT `tokopenjualan_ibfk_1` FOREIGN KEY (`no_member`) REFERENCES `tokomember` (`no_member`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `tokopenjualan_ibfk_2` FOREIGN KEY (`kd_rek`) REFERENCES `rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `tokopenjualan_ibfk_3` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `tokopenjualan_ibfk_4` FOREIGN KEY (`nama_bayar`) REFERENCES `akun_bayar` (`nama_bayar`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tokopiutang
-- ----------------------------
DROP TABLE IF EXISTS `tokopiutang`;
CREATE TABLE `tokopiutang`  (
  `nota_piutang` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_piutang` date NULL DEFAULT NULL,
  `nip` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_member` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nm_member` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `catatan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jns_jual` enum('Distributor','Grosir','Retail') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ongkir` double NULL DEFAULT NULL,
  `uangmuka` double NULL DEFAULT NULL,
  `sisapiutang` double NOT NULL,
  `tgltempo` date NOT NULL,
  PRIMARY KEY (`nota_piutang`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  INDEX `no_member`(`no_member`) USING BTREE,
  CONSTRAINT `tokopiutang_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tokopiutang_ibfk_2` FOREIGN KEY (`no_member`) REFERENCES `tokomember` (`no_member`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tokoreturbeli
-- ----------------------------
DROP TABLE IF EXISTS `tokoreturbeli`;
CREATE TABLE `tokoreturbeli`  (
  `no_retur_beli` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_retur` date NULL DEFAULT NULL,
  `nip` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_suplier` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `catatan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`no_retur_beli`) USING BTREE,
  INDEX `kode_suplier`(`kode_suplier`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `tokoreturbeli_ibfk_1` FOREIGN KEY (`kode_suplier`) REFERENCES `tokosuplier` (`kode_suplier`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tokoreturbeli_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tokoreturjual
-- ----------------------------
DROP TABLE IF EXISTS `tokoreturjual`;
CREATE TABLE `tokoreturjual`  (
  `no_retur_jual` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_retur` date NULL DEFAULT NULL,
  `nip` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_member` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `catatan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`no_retur_jual`) USING BTREE,
  INDEX `no_member`(`no_member`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `tokoreturjual_ibfk_1` FOREIGN KEY (`no_member`) REFERENCES `tokomember` (`no_member`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tokoreturjual_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tokoreturpiutang
-- ----------------------------
DROP TABLE IF EXISTS `tokoreturpiutang`;
CREATE TABLE `tokoreturpiutang`  (
  `no_retur_piutang` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_retur` date NULL DEFAULT NULL,
  `nip` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_member` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `catatan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`no_retur_piutang`) USING BTREE,
  INDEX `no_member`(`no_member`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `tokoreturpiutang_ibfk_1` FOREIGN KEY (`no_member`) REFERENCES `tokomember` (`no_member`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tokoreturpiutang_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tokosetharga
-- ----------------------------
DROP TABLE IF EXISTS `tokosetharga`;
CREATE TABLE `tokosetharga`  (
  `distributor` double NOT NULL,
  `grosir` double NOT NULL,
  `retail` double NOT NULL
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for tokosuplier
-- ----------------------------
DROP TABLE IF EXISTS `tokosuplier`;
CREATE TABLE `tokosuplier`  (
  `kode_suplier` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_suplier` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alamat` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kota` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_telp` varchar(13) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_bank` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rekening` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_suplier`) USING BTREE,
  INDEX `nama_suplier`(`nama_suplier`) USING BTREE,
  INDEX `alamat`(`alamat`) USING BTREE,
  INDEX `kota`(`kota`) USING BTREE,
  INDEX `no_telp`(`no_telp`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tracker
-- ----------------------------
DROP TABLE IF EXISTS `tracker`;
CREATE TABLE `tracker`  (
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_login` date NOT NULL,
  `jam_login` time(0) NOT NULL,
  PRIMARY KEY (`nip`, `tgl_login`, `jam_login`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for trackersql
-- ----------------------------
DROP TABLE IF EXISTS `trackersql`;
CREATE TABLE `trackersql`  (
  `tanggal` datetime(0) NOT NULL,
  `sqle` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `usere` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ubah_penjab
-- ----------------------------
DROP TABLE IF EXISTS `ubah_penjab`;
CREATE TABLE `ubah_penjab`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_ubah` datetime(0) NOT NULL,
  `kd_pj1` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_pj2` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `tgl_ubah`(`tgl_ubah`) USING BTREE,
  INDEX `kd_pj1`(`kd_pj1`) USING BTREE,
  INDEX `kd_pj2`(`kd_pj2`) USING BTREE,
  CONSTRAINT `ubah_penjab_ibfk_4` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ubah_penjab_ibfk_5` FOREIGN KEY (`kd_pj1`) REFERENCES `penjab` (`kd_pj`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ubah_penjab_ibfk_6` FOREIGN KEY (`kd_pj2`) REFERENCES `penjab` (`kd_pj`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id_user` varchar(700) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `penyakit` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `obat_penyakit` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dokter` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jadwal_praktek` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `petugas` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pasien` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `registrasi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tindakan_ralan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kamar_inap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tindakan_ranap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `operasi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rujukan_keluar` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rujukan_masuk` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `beri_obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `resep_pulang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pasien_meninggal` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `diet_pasien` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kelahiran_bayi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `periksa_lab` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `periksa_radiologi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kasir_ralan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `deposit_pasien` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `piutang_pasien` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `peminjaman_berkas` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `barcode` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `presensi_harian` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `presensi_bulanan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pegawai_admin` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pegawai_user` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `suplier` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `satuan_barang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `konversi_satuan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jenis_barang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `stok_opname_obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `stok_obat_pasien` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pengadaan_obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemesanan_obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `penjualan_obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `piutang_obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `retur_ke_suplier` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `retur_dari_pembeli` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `retur_obat_ranap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `retur_piutang_pasien` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keuntungan_penjualan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keuntungan_beri_obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sirkulasi_obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ipsrs_barang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ipsrs_pengadaan_barang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ipsrs_stok_keluar` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ipsrs_rekap_pengadaan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ipsrs_rekap_stok_keluar` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ipsrs_pengeluaran_harian` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `inventaris_jenis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `inventaris_kategori` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `inventaris_merk` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `inventaris_ruang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `inventaris_produsen` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `inventaris_koleksi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `inventaris_inventaris` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `inventaris_sirkulasi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `parkir_jenis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `parkir_in` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `parkir_out` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `parkir_rekap_harian` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `parkir_rekap_bulanan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `informasi_kamar` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `harian_tindakan_poli` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `obat_per_poli` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `obat_per_kamar` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `obat_per_dokter_ralan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `obat_per_dokter_ranap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `harian_dokter` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bulanan_dokter` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `harian_paramedis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bulanan_paramedis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pembayaran_ralan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pembayaran_ranap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rekap_pembayaran_ralan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rekap_pembayaran_ranap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tagihan_masuk` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tambahan_biaya` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `potongan_biaya` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `resep_obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `resume_pasien` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `penyakit_ralan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `penyakit_ranap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kamar` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tarif_ralan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tarif_ranap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tarif_lab` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tarif_radiologi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tarif_operasi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `akun_rekening` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rekening_tahun` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `posting_jurnal` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `buku_besar` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cashflow` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keuangan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pengeluaran` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `setup_pjlab` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `setup_otolokasi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `setup_jam_kamin` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `setup_embalase` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tracer_login` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `display` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `set_harga_obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `set_penggunaan_tarif` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `set_oto_ralan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `biaya_harian` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `biaya_masuk_sekali` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `set_no_rm` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `billing_ralan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `billing_ranap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jm_ranap_dokter` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `igd` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `barcoderalan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `barcoderanap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `set_harga_obat_ralan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `set_harga_obat_ranap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `penyakit_pd3i` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `surveilans_pd3i` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `surveilans_ralan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `diagnosa_pasien` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `surveilans_ranap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pny_takmenular_ranap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pny_takmenular_ralan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kunjungan_ralan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rl32` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rl33` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rl37` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rl38` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `harian_tindakan_dokter` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sms` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sidikjari` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jam_masuk` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jadwal_pegawai` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `parkir_barcode` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `set_nota` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dpjp_ranap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mutasi_barang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rl34` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rl36` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fee_visit_dokter` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fee_bacaan_ekg` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fee_rujukan_rontgen` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fee_rujukan_ranap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fee_ralan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `akun_bayar` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bayar_pemesanan_obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `obat_per_dokter_peresep` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ipsrs_jenis_barang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pemasukan_lain` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pengaturan_rekening` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `closing_kasir` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keterlambatan_presensi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `set_harga_kamar` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rekap_per_shift` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_cek_nik` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_cek_kartu` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_cek_riwayat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `obat_per_cara_bayar` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kunjungan_ranap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bayar_piutang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `payment_point` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_cek_nomor_rujukan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `icd9` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `darurat_stok` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `retensi_rm` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `temporary_presensi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jurnal_harian` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sirkulasi_obat2` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `edit_registrasi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_referensi_diagnosa` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_referensi_poli` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `industrifarmasi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `harian_js` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bulanan_js` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `harian_paket_bhp` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bulanan_paket_bhp` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `piutang_pasien2` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_referensi_faskes` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_sep` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pengambilan_utd` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tarif_utd` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pengambilan_utd2` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `utd_medis_rusak` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pengambilan_penunjang_utd` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pengambilan_penunjang_utd2` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `utd_penunjang_rusak` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `suplier_penunjang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `utd_donor` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_monitoring_klaim` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `utd_cekal_darah` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `utd_komponen_darah` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `utd_stok_darah` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `utd_pemisahan_darah` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `harian_kamar` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rincian_piutang_pasien` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keuntungan_beri_obat_nonpiutang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `reklasifikasi_ralan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `reklasifikasi_ranap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `utd_penyerahan_darah` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hutang_obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `riwayat_obat_alkes_bhp` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sensus_harian_poli` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rl4a` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `aplicare_referensi_kamar` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `aplicare_ketersediaan_kamar` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `inacbg_klaim_baru_otomatis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `inacbg_klaim_baru_manual` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `inacbg_coder_nik` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mutasi_berkas` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `akun_piutang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `harian_kso` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bulanan_kso` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `harian_menejemen` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bulanan_menejemen` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `inhealth_cek_eligibilitas` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `inhealth_referensi_jenpel_ruang_rawat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `inhealth_referensi_poli` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `inhealth_referensi_faskes` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `inhealth_sjp` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `piutang_ralan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `piutang_ranap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `detail_piutang_penjab` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lama_pelayanan_ralan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `catatan_pasien` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rl4b` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rl4asebab` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rl4bsebab` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `data_HAIs` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `harian_HAIs` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bulanan_HAIs` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hitung_bor` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `perusahaan_pasien` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `resep_dokter` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lama_pelayanan_apotek` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hitung_alos` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `detail_tindakan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rujukan_poli_internal` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rekap_poli_anak` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_kunjungan_poli` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_kunjungan_perdokter` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_kunjungan_perpekerjaan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_kunjungan_perpendidikan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_kunjungan_pertahun` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `berkas_digital_perawatan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penyakit_menular_ranap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penyakit_menular_ralan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_kunjungan_perbulan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_kunjungan_pertanggal` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_kunjungan_demografi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_kunjungan_statusdaftartahun` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_kunjungan_statusdaftartahun2` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_kunjungan_statusdaftarbulan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_kunjungan_statusdaftarbulan2` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_kunjungan_statusdaftartanggal` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_kunjungan_statusdaftartanggal2` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_kunjungan_statusbataltahun` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_kunjungan_statusbatalbulan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pcare_cek_penyakit` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_kunjungan_statusbataltanggal` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kategori_barang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `golongan_barang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pemberian_obat_pertanggal` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penjualan_obat_pertanggal` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pcare_cek_kesadaran` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pembatalan_periksa_dokter` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pembayaran_per_unit` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rekap_pembayaran_per_unit` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_kunjungan_percarabayar` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ipsrs_pengadaan_pertanggal` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ipsrs_stokkeluar_pertanggal` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_kunjungan_ranaptahun` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pcare_cek_rujukan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_lab_ralantahun` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_rad_ralantahun` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cek_entry_ralan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `inacbg_klaim_baru_manual2` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `permintaan_medis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rekap_permintaan_medis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `surat_pemesanan_medis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `permintaan_non_medis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rekap_permintaan_non_medis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `surat_pemesanan_non_medis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_per_perujuk` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bpjs_cek_prosedur` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_cek_kelas_rawat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_cek_dokter` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_cek_spesialistik` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_cek_ruangrawat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_cek_carakeluar` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_cek_pasca_pulang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `detail_tindakan_okvk` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `billing_parsial` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_cek_nomor_rujukan_rs` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_cek_rujukan_kartu_pcare` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_cek_rujukan_kartu_rs` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `akses_depo_obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_rujukan_keluar` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_lab_ralanbulan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pengeluaran_stok_apotek` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_rad_ralanbulan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `detailjmdokter2` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pengaduan_pasien` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_lab_ralanhari` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_rad_ralanhari` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sensus_harian_ralan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `metode_racik` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pembayaran_akun_bayar` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pengguna_obat_resep` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rekap_pemesanan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `master_berkas_pegawai` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `berkas_kepegawaian` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `riwayat_jabatan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `riwayat_pendidikan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `riwayat_naik_gaji` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kegiatan_ilmiah` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `riwayat_penghargaan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `riwayat_penelitian` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penerimaan_non_medis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bayar_pesan_non_medis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hutang_barang_non_medis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rekap_pemesanan_non_medis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `insiden_keselamatan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `insiden_keselamatan_pasien` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_ikp_pertahun` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_ikp_perbulan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_ikp_pertanggal` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `riwayat_data_batch` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_ikp_jenis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_ikp_dampak` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `piutang_akun_piutang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_kunjungan_per_agama` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_kunjungan_per_umur` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `suku_bangsa` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bahasa_pasien` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `golongan_tni` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `satuan_tni` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jabatan_tni` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pangkat_tni` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `golongan_polri` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `satuan_polri` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jabatan_polri` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pangkat_polri` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cacat_fisik` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_kunjungan_suku` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_kunjungan_bahasa` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `booking_operasi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mapping_poli_bpjs` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_kunjungan_per_cacat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `barang_cssd` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `skdp_bpjs` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `booking_registrasi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_cek_propinsi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_cek_kabupaten` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_cek_kecamatan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_cek_dokterdpjp` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_cek_riwayat_rujukanrs` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_cek_tanggal_rujukan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `permintaan_lab` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `permintaan_radiologi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `surat_indeks` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `surat_map` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `surat_almari` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `surat_rak` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `surat_ruang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `surat_klasifikasi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `surat_status` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `surat_sifat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `surat_balas` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `surat_masuk` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pcare_cek_dokter` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pcare_cek_poli` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pcare_cek_provider` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pcare_cek_statuspulang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pcare_cek_spesialis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pcare_cek_subspesialis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pcare_cek_sarana` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pcare_cek_khusus` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pcare_cek_obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pcare_cek_tindakan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pcare_cek_faskessubspesialis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pcare_cek_faskesalihrawat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pcare_cek_faskesthalasemia` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pcare_mapping_obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pcare_mapping_tindakan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pcare_club_prolanis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pcare_mapping_poli` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pcare_kegiatan_kelompok` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pcare_mapping_tindakan_ranap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pcare_peserta_kegiatan_kelompok` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sirkulasi_obat3` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bridging_pcare_daftar` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pcare_mapping_dokter` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ranap_per_ruang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penyakit_ranap_cara_bayar` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `anggota_militer_dirawat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `set_input_parsial` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lama_pelayanan_radiologi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lama_pelayanan_lab` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_cek_sep` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `catatan_perawatan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `surat_keluar` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kegiatan_farmasi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `stok_opname_logistik` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sirkulasi_non_medis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rekap_lab_pertahun` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `perujuk_lab_pertahun` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rekap_radiologi_pertahun` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `perujuk_radiologi_pertahun` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jumlah_porsi_diet` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jumlah_macam_diet` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `payment_point2` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pembayaran_akun_bayar2` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hapus_nota_salah` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pengkajian_askep` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hais_perbangsal` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ppn_obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `saldo_akun_perbulan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `display_apotek` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sisrute_referensi_faskes` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sisrute_referensi_alasanrujuk` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sisrute_referensi_diagnosa` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sisrute_rujukan_masuk` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sisrute_rujukan_keluar` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_cek_skdp` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `data_batch` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kunjungan_permintaan_lab` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kunjungan_permintaan_lab2` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kunjungan_permintaan_radiologi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kunjungan_permintaan_radiologi2` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pcare_pemberian_obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pcare_pemberian_tindakan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pembayaran_akun_bayar3` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password_asuransi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kemenkes_sitt` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `siranap_ketersediaan_kamar` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_tb_periodelaporan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_tb_rujukan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_tb_riwayat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_tb_tipediagnosis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_tb_statushiv` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_tb_skoringanak` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_tb_konfirmasiskoring5` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_tb_konfirmasiskoring6` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_tb_sumberobat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_tb_hasilakhirpengobatan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_tb_hasilteshiv` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kadaluarsa_batch` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sisa_stok` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `obat_per_resep` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pemakaian_air_pdam` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `limbah_b3_medis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_air_pdam_pertanggal` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_air_pdam_perbulan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_limbahb3_pertanggal` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_limbahb3_perbulan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `limbah_domestik` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_limbahdomestik_pertanggal` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_limbahdomestik_perbulan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mutu_air_limbah` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pest_control` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ruang_perpustakaan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kategori_perpustakaan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jenis_perpustakaan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pengarang_perpustakaan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penerbit_perpustakaan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `koleksi_perpustakaan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `inventaris_perpustakaan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `set_peminjaman_perpustakaan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `denda_perpustakaan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `anggota_perpustakaan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `peminjaman_perpustakaan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bayar_denda_perpustakaan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ebook_perpustakaan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jenis_cidera_k3rs` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penyebab_k3rs` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jenis_luka_k3rs` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lokasi_kejadian_k3rs` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dampak_cidera_k3rs` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jenis_pekerjaan_k3rs` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bagian_tubuh_k3rs` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `peristiwa_k3rs` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_k3_pertahun` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_k3_perbulan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_k3_pertanggal` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_k3_perjeniscidera` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_k3_perpenyebab` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_k3_perjenisluka` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_k3_lokasikejadian` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_k3_dampakcidera` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_k3_perjenispekerjaan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_k3_perbagiantubuh` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jenis_cidera_k3rstahun` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penyebab_k3rstahun` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jenis_luka_k3rstahun` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lokasi_kejadian_k3rstahun` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dampak_cidera_k3rstahun` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jenis_pekerjaan_k3rstahun` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bagian_tubuh_k3rstahun` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sekrining_rawat_jalan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_histori_pelayanan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rekap_mutasi_berkas` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `skrining_ralan_pernapasan_pertahun` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pengajuan_barang_medis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pengajuan_barang_nonmedis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_kunjungan_ranapbulan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_kunjungan_ranaptanggal` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_kunjungan_ranap_peruang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kunjungan_bangsal_pertahun` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_jenjang_jabatanpegawai` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_bidangpegawai` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_departemenpegawai` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_pendidikanpegawai` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_sttswppegawai` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_sttskerjapegawai` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_sttspulangranap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kip_pasien_ranap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kip_pasien_ralan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_mapping_dokterdpjp` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `data_triase_igd` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `master_triase_skala1` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `master_triase_skala2` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `master_triase_skala3` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `master_triase_skala4` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `master_triase_skala5` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `master_triase_pemeriksaan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `master_triase_macamkasus` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rekap_permintaan_diet` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `daftar_pasien_ranap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `daftar_pasien_ranaptni` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pengajuan_asetinventaris` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `item_apotek_jenis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `item_apotek_kategori` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `item_apotek_golongan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `item_apotek_industrifarmasi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `10_obat_terbanyak_poli` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_pengajuan_aset_urgensi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_pengajuan_aset_status` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_pengajuan_aset_departemen` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rekap_pengajuan_aset_departemen` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_kelompok_jabatanpegawai` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_resiko_kerjapegawai` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_emergency_indexpegawai` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_inventaris_ruang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `harian_HAIs2` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_inventaris_jenis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `data_resume_pasien` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `perkiraan_biaya_ranap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rekap_obat_poli` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rekap_obat_pasien` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `permintaan_perbaikan_inventaris` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_HAIs_pasienbangsal` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_HAIs_pasienbulan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_HAIs_laju_vap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_HAIs_laju_iad` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_HAIs_laju_pleb` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_HAIs_laju_isk` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_HAIs_laju_ilo` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_HAIs_laju_hap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `inhealth_mapping_poli` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `inhealth_mapping_dokter` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `inhealth_mapping_tindakan_ralan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `inhealth_mapping_tindakan_ranap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `inhealth_mapping_tindakan_radiologi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `inhealth_mapping_tindakan_laborat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `inhealth_mapping_tindakan_operasi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hibah_obat_bhp` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `asal_hibah` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `asuhan_gizi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `inhealth_kirim_tagihan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sirkulasi_obat4` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sirkulasi_obat5` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sirkulasi_non_medis2` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `monitoring_asuhan_gizi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penerimaan_obat_perbulan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rekap_kunjungan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `surat_sakit` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penilaian_awal_keperawatan_ralan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `permintaan_diet` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `master_masalah_keperawatan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pengajuan_cuti` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kedatangan_pasien` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `utd_pendonor` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `toko_suplier` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `toko_jenis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `toko_set_harga` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `toko_barang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penagihan_piutang_pasien` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `akun_penagihan_piutang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `stok_opname_toko` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `toko_riwayat_barang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `toko_surat_pemesanan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `toko_pengajuan_barang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `toko_penerimaan_barang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `toko_pengadaan_barang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `toko_hutang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `toko_bayar_pemesanan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `toko_member` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `toko_penjualan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `registrasi_poli_per_tanggal` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `toko_piutang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `toko_retur_beli` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ipsrs_returbeli` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ipsrs_riwayat_barang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pasien_corona` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `toko_pendapatan_harian` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `diagnosa_pasien_corona` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `perawatan_pasien_corona` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penilaian_awal_keperawatan_gigi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `master_masalah_keperawatan_gigi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `toko_bayar_piutang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `toko_piutang_harian` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `toko_penjualan_harian` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `deteksi_corona` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penilaian_awal_keperawatan_kebidanan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pengumuman_epasien` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `surat_hamil` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `set_tarif_online` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `booking_periksa` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `toko_sirkulasi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `toko_retur_jual` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `toko_retur_piutang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `toko_sirkulasi2` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `toko_keuntungan_barang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `zis_pengeluaran_penerima_dankes` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `zis_penghasilan_penerima_dankes` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `zis_ukuran_rumah_penerima_dankes` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `zis_dinding_rumah_penerima_dankes` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `zis_lantai_rumah_penerima_dankes` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `zis_atap_rumah_penerima_dankes` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `zis_kepemilikan_rumah_penerima_dankes` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `zis_kamar_mandi_penerima_dankes` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `zis_dapur_rumah_penerima_dankes` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `zis_kursi_rumah_penerima_dankes` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `zis_kategori_phbs_penerima_dankes` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `zis_elektronik_penerima_dankes` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `zis_ternak_penerima_dankes` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `zis_jenis_simpanan_penerima_dankes` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penilaian_awal_keperawatan_anak` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `zis_kategori_asnaf_penerima_dankes` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `master_masalah_keperawatan_anak` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `master_imunisasi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `zis_patologis_penerima_dankes` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pcare_cek_kartu` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `surat_bebas_narkoba` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `surat_keterangan_covid` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pemakaian_air_tanah` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_air_tanah_pertanggal` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_air_tanah_perbulan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lama_pelayanan_poli` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hemodialisa` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `laporan_tahunan_irj` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_harian_hemodialisa` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_bulanan_hemodialisa` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_tahunan_hemodialisa` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_bulanan_meninggal` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `perbaikan_inventaris` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `surat_cuti_hamil` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `permintaan_stok_obat_pasien` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pemeliharaan_inventaris` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `klasifikasi_pasien_ranap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bulanan_klasifikasi_pasien_ranap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `harian_klasifikasi_pasien_ranap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `klasifikasi_pasien_perbangsal` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `soap_perawatan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `klaim_rawat_jalan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `skrining_gizi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lama_penyiapan_rm` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dosis_radiologi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `demografi_umur_kunjungan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jam_diet_pasien` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rvu_bpjs` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `verifikasi_penerimaan_farmasi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `verifikasi_penerimaan_logistik` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pemeriksaan_lab_pa` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ringkasan_pengajuan_obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ringkasan_pemesanan_obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ringkasan_pengadaan_obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ringkasan_penerimaan_obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ringkasan_hibah_obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ringkasan_penjualan_obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ringkasan_beri_obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ringkasan_piutang_obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ringkasan_stok_keluar_obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ringkasan_retur_suplier_obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ringkasan_retur_pembeli_obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penilaian_awal_keperawatan_ranapkebidanan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ringkasan_pengajuan_nonmedis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ringkasan_pemesanan_nonmedis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ringkasan_pengadaan_nonmedis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ringkasan_penerimaan_nonmedis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ringkasan_stokkeluar_nonmedis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ringkasan_returbeli_nonmedis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `omset_penerimaan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `validasi_penagihan_piutang` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `permintaan_ranap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_diagnosa_prb` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_obat_prb` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_surat_kontrol` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penggunaan_bhp_ok` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `surat_keterangan_rawat_inap` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `surat_keterangan_sehat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pendapatan_per_carabayar` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `akun_host_to_host_bank_jateng` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pembayaran_bank_jateng` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bpjs_surat_pri` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ringkasan_tindakan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lama_pelayanan_pasien` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `surat_sakit_pihak_2` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tagihan_hutang_obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `referensi_mobilejkn_bpjs` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `batal_pendaftaran_mobilejkn_bpjs` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lama_operasi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_inventaris_kategori` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_inventaris_merk` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grafik_inventaris_produsen` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pengembalian_deposit_pasien` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `validasi_tagihan_hutang_obat` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `piutang_obat_belum_lunas` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `integrasi_briapi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for utd_cekal_darah
-- ----------------------------
DROP TABLE IF EXISTS `utd_cekal_darah`;
CREATE TABLE `utd_cekal_darah`  (
  `no_donor` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `dinas` enum('Pagi','Siang','Sore','Malam') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `petugas_pemusnahan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keterangan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_donor`) USING BTREE,
  INDEX `petugas_pemusnahan`(`petugas_pemusnahan`) USING BTREE,
  CONSTRAINT `utd_cekal_darah_ibfk_1` FOREIGN KEY (`no_donor`) REFERENCES `utd_donor` (`no_donor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `utd_cekal_darah_ibfk_2` FOREIGN KEY (`petugas_pemusnahan`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for utd_detail_pemisahan_komponen
-- ----------------------------
DROP TABLE IF EXISTS `utd_detail_pemisahan_komponen`;
CREATE TABLE `utd_detail_pemisahan_komponen`  (
  `no_donor` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_kantong` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_komponen` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal_kadaluarsa` date NULL DEFAULT NULL,
  PRIMARY KEY (`no_kantong`) USING BTREE,
  INDEX `no_donor`(`no_donor`) USING BTREE,
  CONSTRAINT `utd_detail_pemisahan_komponen_ibfk_1` FOREIGN KEY (`no_donor`) REFERENCES `utd_pemisahan_komponen` (`no_donor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for utd_donor
-- ----------------------------
DROP TABLE IF EXISTS `utd_donor`;
CREATE TABLE `utd_donor`  (
  `no_donor` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_pendonor` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `dinas` enum('Pagi','Siang','Sore','Malam') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tensi` varchar(7) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_bag` int(11) NULL DEFAULT NULL,
  `jenis_bag` enum('SB','DB','TB','QB') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jenis_donor` enum('DB','DP','DS') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tempat_aftap` enum('Dalam Gedung','Luar Gedung') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `petugas_aftap` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hbsag` enum('Negatif','Positif') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hcv` enum('Negatif','Positif') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hiv` enum('Negatif','Positif') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `spilis` enum('Negatif','Positif') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `malaria` enum('Negatif','Positif') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `petugas_u_saring` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` enum('Aman','Cekal') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_donor`) USING BTREE,
  INDEX `petugas_aftap`(`petugas_aftap`) USING BTREE,
  INDEX `petugas_u_saring`(`petugas_u_saring`) USING BTREE,
  INDEX `no_pendonor`(`no_pendonor`) USING BTREE,
  CONSTRAINT `utd_donor_ibfk_1` FOREIGN KEY (`petugas_aftap`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `utd_donor_ibfk_2` FOREIGN KEY (`petugas_u_saring`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `utd_donor_ibfk_3` FOREIGN KEY (`no_pendonor`) REFERENCES `utd_pendonor` (`no_pendonor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for utd_komponen_darah
-- ----------------------------
DROP TABLE IF EXISTS `utd_komponen_darah`;
CREATE TABLE `utd_komponen_darah`  (
  `kode` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lama` smallint(6) NULL DEFAULT NULL,
  `jasa_sarana` double NULL DEFAULT NULL,
  `paket_bhp` double NULL DEFAULT NULL,
  `kso` double NULL DEFAULT NULL,
  `manajemen` double NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  `pembatalan` double NULL DEFAULT NULL,
  PRIMARY KEY (`kode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for utd_medis_rusak
-- ----------------------------
DROP TABLE IF EXISTS `utd_medis_rusak`;
CREATE TABLE `utd_medis_rusak`  (
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `jml` double NULL DEFAULT NULL,
  `hargabeli` double NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tanggal` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `keterangan` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_brng`, `nip`, `tanggal`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `utd_medis_rusak_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `utd_medis_rusak_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for utd_pemisahan_komponen
-- ----------------------------
DROP TABLE IF EXISTS `utd_pemisahan_komponen`;
CREATE TABLE `utd_pemisahan_komponen`  (
  `no_donor` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `dinas` enum('Pagi','Siang','Sore','Malam') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_donor`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `utd_pemisahan_komponen_ibfk_1` FOREIGN KEY (`no_donor`) REFERENCES `utd_donor` (`no_donor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `utd_pemisahan_komponen_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for utd_pendonor
-- ----------------------------
DROP TABLE IF EXISTS `utd_pendonor`;
CREATE TABLE `utd_pendonor`  (
  `no_pendonor` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_ktp` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jk` enum('L','P') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tmp_lahir` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kd_kel` int(11) NOT NULL,
  `kd_kec` int(11) NOT NULL,
  `kd_kab` int(11) NOT NULL,
  `kd_prop` int(11) NOT NULL,
  `golongan_darah` enum('A','AB','B','O') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `resus` enum('(-)','(+)') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_telp` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_pendonor`) USING BTREE,
  INDEX `kd_kel`(`kd_kel`) USING BTREE,
  INDEX `kd_kec`(`kd_kec`) USING BTREE,
  INDEX `kd_kab`(`kd_kab`) USING BTREE,
  INDEX `kd_prop`(`kd_prop`) USING BTREE,
  CONSTRAINT `utd_pendonor_ibfk_1` FOREIGN KEY (`kd_kel`) REFERENCES `kelurahan` (`kd_kel`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `utd_pendonor_ibfk_2` FOREIGN KEY (`kd_kec`) REFERENCES `kecamatan` (`kd_kec`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `utd_pendonor_ibfk_3` FOREIGN KEY (`kd_kab`) REFERENCES `kabupaten` (`kd_kab`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `utd_pendonor_ibfk_4` FOREIGN KEY (`kd_prop`) REFERENCES `propinsi` (`kd_prop`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for utd_pengambilan_medis
-- ----------------------------
DROP TABLE IF EXISTS `utd_pengambilan_medis`;
CREATE TABLE `utd_pengambilan_medis`  (
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `jml` double NULL DEFAULT NULL,
  `hargabeli` double NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  `kd_bangsal_dr` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tanggal` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `keterangan` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_batch` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_faktur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kode_brng`, `tanggal`, `no_batch`, `no_faktur`) USING BTREE,
  INDEX `kd_bangsal_dr`(`kd_bangsal_dr`) USING BTREE,
  INDEX `jml`(`jml`) USING BTREE,
  INDEX `total`(`total`) USING BTREE,
  INDEX `hargabeli`(`hargabeli`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  CONSTRAINT `utd_pengambilan_medis_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `utd_pengambilan_medis_ibfk_2` FOREIGN KEY (`kd_bangsal_dr`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for utd_pengambilan_penunjang
-- ----------------------------
DROP TABLE IF EXISTS `utd_pengambilan_penunjang`;
CREATE TABLE `utd_pengambilan_penunjang`  (
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `jml` double NULL DEFAULT NULL,
  `harga` double NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tanggal` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `keterangan` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_brng`, `nip`, `tanggal`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  INDEX `jml`(`jml`) USING BTREE,
  INDEX `total`(`total`) USING BTREE,
  CONSTRAINT `utd_pengambilan_penunjang_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `ipsrsbarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `utd_pengambilan_penunjang_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for utd_penggunaan_medis_donor
-- ----------------------------
DROP TABLE IF EXISTS `utd_penggunaan_medis_donor`;
CREATE TABLE `utd_penggunaan_medis_donor`  (
  `no_donor` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `jml` double NULL DEFAULT NULL,
  `harga` double NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  PRIMARY KEY (`no_donor`, `kode_brng`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  CONSTRAINT `utd_penggunaan_medis_donor_ibfk_1` FOREIGN KEY (`no_donor`) REFERENCES `utd_donor` (`no_donor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `utd_penggunaan_medis_donor_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for utd_penggunaan_medis_pemisahan_komponen
-- ----------------------------
DROP TABLE IF EXISTS `utd_penggunaan_medis_pemisahan_komponen`;
CREATE TABLE `utd_penggunaan_medis_pemisahan_komponen`  (
  `no_donor` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `jml` double NULL DEFAULT NULL,
  `harga` double NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  PRIMARY KEY (`no_donor`, `kode_brng`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  CONSTRAINT `utd_penggunaan_medis_pemisahan_komponen_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `utd_penggunaan_medis_pemisahan_komponen_ibfk_3` FOREIGN KEY (`no_donor`) REFERENCES `utd_pemisahan_komponen` (`no_donor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for utd_penggunaan_medis_penyerahan_darah
-- ----------------------------
DROP TABLE IF EXISTS `utd_penggunaan_medis_penyerahan_darah`;
CREATE TABLE `utd_penggunaan_medis_penyerahan_darah`  (
  `no_penyerahan` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `jml` double NULL DEFAULT NULL,
  `harga` double NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  PRIMARY KEY (`no_penyerahan`, `kode_brng`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  CONSTRAINT `utd_penggunaan_medis_penyerahan_darah_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `utd_penggunaan_medis_penyerahan_darah_ibfk_2` FOREIGN KEY (`no_penyerahan`) REFERENCES `utd_penyerahan_darah` (`no_penyerahan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for utd_penggunaan_penunjang_donor
-- ----------------------------
DROP TABLE IF EXISTS `utd_penggunaan_penunjang_donor`;
CREATE TABLE `utd_penggunaan_penunjang_donor`  (
  `no_donor` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `jml` double NULL DEFAULT NULL,
  `harga` double NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  PRIMARY KEY (`no_donor`, `kode_brng`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  CONSTRAINT `utd_penggunaan_penunjang_donor_ibfk_1` FOREIGN KEY (`no_donor`) REFERENCES `utd_donor` (`no_donor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `utd_penggunaan_penunjang_donor_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `ipsrsbarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for utd_penggunaan_penunjang_pemisahan_komponen
-- ----------------------------
DROP TABLE IF EXISTS `utd_penggunaan_penunjang_pemisahan_komponen`;
CREATE TABLE `utd_penggunaan_penunjang_pemisahan_komponen`  (
  `no_donor` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `jml` double NULL DEFAULT NULL,
  `harga` double NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  PRIMARY KEY (`no_donor`, `kode_brng`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  CONSTRAINT `utd_penggunaan_penunjang_pemisahan_komponen_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `ipsrsbarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `utd_penggunaan_penunjang_pemisahan_komponen_ibfk_3` FOREIGN KEY (`no_donor`) REFERENCES `utd_pemisahan_komponen` (`no_donor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for utd_penggunaan_penunjang_penyerahan_darah
-- ----------------------------
DROP TABLE IF EXISTS `utd_penggunaan_penunjang_penyerahan_darah`;
CREATE TABLE `utd_penggunaan_penunjang_penyerahan_darah`  (
  `no_penyerahan` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `jml` double NULL DEFAULT NULL,
  `harga` double NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  PRIMARY KEY (`no_penyerahan`, `kode_brng`) USING BTREE,
  INDEX `kode_brng`(`kode_brng`) USING BTREE,
  CONSTRAINT `utd_penggunaan_penunjang_penyerahan_darah_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `ipsrsbarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `utd_penggunaan_penunjang_penyerahan_darah_ibfk_2` FOREIGN KEY (`no_penyerahan`) REFERENCES `utd_penyerahan_darah` (`no_penyerahan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for utd_penunjang_rusak
-- ----------------------------
DROP TABLE IF EXISTS `utd_penunjang_rusak`;
CREATE TABLE `utd_penunjang_rusak`  (
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `jml` double NULL DEFAULT NULL,
  `harga` double NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tanggal` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `keterangan` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_brng`, `nip`, `tanggal`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `utd_penunjang_rusak_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `ipsrsbarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `utd_penunjang_rusak_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for utd_penyerahan_darah
-- ----------------------------
DROP TABLE IF EXISTS `utd_penyerahan_darah`;
CREATE TABLE `utd_penyerahan_darah`  (
  `no_penyerahan` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tanggal` date NULL DEFAULT NULL,
  `dinas` enum('Pagi','Siang','Sore','Malam') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nip_cross` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keterangan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` enum('Belum Dibayar','Sudah Dibayar') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_rek` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pengambil_darah` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alamat_pengambil_darah` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nip_pj` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `besarppn` double NULL DEFAULT NULL,
  PRIMARY KEY (`no_penyerahan`) USING BTREE,
  INDEX `nip`(`nip_cross`) USING BTREE,
  INDEX `kd_rek`(`kd_rek`) USING BTREE,
  CONSTRAINT `utd_penyerahan_darah_ibfk_1` FOREIGN KEY (`nip_cross`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `utd_penyerahan_darah_ibfk_2` FOREIGN KEY (`kd_rek`) REFERENCES `rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for utd_penyerahan_darah_detail
-- ----------------------------
DROP TABLE IF EXISTS `utd_penyerahan_darah_detail`;
CREATE TABLE `utd_penyerahan_darah_detail`  (
  `no_penyerahan` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `no_kantong` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `jasa_sarana` double NULL DEFAULT NULL,
  `paket_bhp` double NULL DEFAULT NULL,
  `kso` double NULL DEFAULT NULL,
  `manajemen` double NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  PRIMARY KEY (`no_penyerahan`, `no_kantong`) USING BTREE,
  INDEX `no_kantong`(`no_kantong`) USING BTREE,
  CONSTRAINT `utd_penyerahan_darah_detail_ibfk_1` FOREIGN KEY (`no_penyerahan`) REFERENCES `utd_penyerahan_darah` (`no_penyerahan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `utd_penyerahan_darah_detail_ibfk_2` FOREIGN KEY (`no_kantong`) REFERENCES `utd_stok_darah` (`no_kantong`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for utd_stok_darah
-- ----------------------------
DROP TABLE IF EXISTS `utd_stok_darah`;
CREATE TABLE `utd_stok_darah`  (
  `no_kantong` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kode_komponen` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `golongan_darah` enum('A','AB','B','O') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `resus` enum('(-)','(+)') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal_aftap` date NULL DEFAULT NULL,
  `tanggal_kadaluarsa` date NULL DEFAULT NULL,
  `asal_darah` enum('Hibah','Beli','Produksi Sendiri') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` enum('Ada','Diambil','Dimusnahkan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_kantong`) USING BTREE,
  INDEX `kode_komponen`(`kode_komponen`) USING BTREE,
  CONSTRAINT `utd_stok_darah_ibfk_1` FOREIGN KEY (`kode_komponen`) REFERENCES `utd_komponen_darah` (`kode`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for utd_stok_medis
-- ----------------------------
DROP TABLE IF EXISTS `utd_stok_medis`;
CREATE TABLE `utd_stok_medis`  (
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `stok` double NULL DEFAULT NULL,
  `hargaterakhir` double NULL DEFAULT NULL,
  PRIMARY KEY (`kode_brng`) USING BTREE,
  CONSTRAINT `utd_stok_medis_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for utd_stok_penunjang
-- ----------------------------
DROP TABLE IF EXISTS `utd_stok_penunjang`;
CREATE TABLE `utd_stok_penunjang`  (
  `kode_brng` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `stok` double NULL DEFAULT NULL,
  `hargaterakhir` double NULL DEFAULT NULL,
  PRIMARY KEY (`kode_brng`) USING BTREE,
  CONSTRAINT `utd_stok_penunjang_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `ipsrsbarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zis_keterangan_atap_rumah_penerima_dankes
-- ----------------------------
DROP TABLE IF EXISTS `zis_keterangan_atap_rumah_penerima_dankes`;
CREATE TABLE `zis_keterangan_atap_rumah_penerima_dankes`  (
  `kode` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zis_keterangan_dapur_rumah_penerima_dankes
-- ----------------------------
DROP TABLE IF EXISTS `zis_keterangan_dapur_rumah_penerima_dankes`;
CREATE TABLE `zis_keterangan_dapur_rumah_penerima_dankes`  (
  `kode` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zis_keterangan_dinding_rumah_penerima_dankes
-- ----------------------------
DROP TABLE IF EXISTS `zis_keterangan_dinding_rumah_penerima_dankes`;
CREATE TABLE `zis_keterangan_dinding_rumah_penerima_dankes`  (
  `kode` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zis_keterangan_elektronik_penerima_dankes
-- ----------------------------
DROP TABLE IF EXISTS `zis_keterangan_elektronik_penerima_dankes`;
CREATE TABLE `zis_keterangan_elektronik_penerima_dankes`  (
  `kode` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zis_keterangan_jenis_simpanan_penerima_dankes
-- ----------------------------
DROP TABLE IF EXISTS `zis_keterangan_jenis_simpanan_penerima_dankes`;
CREATE TABLE `zis_keterangan_jenis_simpanan_penerima_dankes`  (
  `kode` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zis_keterangan_kamar_mandi_penerima_dankes
-- ----------------------------
DROP TABLE IF EXISTS `zis_keterangan_kamar_mandi_penerima_dankes`;
CREATE TABLE `zis_keterangan_kamar_mandi_penerima_dankes`  (
  `kode` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zis_keterangan_kategori_asnaf_penerima_dankes
-- ----------------------------
DROP TABLE IF EXISTS `zis_keterangan_kategori_asnaf_penerima_dankes`;
CREATE TABLE `zis_keterangan_kategori_asnaf_penerima_dankes`  (
  `kode` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zis_keterangan_kategori_phbs_penerima_dankes
-- ----------------------------
DROP TABLE IF EXISTS `zis_keterangan_kategori_phbs_penerima_dankes`;
CREATE TABLE `zis_keterangan_kategori_phbs_penerima_dankes`  (
  `kode` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zis_keterangan_kursi_rumah_penerima_dankes
-- ----------------------------
DROP TABLE IF EXISTS `zis_keterangan_kursi_rumah_penerima_dankes`;
CREATE TABLE `zis_keterangan_kursi_rumah_penerima_dankes`  (
  `kode` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zis_keterangan_lantai_rumah_penerima_dankes
-- ----------------------------
DROP TABLE IF EXISTS `zis_keterangan_lantai_rumah_penerima_dankes`;
CREATE TABLE `zis_keterangan_lantai_rumah_penerima_dankes`  (
  `kode` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zis_keterangan_patologis_penerima_dankes
-- ----------------------------
DROP TABLE IF EXISTS `zis_keterangan_patologis_penerima_dankes`;
CREATE TABLE `zis_keterangan_patologis_penerima_dankes`  (
  `kode` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zis_keterangan_pengeluaran_penerima_dankes
-- ----------------------------
DROP TABLE IF EXISTS `zis_keterangan_pengeluaran_penerima_dankes`;
CREATE TABLE `zis_keterangan_pengeluaran_penerima_dankes`  (
  `kode` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zis_keterangan_penghasilan_penerima_dankes
-- ----------------------------
DROP TABLE IF EXISTS `zis_keterangan_penghasilan_penerima_dankes`;
CREATE TABLE `zis_keterangan_penghasilan_penerima_dankes`  (
  `kode` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zis_keterangan_ternak_penerima_dankes
-- ----------------------------
DROP TABLE IF EXISTS `zis_keterangan_ternak_penerima_dankes`;
CREATE TABLE `zis_keterangan_ternak_penerima_dankes`  (
  `kode` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zis_keterangan_ukuran_rumah_penerima_dankes
-- ----------------------------
DROP TABLE IF EXISTS `zis_keterangan_ukuran_rumah_penerima_dankes`;
CREATE TABLE `zis_keterangan_ukuran_rumah_penerima_dankes`  (
  `kode` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Function structure for sf_formatTanggal
-- ----------------------------
DROP FUNCTION IF EXISTS `sf_formatTanggal`;
delimiter ;;
CREATE FUNCTION `sf_formatTanggal`(tanggal DATE)
 RETURNS varchar(255) CHARSET latin1
  DETERMINISTIC
BEGIN
  DECLARE varhasil varchar(255);

  SELECT CONCAT(
    CASE DAYOFWEEK(tanggal)
      WHEN 1 THEN 'Minggu'
      WHEN 2 THEN 'Senin'
      WHEN 3 THEN 'Selasa'
      WHEN 4 THEN 'Rabu'
      WHEN 5 THEN 'Kamis'
      WHEN 6 THEN 'Jumat'
      WHEN 7 THEN 'Sabtu'
    END,', ',
    DAY(tanggal),' ',
    CASE MONTH(tanggal) 
      WHEN 1 THEN 'Januari' 
      WHEN 2 THEN 'Februari' 
      WHEN 3 THEN 'Maret' 
      WHEN 4 THEN 'April' 
      WHEN 5 THEN 'Mei' 
      WHEN 6 THEN 'Juni' 
      WHEN 7 THEN 'Juli' 
      WHEN 8 THEN 'Agustus' 
      WHEN 9 THEN 'September'
      WHEN 10 THEN 'Oktober' 
      WHEN 11 THEN 'November' 
      WHEN 12 THEN 'Desember' 
    END,' ',
    YEAR(tanggal)
  ) INTO varhasil;

  RETURN varhasil;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for toRoman
-- ----------------------------
DROP FUNCTION IF EXISTS `toRoman`;
delimiter ;;
CREATE FUNCTION `toRoman`(number INT)
 RETURNS text CHARSET latin1
  DETERMINISTIC
BEGIN
 
	DECLARE basic_roman TEXT DEFAULT 'XL,X,IX,V,IV,I';
	DECLARE basic_value TEXT DEFAULT '40,10,9,5,4,1';
	DECLARE roman_string TEXT DEFAULT '';
	DECLARE i INT DEFAULT 1;
	DECLARE roman_symbol TEXT;
	DECLARE roman_value INT;
 
	SET roman_string = (SELECT IF(number<=0 OR number>=4000,NULL,roman_string));
 
	WHILE number > 0 AND number < 4000 DO
 
		SET roman_symbol = SUBSTRING_INDEX(SUBSTRING_INDEX(basic_roman,',',i),',',-1);
		SET roman_value  = SUBSTRING_INDEX(SUBSTRING_INDEX(basic_value,',',i),',',-1);
 
		IF number >= roman_value THEN
			SET roman_string = CONCAT(roman_string,roman_symbol);
			SET number = number - roman_value;
		ELSE
			SET i = i + 1;
		END IF;
 
	END WHILE;
 
	RETURN 	roman_string;
 
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
