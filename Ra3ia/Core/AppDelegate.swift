//
//  AppDelegate.swift
//  Ra3ia
//
//  Created by Sara Mady on 21/03/2021.
//
import UIKit
import IQKeyboardManagerSwift
import GooglePlaces
import GoogleMaps
import Firebase
import UserNotifications
import FirebaseInstanceID
import FirebaseMessaging
import SwiftyJSON

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var location:CLLocationManager?
    var window: UIWindow?
    let gcmMessageIDKey = "gcm.message_id"
    static var FCMTOKEN = "1234567"
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        GMSServices.provideAPIKey("AIzaSyBrEyBXL7xP6XwzTnybqmYciGjjxsYF5xI")
        GMSPlacesClient.provideAPIKey("AIzaSyBrEyBXL7xP6XwzTnybqmYciGjjxsYF5xIs")
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.toolbarTintColor = UIColor.BasicColor
        application.registerForRemoteNotifications()

        self.setUpSegment()
        FirebaseApp.configure()
        Messaging.messaging().delegate = self
        if User.currentUser != nil , KeyChain.userToken != nil {
            if KeyChain.tokenExist{
                GoToHomeStoryBoard()
            }else{
                GoToAuthntcatonStoryBoard()
            }
        }else{
            GoToAuthntcatonStoryBoard()
        }
       
        UNUserNotificationCenter.current().delegate = self

        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
        } else {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }

        if User.currentUser != nil , KeyChain.userToken != nil {
            if KeyChain.tokenExist{
                GoToHomeStoryBoard()
            }else{
                GoToAuthntcatonStoryBoard()
            }
        }else{
            GoToAuthntcatonStoryBoard()
        }
        
        
        if(UserDefaults.standard.object(forKey: "FirstRun") == nil){
            AppLanguage.setAppLanguage(lang: "ar")
            Localizer.DoTheExhange()
            self.setAppSemantic()
            
        }


        return true
    }
    
    private func setAppSemantic() {
         
                UINavigationBar.appearance().semanticContentAttribute = .forceRightToLeft

                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                UILabel.appearance().semanticContentAttribute = .forceRightToLeft
                UITextField.appearance().textAlignment = .right
                UITextView.appearance().textAlignment = .right
                UITableView.appearance().semanticContentAttribute = .forceRightToLeft
                UITabBar.appearance().semanticContentAttribute = .forceRightToLeft
        
        
        UserDefaults.standard.set("true", forKey: "FirstRun")
        }
    
    
    func GoToAuthntcatonStoryBoard(){
        let vc = UIStoryboard.instantiateInitialViewController(.Main)
        self.window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
    func GoToHomeStoryBoard(){
        let vc = Storyboard.Main.viewController(StartViewController.self)
        self.window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
    
    
    
    
    
}

extension AppDelegate {
   
    
    func setUpSegment() {
        
        
        if let font = UIFont(name: "Fairuz", size: 16 )
        {
            
            UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
            
        }
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.white], for: .selected)
        
        
    }
}
// [START ios_10_message_handling]
@available(iOS 10, *)
extension AppDelegate : UNUserNotificationCenterDelegate {
    
    func registerForLocalNotification(on application:UIApplication) {
        
    }
    
    func dispatchlocalNotification(with title: String, body: String, userInfo: [AnyHashable: Any]? = nil, at date:Date) {
        
    }
    
    // Receive displayed notifications for iOS 10 devices.
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        
        let userInfo = notification.request.content.userInfo
        //        let title = JSON(userInfo[AnyHashable("title")]!).string
        //        let message_ar = JSON(userInfo[AnyHashable("message_ar")]!).string
        //        let message_en = JSON(userInfo[AnyHashable("message_en")]!).string
        //        var massgae = ""
        //        if(getServerLang() == "ar"){
        //            massgae = message_ar!
        //        }else{
        //            massgae = message_en!
        //        }
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }
        // print("⛩\(JSON(userInfo[AnyHashable("key")]!).string!)")
        
        
        
        completionHandler([.alert,.sound,.badge])
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        
        print("did receive response")
        print("will present notification")
        print("🤩 \(response.notification.request.content.userInfo)")
        
        let userInfo = response.notification.request.content.userInfo
        _ = JSON(userInfo[AnyHashable("title")]!).string
        //        let message_ar = JSON(userInfo[AnyHashable("message_ar")]!).string
        //        let message_en = JSON(userInfo[AnyHashable("message_en")]!).string
        var massgae = ""
        //        if(getServerLang() == "ar"){
        //            massgae = message_ar!
        //        }else{
        //            massgae = message_en!
        //        }
        
        
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
            
            completionHandler()
        }
        
    }
}
// [END ios_10_message_handling]

extension AppDelegate : MessagingDelegate {
    
    func showAlertAppDelegate(title: String,message : String,buttonTitle: String,window: UIWindow){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: UIAlertAction.Style.default, handler: nil))
        window.rootViewController?.present(alert, animated: false, completion: nil)
    }
    
    
    // [START refresh_token]
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("Firebase registration token: \(String(describing: fcmToken))")
        //        temp.token = fcmToken
        temp.token = fcmToken ?? ""
        let token = Messaging.messaging().fcmToken
        
        AppDelegate.FCMTOKEN = token!
        //UserDefaults.standard.set(token, forKey: "FCMTOKEN")
        print("FCM token: \(token ?? "")")
    }
    
    
    // [END refresh_token]
    // [START ios_10_data_message]
    // Receive data messages on iOS 10+ directly from FCM (bypassing APNs) when the app is in the foreground.
    // To enable direct data messages, you can set Messaging.messaging().shouldEstablishDirectChannel to true.
    
    
    func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingDelegate) {
        print("Received data message: \(remoteMessage.description)")
        
    }
    
}

extension Notification.Name {
    static let openAddProduct = Notification.Name("openAddProduct")
    static let stopTimer = Notification.Name("stopTimer")
    static let updateData = Notification.Name("updateData")
    
}

