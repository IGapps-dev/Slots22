import UIKit
import SnapKit
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigationController = UINavigationController(
            rootViewController: FirelineSplashView())
        navigationController.navigationBar.isHidden = true
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
      
        self.window?.rootViewController = navigationController; self.window?.makeKeyAndVisible()
        
        return true
    }
}
