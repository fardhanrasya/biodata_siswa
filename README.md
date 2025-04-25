# Aplikasi Biodata Siswa

Aplikasi CRUD sederhana untuk mengelola biodata siswa menggunakan Flutter dan Firebase.

## Fitur

- Create: Menambahkan data siswa baru
- Read: Melihat daftar siswa dan detail siswa
- Update: Mengubah data siswa yang sudah ada
- Delete: Menghapus data siswa

## Langkah-langkah Setup dan Menjalankan Aplikasi

### 1. Prasyarat

- Flutter SDK terinstal (versi 3.0.0 atau lebih baru)
- Git terinstal
- Akun Firebase
- Android Studio atau VS Code
- Emulator Android/iOS atau perangkat fisik

### 2. Clone Repository (jika menggunakan GitHub)

```bash
git clone https://github.com/username/biodata_siswa.git
cd biodata_siswa
```

### 3. Instalasi Dependensi

Jalankan perintah berikut untuk menginstal semua dependensi yang diperlukan:

```bash
flutter pub get
```

### 4. Setup Firebase

1. Buat proyek baru di [Firebase Console](https://console.firebase.google.com/)
2. Tambahkan aplikasi Flutter ke proyek Firebase:
   - Klik "Add app" dan pilih platform (Android/iOS)
   - Ikuti petunjuk untuk mendaftarkan aplikasi Anda
   - Unduh file konfigurasi:
     - Untuk Android: `google-services.json` (tempatkan di folder `/android/app/`)
     - Untuk iOS: `GoogleService-Info.plist` (tempatkan di folder `/ios/Runner/`)

3. Aktifkan Cloud Firestore:
   - Di Firebase Console, buka "Firestore Database"
   - Klik "Create database"
   - Pilih mode (production atau test)
   - Buat koleksi dengan nama "students"

4. Instal Firebase CLI dan FlutterFire CLI:
   ```bash
   npm install -g firebase-tools
   dart pub global activate flutterfire_cli
   ```

5. Konfigurasi Firebase untuk proyek Flutter:
   ```bash
   flutterfire configure --project=your-firebase-project-id
   ```
   
   Ini akan membuat file `firebase_options.dart` di aplikasi Anda.

### 5. Struktur File

Pastikan struktur file proyek Anda seperti ini:

```
lib/
├── main.dart
├── firebase_options.dart (dibuat oleh FlutterFire CLI)
├── models/
│   └── student.dart
├── screens/
│   ├── home_screen.dart
│   ├── student_detail_screen.dart
│   └── student_form_screen.dart
└── services/
    └── firebase_service.dart
```

### 6. Menjalankan Aplikasi

1. Sambungkan perangkat Android/iOS atau jalankan emulator
2. Jalankan aplikasi dengan perintah:

```bash
flutter run
```

### 7. Troubleshooting

#### Masalah Flutter Firebase

Jika mengalami masalah dengan integrasi Firebase:

1. Pastikan file konfigurasi Firebase (`google-services.json` atau `GoogleService-Info.plist`) sudah berada di lokasi yang benar
2. Periksa versi dependensi Firebase di `pubspec.yaml`
3. Jalankan `flutter clean` lalu `flutter pub get`

#### Masalah iOS

Untuk iOS, Anda mungkin perlu menjalankan:

```bash
cd ios
pod install
cd ..
```

#### Masalah Android

Pastikan minSdkVersion di `android/app/build.gradle` adalah 21 atau lebih tinggi:

```gradle
defaultConfig {
    minSdkVersion 21
    // ...
}
```

## Fitur Tambahan yang Dapat Dikembangkan

1. Autentikasi pengguna
2. Upload foto siswa
3. Pencarian dan filter data siswa
4. Export data ke PDF/Excel
5. Notifikasi