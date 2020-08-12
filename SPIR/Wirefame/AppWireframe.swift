//
//  SPIR
//

import Quickly

class AppWireframe< ContextType: IAppContext > : QAppWireframe< ContextType > {
    
    override init(context: ContextType) {
        super.init(context: context)
        
        self.modalContainerViewController = QModalContainerViewController()

        self.dialogContainerViewController = QDialogContainerViewController()
        self.dialogContainerViewController!.backgroundView = QDialogBackgroundView(backgroundColor: UIColor(white: 0, alpha: 0.9))

        self.pushContainerViewController = QPushContainerViewController()
    }

    override func launch(_ options: [UIApplication.LaunchOptionsKey : Any]?) {
        self.set(wireframe: LoginWireframe(router: self, context: self.context))
        super.launch(options)
    }
    
}

extension AppWireframe : ILoginWireframeRouter {

    func didAuthorized() {
        print("AAA!!!")
    }
    
}
