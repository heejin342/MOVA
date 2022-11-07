//
//  SceneDelegate.swift
//  MOVA
//
//  Created by 김희진 on 2022/10/31.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windonScene = (scene as? UIWindowScene) else {return}
               
        window = UIWindow(windowScene: windonScene)
        appCoordinator = AppCoordinator(window)
        appCoordinator?.start()
        
        //        window?.backgroundColor = .systemBackground
        //        let rootVC = ViewController()
        //        window?.rootViewController = rootVC
        //        window?.makeKeyAndVisible()
    }
}

