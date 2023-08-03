'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "16003c4ece95d6f6898b70aa1514899a",
"assets/AssetManifest.json": "82011e7fc514b4db71308b5bdf1fc7be",
"assets/assets/animations/404-not-found.json": "51fc6518a110f15cb5777173ec148f15",
"assets/assets/animations/download-file-icon-animation.json": "10408aec1cfa45ff3758ffb133c7ae29",
"assets/assets/fonts/Montserrat-Italic-VariableFont_wght.ttf": "5b315bd5a3b7fa34eef7dfd5786b90b0",
"assets/assets/fonts/Montserrat-VariableFont_wght.ttf": "52a37115b1d8d5d6ae0b0e373e692c9d",
"assets/assets/icons/behance-alt.svg": "5c5cb1c76f9e70c3906f061365fdac19",
"assets/assets/icons/feather_dribbble.svg": "89b806ce6cc9dea635b81d7dc2406352",
"assets/assets/icons/feather_message-square.svg": "5194a360f12626cb541cc80f58c4f217",
"assets/assets/icons/feather_search.svg": "9d58d567fd606a3fdf19583f8685523d",
"assets/assets/icons/feather_share-2.svg": "2eadf3eff1fb945866235c94ec30915d",
"assets/assets/icons/feather_thumbs-up.svg": "a066c16fa33209a18b5282c40da1cf78",
"assets/assets/icons/feather_twitter.svg": "3a254ce88e725b0169c202752364535e",
"assets/assets/icons/logo.svg": "c9931bc4e93cda3b203dae019b85688e",
"assets/assets/icons/odc_pattern.svg": "6453075e3df39383bd5f365053cdd600",
"assets/assets/icons/odc_pattern2.svg": "33f4b87c01cb33575eda0d1a271521e4",
"assets/assets/icons/odc_pattern3.svg": "0308f116901b4d0ce05dc4f4be0d46bf",
"assets/assets/images/0.png": "9764fc4eb9b8903140c321cb478401c3",
"assets/assets/images/1.png": "a4db2dc609cd22aa297dc0d3159d71e0",
"assets/assets/images/2.png": "1fdb7c800008fbb0a8f92e2a00574672",
"assets/assets/images/bg_img_2.png": "8257ef89b2dfeab767578260965a7e2d",
"assets/assets/images/desktop.png": "d4794e3ddcb4fce9a2c12246e3b4d8a7",
"assets/assets/images/download.png": "d9317d736e7b69f20f57f6ab13f34d3c",
"assets/assets/images/email-50.png": "996b14a7f5e6bff0f27f5aa86831e292",
"assets/assets/images/email.png": "f59e8ec158ec05d21c8b251d7b0017ca",
"assets/assets/images/formations/background1.png": "db15847d314e5b787839ece003621705",
"assets/assets/images/formations/background2.png": "dc00e53535e8b64378441c8ef3418e0a",
"assets/assets/images/formations/background3.jpg": "b8b9099a5377be411bc34a9ea7dd1895",
"assets/assets/images/formations/doctorants.png": "4664c4f93d9f2b98b77ae62569d9c6f9",
"assets/assets/images/formations/learning_travel.png": "571f15ee19ad4037b6e4b63debe9d7e2",
"assets/assets/images/formations/soft_skills.png": "e2eb6822bc44be332d3b8efe253eff8a",
"assets/assets/images/formations/sur_mesures.png": "7f0168858e8b9e1bde9ec3db93fce2e9",
"assets/assets/images/graphic.png": "d7aaa5a5615483382572b5d5c24c5e5b",
"assets/assets/images/hand.png": "d7c6f40ec1244a86fb4610cd515fee55",
"assets/assets/images/Hover.png": "f0a2318c40269d84384f56f54d25ad69",
"assets/assets/images/Hover_flip.png": "57d317fc22080b316188ebe73407065b",
"assets/assets/images/Intreaction_design.png": "98e873648b7c2d3062556f2f8c09d4c3",
"assets/assets/images/linkedin-50.png": "8c54498de170f54d31a75a7bb0e6c998",
"assets/assets/images/logo.png": "083c540d20758d8bbaa961abd9b9a802",
"assets/assets/images/logo_no_text.png": "82ace159744d7a480c2db53368861a41",
"assets/assets/images/odc_pattern.png": "6629a1d231fd8366b53536d0c1215cc3",
"assets/assets/images/odc_pattern2.png": "69556ec2bdf047ed2544343462abc689",
"assets/assets/images/odc_pattern3.png": "4de182133782d01ecd3f899c2fbcfacd",
"assets/assets/images/odc_pattern4.png": "04c5b5b009a5048907368b471373d040",
"assets/assets/images/odc_pattern5.png": "78f910f09d96b3d1afc944cc82cd2fa5",
"assets/assets/images/OpenSourceImages/img1.png": "65622d85ea47a57efe5c5285fe91d74a",
"assets/assets/images/OpenSourceImages/img10.png": "0ddd2d7bef312fd41ac26a2a5d85c714",
"assets/assets/images/OpenSourceImages/img2.png": "08980f0c94cca35f87709b378d0764c8",
"assets/assets/images/OpenSourceImages/img3.png": "3bc55985201d97c64f0450bdf8653b33",
"assets/assets/images/OpenSourceImages/img4.png": "621f074e72e154556d4eeaf0a42a8366",
"assets/assets/images/OpenSourceImages/img5.png": "497b8548af9ecbe7897125641caa38b5",
"assets/assets/images/OpenSourceImages/img6.png": "763761cc59295ea189ef8f92590416e3",
"assets/assets/images/OpenSourceImages/img7.png": "d366dad870367f12a127f4327c10ae0c",
"assets/assets/images/OpenSourceImages/img8.png": "2e7f9a54c5bb75c32cf7529bfbf60326",
"assets/assets/images/OpenSourceImages/img9.png": "9a3408db01b28ef83ec55a514ca3aed5",
"assets/assets/images/phone-50.png": "0f836368efbacc57b877c547a93019fc",
"assets/assets/images/recent_1.png": "f78101e229ed5405aadad3ba5dc83902",
"assets/assets/images/recent_2.png": "a567a0e447c13f94acf9b1eec0923b55",
"assets/assets/images/text/description1.png": "b762a00762cea7a390fd2c23adc06da6",
"assets/assets/images/text/description2.png": "e3e401eae8149c63ac7fe1206f7dd25e",
"assets/assets/images/text/description3.png": "776e180ebc825f0bb7adcfa8fc129546",
"assets/assets/images/ui.png": "6ca82a6c70f80fd75c56b1fe66caa180",
"assets/assets/images/values.png": "b374feb6b4b53a4108baf0f12097850d",
"assets/assets/translations/en.json": "4b42c4f9e6210c2b4302c4fc44d0f7be",
"assets/assets/translations/fr.json": "7c6bfb36404d8b1b29b90ce26ca7480a",
"assets/FontManifest.json": "f536a0a228bb02550d1ae250a3655084",
"assets/fonts/MaterialIcons-Regular.otf": "2cd266171fe5ea212f8a0a240766136f",
"assets/NOTICES": "0a043ed63dde0dba9540776cdba5af12",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/packages/easy_localization/i18n/ar-DZ.json": "acc0a8eebb2fcee312764600f7cc41ec",
"assets/packages/easy_localization/i18n/ar.json": "acc0a8eebb2fcee312764600f7cc41ec",
"assets/packages/easy_localization/i18n/en-US.json": "5f5fda8715e8bf5116f77f469c5cf493",
"assets/packages/easy_localization/i18n/en.json": "5f5fda8715e8bf5116f77f469c5cf493",
"assets/packages/flutter_dropzone_web/assets/flutter_dropzone.js": "08091c5a19148cac3c251932f00e32b8",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "d7791ef376c159f302b8ad90a748d2ab",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "5070443340d1d8cceb516d02c3d6dee7",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "658b490c9da97710b01bd0f8825fce94",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"favicon.png": "09e6996569aba61cae215e1e4578f33e",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "abe014c5394407e6edf955ea0c6f7539",
"/": "abe014c5394407e6edf955ea0c6f7539",
"Logo.png": "083c540d20758d8bbaa961abd9b9a802",
"main.dart.js": "6f52a76dd10f9b657373f706dda42f6f",
"manifest.json": "a823701afad6dc7cbeaa6e167bb930f7",
"version.json": "637fc56ccdb2a862d355c7086563783e"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
