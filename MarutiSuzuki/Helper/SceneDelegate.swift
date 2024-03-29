//
//  SceneDelegate.swift
//  MarutiSuzuki
//
//  Created by Sagar on 07/02/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let sceenWindow = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: sceenWindow)
        showDashboard()
        
    }
    
    func showDashboard() {
        let dashboard = AppTabBarViewController.init(nibName: "AppTabBarViewController", bundle: nil,smoothData: smoothTab())
        let navigation = UINavigationController.init(rootViewController: dashboard)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
    
    func smoothTab() -> [TabItem] {
      let v1 = HomeViewController()

      let v2 = SearchViewController()

      let v3 = HomeViewController()
//
//      let v4 = HomeViewController()

      
        let t1 = TabItem(v1, imageName: "mingcute_task-line", tabName: "Test Drives")
        let t2 = TabItem(v2, imageName: "car", tabName: "Search")
        let t3 = TabItem(v3, imageName: "building", tabName: "")
//      let t4 = TabItem(v4, imageName: "profile", selectedImage: nil, tabName: nil)
      
      return [t1,t2,t3]
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

