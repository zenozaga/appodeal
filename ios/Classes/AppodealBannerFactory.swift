//
//  AppodealBannerFactory.swift
//  appodeal_flutter
//
//  Created by Vinicius Egidio on 2020-08-28.
//

import Appodeal
import Flutter
import Foundation

class AppodealBannerFactory: NSObject, FlutterPlatformViewFactory {
    var instance: SwiftAppodealFlutterPlugin

    init(instance: SwiftAppodealFlutterPlugin) {
        self.instance = instance
    }

    func create(withFrame _: CGRect, viewIdentifier _: Int64, arguments args: Any?) -> FlutterPlatformView {
        var placementName: String?
        var height: Int?
        
        
        if let argsDict = args as? [String: Any] {
            
            placementName = argsDict["placementName"] as? String
            height = argsDict["height"] as? Int;
            
        }

 
        return AppodealBannerView(instance: instance, placementName: placementName, height: height ?? 50)
    }

    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }

    // MARK: - AppodealBannerView

    class AppodealBannerView: NSObject, FlutterPlatformView {
        var instance: SwiftAppodealFlutterPlugin
        var placementName: String?
        var height: Int!

        init(instance: SwiftAppodealFlutterPlugin,
             placementName: String?, height: Int) {
            self.instance = instance
            self.placementName = placementName
            self.height = height
        }

        func view() -> UIView {
            
            var banner = APDBannerView()
            banner.adSize = kAPDAdSize320x50;
                        
            var rec: CGRect = CGRect(x: 0, y: 0, width: 320, height: 50);
            
            if(height >= 250){
                banner = APDMRECView()
                banner.adSize = kAPDAdSize300x250
                rec = CGRect(x: 0, y: 0, width: 300, height: 250)
            };
            
            banner.delegate = instance
            banner.placement = placementName
            banner.frame = rec
            banner.loadAd()

            return banner
            
        }
    }
}
