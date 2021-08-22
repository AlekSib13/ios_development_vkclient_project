//
//  InitialCoverPageInteractor.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 17.08.2021.
//

import Foundation

protocol InitialCoverPageInteractorProtocol {
    var presenter: InitialCoverPagePresenterProtocol? {get}
}


class InitialCoverPageInteractor: InitialCoverPageInteractorProtocol {
    weak var presenter: InitialCoverPagePresenterProtocol?
    
    init(presenter: InitialCoverPagePresenterProtocol){
        self.presenter = presenter
    }
}
