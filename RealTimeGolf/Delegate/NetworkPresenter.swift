//
//  NetworkPresenter.swift
//  RealTimeGolf
//
//  Created by Ethan Keiser on 3/18/23.
//

import Foundation

protocol LoadableView {

    func isLoading(showLoadingIndicator: Bool)
    func showError()
}
protocol MatchLoadableSuccessView {
    func showSuccess(object: Match)
}
