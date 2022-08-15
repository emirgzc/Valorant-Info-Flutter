class CharModel {
  String? realName;
  String? story;
  String? gameName;
  String? country;
  String? type;
  String? gender;
  String? role;
  String? codeName;
  String? image;
  Map<String, Map<String, String>>? powers;

  CharModel({
    required this.realName,
    required this.gameName,
    required this.country,
    required this.type,
    required this.gender,
    required this.role,
    required this.codeName,
    required this.image,
    required this.powers,
    required this.story,
  });
}

List<CharModel> listChar = [
  CharModel(
    realName: "Liam Byrne",
    story:
        "Aramıza ABD'den katılan Brimstone'un hava araçları sayesinde takımı her zaman 1-0 öndedir. Gereken her türlü işlevselliği titizlikle ve güvenli bir mesafeden sağlaması, muharebe alanında bu kumandanı eşsiz kılar.",
    gameName: "Brimstone",
    country: "United States",
    type: "Human",
    gender: "Male",
    role: "Kontrol Uzmanı",
    codeName: "Sarge",
    image: "assets/char/brim.webp",
    powers: {
      "KUVVET İŞARETİ": {
        "name": "KUVVET İŞARETİ",
        "desc":
            "Bir kuvvet işareti KUŞAN. Kuvvet işaretini Brimstone'un önüne atmak için ATEŞ ET. Yere inen kuvvet işareti oyunculara SeriAtış sağlayan bir alan oluşturur.",
        "price": "200",
        "use": "C",
        "image": "assets/char/b1.webp",
      },
      "YAKICI": {
        "name": "YAKICI",
        "desc":
            "Bir yangın bombası atar KUŞAN. Yerde durduğu anda infilak eden bir bomba fırlatmak için ATEŞ ET. Yerde bir süre kalan alev bölgesi, içindeki oyunculara hasar verir.",
        "price": "250",
        "use": "Q",
        "image": "assets/char/b2.webp",
      },
      "DUMANLI HAVA SAHASI": {
        "name": "DUMANLI HAVA SAHASI",
        "desc":
            "Bir taktik harita KUŞAN. Brimstone'un duman bulutlarının ineceği konumları belirlemek için ATEŞ ET. ALTERNATİF ATIŞ ile onayla ve seçili alanda görüşü kısıtlayan uzun süreli duman bulutları oluştur.",
        "price": "100",
        "use": "E",
        "image": "assets/char/b3.webp",
      },
      "UYDU SALDIRISI": {
        "name": "UYDU SALDIRISI",
        "desc":
            "Bir taktik harita KUŞAN. Seçili konuma bir süre yerde kalan bir uydu saldırısı lazeri fırlatmak için ATEŞ ET. Seçili alanda kalan oyuncular zaman içinde yüksek hasar alır.",
        "price": "Free(7 point)",
        "use": "X",
        "image": "assets/char/b4.webp",
      },
    },
  ),
  CharModel(
    realName: "Sabine Callas",
    story:
        "Amerikalı kimyacı Viper zehir yüklü, çeşit çeşit kimyasal cihazıyla savaş alanını kontrol altında tutarken düşmanın görüşünü de alt üst eder. Avını zehriyle değilse bile aklıyla mutlaka avcunun içine alır.",
    gameName: "Viper",
    country: "United States",
    type: "Human",
    gender: "Female",
    role: "Kontrol Uzmanı",
    codeName: "Pandemic",
    image: "assets/char/viper.webp",
    powers: {
      "ASİT HAVUZU": {
        "name": "ASİT HAVUZU",
        "desc":
            "Bir kimyasal fırlatıcı KUŞAN. Yere çarptığında parçalanan bir kapsül fırlatmak için ATEŞ ET. Oluşturduğu uzun süreli kimyasal alanda kalan düşmanlar hasar alır ve yavaşlar.",
        "price": "200",
        "use": "C",
        "image": "assets/char/v1.webp",
      },
      "ZEHİR BULUTU": {
        "name": "ZEHİR BULUTU",
        "desc":
            "Bir gaz salgılayıcı KUŞAN. Tur boyunca devamlı yerde kalacak salgılayıcıyı fırlatmak için ATEŞ ET. Yakıt kullanarak zehirli bir duman bulutu oluşturmak için YENİDEN KULLAN. Bu yetenek birden fazla kez YENİDEN KULLANILABİLİR ve yerden alınarak YENİDEN YERLEŞTİRİLEBİLİR.",
        "use": "Q",
        "price": "200",
        "image": "assets/char/v2.webp",
      },
      "ZEHİR PERDESİ": {
        "name": "ZEHİR PERDESİ",
        "desc":
            "Bir gaz salgılayıcı fırlatıcı KUŞAN. Gaz salgılayıcıları uzun bir hat boyunca yerleştirmek için ATEŞ ET. Yakıt kullanarak zehirli bir duman bulutu oluşturmak için YENİDEN KULLAN. Bu yetenek birden fazla kez YENİDEN KULLANILABİLİR.",
        "use": "E",
        "price": "Free",
        "image": "assets/char/v3.webp",
      },
      "VIPER'IN İNİ": {
        "name": "VIPER'IN İNİ",
        "desc":
            "Bir kimyasal püskürtücü KUŞAN. Viper'ın etrafında her yöne doğru kimyasal bir bulut oluşturmak için ATEŞ ET. Oluşan geniş bulut, içinde kalan oyuncuların görüşünü kısıtlar ve azami canlarını azaltır.",
        "use": "X",
        "price": "Free(7 point)",
        "image": "assets/char/v4.webp",
      },
    },
  ),
  CharModel(
    realName: "John Fred Marcus Yohan Dimitri",
    story:
        "Bir anının hayaleti olan Omen gölgelerin içinde avlanır. Düşmanlarını kör eder, savaş alanını boydan boya kat eder ve paranoyanın, onun ne taraftan saldıracağını anlamaya çalışan rakiplerinin damarlarında gezinmesini sağlar.",
    gameName: "Omen",
    country: "Earth",
    type: "Radiant",
    gender: "Male",
    role: "Kontrol Uzmanı",
    codeName: "Wraith",
    image: "assets/char/omen.webp",
    powers: {
      "GİZLİ ADIM": {
        "name": "GİZLİ ADIM",
        "desc":
            "Bir gölge yürüyüşü yeteneği KUŞAN ve menzil göstergesini görüntüle. Kısa bir beklemenin ardından işaretli konuma ışınlanmak için ATEŞ ET.",
        "price": "100",
        "use": "C",
        "image": "assets/char/o1.webp",
      },
      "PARANOYA": {
        "name": "PARANOYA",
        "desc":
            "HEMEN ileri fırlayan bir gölge atışı yap. Kısa süreliğine, dokunduğu herkesin görüş menzilini kısıtlar. Bu atış doğrudan duvarlardan geçebilir.",
        "price": "100",
        "use": "Q",
        "image": "assets/char/o1.webp",
      },
      "KARANLIK ÖRTÜ": {
        "name": "KARANLIK ÖRTÜ",
        "desc":
            "Bir gölge küresi KUŞAN ve menzil göstergesini görüntüle. Gölge küresini işaretli konuma fırlatmak için ATEŞ ET. Görüş kısıtlayan uzun süreli bir gölge küresi oluşturur. Hedef alma esnasında işaretçiyi daha uzağa götürmek için ALTERNATİF ATIŞI BASILI TUT, işaretçiyi daha yakına getirmek için yetenek tuşunu BASILI TUT.",
        "use": "E",
        "price": "150",
        "image": "assets/char/o3.webp",
      },
      "GÖLGELERİN İÇİNDEN": {
        "name": "GÖLGELERİN İÇİNDEN",
        "desc":
            "Bir taktik harita KUŞAN. Seçili konuma ışınlanmaya başlamak için ATEŞ ET. Omen, ışınlanma esnasında Gölge suretine bürünür ve düşmanları onu yok ederek ışınlanmayı iptal edebilir.",
        "use": "X",
        "price": "Free(7 point)",
        "image": "assets/char/o4.webp",
      },
    },
  ),
  CharModel(
    realName: "Klara Böhringer",
    story:
        "Alman dâhi Killjoy, kendi icatlarından oluşan cephaneliğiyle savaş meydanını kontrol altına alır. Cihazlarının verdiği hasar rakiplerini durdurmaya yetmezse robotlarının yardımıyla rakiplerini zayıflatarak onların ortadan kaldırılmalarını kolaylaştırır.",
    gameName: "Killjoy",
    country: "Germany",
    type: "Human",
    gender: "Female",
    role: "Gözcü",
    codeName: "Killjoy",
    image: "assets/char/killjoy.webp",
    powers: {
      "Nanosürü": {
        "name": "Nanosürü",
        "desc":
            "Nanosürü bombası KUŞAN. Bombayı fırlatmak için ATEŞ ET. Nanosürü bir yere isabet ettiği anda gizlenir. Hasar veren nano robot sürüsünü salmak için Nanosürü'yü ETKİNLEŞTİR.",
        "price": "200",
        "use": "C",
        "image": "assets/char/k1.webp",
      },
      "Alarm Botu": {
        "name": "Alarm Botu",
        "desc":
            "Gizli bir Alarm Botu KUŞAN. Menzili içine giren düşmanların peşine düşen bir robot göndermek için ATEŞ ET. Robot hedefine ulaştığında patlar ve hedefi Savunmasız hale getirir. Gönderdiğin botu geri çağırmak için KUŞANMA TUŞUNU BASILI TUT.",
        "use": "Q",
        "price": "200",
        "image": "assets/char/k2.webp",
      },
      "Taret": {
        "name": "Taret",
        "desc":
            "Bir taret KUŞAN. 180 derecelik bir koni içindeki düşmanlara ateş eden bir taret yerleştirmek için ATEŞ ET. Gönderdiğin botu geri çağırmak için KUŞANMA TUŞUNU BASILI TUT.",
        "use": "E",
        "price": "Free",
        "image": "assets/char/k3.webp",
      },
      "Tecrit": {
        "name": "Tecrit",
        "desc":
            "Tecrit cihazını KUŞAN. Cihazı yerleştirmek için ATEŞ ET. Uzun bir hazırlık süresinin ardından cihazın etki alanında kalan düşmanların hepsi alıkoyulur. Bu cihaz düşmanlar tarafından yok edilebilir.",
        "use": "X",
        "price": "Free(7 point)",
        "image": "assets/char/k4.webp",
      },
    },
  ),
  CharModel(
    realName: "Amir El Amari",
    story:
        "Faslı bilgi uzmanı ve tek kişilik gözetleme ağı Cypher, düşmanın her hareketini bilir, her sırrını duyar ve her manevrasını görür. Cypher'ın gözleri hep üzerinizdedir.",
    gameName: "Cypher",
    country: "Morocco",
    type: "Human",
    gender: "Male",
    role: "Gözcü",
    codeName: "Aamir Gumshoe",
    image: "assets/char/cypher.webp",
    powers: {
      "BUBİ TUZAĞI": {
        "name": "BUBİ TUZAĞI",
        "desc":
            "Bir bubi tuzağı KUŞAN. Hedef konuma yok edilebilir, gizli bir bubi tuzağı yerleştirmek için ATEŞ ET. Yerleştirilen konum ile karşısındaki duvar arasına bir hat çekilir. Yakalanan rakipler cihazı zamanında yok edemedikleri takdirde kısa süre içinde kısıtlanır, açığa çıkar ve sarsılırlar. Bu yetenek yerinden alınabilir ve YENİDEN YERLEŞTİRİLEBİLİR.",
        "price": "200",
        "use": "C",
        "image": "assets/char/c1.webp",
      },
      "SİBER KAFES": {
        "name": "SİBER KAFES",
        "desc":
            "Siber kafesi HEMEN Cypher'ın önüne fırlat. İçinden geçen düşmanların görüşünü engelleyen ve onları yavaşlatan bir alan oluşturmak için etkinleştir.",
        "use": "Q",
        "price": "100",
        "image": "assets/char/c2.webp",
      },
      "GİZLİ KAMERA": {
        "name": "GİZLİ KAMERA",
        "desc":
            "Bir gizli kamera KUŞAN. Gizli kamerayı hedef konuma yerleştirmek için ATEŞ ET. Bu yeteneği YENİDEN KULLAN ve kamera görüşünü kontrol et. Kamera kontrolü sendeyken ATEŞ ET ve işaretleyen bir iğne fırlat. Bu iğne, isabet ettiği herhangi bir oyuncunun konumunu açığa çıkarır.",
        "use": "E",
        "price": "Free",
        "image": "assets/char/c3.webp",
      },
      "NÖRON HIRSIZI": {
        "name": "NÖRON HIRSIZI",
        "desc":
            "Nişangâhından gördüğün ölü bir düşman üzerinde ANINDA kullan ve hayatta olan diğer tüm düşmanların konumunu ortaya çıkar.",
        "use": "X",
        "price": "Free(6 point)",
        "image": "assets/char/c4.webp",
      },
    },
  ),
  CharModel(
    realName: "Alexander (Sasha) Novikov",
    story:
        "Rusya'nın uçsuz bucaksız tundralarında yetişen Sova düşmanlarını acımasız bir verimlilik ve titizlikle tespit eder, izlerini sürer ve onları yok eder. Özel yayı ve sıra dışı iz sürme yetenekleri ile ondan kaçsanız da asla saklanamazsınız.",
    gameName: "Sova",
    country: "Russia",
    type: "Human",
    gender: "Male",
    role: "Öncü",
    codeName: "Hunter",
    image: "assets/char/sova.webp",
    powers: {
      "BAYKUŞ DRON": {
        "name": "BAYKUŞ DRON",
        "desc":
            "Bir baykuş dron KUŞAN. Baykuş dronu göndermek ve hareketlerini kontrol etmek için ATEŞ ET. Dronun kontrolü sendeyken ATEŞ ET ve işaretleyen bir iğne fırlat. Bu iğne, isabet ettiği herhangi bir oyuncunun konumunu açığa çıkarır.",
        "price": "400",
        "use": "C",
        "image": "assets/char/s1.webp",
      },
      "ŞOK OKU": {
        "name": "ŞOK OKU",
        "desc":
            "Şok okuna sahip bir yay KUŞAN. Patlayıcıyı ileri yollamak için ATEŞ ET. Ok çarpışma anında infilak eder ve yakındaki oyunculara hasar verir. Atış mesafesini uzatmak için BASILI TUTARAK ATEŞ ET. Oku iki kereye kadar sektirmek için ALTERNATİF ATIŞ kullan.",
        "use": "Q",
        "price": "150",
        "image": "assets/char/s2.webp",
      },
      "KEŞİF OKU": {
        "name": "KEŞİF OKU",
        "desc":
            "Keşif okuna sahip bir yay KUŞAN. Keşif okunu ileri yollamak için ATEŞ ET. Ok çarpışma anında etkinleşir ve görüş hattı yakınında kalan düşmanların konumunu ortaya çıkarır. Atış mesafesini uzatmak için BASILI TUTARAK ATEŞ ET. Oku iki kereye kadar sektirmek için ALTERNATİF ATIŞ kullan.",
        "use": "E",
        "price": "Free",
        "image": "assets/char/s3.webp",
      },
      "AVCI'NIN HİDDETİ": {
        "name": "AVCI'NIN HİDDETİ",
        "desc":
            "Üç adet duvar delici enerji patlaması ateşleyen bir yay KUŞAN. Sova'nın önünde, bir hat üzerinde enerji patlamaları oluşturmak ve hatta yakalanan düşmanlara hasar verip konumlarını açığa çıkarmak için ATEŞ ET. Bu yetenek, yetenek sayacı etkinken iki kez daha YENİDEN KULLANILABİLİR.",
        "use": "X",
        "price": "Free(8 point)",
        "image": "assets/char/s4.webp",
      },
    },
  ),
  CharModel(
    realName: "Ling Ying Wei",
    story:
        "Çinli ve kapı gibi Sage gittiği her yerde kendini ve takımını güvende tutar. Öldürülen silah arkadaşlarını hayata döndürme yeteneği ve agresif saldırıları bertaraf edebilmesiyle, cehennemvari savaş meydanında etrafına huzur verir.",
    gameName: "Sage",
    country: "China",
    type: "Radiant",
    gender: "Female",
    role: "Gözcü",
    codeName: "Thorne",
    image: "assets/char/sage.webp",
    powers: {
      "BARİYER KÜRESİ": {
        "name": "BARİYER KÜRESİ",
        "desc":
            "Bir bariyer küresi KUŞAN. Sert bir duvar oluşturmak için ATEŞ ET. ALTERNATİF ATIŞ, hedefleyiciyi döndürür.",
        "price": "400",
        "use": "C",
        "image": "assets/char/sg1.webp",
      },
      "YAVAŞLATAN KÜRE": {
        "name": "YAVAŞLATAN KÜRE",
        "desc":
            "Bir yavaşlatma küresi KUŞAN. Yere temas ettiğinde patlayarak bir süre yerde kalan ve oluşturduğu alanda kalan oyuncuları yavaşlatan bir yavaşlatma küresi göndermek için ATEŞ ET.",
        "use": "Q",
        "price": "200",
        "image": "assets/char/sg2.webp",
      },
      "CAN KÜRESİ": {
        "name": "CAN KÜRESİ",
        "desc":
            "Bir iyileştirme küresi KUŞAN. Nişangâhını hasar almış bir silah arkadaşına doğrult ve onu zaman içinde iyileştirmek için ATEŞ ET. Sage hasar aldıysa, zaman içinde kendini iyileştirmek için ALTERNATİF ATIŞ kullan.",
        "use": "E",
        "price": "Free",
        "image": "assets/char/sg3.webp",
      },
      "DİRİLİŞ": {
        "name": "DİRİLİŞ",
        "desc":
            "Bir diriltme yeteneği KUŞAN. Nişangâhını dost bir cesede doğrult ve onu hayata döndürmek için ATEŞ ET. Silah arkadaşın kısa bir sürenin ardından tamamen iyileşmiş olarak hayata döner.",
        "use": "X",
        "price": "Free(8 point)",
        "image": "assets/char/sg4.webp",
      },
    },
  ),
  CharModel(
    realName: "Jamie Adeyemi",
    story:
        "Aramıza Birleşik Krallık'tan katılan ve yıldızlardan aldığı gücü dövüş stilinin her noktasına yansıtan Phoenix, savaş alanını alevlerle ve patlamalarla aydınlatır. Arkasında destek olsun olmasın, bildiği gibi savaşmak için ileri atılacağından şüpheniz olmasın.",
    gameName: "Phoenix",
    country: "United Kingdom",
    type: "Radiant",
    gender: "Male",
    role: "Düellocu",
    codeName: "Phoenix Apollo (Pre-Beta)",
    image: "assets/char/phoenix.webp",
    powers: {
      "ATEŞTEN DUVAR": {
        "name": "ATEŞTEN DUVAR",
        "desc":
            "Bir ateş duvarı KUŞAN. İlerleyen, içinden geçenlerin görüşünü engelleyen ve onlara hasar veren ateş duvarını göndermek için ATEŞ ET. Ateş duvarını nişangâhın yönünde bükmek için BASILI TUTARAK ATEŞ ET.",
        "price": "200",
        "use": "C",
        "image": "assets/char/p1.webp",
      },
      "FALSO": {
        "name": "FALSO",
        "desc":
            "Kavisli giden ve fırlatıldıktan kısa bir süre sonra patlayan bir işaret küresi KUŞAN. İşaret küresine sola doğru yön vermek için ATEŞ ET; küre patladığında onu gören tüm oyuncular kör olur. Küreyi sağa doğru göndermek için ALTERNATİF ATIŞ kullan.",
        "use": "Q",
        "price": "250",
        "image": "assets/char/p2.webp",
      },
      "YAKAR TOP": {
        "name": "YAKAR TOP",
        "desc":
            "Bir alev topu KUŞAN. Yere temas ettiğinde ya da bir gecikmenin ardından patlayan alev topunu fırlatmak için ATEŞ ET. Yerde bir süre kalan alev bölgesi düşmanlara hasar verir.",
        "use": "E",
        "price": "Free",
        "image": "assets/char/p3.webp",
      },
      "YAKARDÖNER": {
        "name": "YAKARDÖNER",
        "desc":
            "Phoenix'in bulunduğu konumu HEMEN işaretle. Yetenek etkinken ölmek veya süresinin dolması yeteneği sonlandırır ve Phoenix'i işaretlenen konumda dolu canla hayata döndürür.",
        "use": "X",
        "price": "Free(6 point)",
        "image": "assets/char/p4.webp",
      },
    },
  ),
  CharModel(
    realName: "Sunwoo Han",
    story:
        "Anavatanı Güney Kore'yi temsil eden Jett'in çevik ve darbelerden kaçmaya dayalı dövüş tarzı, başkalarının alamadığı riskleri almasını sağlar. Her çatışmada üstünlüğünü belli eder ve rakipleri daha nerede olduğunu anlamadan onları kesip biçmeye başlar.",
    gameName: "Jett",
    country: "South Korea",
    type: "Radiant",
    gender: "Female",
    role: "Düellocu",
    codeName: "Hawk Woosh Wushu",
    image: "assets/char/jett.webp",
    powers: {
      "DUMAN BULUTU": {
        "name": "DUMAN BULUTU",
        "desc":
            "HEMEN yaptığın atış, yüzeye çarptığında patlayarak kısa süreliğine görüşü kısıtlayan bir sis bulutuna dönüşür. Duman bulutuna nişangâhın yönünde falso vermek için yetenek tuşunu BASILI TUT.",
        "price": "200",
        "use": "C",
        "image": "assets/char/j1.webp",
      },
      "HAFİFLE": {
        "name": "HAFİFLE",
        "desc": "Jett'i HEMEN havaya doğru fırlat.",
        "use": "Q",
        "price": "150",
        "image": "assets/char/j2.webp",
      },
      "RÜZGÂR GİBİ": {
        "name": "RÜZGÂR GİBİ",
        "desc":
            "Jett'i hareket ettiği yönde HEMEN fırlat. Jett hareketsiz durursa ileriye doğru atılır.",
        "use": "E",
        "price": "Free",
        "image": "assets/char/j3.webp",
      },
      "KESKİN FIRTINA": {
        "name": "KESKİN FIRTINA",
        "desc":
            "Düşmanı öldürdüğünde yük dolduran, oldukça isabetli bıçaklar KUŞAN. Hedefine tek bir bıçak fırlatmak için ATEŞ ET. Kalan tüm hançerleri hedefine fırlatmak için ALTERNATİF ATIŞ kullan.",
        "use": "X",
        "price": "Free(7 point)",
        "image": "assets/char/j4.webp",
      },
    },
  ),
  CharModel(
    realName: "Zyanya Mondragón",
    story:
        "Meksika'nın kalbinden kopup gelmiş Reyna teke tek çatışmalarda düşmanını ezer ve aldığı her skorla daha da coşar. Yapabilecekleri tamamen saf beceri gerektirir ve onu ciddi şekilde performansa dayalı kılar.",
    gameName: "Reyna",
    country: "Mexico",
    type: "Radiant",
    gender: "Female",
    role: "Düellocu",
    codeName: "Vampire",
    image: "assets/char/reyna.webp",
    powers: {
      "KEM GÖZ": {
        "name": "KEM GÖZ",
        "desc":
            "Yok edilebilir, ruhtan bir küre KUŞAN. Gözü yakın mesafede ileri doğru kullanmak için ETKİNLEŞTİR. Göz, ona bakan tüm düşmanların uzağı görmesini engeller.",
        "price": "250",
        "use": "C",
        "image": "assets/char/r1.webp",
      },
      "SÖMÜR": {
        "name": "SÖMÜR",
        "desc":
            "Reyna'nın öldürdüğü düşmanlar, arkalarında 3 saniyeliğine Ruh Küreleri bırakır. HEMEN yakınlardaki bir ruh küresini tüket ve kısa süreliğine hızla can yenile. Bu yetenekle 100'ü geçen can yenilemeleri zamanla azalır. İMPARATORİÇE etkinse yetenek otomatik şekilde, küreyi harcamadan kullanılır.",
        "use": "Q",
        "price": "200",
        "image": "assets/char/r2.webp",
      },
      "AZLET": {
        "name": "AZLET",
        "desc":
            "Yakınlardaki bir ruh küresini HEMEN tüketerek kısa süreliğine saydamlaş. İMPARATORİÇE etkinse, aynı zamanda görünmez olursun.",
        "use": "E",
        "price": "200",
        "image": "assets/char/r3.webp",
      },
      "İMPARATORİÇE": {
        "name": "İMPARATORİÇE",
        "desc":
            "HEMEN bir coşku haline geçersin. Atış, kuşanma ve doldurma hızı ciddi şekilde artar. Düşman öldürmek, süreyi yeniler.",
        "use": "X",
        "price": "Free(6 point)",
        "image": "assets/char/r4.webp",
      },
    },
  ),
  CharModel(
    realName: "Sabine Callas",
    story:
        "Bomba gibi bir kişiliğe ve kocaman silahlara sahip olan Raze, aramıza Brezilya'dan katılıyor. Kafa göz dalan oyun tarzıyla düşmanları saklandıkları deliklerden çıkarmakta ve dar alanları ''bam bam bam'' temizlemekte üstüne yok.",
    gameName: "Raze",
    country: "Brazil",
    type: "Human",
    gender: "Female",
    role: "Düellocu",
    codeName: "Clay",
    image: "assets/char/raze.webp",
    powers: {
      "BOMBOT": {
        "name": "BOMBOT",
        "desc":
            "Bir Bombot KUŞAN. Göndermek için ATEŞ ET; bot yerde düz bir hat halinde ilerler ve duvarlardan seker. Bombot önündeki koni şeklindeki alana giren tüm düşmanlara kilitlenir ve onları kovalar. Yakalayabilirse, ağır hasar vererek patlar.",
        "price": "300",
        "use": "C",
        "image": "assets/char/ra1.webp",
      },
      "PATLAYICI ÇANTA": {
        "name": "PATLAYICI ÇANTA",
        "desc":
            "HEMEN, zemine yapışan bir Patlayıcı Çanta fırlat. Elinden çıkan çantayı patlatmak için TEKRAR KULLAN. İsabet ettiği her şeye hasar verir ve onları yerinden oynatır. Raze bu yeteneğinden doğrudan hasar almaz fakat çok yükseğe fırlatılırsa düşme hasarı alabilir.RENK TESİRLİ BOMBA",
        "use": "Q",
        "price": "200",
        "image": "assets/char/ra2.webp",
      },
      "RENK TESİRLİ BOMBA": {
        "name": "RENK TESİRLİ BOMBA",
        "desc":
            "Bir parça tesirli el bombası KUŞAN. Fırlatmak için ATEŞ ET. Hasar veren bomba, her biri menzilindeki herkese hasar veren bombacıklar oluşturur.NEFES KESEN",
        "use": "E",
        "price": "Free",
        "image": "assets/char/ra3.webp",
      },
      "NEFES KESEN": {
        "name": "NEFES KESEN",
        "desc":
            "Bir roketatar KUŞAN. Temas ettiği her şeye muazzam alan hasarı veren bir roket fırlatmak için ATEŞ ET.",
        "use": "X",
        "price": "Free(8 point)",
        "image": "assets/char/ra4.webp",
      },
    },
  ),
  CharModel(
    realName: "Erik Torsten",
    story:
        "İnsanüstü güçlere sahip İsveçli Breach, düşman zemininde sert bir şekilde yolu açan, hedeflenebilir bir kinetik dalga gönderir. Sebep olduğu hasar ve darbe, savaşın dengelerini değiştirecek niteliktedir.",
    gameName: "Breach",
    country: "Sweden",
    type: "Human",
    gender: "Male",
    role: "Gözcü",
    codeName: "Breach",
    image: "assets/char/breach.webp",
    powers: {
      "ARTÇI SARSINTI": {
        "name": "ARTÇI SARSINTI",
        "desc":
            "Termonükleer bir yük KUŞAN. Duvarın içinden geçtikten sonra zamanla gerçekleşen patlamalar için ATEŞ ET. Patlayan yük, etki alanında kalan herkese ağır hasar verir.",
        "price": "200",
        "use": "C",
        "image": "assets/char/br1.webp",
      },
      "GÖZKAMAŞTIRAN": {
        "name": "GÖZKAMAŞTIRAN",
        "desc":
            "Kör edici bir yük KUŞAN. Duvarın içinden geçtikten sonra art arda hızla gerçekleşen patlamalar için ATEŞ ET. Patlayan yük, ona bakan herkesi kör eder.",
        "use": "Q",
        "price": "250",
        "image": "assets/char/br2.webp",
      },
      "FAY HATTI": {
        "name": "FAY HATTI",
        "desc":
            "Sismik bir darbe KUŞAN. Mesafeyi arttırmak için BASILI TUT. Bir sarsıntı oluşturarak etki alanında ve alan hattı üzerinde kalan tüm oyuncuları sarsmak için SERBEST BIRAK.",
        "use": "E",
        "price": "Free",
        "image": "assets/char/br3.webp",
      },
      "ZELZELE": {
        "name": "ZELZELE",
        "desc":
            "Sismik bir yük KUŞAN. Geniş, koni biçimindeki bir alanda tüm zemini dalga dalga etkileyen bir deprem için ATEŞ ET. Deprem, ona yakalanan herkesi sarsar ve havaya savurur.",
        "use": "X",
        "price": "Free(7 point)",
        "image": "assets/char/b4.webp",
      },
    },
  ),
  CharModel(
    realName: "Kirra Foster",
    story:
        "Aramıza Avustralya'dan katılan Skye, beraberinde getirdiği vahşi hayvan ordusuyla birlikte çatışmayı iyiden iyiye kızıştırıyor. Düşmana ayak bağı olan hayvanları ve takım arkadaşlarını iyileştirme yetisiyle, takımının gücünü pekiştiriyor ve takımdaki herkesi kolluyor.",
    gameName: "Skye",
    country: "Australia",
    type: "Radiant",
    gender: "Female",
    role: "Öncü",
    codeName: "Guide",
    image: "assets/char/skye.webp",
    powers: {
      "DOĞANIN ŞİFASI": {
        "name": "DOĞANIN ŞİFASI",
        "desc":
            "İyileştiren bir figür KUŞAN. Şifa gücünü odaklayarak menzil içinde ve görüş hattındaki takım arkadaşlarını iyileştirmek için ATEŞ TUŞUNU BASILI TUT. Bu yetenek, şifa gücü tamamen tükenene kadar birden fazla kez kullanılabilir. Skye kendisini iyileştiremez.",
        "price": "200",
        "use": "C",
        "image": "assets/char/sk1.webp",
      },
      "AV PEŞİNDE": {
        "name": "AV PEŞİNDE",
        "desc":
            "Bir Tazmanya kaplanı figürü KUŞAN. Avcıyı gönderip onu kontrol etmek için ATEŞ ET. Hayvanı kontrol ederken birden ileri atılarak sarsıcı bir patlamaya sebep olmak ve doğrudan isabet alan düşmanlara hasar vermek için ATEŞ ET.",
        "use": "Q",
        "price": "250",
        "image": "assets/char/sk2.webp",
      },
      "KILAVUZ IŞIK": {
        "name": "KILAVUZ IŞIK",
        "desc":
            "Bir şahin figürü KUŞAN. Şahini ileri göndermek için ATEŞ ET. Şahini nişangâhının baktığı tarafa yöneltmek için ATEŞ TUŞUNU BASILI TUT. Şahini havada uçarken kör edici bir bombaya çevirmek için yeteneği TEKAR KULLAN; bu özellik menzili veya görüş hattı içinde bir düşman olup olmadığını doğrular.",
        "use": "E",
        "price": "250",
        "image": "assets/char/sk3.webp",
      },
      "İZSÜRENLER": {
        "name": "İZSÜRENLER",
        "desc":
            "Bir İzsüren figürü KUŞAN. En yakındaki üç düşmanın peşine düşecek üç tane İzsüren göndermek için ATEŞ ET. Bir İzsüren hedefine ulaştığında, hedefin görüşünü kısıtlar.",
        "use": "X",
        "price": "Free(7 point)",
        "image": "assets/char/sk4.webp",
      },
    },
  ),
  CharModel(
    realName: "Ryo Kiritani",
    story:
        "Japon Yoru, gerçeklikte açtığı geçitlerden geçerek düşman hattına sinsice sızıyor. Yanılsamalardan ve kaba kuvvetten eşit oranda faydalanarak hedeflerini göz açıp kapayıncaya kadar indiriyor.",
    gameName: "Yoru",
    country: "Japan",
    type: "Radiang",
    gender: "Male",
    role: "Düellocu",
    codeName: "Stealth Stealthboi",
    image: "assets/char/yoru.webp",
    powers: {
      "FAKE AT": {
        "name": "FAKE AT",
        "desc":
            "Etkinleştirildiğinde Yoru'nun kopyası gibi görünen bir yanılsama KUŞAN. Yanılsamayı etkinleştirerek ileri göndermek için ATEŞ ET. Devre dışındaki yanılsamayı yerleştirmek için ALT. ATIŞ'a bas. Devre dışındaki yanılsamanın ileri yürümesi için KULLAN'a bas. Yanılsamalar düşmanlar tarafından yok edildiğinde kör edici bir flaşla patlar.",
        "price": "100",
        "use": "C",
        "image": "assets/char/y1.webp",
      },
      "KÖR NOKTA": {
        "name": "KÖR NOKTA",
        "desc":
            "Kararsız bir boyut parçacığını gerçeklikten koparıp almak için KUŞAN. Parçacığı fırlatmak için ATEŞ ET. Fırlattığın parçacık sert bir yüzeye çarptığında kör edici bir ışık saçar.",
        "use": "Q",
        "price": "250",
        "image": "assets/char/y2.webp",
      },
      "ÇATKAPI": {
        "name": "ÇATKAPI",
        "desc":
            "Bir boyut geçidi küresi KUŞAN. Küreyi ilerletmek için ATEŞ ET. Küreyi sabit bir yere yerleştirmek için ALT. ATIŞ'a bas. Kürenin bulunduğu konuma ışınlanmak için küreyi ETKİNLEŞTİR. Sahte bir ışınlanma görüntüsü vermek için KULLAN.",
        "use": "E",
        "price": "200",
        "image": "assets/char/y3.webp",
      },
      "BOYUTLARARASI GEÇİŞ": {
        "name": "BOYUTLARARASI GEÇİŞ",
        "desc":
            "Boyutlararasını görebilen bir maske KUŞAN. Yoru'nun boyutuna geçmek için ATEŞ ET. Yoru'nun boyutundayken dışarıdaki düşmanlar tarafından görülemez ve onlardan etkilenmezsin.",
        "use": "X",
        "price": "Free(7 point)",
        "image": "assets/char/y4.webp",
      },
    },
  ),
  CharModel(
    realName: "Efia Danso",
    story:
        "Ganalı ajan Astra, kozmosun enerjisini kullanarak savaş meydanını lehine değiştirebiliyor. Astral yolculuğu üzerinde tam kontrole sahip olması ve engin stratejik öngörüsüyle, düşmanın bir sonraki hamlesinden her zaman birkaç ışık yılı önde.",
    gameName: "Astra",
    country: "Ghana",
    type: "Radiant",
    gender: "Female",
    role: "Kontrol Uzmanı",
    codeName: "Rift",
    image: "assets/char/astra.webp",
    powers: {
      "ÇEKİM ALANI": {
        "name": "ÇEKİM ALANI",
        "desc":
            "Astral Yolcu halindeyken yıldız yerleştir (X). Çekim Alanı oluşturmak için bir yıldızı ETKİNLEŞTİR. Etki alanı içindeki oyuncular merkeze çekilir ve ardından merkez patlayarak içerideki oyuncuları savunmasız hale getirir.",
        "price": "100",
        "use": "C",
        "image": "assets/char/a1.webp",
      },
      "NOVA DARBESİ": {
        "name": "NOVA DARBESİ",
        "desc":
            "Astral Yolcu halindeyken yıldız yerleştir (X). Patlayarak Nova Darbesi oluşturması için bir yıldızı ETKİNLEŞTİR. Nova Darbesi kısa bir süre güç topladıktan sonra patlayarak etki alanı içindeki tüm oyuncuları sersemletir.",
        "use": "Q",
        "price": "100",
        "image": "assets/char/a2.webp",
      },
      "YILDIZ BULUTU": {
        "name": "YILDIZ BULUTU",
        "desc":
            "Astral Yolcu halindeyken yıldız yerleştir (X). Dönüşerek Yıldız Bulutu (duman) oluşturması için bir yıldızı ETKİNLEŞTİR. Bir yıldızı Kozmik Çözünüm'le geri almak için kullan (F). Geri alınan yıldızı belli bir süre sonra tekrar yerleştirebilirsin. Kozmik Çözünüm, dönmeden önce yıldızın yerinde kısa süreliğine sahte bir Yıldız Bulutu oluşturur.",
        "use": "E",
        "price": "150",
        "image": "assets/char/a3.webp",
      },
      "ASTRAL YOLCU / KOZMİK AYRIM": {
        "name": "ASTRAL YOLCU / KOZMİK AYRIM",
        "desc":
            "TEMEL ATIŞ tuşuyla yıldız yerleştirebileceğin Astral Yolcu haline geçmek için ETKİNLEŞTİR (X). Yerleştirilen yıldızlar daha sonra etkinleştirilerek Nova Darbesi, Yıldız Bulutu ve Çekim Alanı'na dönüştürülebilir. Kozmik Ayrım yeteneği hazır olduğunda, Astral Yolcu halindeyken İKİNCİL ATIŞ tuşuna basarak nişan al ve TEMEL ATIŞ tuşuna basarak iki konum seç. Seçtiğin bu iki nokta arasında sonsuz bir Kozmik Ayrım bağlantısı oluşur. Kozmik Ayrım mermileri engeller ve sesleri büyük oranda bastırır.",
        "use": "X",
        "price": "Free(7 point)",
        "image": "assets/char/a4.webp",
      },
    },
  ),
  CharModel(
    realName: "Alternate Timeline Earth",
    story:
        "KAY/O, radyantları etkisiz hale getirmek için üretilmiş bir savaş makinesi. Düşmanlarının yeteneklerini sindirerek rakiplerin karşı koyma yetisini bastırır. Böylece hem kendisini hem de takım arkadaşlarını korur.",
    gameName: "KAY/O",
    country: "-",
    type: "Cybernetic",
    gender: "-",
    role: "Öncü",
    codeName: "Grenadier",
    image: "assets/char/kayo.webp",
    powers: {
      "PARÇA/Tesirli": {
        "name": "PARÇA/Tesirli",
        "desc":
            "Patlayıcı bir şarapnel KUŞAN. Şarapneli fırlatmak için ATEŞ ET. Şarapnel yere yapışır, sonrasında birden fazla kez patlar ve tam merkezinde bulunanlara neredeyse ölümcül hasar verir.",
        "price": "200",
        "use": "C",
        "image": "assets/char/ko1.webp",
      },
      "FLAŞ/Bellek": {
        "name": "FLAŞ/Bellek",
        "desc":
            "Bir kör edici bomba KUŞAN. Bombayı fırlatmak için ATEŞ ET. Kör edici bomba kısa bir süre sonra patlayarak görüş menzili içinde bulunan herkesi kör eder.",
        "use": "Q",
        "price": "250",
        "image": "assets/char/ko2.webp",
      },
      "SIFIR/Noktası": {
        "name": "SIFIR/Noktası",
        "desc":
            "Düşmanları sindirmeni sağlayan bir bıçak KUŞAN. Bıçağı fırlatmak için ATEŞ ET. Bıçak isabet ettiği ilk yüzeye saplanır ve patladığında menzili içindeki herkesi sindirir.",
        "use": "E",
        "price": "Free",
        "image": "assets/char/ko3.webp",
      },
      "İPTAL/Komut": {
        "name": "İPTAL/Komut",
        "desc":
            "KAY/O, kutuplaşmış radyanit enerjisiyle aşırı yüklenerek ANINDA güçlenir ve bulunduğu konumdan devasa enerji dalgaları yayar. Enerji dalgalarının isabet ettiği düşmanlar kısa bir süreliğine sindirilir.",
        "use": "X",
        "price": "Free(7 point)",
        "image": "assets/char/ko4.webp",
      },
    },
  ),
  CharModel(
    realName: "Vincent Fabron",
    story:
        "Her daim şık ve tam teçhizat dolaşan Fransız silah tasarımcısı Chamber, ölümcül isabetliliğiyle rakipleri ortadan kaldırıyor. Özel yeteneklerini kullanarak görüş mesafesi sağlar, uzaktaki rakipleri avlar ve her plana mükemmel bir şekilde uyum sağlar.",
    gameName: "Chamber",
    country: "France",
    type: "Human",
    gender: "Male",
    role: "Gözcü",
    codeName: "Deadeye",
    image: "assets/char/chamber.webp",
    powers: {
      "Kartvizit": {
        "name": "Kartvizit",
        "desc":
            "Düşmanlar için etrafı tarayan bir tuzak YERLEŞTİR. Görünen düşmanlar tuzağın menzili içine girdiğinde, tuzak geri sayıma başlar. Tuzak devreye girdiğinde etki alanını stabil olmayan bir hale getirerek içinde bulunan düşmanları yavaşlatır.",
        "price": "200",
        "use": "C",
        "image": "assets/char/ch1.webp",
      },
      "Kelle Avcısı": {
        "name": "Kelle Avcısı",
        "desc":
            "Ağır bir tabanca kuşanmak için ETKİNLEŞTİR. Tabancanın ALTERNATİF ATIŞI nişan almanı sağlar.",
        "use": "Q",
        "price": "100",
        "image": "assets/char/ch2.webp",
      },
      "Buluşma": {
        "name": "Buluşma",
        "desc":
            "İki tane IŞINLAYICI yerleştir. Işınlayıcılardan birinin menzilinde ve yerde dururken, TEKRAR ETKİNLEŞTİREREK hızlıca diğer ışınlayıcıya ışınlan. Işınlayıcıları TEKRAR YERLEŞTİRMEK üzere bıraktığın yerden alabilirsin.",
        "use": "E",
        "price": "Free",
        "image": "assets/char/ch3.webp",
      },
      "Keskin Tarz": {
        "name": "Keskin Tarz",
        "desc":
            "Doğrudan isabet ettiği düşmanları anında öldüren güçlü ve özel bir keskin nişancı tüfeği kuşanmak için ETKİNLEŞTİR. Düşmanı öldürdüğün yerde, içine giren düşmanları yavaşlatan bir etki alanı oluşur.",
        "use": "X",
        "price": "Free(7 point)",
        "image": "assets/char/ch4.webp",
      },
    },
  ),
  CharModel(
    realName: "Tala Nicole Dimaapi Valdez",
    story:
        "Filipinli Ajan Neon, şoke edici bir hızla öne atılır ve bedeninin ürettiği biyoelektrik dalgalarını düşmanların üstüne salar. Düşmanları gafil avlamak için yarışırcasına koşar ve hepsini yıldırım hızıyla indirir.",
    gameName: "Neon",
    country: "Philippines",
    type: "Radiant",
    gender: "Female",
    role: "Düellocu",
    codeName: "Sprinter",
    image: "assets/char/neon.webp",
    powers: {
      "HIZ ŞERİDİ": {
        "name": "HIZ ŞERİDİ",
        "desc":
            "Önüne doğru, kısa veya bir yüzeye çarpana kadar ilerleyen iki enerji hattı çıkarmak için ATEŞ ET. Bu enerji hatları, görüşü engelleyen ve içinden geçen düşmanlara hasar veren statik elektrik duvarlarına dönüşür.",
        "price": "300",
        "use": "C",
        "image": "assets/char/n1.webp",
      },
      "ELEKTRO OK": {
        "name": "ELEKTRO OK",
        "desc":
            "ANINDA bir enerji oku fırlat. Ok bir kere seker. Ok bir yüzeye çarptığında sersemletici bir patlamayla altındaki zemine elektrik akımı verir.",
        "use": "Q",
        "price": "200",
        "image": "assets/char/n2.webp",
      },
      "YÜKSEK DEVİR": {
        "name": "YÜKSEK DEVİR",
        "desc":
            "Neon'u hızlandırmak için ANINDA gücünü odakla. Yükü dolduğunda, ALT. ATIŞ'la elektrikli kayma hareketini etkinleştir. Her iki skorda bir kayma hareketinin yükü dolar.",
        "use": "E",
        "price": "Free",
        "image": "assets/char/n3.webp",
      },
      "ENERJİ PATLAMASI": {
        "name": "ENERJİ PATLAMASI",
        "desc":
            "Neon'un tüm gücünü ve hızını kısa bir süreliğine etkinleştir. Gücünü, hareket ederken isabetliliği yüksek olan ölümcül bir ışın saldırısına dönüştürmek için ATEŞ ET. Aldığın her skorla birlikte bekleme süresi sıfırlanır.",
        "use": "X",
        "price": "Free(7 point)",
        "image": "assets/char/n4.webp",
      },
    },
  ),
  CharModel(
    realName: "-",
    story:
        "Türk kelle avcısı Fade, düşmanların sırlarını gasp etmek için saf kâbus gücünü kullanır. Korkuyla uyum içinde çalışarak hedeflerini avlar ve hedeflerinin işini bitirmeden önce en büyük korkularını açığa çıkarır.",
    gameName: "Fade",
    country: "Turkey",
    type: "Radiant",
    gender: "Female",
    role: "Öncü",
    codeName: "BountyHunter",
    image: "assets/char/fade.webp",
    powers: {
      "Ecel": {
        "name": "Ecel",
        "desc":
            "Bir Ecel KUŞAN. Ecel’i düz bir hatta ileriye yollamak için ATEŞ ET. Ecel, koni şeklindeki görüş alanında bulunan herhangi bir düşmana veya düşmanın bıraktığı ize kilitlenip hedefinin peşine takılır ve yakalarsa hedefin görüşünü kısıtlar. Ecel’i nişangâhının baktığı yöne doğru ilerletmek için ATEŞ ETME Düğmesi'ni BASILI TUT.",
        "price": "250",
        "use": "C",
        "image": "assets/char/f1.webp",
      },
      "Mıhla": {
        "name": "Mıhla",
        "desc":
            "Kâbus mürekkebinden küre kuşan. Küreyi fırlatmak için ATEŞ ET. Küre belli bir süre sonra yere çarpar. Mürekkep küresi yere çarptıktan sonra patlar ve düşmanların içinden normal yollarla çıkamayacağı bir bölge oluşturur. Uçuşu sırasında küreyi yere erken indirmek için yeteneği TEKRAR KULLAN.",
        "use": "Q",
        "price": "200",
        "image": "assets/char/f2.webp",
      },
      "Musallat": {
        "name": "Musallat",
        "desc":
            "Kâbuslardan fırlamış bir varlık kuşan. Küreyi fırlatmak için ATEŞ ET. Küre belli bir süre sonra yere çarpar. Yere çarpan küre, kâbuslardan fırlamış bir varlığa dönüşür ve bu varlık, görüş alanı içinde kalan düşmanların yerini açığa çıkarır. Düşmanlar bu varlığı yok edebilir. Uçuşu sırasında küreyi yere erken indirmek için yeteneği TEKRAR KULLAN.",
        "use": "E",
        "price": "Free",
        "image": "assets/char/f3.webp",
      },
      "Gece Karanlığı": {
        "name": "Gece Karanlığı",
        "desc":
            "Korkunun gücünü KUŞAN. Duvarların içinden geçebilen bir kâbus enerjisi göndermek için ATEŞ ET. Bu enerji rakibe doğru giden bir iz oluşturmanın yanında rakibi sağır eder ve çürüme uygular.",
        "use": "X",
        "price": "Free(7 point)",
        "image": "assets/char/f4.webp",
      },
    },
  ),
];
