//
//  UserProfileInteractor.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 20.08.2021.
//

import Foundation


protocol UserProfileInteractorProtocol {}

class UserProfileInteractor: UserProfileInteractorProtocol {
    
    weak var presenter: UserProfilePresenterProtocol?
}
