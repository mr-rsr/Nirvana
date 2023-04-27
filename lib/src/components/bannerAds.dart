import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nirvana/src/models/adsHelper.dart';

class BottomAds extends StatefulWidget {
  const BottomAds({super.key});

  @override
  State<BottomAds> createState() => _BottomAdsState();
}

class _BottomAdsState extends State<BottomAds> {
  Future<InitializationStatus> _initGoogleMobileAds() {
    // TODO: Initialize Google Mobile Ads SDK
    return MobileAds.instance.initialize();
  }

  BannerAd? _bannerAd;
  @override
  void initState() {
    super.initState();
    // TODO: Load a banner ad
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _bannerAd != null
        ? SizedBox(
            height: 52.h,
            width: double.infinity,
            //color: Colors.grey,
            child: Center(
              child: AdWidget(ad: _bannerAd!),
            ))
        : const SizedBox();
  }
}
