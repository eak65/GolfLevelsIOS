//
//  CreateMatchComposer.swift
//  RealTimeGolf
//
//  Created by Ethan Keiser on 3/18/23.
//

import Foundation
import UIKit

class CreateMatchComposer {
   // let navigation : UINavigationController
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
   
    func createMatch() -> MainTabController {
        
        guard let createController = storyboard.instantiateViewController(identifier: "CreateController") as? CreateController,
              let matchController = storyboard.instantiateViewController(withIdentifier: "MatchTableViewController") as? MatchTableViewController,
              let mainTab = storyboard.instantiateViewController(withIdentifier: "MainTabController") as? MainTabController,
              let matchDetail = storyboard.instantiateViewController(withIdentifier: "MatchDetailController") as? MatchDetailController,
              let createTeamsController = storyboard.instantiateViewController(withIdentifier: "CreateTeamsController") as? CreateTeamsController,
              let assignController = storyboard.instantiateViewController(withIdentifier: "AssignController") as? AssignController,
              let betController = storyboard.instantiateViewController(withIdentifier: "BetController") as? BetController,
              let startController = storyboard.instantiateViewController(withIdentifier: "StartController") as? StartController,
              let activeController = storyboard.instantiateViewController(withIdentifier: "ActiveController") as? ActiveController
        else
        {
            fatalError("Cannot Create CreateController")
        }
        let matchNav = UINavigationController(rootViewController: matchController)
        let activeNav = UINavigationController(rootViewController: activeController)

        matchController.addMatchButton = {
             if let sheet = createController.sheetPresentationController {
                 sheet.detents = [.medium()]
             }
             matchNav.present(createController, animated: true)
        }
        let loadablePresenter = MatchLoadablePresenter(view: createController,successView: matchController)
        let apiPostCreate = PostCreateMatch()
        let createAdapter = CreateAdatper(presenter: loadablePresenter, remote: apiPostCreate)
        createController.delegate = createAdapter
        matchController.didSelectMatch = { match in
            matchNav.pushViewController(matchDetail, animated: true)
        }
        matchDetail.formTeamsPressed = { users in
            matchNav.pushViewController(assignController, animated: true)
        }
        assignController.nextButton = {
            matchNav.pushViewController(betController, animated: true)
        }
        betController.nextButtonPressed = {
            matchNav.pushViewController(startController, animated: true)
        }
        startController.teams = [Team(name: "", members: [User(name: "Kirk", handicap: "3.2"),User(name: "Ethan",handicap: "3.2")]),Team(name: "", members: [User(name: "Kirk", handicap: "3.2"),User(name: "Ethan",handicap: "3.2")])]

        activeNav.modalPresentationStyle = .fullScreen
        startController.startButtonPressed = { teams in
            mainTab.present(activeNav, animated: true) {
                matchNav.popToRootViewController(animated: false)
            }
        }
        mainTab.viewControllers = [matchNav]
        
        return mainTab
    }
    
}
