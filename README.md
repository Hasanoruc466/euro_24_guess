**Euro 2024 Tahmin Oyunu**
**Euro 2024 Tahmin Oyunu**, Avrupa Futbol Şampiyonası 2024 için geliştirilen bir mobil tahmin oyunu uygulamasıdır. Kullanıcılar, turnuva boyunca maç sonuçlarını tahmin ederek puan kazanabilir ve tahminlerinde ne kadar doğru olduklarını görebilir.

**Özellikler**
⚽ *Turnuva Grupları:* A, B, C, D, E, F gruplarındaki takımların listesini görüntüleyin.
🏆 *Maç Tahminleri:* Grup aşamasından final aşamasına kadar tüm maçları tahmin edin.
🥉 *En İyi Üçüncü Seçimi:* Gruplardan çıkan en iyi üçüncü takımları seçme.
🔥 *Son 16, Çeyrek Final, Yarı Final ve Final:* Son 16, Çeyrek Final, Yarı Final ve Final eşleşmelerini görüntüleyin ve tahminlerde bulunun.

**Kullanılan Teknolojiler**
Flutter: Mobil uygulama geliştirmek için.
Dart: Kodlama dili.
Firebase: Takım verilerini (grup ve takım adı) dinamik olarak almak için.

**Kurulum ve Kullanım**
1.
```bash
git clone https://github.com/kullaniciadi/euro2024-tahmin
cd euro2024-tahmin
```
2.
```bash
flutter pub get
```
3. Firebase Yapılandırmasını Yapın:
    Firebase projesi oluşturun ve Flutter uygulamanızı Firebase'e bağlayın.
    RealTime Database'e takım verilerini ekleyin.

4. Uygulamayı Başlatın: 
```bash
    flutter run
```

**Takım Verileri**
```json
{
  "euro24": {
    "groups": {
      "A": {
        "teams": [
          {
            "code": "DE",
            "name": "Almanya"
          },
          {
            "code": "HU",
            "name": "Macaristan"
          },
          {
            "code": "GB-SCT",
            "name": "İskoçya"
          },
          {
            "code": "CH",
            "name": "İsviçre"
          }
        ]
      },
      "B": {
        "teams": [
          {
            "code": "ES",
            "name": "İspanya"
          },
          {
            "code": "HR",
            "name": "Hırvatistan"
          },
          {
            "code": "IT",
            "name": "İtalya"
          },
          {
            "code": "AL",
            "name": "Arnavutluk"
          }
        ]
      },
      "C": {
        "teams": [
          {
            "code": "SI",
            "name": "Slovenya"
          },
          {
            "code": "DK",
            "name": "Danimarka"
          },
          {
            "code": "RS",
            "name": "Sırbistan"
          },
          {
            "code": "GB",
            "name": "İngiltere"
          }
        ]
      },
      "D": {
        "teams": [
          {
            "code": "PL",
            "name": "Polonya"
          },
          {
            "code": "NL",
            "name": "Hollanda"
          },
          {
            "code": "AT",
            "name": "Avusturya"
          },
          {
            "code": "FR",
            "name": "Fransa"
          }
        ]
      },
      "E": {
        "teams": [
          {
            "code": "BE",
            "name": "Belçika"
          },
          {
            "code": "SK",
            "name": "Slovakya"
          },
          {
            "code": "RO",
            "name": "Romanya"
          },
          {
            "code": "UA",
            "name": "Ukrayna"
          }
        ]
      },
      "F": {
        "teams": [
          {
            "code": "TR",
            "name": "Türkiye"
          },
          {
            "code": "GE",
            "name": "Gürcistan"
          },
          {
            "code": "PT",
            "name": "Portekiz"
          },
          {
            "code": "CZ",
            "name": "Çek Cumhuriyeti"
          }
        ]
      }
    }
  }
}
