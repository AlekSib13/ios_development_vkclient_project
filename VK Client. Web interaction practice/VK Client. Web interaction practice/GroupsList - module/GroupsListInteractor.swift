//
//  GroupsListInteratctor.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 06.06.2022.
//

import Foundation


protocol GroupsListInteractorProtocol {}


class GroupsListInteractor: GroupsListInteractorProtocol {
    
    weak var presenter: GroupsListPresenterProtocol?
    
}
