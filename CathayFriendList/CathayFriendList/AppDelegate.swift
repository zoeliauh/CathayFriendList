//
//  AppDelegate.swift
//  CathayFriendList
//
//  Created by woanjwu liauh on 2024/5/26.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window:UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: self.createRootViewController())
        self.window?.makeKeyAndVisible()
        return true
    }
    
    private func createRootViewController() -> HomeViewController {
        let userInfoService = UserInfoService()
        let factory = PagesFactory()
        let vm = HomeViewModel(userInfoService: userInfoService)
        let vc = HomeViewController(viewModel: vm, factory: factory)
        return vc
    }
}
