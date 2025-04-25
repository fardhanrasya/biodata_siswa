# 📚 Aplikasi Biodata Siswa

<div align="center">
  
  ![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
  ![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)
  
  Aplikasi CRUD sederhana untuk mengelola biodata siswa menggunakan Flutter dan Firebase
  
</div>

## ✨ Fitur

- 📝 **Create**: Menambahkan data siswa baru
- 📋 **Read**: Melihat daftar siswa dan detail siswa
- 🔄 **Update**: Mengubah data siswa yang sudah ada
- 🗑️ **Delete**: Menghapus data siswa

## 🚀 Memulai

### 📋 Prasyarat

Berikut adalah hal-hal yang perlu disiapkan sebelum menjalankan aplikasi:

#### 1. Instalasi Flutter

Flutter adalah framework untuk membuat aplikasi mobile. Ikuti langkah-langkah berikut:

1. **Unduh Flutter SDK**

   - Kunjungi [flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)
   - Pilih sistem operasi Anda (Windows/Mac/Linux)
   - Unduh paket Flutter terbaru (ZIP file)

2. **Ekstrak Flutter**

   - Buat folder di drive C: (misal: `C:\src`)
   - Ekstrak file ZIP Flutter ke folder tersebut
   - Anda akan memiliki folder seperti `C:\src\flutter`

3. **Atur PATH Environment**

   - Buka "Edit environment variables for your account" di Windows
   - Edit variabel PATH, tambahkan `C:\src\flutter\bin`
   - Klik OK untuk menyimpan

4. **Verifikasi Instalasi**
   - Buka Command Prompt baru
   - Jalankan: `flutter doctor`
   - Ikuti petunjuk yang muncul untuk menyelesaikan setup

#### 2. Instalasi Git

Git digunakan untuk mengelola kode sumber:

1. **Unduh Git**

   - Kunjungi [git-scm.com/downloads](https://git-scm.com/downloads)
   - Pilih sistem operasi Anda
   - Unduh installer Git

2. **Instal Git**

   - Jalankan installer yang diunduh
   - Gunakan pengaturan default (Next → Next → Install)
   - Setelah selesai, klik Finish

3. **Verifikasi Instalasi Git**
   - Buka Command Prompt
   - Jalankan: `git --version`
   - Jika muncul nomor versi, Git telah terinstal dengan benar

#### 3. Instalasi Android Studio

Android Studio diperlukan untuk pengembangan dan emulator:

1. **Unduh Android Studio**

   - Kunjungi [developer.android.com/studio](https://developer.android.com/studio)
   - Klik tombol "Download Android Studio"

2. **Instal Android Studio**

   - Jalankan installer
   - Ikuti wizard instalasi (Next → Next → Install)
   - Tunggu hingga proses instalasi selesai

3. **Setup Android Studio**

   - Saat pertama kali membuka, pilih "Standard Setup"
   - Tunggu proses download komponen
   - Setelah selesai, klik "Finish"

4. **Instal Android SDK**
   - Buka Android Studio
   - Klik "More Actions" → "SDK Manager"
   - Di tab "SDK Platforms", pilih "Android 12 (S)" atau yang lebih baru
   - Di tab "SDK Tools", pastikan "Android SDK Build-Tools" dicentang
   - Klik "Apply" dan tunggu proses download selesai

#### 4. Buat Akun Firebase

1. **Daftar Akun Google**

   - Jika belum punya akun Google, daftar di [accounts.google.com/signup](https://accounts.google.com/signup)
   - Ikuti proses pendaftaran hingga selesai

2. **Akses Firebase Console**
   - Buka [console.firebase.google.com](https://console.firebase.google.com/)
   - Login dengan akun Google Anda

### 📥 Setup Proyek

#### 1. Clone Repository

1. **Buka Command Prompt atau Terminal**

   - Di Windows: tekan Win+R, ketik "cmd", lalu Enter
   - Di Mac: buka Applications → Utilities → Terminal

2. **Pindah ke Direktori yang Diinginkan**

   - Contoh: `cd Documents`

3. **Clone Repository**
   ```bash
   git clone https://github.com/username/biodata_siswa.git
   cd biodata_siswa
   ```

#### 2. Instalasi Dependensi

1. **Buka Command Prompt di Folder Proyek**

   - Pastikan Anda sudah berada di folder proyek
   - Jalankan perintah:

   ```bash
   flutter pub get
   ```

2. **Tunggu Proses Selesai**
   - Flutter akan mengunduh semua package yang diperlukan
   - Setelah selesai, akan muncul pesan "Process completed successfully"

### 🔥 Setup Firebase (Langkah-langkah Detail)

#### 1. Buat Proyek Firebase Baru

1. **Buka Firebase Console**

   - Kunjungi [console.firebase.google.com](https://console.firebase.google.com/)
   - Login dengan akun Google Anda

2. **Buat Proyek Baru**

   - Klik tombol "Create a project" atau "Add project"
   - Masukkan nama proyek: "Biodata Siswa"
   - Klik "Continue"

3. **Konfigurasi Google Analytics**

   - Pilih apakah ingin mengaktifkan Google Analytics (disarankan "Yes")
   - Klik "Continue"

4. **Pilih Akun Google Analytics**

   - Pilih "Default Account for Firebase"
   - Klik "Create project"

5. **Tunggu Proses Pembuatan Proyek**
   - Proses ini mungkin memerlukan waktu beberapa menit
   - Setelah selesai, klik "Continue"

#### 2. Daftarkan Aplikasi Android

1. **Tambahkan Aplikasi Android ke Firebase**

   - Di dashboard Firebase, klik ikon Android (🤖)
   - Masukkan package name: `com.example.biodata_siswa`
     (Catatan: Sesuaikan dengan package name di file `android/app/build.gradle`)
   - Opsional: Masukkan nickname aplikasi
   - Klik "Register app"

2. **Unduh Konfigurasi**

   - Sistem akan menghasilkan file `google-services.json`
   - Klik tombol "Download google-services.json"
   - Simpan file ini di komputer Anda

3. **Tempatkan File Konfigurasi**

   - Pindahkan file `google-services.json` ke folder `android/app/` dalam proyek Flutter Anda
   - Buka explorer Windows/Finder Mac
   - Navigasi ke folder proyek Flutter
   - Salin file ke dalam folder android/app

4. **Tambahkan Dependencies Firebase**
   - Firebase sudah akan menampilkan petunjuk untuk menambahkan kode
   - Klik "Next" untuk melanjutkan ke langkah berikutnya
   - Klik "Skip this step" pada langkah "Add Firebase SDK"
   - Klik "Continue to console"

#### 3. Daftarkan Aplikasi iOS (Jika Diperlukan)

1. **Tambahkan Aplikasi iOS ke Firebase**

   - Di dashboard proyek Firebase, klik "Add app"
   - Pilih ikon iOS (🍎)
   - Masukkan Bundle ID: `com.example.biodataSiswa`
   - Opsional: Masukkan nickname aplikasi
   - Klik "Register app"

2. **Unduh Konfigurasi iOS**

   - Sistem akan menghasilkan file `GoogleService-Info.plist`
   - Klik tombol "Download GoogleService-Info.plist"
   - Simpan file ini di komputer Anda

3. **Tempatkan File Konfigurasi iOS**
   - Buka proyek di Xcode:
     - Buka terminal dan jalankan: `open ios/Runner.xcworkspace`
   - Drag-and-drop file `GoogleService-Info.plist` ke folder Runner di Xcode
   - Pastikan opsi "Copy items if needed" dicentang
   - Klik "Finish"

#### 4. Aktifkan Cloud Firestore

1. **Buka Firestore Database**

   - Di menu kiri Firebase Console, klik "Firestore Database"
   - Klik tombol "Create database"

2. **Pilih Mode Keamanan**

   - Untuk pengujian, pilih "Start in test mode"
   - Untuk produksi, pilih "Start in production mode"
   - Klik "Next"

3. **Pilih Lokasi**

   - Pilih lokasi server yang terdekat dengan pengguna aplikasi Anda
   - Untuk Indonesia, pilih `asia-southeast1` (Singapore)
   - Klik "Enable"

4. **Buat Koleksi untuk Data Siswa**
   - Setelah Firestore aktif, klik "Start collection"
   - Masukkan Collection ID: `students`
   - Klik "Next"
   - Untuk contoh, tambahkan dokumen pertama dengan fields:
     - `id`: (Auto-ID)
     - `nama`: "Contoh Nama"
     - `kelas`: "12 IPA 1"
     - `alamat`: "Jl. Contoh No. 123"
   - Klik "Save"

#### 5. Instalasi Firebase CLI

1. **Instal Node.js**

   - Kunjungi [nodejs.org](https://nodejs.org/en/download/)
   - Unduh versi LTS untuk sistem operasi Anda
   - Jalankan installer dan ikuti petunjuk (Next → Next → Install)

2. **Instal Firebase CLI**

   - Buka Command Prompt sebagai Administrator
   - Jalankan perintah:

   ```bash
   npm install -g firebase-tools
   ```

3. **Login ke Firebase**

   - Di Command Prompt, jalankan:

   ```bash
   firebase login
   ```

   - Browser akan terbuka, login dengan akun Google Anda
   - Kembali ke Command Prompt setelah otentikasi berhasil

4. **Instal FlutterFire CLI**
   - Jalankan perintah:
   ```bash
   dart pub global activate flutterfire_cli
   ```

#### 6. Konfigurasi Firebase untuk Flutter

1. **Jalankan FlutterFire Configure**

   - Di folder proyek, jalankan:

   ```bash
   flutterfire configure
   ```

2. **Pilih Proyek Firebase**

   - Dari daftar proyek yang muncul, pilih proyek "Biodata Siswa" yang telah dibuat
   - Tekan Enter

3. **Pilih Platform**

   - Pilih platform yang ingin dikonfigurasi (Android/iOS/Web)
   - Tekan spasi untuk memilih
   - Tekan Enter untuk melanjutkan

4. **Verifikasi Konfigurasi**
   - FlutterFire akan membuat file `lib/firebase_options.dart` secara otomatis
   - Pastikan file ini ada di proyek Anda

### 📱 Menjalankan Aplikasi

#### 1. Siapkan Perangkat

**Menggunakan Emulator Android:**

1. Buka Android Studio
2. Klik "AVD Manager" (ikon ponsel di toolbar)
3. Klik "Create Virtual Device"
4. Pilih perangkat (misal: Pixel 4)
5. Pilih sistem Android (misal: Android 12)
6. Klik "Finish"
7. Jalankan emulator dengan mengklik ikon play

**Menggunakan Perangkat Fisik Android:**

1. Aktifkan "USB Debugging" di perangkat:
   - Buka Settings → About Phone
   - Tap "Build Number" 7 kali untuk mengaktifkan Developer Options
   - Kembali ke Settings → System → Developer Options
   - Aktifkan "USB Debugging"
2. Sambungkan perangkat ke komputer dengan kabel USB
3. Izinkan debugging USB ketika prompt muncul di perangkat

#### 2. Jalankan Aplikasi

1. **Buka Terminal/Command Prompt**

   - Pastikan Anda berada di folder proyek

2. **Periksa Perangkat Terhubung**

   ```bash
   flutter devices
   ```

   - Pastikan perangkat Anda muncul dalam daftar

3. **Jalankan Aplikasi**

   ```bash
   flutter run
   ```

4. **Tunggu Proses Build**
   - Proses build pertama kali mungkin memerlukan waktu beberapa menit
   - Setelah selesai, aplikasi akan terbuka di perangkat/emulator

### 📂 Struktur Proyek

```
lib/
├── main.dart
├── firebase_options.dart
├── models/
│   └── student.dart
├── screens/
│   ├── home_screen.dart
│   ├── student_detail_screen.dart
│   └── student_form_screen.dart
└── services/
    └── firebase_service.dart
```

## 🔧 Troubleshooting

<details>
<summary>Masalah Instalasi Flutter</summary>

- **Flutter tidak ditemukan:**
  ```bash
  flutter: command not found
  ```
  Solusi: Pastikan Flutter sudah ditambahkan ke PATH sistem
- **Flutter doctor menunjukkan error:**
  Solusi: Jalankan `flutter doctor -v` dan ikuti instruksi untuk memperbaiki masalah

- **Gradle build failed:**
  Solusi:
  ```bash
  flutter clean
  flutter pub get
  ```
  </details>

<details>
<summary>Masalah Integrasi Firebase</summary>

- **Missing google-services.json:**
  Solusi: Pastikan file `google-services.json` sudah ditempatkan di folder `android/app/`
- **Firebase initialization failed:**
  Solusi: Periksa `lib/firebase_options.dart` sudah ada dan benar

- **Package get failed:**
  Solusi:
  ```bash
  flutter clean
  flutter pub get
  ```
  </details>

<details>
<summary>Masalah iOS</summary>

- **Pod install error:**
  Solusi:
  ```bash
  cd ios
  pod repo update
  pod install
  cd ..
  ```
- **Missing GoogleService-Info.plist:**
Solusi: Pastikan file sudah ditambahkan ke Xcode dan berada di folder yang benar
</details>

<details>
<summary>Masalah Android</summary>

- **minSdkVersion error:**
  Solusi: Buka `android/app/build.gradle` dan pastikan:

  ```gradle
  defaultConfig {
      minSdkVersion 21
      // ...
  }
  ```

- **Execution failed for task ':app:processDebugGoogleServices':**
  Solusi: Pastikan file `google-services.json` ada dan valid

- **Plugin requires higher API level:**
Solusi: Update `compileSdkVersion` dan `targetSdkVersion` di `android/app/build.gradle`
</details>
