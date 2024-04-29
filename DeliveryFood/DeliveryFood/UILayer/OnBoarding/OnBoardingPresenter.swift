//
//  OnBoardingPresenter.swift
//  DeliveryFood
//
//  Created by Владимир Курганов on 27.04.2024.
//

import Foundation

//MARK: - OnBoardingPresenterProtocol
protocol OnBoardingViewOutputProtocol: AnyObject {
    func onboardingFinish()
}

//MARK: - OnBoardingPresenter
class OnBoardingViewPresenter: OnBoardingViewOutputProtocol {
    
//MARK: - Properties
    weak var coordinator: OnboardingCoordinator?
    
//MARK: - Init
    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
    }
    
//MARK: - Methods
    func onboardingFinish() {
        coordinator?.finish()
    }
}
