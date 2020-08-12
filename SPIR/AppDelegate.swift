//
//  SPIR
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var context = AppContext(
        url: URL(string: "https://terminal.tass.ru/api/v2")!
    )
    lazy var wireframe = AppWireframe(context: self.context)
    public var window: UIWindow? {
        set(value) { fatalError("Unsupported method '\(#function)'") }
        get { return self.wireframe.window }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.wireframe.launch(launchOptions)
        return true
    }

}
