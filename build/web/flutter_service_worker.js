'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "db8529be252da63c39319042f28018a1",
"assets/AssetManifest.bin.json": "df974f536837e9facb9a9f1cb6260119",
"assets/AssetManifest.json": "e212d88681ebe89edfcc8b867f684a58",
"assets/assets/icons/facebook.png": "fe66661d708f225443316a6addf8fd72",
"assets/assets/icons/google.png": "7efda01f8e686087653785ffaa5ae081",
"assets/assets/icons/linkedin.png": "d1637764b31adcadb6e684da1bda8e9a",
"assets/assets/icons/twitter.png": "87dce2d3fad08f8a7294ead6bf2e9f17",
"assets/assets/icons/whyus1.png": "83023ed6c239ffefe9108d6c42bb6d42",
"assets/assets/icons/whyus2.png": "e1464439341ae128be1114a6564b03e8",
"assets/assets/icons/whyus3.png": "34ac8493fe41fcf503eccc41db82d0cb",
"assets/assets/icons/whyus4.png": "5e819dd2dd0d25850d670201382a4951",
"assets/assets/icons/whyus5.png": "279ee1883df3e4b1fd1050b0fe917800",
"assets/assets/icons/whyus6.png": "fbf1c7c4b318f79fc077b89b8b26bc24",
"assets/assets/images/about_us.png": "04128e1b153eaf9416224d9fec7cb4f3",
"assets/assets/images/apple_pay.png": "6b1fbf80ac9686f51f92fcefdb30a66a",
"assets/assets/images/login.png": "7f9e95f5e753c247710678c60b06a2d6",
"assets/assets/images/logo.png": "994d3645465ccf33ed2ec18e497396dd",
"assets/assets/images/mastercard.png": "7ac86109740563494c10bb3fe40f3426",
"assets/assets/images/mini_logo.png": "81027dbe8fa5e0d023bbb7e804afb427",
"assets/assets/images/paypal.png": "0a4be5f146d519bb516fcd8a2de893c9",
"assets/assets/images/plan.png": "1c44cad38e9a1c000243f1bea43cb199",
"assets/assets/images/service1.png": "ee1f8292d7ae436a0bc1e9160f6a0ac4",
"assets/assets/images/service2.png": "b9f7f1f5d3b8351715b353399f6b62a9",
"assets/assets/images/service3.png": "19ed3d192480c6e5d7f85f1737c50bdd",
"assets/assets/images/service4.png": "64d73b19eeb17381e6ffda65e7f68e35",
"assets/assets/images/signup.png": "9f2d95ddb29283f0a0803ced3380e0ec",
"assets/assets/images/sub1.png": "d05d904ccf86ea1bdbe8a13b5c7ee470",
"assets/assets/images/sub2.png": "1ddfd823b7ec68a5f00ad6620bc709fd",
"assets/assets/images/sub3.png": "25f041a56ed5c82f52d7c946482b12f1",
"assets/assets/images/sub4.png": "2885e653b758031c1c29796c855da468",
"assets/assets/images/sub5.png": "4ce39af27a74536dab07c474904621e4",
"assets/assets/images/sub6.png": "07b1ac381c47f13a7e6e0f35227ff8f6",
"assets/assets/images/successfull.png": "5466ac36ba9001fb92ada4c763666147",
"assets/assets/translation/ar.json": "4e3cc6318aeaaed0007a12acc1040c0d",
"assets/assets/translation/en.json": "73d45b6a759c989e9c562a14277eb9b5",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "07962c658cd1dd2605bf5c34f4daa0e2",
"assets/NOTICES": "4ff52ad6391426931ead5c928788a8b1",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "5070f5b49d22695a5da9502742971426",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "a3be9f2b2cc567575ebf31e7b8d602de",
"/": "a3be9f2b2cc567575ebf31e7b8d602de",
"main.dart.js": "5ddfac1411ba8495b8e7048160ed6175",
"manifest.json": "2515e801a67088fd828775a48667ba4a",
"version.json": "325bc4b79cd75ab5dba972a568ba683d"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
