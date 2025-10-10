# Mindtrip AI - Flutter App

Modern ve minimalist tasarıma sahip AI seyahat asistanı uygulaması.

## 🎨 Renk Paleti

- **Primary (Kırmızı)**: `#C11336`
- **Secondary (Pembe)**: `#CD5970`
- **Accent (Turuncu)**: `#F56F29`
- **Yellow (Sarı)**: `#F3E602`
- **Background (Beyaz)**: `#FDFDFD`

## 📱 Sayfalar

### 1. Authentication
- **Sign Up Page**: Kullanıcı kaydı
- **Sign In Page**: Kullanıcı girişi

### 2. Home (AI Chat)
- AI asistan ile sohbet
- Mesaj gönderme ve alma
- Dosya ekleme özellği

### 3. Profile
- Kullanıcı profili
- Avatar
- İstatistikler (Posts, Followers, Following)
- About bölümü
- Edit Profile butonu

### 4. Settings
- Account (Hesap Detayları, Şifre Değiştirme)
- Preferences (Uygulama Tercihleri, Bildirimler)
- Support (Yardım Merkezi, İletişim)

## 🚀 Kurulum

```bash
# Bağımlılıkları yükle
flutter pub get

# Uygulamayı çalıştır
flutter run

# Build al
flutter build apk  # Android için
flutter build ios  # iOS için
flutter build windows  # Windows için
```

## 📦 Kullanılan Paketler

- `flutter`: Flutter framework
- `cupertino_icons`: iOS stil ikonlar

## 🏗️ Proje Yapısı

```
lib/
├── core/
│   ├── theme/
│   │   └── app_theme.dart          # Tema ayarları
│   └── widgets/
│       └── app_scaffold.dart       # Ana navigation
├── features/
│   ├── auth/
│   │   ├── signup_page.dart        # Kayıt olma sayfası
│   │   └── signin_page.dart        # Giriş sayfası
│   ├── chat/
│   │   └── chat_page.dart          # AI Chat sayfası
│   ├── profile/
│   │   └── profile_page.dart       # Profil sayfası
│   └── settings/
│       └── settings_page.dart      # Ayarlar sayfası
└── main.dart                        # Ana dosya
```

## 🎯 Özellikler

- ✅ Modern ve temiz UI/UX tasarımı
- ✅ Material 3 design
- ✅ Responsive tasarım
- ✅ Bottom navigation bar
- ✅ Custom renk paleti
- ✅ Authentication flow

## 📝 Notlar

Bu uygulama sadece tasarım odaklıdır ve backend entegrasyonu içermez. Gerçek bir uygulamada:

- Authentication için Firebase Auth veya benzeri bir servis kullanılmalı
- AI Chat için OpenAI API veya benzeri bir servis entegre edilmeli
- Kullanıcı verileri için backend ve database kurulmalı
- State management (Provider, Riverpod, Bloc vb.) eklenebilir

## 🔮 Gelecek Geliştirmeler

- [ ] Backend entegrasyonu
- [ ] Gerçek AI chat fonksiyonalitesi
- [ ] Kullanıcı profili düzenleme
- [ ] Bildirimler
- [ ] Karanlık tema desteği
- [ ] Çoklu dil desteği

## 📄 Lisans

Bu proje eğitim amaçlı oluşturulmuştur.
