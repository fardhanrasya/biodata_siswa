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

- Flutter SDK (versi 3.0.0 atau lebih baru)
- Git
- Akun Firebase
- Android Studio atau VS Code
- Emulator Android/iOS atau perangkat fisik

### 📥 Clone Repository

```bash
git clone https://github.com/username/biodata_siswa.git
cd biodata_siswa
```

### 📦 Instalasi Dependensi

```bash
flutter pub get
```

### 🔥 Setup Firebase

1. **Buat Proyek Firebase**

   - Kunjungi [Firebase Console](https://console.firebase.google.com/)
   - Buat proyek baru

2. **Tambahkan Aplikasi Flutter**
   - Klik "Add app" dan pilih platform (Android/iOS)
   - Ikuti petunjuk untuk mendaftarkan aplikasi
3. **Unduh & Tempatkan File Konfigurasi:**

   - Android: `google-services.json` → `/android/app/`
   - iOS: `GoogleService-Info.plist` → `/ios/Runner/`

4. **Aktifkan Cloud Firestore:**

   - Di Firebase Console → "Firestore Database"
   - Klik "Create database"
   - Pilih mode (production atau test)
   - Buat koleksi dengan nama "students"

5. **Pasang Firebase CLI:**

   ```bash
   npm install -g firebase-tools
   dart pub global activate flutterfire_cli
   ```

6. **Konfigurasi Firebase untuk Flutter:**
   ```bash
   flutterfire configure
   ```

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

### ▶️ Menjalankan Aplikasi

1. Sambungkan perangkat atau jalankan emulator
2. Jalankan aplikasi:

```bash
flutter run
```

## 🔧 Troubleshooting

<details>
<summary>Masalah Integrasi Firebase</summary>

- Pastikan file konfigurasi berada pada lokasi yang benar
- Periksa versi dependensi Firebase di `pubspec.yaml`
- Jalankan:
  ```bash
  flutter clean
  flutter pub get
  ```
  </details>

<details>
<summary>Masalah iOS</summary>

Jalankan perintah berikut:

```bash
cd ios
pod install
cd ..
```

</details>

<details>
<summary>Masalah Android</summary>

Pastikan `minSdkVersion` di `android/app/build.gradle` minimal 21:

```gradle
defaultConfig {
    minSdkVersion 21
    // ...
}
```

</details>
