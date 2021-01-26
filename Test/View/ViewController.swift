//
//  ViewController.swift
//  Test
//
//  Created by Stanislav on 15.01.2021.
//

import UIKit

class MainView: UIViewController, UITextFieldDelegate {
    var presenter: MainViewPresenterProtocol!
    
    var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.backgroundColor = .white
        textField.tintColor = .lightGray
        textField.layer.cornerRadius = 10
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Last name"
        textField.backgroundColor = .white
        textField.tintColor = .lightGray
        textField.layer.cornerRadius = 10
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var ageTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Age"
        textField.backgroundColor = .white
        textField.tintColor = .lightGray
        textField.layer.cornerRadius = 10
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var sexTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Your sex"
        textField.backgroundColor = .white
        textField.tintColor = .lightGray
        textField.layer.cornerRadius = 10
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var eyeColorTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Color eyes"
        textField.backgroundColor = .white
        textField.tintColor = .lightGray
        textField.layer.cornerRadius = 10
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.numberOfLines = 5
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Click!", for: .normal)
        button.setTitleColor(.systemPink, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(nameTextField)
        view.addSubview(lastNameTextField)
        view.addSubview(ageTextField)
        view.addSubview(sexTextField)
        view.addSubview(eyeColorTextField)
        view.addSubview(label)
        view.addSubview(button)
        
        view.backgroundColor = .systemPink
        nameTextField.delegate = self
        lastNameTextField.delegate = self
        ageTextField.delegate = self
        sexTextField.delegate = self
        eyeColorTextField.delegate = self
        
        label.text = "First name & last name"
        button.addTarget(self, action: #selector(tapToButton), for: .touchUpInside)
        setupConstraints()
        
        
    }
    
    @objc func tapToButton() {
        presenter.model = Person(firstName: nameTextField.text ?? "",
                                 lastName: lastNameTextField.text ?? "",
                                 age: ageTextField.text ?? "",
                                 sex: sexTextField.text ?? "",
                                 eyeColor: eyeColorTextField.text ?? "")

        presenter.showData()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 44),
            
            lastNameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            lastNameTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            lastNameTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            lastNameTextField.heightAnchor.constraint(equalToConstant: 44),
            
            ageTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 20),
            ageTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            ageTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            ageTextField.heightAnchor.constraint(equalToConstant: 44),
            
            sexTextField.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 20),
            sexTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            sexTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            sexTextField.heightAnchor.constraint(equalToConstant: 44),
            
            eyeColorTextField.topAnchor.constraint(equalTo: sexTextField.bottomAnchor, constant: 20),
            eyeColorTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            eyeColorTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            eyeColorTextField.heightAnchor.constraint(equalToConstant: 44),
        ])
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}


extension MainView: MainViewProtocol {
    func setGreeting(greeting: String) {
        label.text = greeting
    }
}
