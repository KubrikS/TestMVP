//
//  MainPresenter.swift
//  Test
//
//  Created by Stanislav on 26.01.2021.
//

import UIKit

protocol MainViewProtocol: class {
    func setGreeting(greeting: String)
}

protocol MainViewPresenterProtocol: class {
    init(view: MainViewProtocol)
    var model: Person? { get set }
    func showData()
}

class MainPresenter: MainViewPresenterProtocol {
    
    let view: MainViewProtocol
    var model: Person?
    
    required init(view: MainViewProtocol) {
        self.view = view
    }
    
    func showData() {
        guard let person = model else { return }
        let greeting = "Name - \(person.firstName)\n Last name - \(person.lastName)\n Age - \(person.age)\n Sex - \(person.sex)\n Eye color - \(person.eyeColor)"
        view.setGreeting(greeting: greeting)
    }
}
