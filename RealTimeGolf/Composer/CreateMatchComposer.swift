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
              let accountVC = storyboard.instantiateViewController(withIdentifier: "AccountViewController") as? AccountViewController,
              let socialVC = storyboard.instantiateViewController(withIdentifier: "SocialViewController") as? SocialViewController
        else
        {
            fatalError("Cannot Create CreateController")
        }
        let matchNav = UINavigationController(rootViewController: matchController)

        matchController.addMatchButton = {
             if let sheet = createController.sheetPresentationController {
                 sheet.detents = [.large()]
             }
             matchNav.present(createController, animated: true)
        }
        let loadablePresenter = MatchLoadablePresenter(view: createController,successView: matchController)
        let apiPostCreate = PostCreateMatch()
        let createAdapter = CreateAdatper(presenter: loadablePresenter, remote: apiPostCreate)
        createController.delegate = createAdapter
        matchController.didSelectMatch = { match in
            matchNav.pushViewController(self.setup(matchNav: matchNav, mainTab: mainTab), animated: true)
        }
       
        mainTab.viewControllers = [socialVC,matchNav,accountVC]
        
        return mainTab
    }
    func setup(matchNav: UINavigationController, mainTab: UIViewController) -> UIViewController{
        guard
              let matchDetail = storyboard.instantiateViewController(withIdentifier: "MatchDetailController") as? MatchDetailController,
              let assignController = storyboard.instantiateViewController(withIdentifier: "AssignController") as? AssignController,
              let betController = storyboard.instantiateViewController(withIdentifier: "BetController") as? BetController,
              let startController = storyboard.instantiateViewController(withIdentifier: "StartController") as? StartController,
              let activeController = storyboard.instantiateViewController(withIdentifier: "ActiveController") as? ActiveController
        else
        {
            fatalError("Cannot Create CreateController")
        }
        let activeNav = UINavigationController(rootViewController: activeController)

        matchDetail.formTeamsPressed = { users in
            matchNav.pushViewController(assignController, animated: true)
        }
        assignController.nextButton = {
            matchNav.pushViewController(betController, animated: true)
        }
        betController.nextButtonPressed = {
            matchNav.pushViewController(startController, animated: true)
        }
        let teams = [Team(name: "", members: [User(name: "Kirk", handicap: "3.5"),User(name: "Ethan",handicap: "3.5")]),Team(name: "", members: [User(name: "Ariana", handicap: "5.0"),User(name: "Rob",handicap: "2.0")])]
        startController.teams = teams

        activeNav.modalPresentationStyle = .fullScreen
        startController.startButtonPressed = { teams in
            mainTab.present(activeNav, animated: true) {
                matchNav.popToRootViewController(animated: false)
            }
        }
        activeController.teams = teams
        activeController.hole = Hole(number: 1, score: [UserScore(user: User(name: "Ethan", handicap: "2.3"), score: 4)])
        var nextButtonPressed : ((Hole) -> ())!
        nextButtonPressed = { hole in
            if hole.number >= 12 {
                // show summary
            } else {
                guard let  activeController = self.storyboard.instantiateViewController(withIdentifier: "ActiveController") as? ActiveController else {fatalError()}
                activeController.teams = teams
                activeController.hole = Hole(number: hole.number+1, score: [UserScore(user: User(name: "Ethan", handicap: "2.3"), score: 4)])
                activeController.nextButtonPressed = nextButtonPressed
                activeNav.pushViewController(activeController, animated: true)
            }
        }

        activeController.nextButtonPressed = nextButtonPressed
        return matchDetail
    }
    
}
