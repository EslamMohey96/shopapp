class homeModel {
  late bool status;
  late dataModel data;

  homeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = dataModel.fromJson(json['data']);
  }
}

class dataModel {
  late List<bannersModel> banners = [];
  late List<productsModel> products = [];
  late String ad;

  dataModel.fromJson(Map<String, dynamic> json) {
    json['banners'].forEach((element) {
      banners.add(bannersModel.fromJson(element));
    });

    json['products'].forEach((element) {
      products.add(productsModel.fromJson(element));
    });
  }
}

class bannersModel {
  late int id;
  late String image;
  late bool category;
  late bool product;
  bannersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    // category = json['category'];
    // product = json['product'];
  }
}

class productsModel {
  late int id;
  late dynamic price;
  late dynamic old_price;
  late dynamic discount;
  late String image;
  late String name;
  late bool in_favorites;
  late bool in_cart;
  productsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    old_price = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    in_favorites = json['in_favorites'];
    in_cart = json['in_cart'];
  }
}

var model = {
  "status": true,
  "message": null,
  "data": {
    "banners": [
      {
        "id": 11,
        "image":
            "https://student.valuxapps.com/storage/uploads/banners/1689106904Mzsmc.photo_2023-07-11_23-08-24.png",
        "category": null,
        "product": null
      },
      {
        "id": 12,
        "image":
            "https://student.valuxapps.com/storage/uploads/banners/1689106848R4Nxl.photo_2023-07-11_23-08-19.png",
        "category": null,
        "product": null
      },
      {
        "id": 17,
        "image":
            "https://student.valuxapps.com/storage/uploads/banners/1689106932hsRxm.photo_2023-07-11_23-07-53.png",
        "category": null,
        "product": null
      },
      {
        "id": 19,
        "image":
            "https://student.valuxapps.com/storage/uploads/banners/1689110348KHwtl.sales-abstract-landing-page-with-photo_52683-28304 (1) (2).png",
        "category": null,
        "product": null
      },
      {
        "id": 23,
        "image":
            "https://student.valuxapps.com/storage/uploads/banners/1689108526i90RV.online-shopping-banner-template_23-2148764566 (1).png",
        "category": null,
        "product": null
      },
      {
        "id": 24,
        "image":
            "https://student.valuxapps.com/storage/uploads/banners/1689108648Avc1g.banner-template-with-summer-sale_23-2148515754 (1).png",
        "category": null,
        "product": null
      },
      {
        "id": 26,
        "image":
            "https://student.valuxapps.com/storage/uploads/banners/1689107104Ezc0d.photo_2023-07-11_23-07-59.png",
        "category": null,
        "product": null
      },
      {
        "id": 27,
        "image":
            "https://student.valuxapps.com/storage/uploads/banners/1689106762vIpcq.photo_2023-07-11_23-07-38.png",
        "category": null,
        "product": null
      },
      {
        "id": 28,
        "image":
            "https://student.valuxapps.com/storage/uploads/banners/1689106805161JH.photo_2023-07-11_23-07-43.png",
        "category": null,
        "product": null
      },
      {
        "id": 29,
        "image":
            "https://student.valuxapps.com/storage/uploads/banners/1689108280StVEo.cyber-monday-banner-template_23-2148748266 (1).png",
        "category": null,
        "product": null
      }
    ],
    "products": [
      {
        "id": 52,
        "price": 25000,
        "old_price": 25000,
        "discount": 0,
        "image":
            "https://student.valuxapps.com/storage/uploads/products/1615440322npwmU.71DVgBTdyLL._SL1500_.jpg",
        "name": "Apple iPhone 12 Pro Max 256GB 6 GB RAM, Pacific Blue",
        "description":
            "DISPLAY\r\nSize: 6.7 inches\r\nResolution: 2778 x 1284 pixels, 458 PPI\r\nTechnology: OLED\r\nScreen-to-body: 87.45 %\r\nPeak brightness: 1200 cd/m2 (nit)\r\nFeatures: HDR video support, Oleophobic coating, Scratch-resistant glass (Ceramic Shield), Ambient light sensor, Proximity sensor\r\nHARDWARE\r\nSystem chip: Apple A14 Bionic\r\nProcessor: Hexa-core, 64-bit, 5 nm\r\nGPU: Yes\r\nRAM: 6GB LPDDR5\r\nInternal storage: 128GB (NVMe), not expandable\r\nDevice type: Smartphone\r\nOS: iOS (14.x)\r\nBATTERY\r\nType: Li - Ion, Not user replaceable\r\nCharging: USB Power Delivery, Qi wireless charging, MagSafe wireless charging\r\nMax charge speed: Wireless: 15.0W\r\nCAMERA\r\nRear: Triple camera\r\nMain camera: 12 MP (OIS, PDAF)\r\nSpecifications: Aperture size: F1.6; Focal length: 26 mm; Pixel size: 1.7 μm\r\nSecond camera: 12 MP (Telephoto, OIS, PDAF)\r\nSpecifications: Optical zoom: 2x; Aperture size: F2.2; Focal Length: 65 mm\r\nThird camera: 12 MP (Ultra-wide)\r\nSpecifications: Aperture size: F2.4; Focal Length: 13 mm\r\nVideo recording: 3840x2160 (4K UHD) (60 fps), 1920x1080 (Full HD) (240 fps), 1280x720 (HD) (30 fps)\r\nFeatures: OIS, HDR, Time-lapse video, Continuous autofocus, Picture-taking during video recording, Video light\r\nFront: 12 MP (Time-of-Flight (ToF), EIS, HDR, Slow-motion videos)\r\nVideo capture: 3840x2160 (4K UHD) (60 fps)\r\nDESIGN\r\nDimensions: 6.33 x 3.07 x 0.29 inches (160.84 x 78.09 x 7.39 mm)\r\nWeight: 8.03 oz (228.0 g)\r\nMaterials: Back: Glass; Frame: Stainless steel\r\nMaterials & Colors: Pacific Blue\r\nResistance: Water, Splash, Dust; IP68\r\nBiometrics: 3D Face unlock\r\nKeys: Left: Volume control, Other; Right: Lock/Unlock key\r\nCELLULAR\r\n5G: n1, n2, n3, n5, n7, n8, n12, n20, n25, n28, n38, n40, n41, n66, n71, n77, n78, n79, n260, n261, Sub-6, mmWave\r\nLTE (FDD): Bands 1(2100), 2(1900), 3(1800), 4(AWS-1), 5(850), 7(2600), 8(900), 12(700 a), 13(700 c), 14(700 PS), 17(700 b), 18(800 Lower), 19(800 Upper), 20(800 DD), 25(1900+), 26(850+), 28(700 APT), 29(700 d), 30(2300 WCS), 32(1500 L-band), 66(AWS-3), 71(600)\r\nLTE (TDD): Bands 34(2000), 38(2600), 39(1900+), 40(2300), 41(2600+), 42(3500), 46, 48(3600)\r\nUMTS: 850, 900, 1700/2100, 1900, 2100 MHz\r\nData Speed: LTE-A, HSDPA+ (4G) 42.2 Mbit/s, HSUPA 5.76 Mbit/s, UMTS\r\nDual SIM: Yes\r\nSIM type: Nano SIM, eSIM\r\nHD Voice: Yes\r\nVoLTE: Yes\r\nMULTIMEDIA\r\nHeadphones: No 3.5mm jack\r\nSpeakers: Earpiece, Loudspeaker\r\nFeatures: Dolby Atmos\r\nScreen mirroring: Wireless screen share\r\nAdditional microphone(s): for Noise cancellation\r\nCONNECTIVITY & FEATURES\r\nBluetooth: 5.0\r\nWi-Fi: 802.11 a, b, g, n, ac, ax (Wi-Fi 6), dual-band; MIMO, Wi-Fi Direct, Hotspot\r\nUSB: Lightning\r\nFeatures: Charging, Headphones port\r\nLocation: GPS, A-GPS, Glonass, Galileo, BeiDou, QZSS, Cell ID, Wi-Fi positioning\r\nSensors: Accelerometer, Gyroscope, Compass, Barometer, LiDAR scanner\r\nOther: NFC, UMA (Wi-Fi Calling)\r\nHearing aid compatible: M3, T4\r\nBrand : Apple\r\nColor : Pacific Blue\r\nOperating System Type : iOS\r\nStorage Capacity : 128GB\r\nNumber Of SIM : Single SIM & E-SIM\r\nRear Camera Resolution : 12 megapixels\r\nMobile Phone Type : Mobile Phone\r\nCellular Network Technology : 5G\r\nChipset manufacturer : Apple\r\nDisplay Size (Inch) : 6.7 inches\r\nModel Number : iPhone 12 Pro Max\r\nBattery Capacity in mAh : 3,687mAh\r\nFast Charge : Yes\r\nMemory RAM : 6 GB",
        "images": [
          "https://student.valuxapps.com/storage/uploads/products/1615440322UAwSF.81KcqNGQIsL._SL1500_.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1615440322UjY4o.71DVgBTdyLL._SL1500_.jpg"
        ],
        "in_favorites": false,
        "in_cart": false
      },
      {
        "id": 55,
        "price": 44500,
        "old_price": 44500,
        "discount": 0,
        "image":
            "https://student.valuxapps.com/storage/uploads/products/1615442168bVx52.item_XXL_36581132_143760083.jpeg",
        "name": "Apple MacBook Pro",
        "description":
            "Bring home the Apple MacBook Pro and experience computing like never before. This Apple laptop features a powerful 2.3Ghz 8th Gen-Intel Core i5 processor that makes sure the system keeps performing efficiently. Experience smooth and fast multitasking with the 8GB RAM. The Intel Iris Plus Graphics render images in high-quality and make your gaming experience a pleasing one. The macOS operating system offers various user-friendly features. Store your movies, audios, and other important files comfortably on the 512GB SSD of this device. The 13.3inch display allows you to view your favorite movies and other content in high quality. The Retina display features bright LED backlighting and a high contrast ratio that enhances your viewing experience. The True Tone technology provides a natural viewing experience by adjusting the white balance of the screen as per the color temperature of the light around. Featuring well-balanced, high-fidelity sounds, this laptop delivers an immersive audio experience. The Apple T2 chip lets you store your data in an encrypted format with the help of its Secure Enclave coprocessor. Also, it tightens the security further with the help of the Touch ID. The Touch ID only allows you to unlock your laptop using your fingerprints. The Touch Bar controls simplify various activities such as sending an email or formatting a document. This lightweight laptop can be easily carried around in your backpack. It features a space grey that gives it a distinguished and beautiful look.",
        "images": [
          "https://student.valuxapps.com/storage/uploads/products/1615442168ijV8V.item_XXL_36581132_143760083.jpeg",
          "https://student.valuxapps.com/storage/uploads/products/161544216881jxI.item_XXL_36581132_143760084.jpeg",
          "https://student.valuxapps.com/storage/uploads/products/1615442168uZNcz.item_XXL_36581132_143760087.jpeg",
          "https://student.valuxapps.com/storage/uploads/products/1615442168VnIxG.item_XXL_36581132_143760088.jpeg"
        ],
        "in_favorites": false,
        "in_cart": false
      },
      {
        "id": 53,
        "price": 5599,
        "old_price": 10230,
        "discount": 45,
        "image":
            "https://student.valuxapps.com/storage/uploads/products/1615440689wYMHV.item_XXL_36330138_142814934.jpeg",
        "name":
            "JBL Xtreme 2 Portable Waterproof Bluetooth Speaker - Blue JBLXTREME2BLUAM",
        "description":
            "GENERAL SPECIFICATIONS\r\nMusic playing time: 15 hours\r\nOutput power (W): 2 x 20\r\nDIMENSIONS\r\nDimensions: 13.6 x 28.8 x 13.2 centimeters\r\nWeight: 2.39 kilograms\r\nCONTROL AND CONNECTION SPECIFICATIONS\r\nBluetooth version: 4.2\r\nBATTERY\r\nBattery capacity: 10000 mAh\r\nCharging time: 3.5 hours\r\nFEATURES\r\n3.5 mm audio cable Input: Yes\r\nAuto power off: Yes\r\nBluetooth: Yes\r\nJBL Connect+: Yes\r\nPower bank: Yes\r\nSpeakerphone: Yes\r\nVoice Assistant: Yes\r\nWaterproof: Yes",
        "images": [
          "https://student.valuxapps.com/storage/uploads/products/1615440689Oojt6.item_XXL_36330138_142814947.jpeg",
          "https://student.valuxapps.com/storage/uploads/products/16154406895ynKU.item_XXL_36330138_142814944.jpeg",
          "https://student.valuxapps.com/storage/uploads/products/1615440689MjvIY.item_XXL_36330138_142814940.jpeg",
          "https://student.valuxapps.com/storage/uploads/products/1615440689QITsu.item_XXL_36330138_142814934.jpeg"
        ],
        "in_favorites": false,
        "in_cart": false
      },
      {
        "id": 54,
        "price": 11499,
        "old_price": 12499,
        "discount": 8,
        "image":
            "https://student.valuxapps.com/storage/uploads/products/1615441020ydvqD.item_XXL_51889566_32a329591e022.jpeg",
        "name": "Samsung 65 Inch Smart TV 4K Ultra HD Curved - UA65RU7300RXUM",
        "description":
            "Brand: Samsung\r\nColor: black\r\nModel: UA65RU7300\r\nType: Curve\r\nSize: 65 inch\r\nHDMI: 3\r\nUSB: 2\r\nSmart: Yes\r\nOne Remote: Yes\r\nResolution: 3,840 x 2,160\r\nWeight: 25.0 kg\r\nDimensions (WxHxD): 145.27 x 83.81 x 12.09 cm\r\nAI Upscale: N/A\r\nSmart View: Yes",
        "images": [
          "https://student.valuxapps.com/storage/uploads/products/1615441020SnVry.item_XXL_51889566_32a329591e022.jpeg",
          "https://student.valuxapps.com/storage/uploads/products/1615441020mgFw2.item_XXL_51889566_8dbac7d5b2039.jpeg"
        ],
        "in_favorites": false,
        "in_cart": false
      },
      {
        "id": 56,
        "price": 32860,
        "old_price": 35000,
        "discount": 6,
        "image":
            "https://student.valuxapps.com/storage/uploads/products/1615450256e0bZk.item_XXL_7582156_7501823.jpeg",
        "name":
            "Nikon FX-format D750 - 24.3 MP, SLR Camera 24-120mm Lens, Black",
        "description":
            "The Nikon FX Format D750 SLR Camera comes loaded with an array of advanced features that provide total control, enabling you to capture life’s fleeting moments in their purest form. The compact camera comes with 24 to 120mm NIKKOR lens that is perfect for capturing portraits, landscapes, and weddings. Even though this imaging device is small and lightweight, it does not compromise on performance. The device’s impressive 24.3MP CMOS image sensor and EXPEED 4 engine provide you with the ability to shoot stellar photos and videos, even in low light conditions. The sleek black camera’s movie shooting menu with preset control settings make it possible to record 1080/60p Full HD movies with reduced moiré and minimal jaggies. The SLR camera’s 3.2inch tilting TFT LCD monitor has a resolution of approximately 1229K dots. It makes it convenient for you to compose shots from tricky angles or playback the captured footage. The device’s built in WiFi simplifies on the spot sharing of your images and videos with the world. The inclusion of all these and several other sought after features make the Nikon D750 perfect for pro and semi pro photographers alike.",
        "images": [
          "https://student.valuxapps.com/storage/uploads/products/1615450256RlWor.item_XXL_7582156_7501823.jpeg",
          "https://student.valuxapps.com/storage/uploads/products/1615450256gJZZG.item_XXL_7582156_7501825.jpeg",
          "https://student.valuxapps.com/storage/uploads/products/1615450256R7y4x.item_XXL_7582156_7501827.jpeg",
          "https://student.valuxapps.com/storage/uploads/products/1615450256NMmZ7.item_XXL_7582156_7501828.jpeg",
          "https://student.valuxapps.com/storage/uploads/products/1615450256zSjsY.item_XXL_7582156_7501830.jpeg",
          "https://student.valuxapps.com/storage/uploads/products/1615450256CbCNI.item_XXL_7582156_7501832.jpeg"
        ],
        "in_favorites": false,
        "in_cart": false
      },
      {
        "id": 57,
        "price": 530,
        "old_price": 530,
        "discount": 0,
        "image":
            "https://student.valuxapps.com/storage/uploads/products/1615451352LMOAF.item_XXL_23705724_34135503.jpeg",
        "name": "Kingston A400 Internal SSD 2.5\" 240GB SATA 3 - SA400S37/240G",
        "description":
            "Brand : kingston\r\nStorage Capacity : 240 GB\r\nCompatible operating systems : Windows\r\nInterface Type : SATA\r\nDrive Type : SSD\r\nStorage Device Use : Internal Laptop\r\nModel Number : SA400S37/240G",
        "images": [
          "https://student.valuxapps.com/storage/uploads/products/16154513529ml4b.item_XXL_23705724_34135503.jpeg",
          "https://student.valuxapps.com/storage/uploads/products/1615451352LKVSq.item_XXL_23705724_34135507.jpeg"
        ],
        "in_favorites": false,
        "in_cart": false
      },
      {
        "id": 58,
        "price": 1083,
        "old_price": 1083,
        "discount": 0,
        "image":
            "https://student.valuxapps.com/storage/uploads/products/161545152160GOl.item_XXL_39275650_152762070.jpeg",
        "name": "Stark Iron Kettlebell, 24 KG",
        "description":
            "Brand: Stark\r\nColor: Black\r\nWeight: 24 Kg\r\nTargeted Group: Unisex",
        "images": [
          "https://student.valuxapps.com/storage/uploads/products/16154515218VdQx.item_XXL_39275650_152762070.jpeg",
          "https://student.valuxapps.com/storage/uploads/products/1615451521kM8Ij.item_XXL_39275650_152762102.jpeg"
        ],
        "in_favorites": false,
        "in_cart": false
      },
      {
        "id": 80,
        "price": 45,
        "old_price": 45,
        "discount": 0,
        "image":
            "https://student.valuxapps.com/storage/uploads/products/1638734223uyATp.1.jpg",
        "name":
            "Face Protection Mask, 50 Count - Light Blue with Elastic and Braces",
        "description":
            "Brand : Other\r\nAre batteries needed to power the product or is this product a battery : 0\r\nIs this a Dangerous Good or a Hazardous Material, Substance or Waste that is regulated for transportation, storage, and/or disposal? : 0\r\nType : Protection Masks",
        "images": [
          "https://student.valuxapps.com/storage/uploads/products/1638734223zeTvx.1.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638734223mvH7B.2.jpg"
        ],
        "in_favorites": false,
        "in_cart": false
      },
      {
        "id": 82,
        "price": 3075.260000000000218278728425502777099609375,
        "old_price": 3075.260000000000218278728425502777099609375,
        "discount": 0,
        "image":
            "https://student.valuxapps.com/storage/uploads/products/1638734961565J3.11.jpg",
        "name":
            "Xiaomi Redmi 10 Dual SIM Mobile- 6.53 Inch FHD , 64GB, 4GB RAM, 4G LTE - Carbon Gray",
        "description":
            "Model name\tXiaomi Redmi 10\r\nWireless carrier\tUnlocked for All Carriers\r\nBrand\tXiaomi\r\nForm factor\tFoldable Screen\r\nMemory storage capacity\t4 GB\r\nOS\tAndroid 11.0\r\nColour\tCarbon Gray\r\nCellular technology\tLTE\r\nSIM card slot count\tDual SIM\r\nModel year\t2021\r\n------------\r\nAbout this item\r\nAI quad camera | 90Hz FHD+ display , 5000mAh battery , Gaming CPU , fast charging\r\nWeight: 181g\r\nHelio G88 processor,Octa-Core ,12nm manufacturing process Dimensions:161.95mm x 75.53mm x 8.92mm\r\nMain camera : 50MP\r\nFront camera : 8MP",
        "images": [
          "https://student.valuxapps.com/storage/uploads/products/163873496133DmC.11.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638734961lq9NM.12.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638734961JJsUU.13.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638734961M75SS.14.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638734961oRfP5.15.jpg",
          "https://student.valuxapps.com/storage/uploads/products/16387349613Ufwq.16.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638734961xdhWc.17.jpg"
        ],
        "in_favorites": false,
        "in_cart": false
      },
      {
        "id": 84,
        "price": 1606.5,
        "old_price": 1606.5,
        "discount": 0,
        "image":
            "https://student.valuxapps.com/storage/uploads/products/1638737146iLO2c.11.jpg",
        "name": "Nike Flex Essential Mesh Training Shoes For Women - White",
        "description":
            "Women's Nike Flex Essential Training Shoes pairs a lightweight, breathable upper with a supportive platform designed for flexibility and traction in every direction. Ideal for light workouts and all-day wear, this shoe is flexible to whatever you have planned.\r\n\r\nMesh synthetic construction provides breathable containment\r\nLightweight foam midsole for comfortable cushioning\r\nSections of durable rubber tread for excellent traction\r\nDeep flex grooves allow your foot to move naturally\r\nStyle: 924344-100",
        "images": [
          "https://student.valuxapps.com/storage/uploads/products/1638737146HIHWT.11.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638737146A41I6.12.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638737146CTmMi.13.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638737146P2XeK.14.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638737146vpmnS.15.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638737146fgAq5.16.jpg"
        ],
        "in_favorites": false,
        "in_cart": false
      },
      {
        "id": 85,
        "price": 1085,
        "old_price": 1085,
        "discount": 0,
        "image":
            "https://student.valuxapps.com/storage/uploads/products/1638737571de5EF.21.jpg",
        "name": "Nike Men's NSW Tee Icon Futura, Black(Black/White010), Medium",
        "description":
            "Nike sportswear men's T-Shirt classic cotton comfort\r\nThe nike sportswear t-Shirt sets you up with soft cotton jersey and a classic logo on the chest\r\nCotton jersey fabric is soft and comfortable",
        "images": [
          "https://student.valuxapps.com/storage/uploads/products/1638737572UAVEg.21.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638737572O9uYg.22.jpg"
        ],
        "in_favorites": false,
        "in_cart": false
      },
      {
        "id": 81,
        "price": 50.25,
        "old_price": 70,
        "discount": 28,
        "image":
            "https://student.valuxapps.com/storage/uploads/products/1638734575kfKn8.21.jpg",
        "name": "Evony Surgical Mask with Soft Elastic Ears, 50 Pieces",
        "description":
            "easy to wear\r\nSuitable for single use\r\nMade in Egypt\r\nASIN: B09475K6NQ",
        "images": [
          "https://student.valuxapps.com/storage/uploads/products/1638734575Qcgiu.21.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638734575rm6Mx.22.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638734575FZ3NW.23.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638734575S5MLu.24.jpg"
        ],
        "in_favorites": false,
        "in_cart": false
      },
      {
        "id": 83,
        "price": 444,
        "old_price": 656,
        "discount": 32,
        "image":
            "https://student.valuxapps.com/storage/uploads/products/1638735246ToPmP.21.jpg",
        "name": "Xiaomi Mi Smart Band 5 - Black",
        "description":
            "Brand\tXiaomi\r\nWireless communication standard\tBluetooth\r\nColour\tBlack\r\nCompatible devices\tMulti\r\nHuman interface input\tTouchscreen\r\nScreen size\t3 Inches\r\nBandwidth\t15 Millimeters\r\nWireless carrier\t3\r\n---------------\r\nAbout this item\r\nLightweight design\r\nMade of high quality materials\r\nWater resistant",
        "images": [
          "https://student.valuxapps.com/storage/uploads/products/163873524655oou.21.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638735246umUmo.22.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638735246fXBko.23.jpg"
        ],
        "in_favorites": false,
        "in_cart": false
      },
      {
        "id": 86,
        "price": 1596.920000000000072759576141834259033203125,
        "old_price": 2659.0500000000001818989403545856475830078125,
        "discount": 40,
        "image":
            "https://student.valuxapps.com/storage/uploads/products/16387377980g2kx.11.jpg",
        "name": "Sony Pulse 3D Wireless Gaming Headset for PlayStation 5",
        "description":
            "Brand\tSony\r\nColour\tWhite & Black\r\nConnectivity technology\tWireless\r\nItem weight\t1.5 Pounds\r\nCompatible Devices\tMulti\r\n---------------------\r\nAbout this item\r\nBuilt for a new generation\r\nFine-tuned for 3D Audio on PS5 consoles1.\r\nEnjoy comfortable gaming with refined earpads and headband strap.\r\nPlay in style with a sleek design that complements the PS5 console.\r\nDesigned for gamers; Chat with friends through the hidden noise-cancelling microphones2.\r\nQuickly adjust audio and chat settings with easy-access controls.",
        "images": [
          "https://student.valuxapps.com/storage/uploads/products/1638737798SfPxq.11.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638737798ZJ4C4.12.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638737798EGD9X.13.jpg"
        ],
        "in_favorites": false,
        "in_cart": false
      },
      {
        "id": 90,
        "price": 110,
        "old_price": 160,
        "discount": 31,
        "image":
            "https://student.valuxapps.com/storage/uploads/products/1644372386y0SzM.4.jpg",
        "name": "Winter High Collar Pullover - Camel",
        "description":
            "We strive to provide products that combine fashion and practical life, as our products are manufactured from the best materials and innovative technologies in the field of fabrics, colors and designs",
        "images": [
          "https://student.valuxapps.com/storage/uploads/products/1644372386aaZFh.5.jpg"
        ],
        "in_favorites": false,
        "in_cart": false
      },
      {
        "id": 88,
        "price": 160.6399999999999863575794734060764312744140625,
        "old_price": 160.6399999999999863575794734060764312744140625,
        "discount": 0,
        "image":
            "https://student.valuxapps.com/storage/uploads/products/1638738160hkG50.1.jpg",
        "name":
            "M-33 Live Stream 360 Degree Rotated LED Ring Light 33 cm With Mobile Phone Holder And 2.1 Meter Stand - Black & White",
        "description":
            "Brand:Other\r\nColor:Black White\r\nModel Number:M33\r\nSize:33cm\r\nlight Mode:3 Mode of Light (White,Yellow,Warm)\r\nPlug Type:USB Power\r\nPackage Includes:LED Ring Light ,Mobile Phone Holder , 2.1 Meter Stand\r\n360 Degree Rotated\r\nMulti Porpuse Using\r\nSiutable For Selfie Photos, Photographers, Bloggers, Makeup Artists, etc",
        "images": [
          "https://student.valuxapps.com/storage/uploads/products/1638738160E3xDG.1.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638738160JmvbS.2.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638738160n2Itr.3.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638738160wZXjM.4.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638738160zSOnk.5.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638738160mwma0.6.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638738160xxsRd.7.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638738160xJUXC.8.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638738160nN8By.9.jpg"
        ],
        "in_favorites": false,
        "in_cart": false
      },
      {
        "id": 89,
        "price": 400,
        "old_price": 400,
        "discount": 0,
        "image":
            "https://student.valuxapps.com/storage/uploads/products/1638738391RrZ5V.21.jpg",
        "name": "Xiaomi Mi Motion Activated Night Light 2 - White",
        "description":
            "Colour\tYellow\r\nItem weight\t100 Grams\r\nBrand\tXiaomi\r\nAssembly required\tNo\r\nNumber of light sources\t1\r\nNumber of pieces\t1\r\n--------------\r\nAbout this item\r\nLight Type : Night Lights\r\nBrand : Xiaomi\r\n360˚ rotating stereo light\r\n120-degree sensor\r\nLight sensitive + dual sensor for the human body\r\nHuman motion detection\r\n2- Brightness levels",
        "images": [
          "https://student.valuxapps.com/storage/uploads/products/163873839146spo.21.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638738391UiO3W.22.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638738391vgBPV.23.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638738391EojZq.24.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638738391rCkCU.25.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638738391Oblao.26.jpg"
        ],
        "in_favorites": false,
        "in_cart": false
      },
      {
        "id": 87,
        "price": 499,
        "old_price": 999,
        "discount": 50,
        "image":
            "https://student.valuxapps.com/storage/uploads/products/1638737964KFEyZ.21.jpg",
        "name": "Sony WI-C200 Wireless Headphones - Black",
        "description":
            "Brand\tSony\r\nColour\tBlack\r\nConnectivity technology\tWireless\r\nItem weight\t0.01 Kilograms\r\nCompatible devices\tAll\r\nWireless communication technologies\tBluetooth\r\nStyle\tClosed-back\r\n-----------------\r\nAbout this item\r\nCompatible with multiple devices and easy to use.\r\nBalanced Pure Sound\r\nDesigned and tested for using safely",
        "images": [
          "https://student.valuxapps.com/storage/uploads/products/1638737964rr3wr.21.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638737964AyYrU.22.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638737964rwKIT.23.jpg",
          "https://student.valuxapps.com/storage/uploads/products/16387379645kCy3.24.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638737964wD6NE.25.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638737964O81Zm.26.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1638737965f9T5b.27.jpg"
        ],
        "in_favorites": false,
        "in_cart": false
      },
      {
        "id": 92,
        "price": 225,
        "old_price": 475,
        "discount": 53,
        "image":
            "https://student.valuxapps.com/storage/uploads/products/1644375298PFm8i.14.jpg",
        "name": "Front Patch Pocket Long Sleeve Shirt - Dark Olive",
        "description":
            "Our model wears a size L\r\ncotton material\r\nRegular fit\r\nlong sleeves",
        "images": [
          "https://student.valuxapps.com/storage/uploads/products/1644375298DjMDB.14.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1644375298UaXrd.15.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1644375298xsuvT.16.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1644375298yVWz5.17.jpg"
        ],
        "in_favorites": false,
        "in_cart": false
      },
      {
        "id": 91,
        "price": 404,
        "old_price": 692,
        "discount": 42,
        "image":
            "https://student.valuxapps.com/storage/uploads/products/1644374518pTaSB.10.jpg",
        "name": "Fashion Solid Color Collage Collar Men Jacket",
        "description":
            "- Product Category: Jackets\r\n- Style: Casual sports\r\n- Length: long-sleeved\r\n- Lining Material: Polyester (PET)\r\n- Thickness: Thin section\r\n- type version: fit body\r\n- Size: M, L, XL, XXL, XXXL, XXXXL, 5XL\r\n- Colors: brown blue, gray blue\r\n- Length: general section (50cm - 65cm)",
        "images": [
          "https://student.valuxapps.com/storage/uploads/products/1644374518j1Fb5.10.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1644374518J6Ymx.11.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1644374518W2nLz.12.jpg",
          "https://student.valuxapps.com/storage/uploads/products/1644374518ZDLfk.13.jpg"
        ],
        "in_favorites": false,
        "in_cart": false
      }
    ],
    "ad":
        "https://student.valuxapps.com/storage/uploads/banners/1689106932hsRxm.photo_2023-07-11_23-07-53.png"
  }
};
